const moment = require("moment")
const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const utils = require("../utils")

const agentStatusWorkflow = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      if(!req.query.practitioner) {
        return reject({message: "Demande invalide, aucun Agent trouvé"})
      }
      fhirQuestionnaire.processQuestionnaire(req.body).then(async(bundle) => {
        let params = {
          practitioner: 'Practitioner/' + req.query.practitioner,
          _profile: 'http://ihris.org/fhir/StructureDefinition/agent-status-profile'
        }
        if(req.query.editing) {
          let editingResources = JSON.parse(req.query.editingResources)
          params["_id:not"] = editingResources[0].id
        }
        await utils.getLatestResourceById({resource: "Basic", params}).then((prevStatus) => {
          if(prevStatus.entry.length) {
            let prevStartDate = prevStatus.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/start-date'
            })?.valueDate
            if(!prevStartDate) {
              prevStartDate = prevStatus.entry[0].resource.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/resumption-date'
              })?.valueDate
            }
            let currStartDate = bundle.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/start-date'
            })?.valueDate

            if(!currStartDate) {
              currStartDate = bundle.entry[0].resource.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/resumption-date'
              })?.valueDate
            }

            let prevAgStatus = prevStatus.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/agent-status'
            }).valueCoding.code
            let currAgStatus = bundle.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/agent-status'
            }).valueCoding.code
            if(prevAgStatus === currAgStatus) {
              return reject({message: "La position administrative précédente est la même que la position administrative actuelle"})
            }
            if(prevStartDate && moment(currStartDate).isBefore(prevStartDate)) {
              return reject({message: "Cette date de début doit être après la date de début de la position administrative précédente " + moment(prevStartDate).format("DD-MM-YYYY")})
            }
            if(currAgStatus === 'active' && moment(currStartDate).isAfter(moment().format("YYYY-MM-DD"))) {
              return reject({message: "La Date de reprise de service doit etre inferieur ou egale a la date d'aujourd'hui"})
            }
            let enddate = bundle.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/start-date'
            })?.valueDate
            if(!enddate) {
              enddate = bundle.entry[0].resource.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/resumption-date'
              })?.valueDate
            }
            if(enddate) {
              let index = prevStatus.entry[0].resource.extension.findIndex((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/end-date'
              })
              if(index == -1) {
                index = prevStatus.entry[0].resource.extension.length
              }
              prevStatus.entry[0].resource.extension[index] = {
                url: 'http://ihris.org/fhir/StructureDefinition/end-date',
                valueDate: enddate
              }
            }
            bundle.entry.push({
              resource: prevStatus.entry[0].resource,
              request: {
                method: "PUT",
                url: "Basic/" + prevStatus.entry[0].resource.id
              }
            })
          }
        })
        let resumdate = bundle.entry[0].resource.extension.find((ext) => {
          return ext.url === 'http://ihris.org/fhir/StructureDefinition/resumption-date'
        })?.valueDate
        if(resumdate) {
          let index = bundle.entry[0].resource.extension.findIndex((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/start-date'
          })
          if(index === -1) {
            index = bundle.entry[0].resource.extension.length
          }
          bundle.entry[0].resource.extension[index] = {
            url: 'http://ihris.org/fhir/StructureDefinition/start-date',
            valueDate: resumdate
          }
        }
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
 
module.exports = agentStatusWorkflow
