const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")

const practitionerWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      fhirQuestionnaire.processQuestionnaire( req.body ).then(async(bundle) => {
        let invalidIssueDate = false
        for(let identifier of bundle.entry[0].resource.identifier) {
          let issueDate = identifier.extension.find((ext) => {
            return ext.url === "http://ihris.org/fhir/StructureDefinition/id-issue-date"
          })
          let expireDate = identifier.extension.find((ext) => {
            return ext.url === "http://ihris.org/fhir/StructureDefinition/id-expire-date"
          })
          if(issueDate && expireDate && moment(issueDate.valueDate).isAfter(expireDate.valueDate)) {
            invalidIssueDate = true
          }
        }
        if(invalidIssueDate) {
          return reject({message: "La date d'émission doit être avant la date d'expiration"})
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
 
module.exports = practitionerWorkflow