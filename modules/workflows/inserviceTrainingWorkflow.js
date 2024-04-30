const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const fhirAxios = ihrissmartrequire('modules/fhir/fhirAxios')
const moment = require("moment")

const inserviceTrainingWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      if(!req.query.request) {
        return reject({message: "Demande invalide, aucun Agent trouvé"})
      }
      fhirQuestionnaire.processQuestionnaire( req.body ).then( async(bundle) => {
        let practitioner
        await fhirAxios.read("Basic", req.query.request).then((response) => {
          practitioner = response.extension.find((ext) => {
            return ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference"
          })?.valueReference?.reference
        })
        bundle.entry[0].resource.extension.push({
          url: 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference',
          valueReference: {
            reference: practitioner
          }
        })
        bundle.entry[0].resource.extension.push({
          url: 'http://ihris.org/fhir/StructureDefinition/inservice-training-request-reference',
          valueReference: {
            reference: 'Basic/' + req.query.request
          }
        })
        let education = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === "http://ihris.org/fhir/StructureDefinition/inservice-training"
        })
        let graduation = education.extension.find((ext) => {
          return ext.url === "end-year"
        })
        let startYear = education.extension.find((ext) => {
          return ext.url === "start-year"
        })
        let specialized = education.extension.find((ext) => {
          return ext.url === "specialized"
        }).valueCoding.code
        let specialization = education.extension.find((ext) => {
          return ext.url === "specialization"
        })
        if(specialized === "yes" && (!specialization || !specialization.valueCoding)) {
          return reject({message: "La spécialisation est obligatoire"})
        } else if(specialized === "no" && specialization && specialization.valueCoding && specialization.valueCoding.code) {
          return reject({message: "La spécialisation n'est pas Obligatoire"})
        }
        if(startYear && moment(startYear.valueDate).isAfter(graduation.valueDate)) {
          return reject({message: "L'année de début doit être avant l'obtention du diplôme"})
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
 
module.exports = inserviceTrainingWorkflow
