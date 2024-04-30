const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")

const employmentWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      if(!req.query.practitioner) {
        return reject({message: "Demande invalide, aucun Agent trouvé"})
      }
      fhirQuestionnaire.processQuestionnaire( req.body ).then(async(bundle) => {
        bundle.entry[0].resource.extension.push({
          url: 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference',
          valueReference: {
            reference: 'Practitioner/' + req.query.practitioner
          }
        })
        let employment = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-employment-history"
        })
        let startDate = employment.extension.find((ext) => {
          return ext?.url === "start-year"
        })
        let endDate = employment.extension.find((ext) => {
          return ext?.url === "end-year"
        })
        if(startDate && endDate && moment(startDate.valueDate).isAfter(endDate.valueDate)) {
          return reject({message: "L'année de fin doit être après l'année de début"})
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
 
module.exports = employmentWorkflow
