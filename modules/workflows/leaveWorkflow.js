const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")

const leaveWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      if(!req.query.practitioner) {
        return reject({message: "Demande invalide, aucun Agent trouvé"})
      }
      fhirQuestionnaire.processQuestionnaire( req.body ).then( async(bundle) => {
        bundle.entry[0].resource.extension.push({
          url: 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference',
          valueReference: {
            reference: 'Practitioner/' + req.query.practitioner
          }
        })
        let leave = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-leave"
        })
        let startDate = leave.extension.find((ext) => {
          return ext.url === "start-date"
        })
        let endDate = leave.extension.find((ext) => {
          return ext.url === "end-date"
        })
        if(startDate && endDate && moment(startDate.valueDate).isAfter(endDate.valueDate)) {
          return reject({message: "La date de fin doit être après la date de début"})
        }
        let terminationDate = leave.extension.find((ext) => {
          return ext.url === "effective-termination-date"
        })
        let resumptionDate = leave.extension.find((ext) => {
          return ext.url === "effective-resumption-date"
        })
        if(terminationDate && resumptionDate && moment(terminationDate.valueDate).isAfter(resumptionDate.valueDate)) {
          return reject({message: "La date de reprise effective doit être après la date de cessation effective"})
        }
        return resolve(bundle)
      })
    } )
  },
  postProcess: ( req, results ) => {
    return new Promise((resolve, reject) => {
      if ( !req.body.meta ) req.body.meta = {}
      if ( !req.body.meta.tag ) req.body.meta.tag = []
      req.body.meta.tag.push({ system: "http://ihris.org/fhir/tags/resource", code: results.entry[0].response.location })
      resolve( req )
    })
  },
  outcome: (message) => {
    return new Promise ((resolve, reject ) => {
      let outcomeBundle = {
        resourceType: "Bundle",
        type: "transaction",
        entry: [{
          resource:{
            resourceType: "OperationOutcome",
            issue: [
            {
              severity: "error",
              code: "exception",
              diagnostics: message
            }]
          },
          request: {
            method: "POST",
            url: "OperationOutcome"
          }
        }]
      }
      winston.info(JSON.stringify(outcomeBundle,null,2))
      resolve(outcomeBundle)
    })
  }
}
 
module.exports = leaveWorkflow
