const ihrissmartrequire = require("ihrissmartrequire")
const winston = require('winston')
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")

const workflowChangeJob = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      fhirQuestionnaire.processQuestionnaire( req.body ).then(async(bundle) => {
        bundle.entry[0].resource.practitioner = {
          reference: "Practitioner/" + req.query.practitioner
        }
        let appointmentDate = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === 'http://ihris.org/fhir/StructureDefinition/appointment-date'
        })
        let presenceDate = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === 'http://ihris.org/fhir/StructureDefinition/effective-presence-date'
        })
        let serviceStartDate = bundle.entry[0].resource.period.start
        let serviceEndDate = bundle.entry[0].resource.period.end
        if(appointmentDate && serviceStartDate && moment(appointmentDate.valueDate).isAfter(serviceStartDate)) {
          return reject({message: "La date de nomination/affectation doit être avant la date de début du service"})
        }
        if(presenceDate && serviceStartDate && moment(serviceStartDate).isAfter(presenceDate.valueDate)) {
          return reject({message: "La date de début du service doit être avant la date de présence effective"})
        }
        if(presenceDate && serviceEndDate && moment(presenceDate.valueDate).isAfter(serviceEndDate)) {
          return reject({message: "La date de présence effective doit être avant la date de fin de service"})
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
 
module.exports = workflowChangeJob
