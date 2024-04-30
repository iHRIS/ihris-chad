const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")

const preserviceTrainingWorkflow = {
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
        let today = moment().format("YYYY")
        let education = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === "http://ihris.org/fhir/StructureDefinition/preservice-training"
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
        if(graduation && moment(graduation.valueDate).isAfter(today)) {
          return reject({message: "L'année d'obtention du diplôme doit être avant aujourd'hui"})
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
 
module.exports = preserviceTrainingWorkflow
