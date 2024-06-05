const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const fhirAxios = require("../../../modules/fhir/fhirAxios")

const defaultWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      if(!req.query.practitioner) {
        return reject({message: "Demande invalide, aucun Agent trouvé"})
      }
      fhirQuestionnaire.processQuestionnaire(req.body).then(async(bundle) => {
        await fhirAxios.read("Practitioner", req.query.practitioner).then((practitioner) => {
          let counterindex = practitioner.extension.findIndex((ext) => {
            return ext.url === "http://ihris.org/fhir/StructureDefinition/counter"
          })
          let counter = 1
          if(counterindex === -1) {
            counterindex = practitioner.extension.length
          } else {
            counter = practitioner.extension[counterindex].valueInteger
            counter = parseInt(counter) + 1
          }
          practitioner.extension[counterindex] = {
            url: "http://ihris.org/fhir/StructureDefinition/counter",
            valueInteger: counter
          }
          bundle.entry.push({
            resource: practitioner,
            request: {
              method: "PUT",
              url: "Practitioner/" + practitioner.id
            }
          })
        })
        bundle.entry[0].resource.extension.push({
          url: 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference',
          valueReference: {
            reference: 'Practitioner/' + req.query.practitioner
          }
        })
        return resolve(bundle)
      })
    })
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
 
module.exports = defaultWorkflow
