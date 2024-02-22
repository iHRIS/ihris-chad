const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")

const performanceWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      if(!req.query.practitioner) {
        return reject({message: "Invalid request, no practitioner on the request"})
      }
      fhirQuestionnaire.processQuestionnaire( req.body ).then( async(bundle) => {
        bundle.entry[0].resource.extension.push({
          url: 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference',
          valueReference: {
            reference: 'Practitioner/' + req.query.practitioner
          }
        })
        let performance = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-performance"
        })
        let startDate = performance.extension.find((ext) => {
          return ext.url === "start-date"
        })
        let endDate = performance.extension.find((ext) => {
          return ext.url === "end-date"
        })
        if(startDate && endDate && moment(startDate.valueDate).isAfter(endDate.valueDate)) {
          return reject({message: "End date must be after start date"})
        }
        let generalKnowledge  = performance.extension.find((ext) => {
          return ext.url === "general-knowledge"
        })
        let professionalCulture  = performance.extension.find((ext) => {
          return ext.url === "professional-culture"
        })
        let effectiveness  = performance.extension.find((ext) => {
          return ext.url === "effectiveness"
        })
        let aptitude  = performance.extension.find((ext) => {
          return ext.url === "aptitude"
        })
        let manner  = performance.extension.find((ext) => {
          return ext.url === "manner"
        })
        if(generalKnowledge && generalKnowledge.valueInteger && (generalKnowledge.valueInteger < 0 || generalKnowledge.valueInteger > 5)) {
          return reject({message: "General knowledge must be between 0 and 5"})
        }
        if(professionalCulture && professionalCulture.valueInteger && (professionalCulture.valueInteger < 0 || professionalCulture.valueInteger > 5)) {
          return reject({message: "Professional Culture must be between 0 and 5"})
        }
        if(generalKnowledge && generalKnowledge.valueInteger && (generalKnowledge.valueInteger < 0 || generalKnowledge.valueInteger > 5)) {
          return reject({message: "General knowledge must be between 0 and 5"})
        }
        if(effectiveness && effectiveness.valueInteger && (effectiveness.valueInteger < 0 || effectiveness.valueInteger > 5)) {
          return reject({message: "Effectiveness in carrying out duties must be between 0 and 5"})
        }
        if(aptitude && aptitude.valueInteger && (aptitude.valueInteger < 0 || aptitude.valueInteger > 5)) {
          return reject({message: "Aptitude for command functions must be between 0 and 5"})
        }
        if(manner && manner.valueInteger && (manner.valueInteger < 0 || manner.valueInteger > 5)) {
          return reject({message: "Manner of carrying out its functions must be between 0 and 5"})
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
 
module.exports = performanceWorkflow
