const winston = require('winston')
const ihrissmartrequire = require("ihrissmartrequire")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const moment = require("moment")
const utils = require("../utils")

const performanceWorkflow = {
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
          return reject({message: "La date de fin doit être après la date de début"})
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
        let params = {
          _profile: "http://ihris.org/fhir/StructureDefinition/situation-profile",
          practitioner: 'Practitioner/' + req.query.practitioner
        }
        let situationstatus
        await utils.getLatestResourceById({resource: "Basic", params, total: 1}).then((response) => {
          if(!response.entry.length) {
            return reject({message: "Add situation before adding performance"})
          }
          situationstatus = response.entry[0].resource.extension.find((ext) => {
            return ext.url === "http://ihris.org/fhir/StructureDefinition/agent-status"
          }).valueCoding.code
        })
        function isContractual() {
          if(situationstatus === 'contractual' || situationstatus === 'costreccontr' || situationstatus === 'contractualpartners') {
            return true
          }
          return false
        }
        function isCivilServant() {
          if(situationstatus === 'regularcivilservant' || situationstatus === 'traineecivilservant') {
            return true
          }
          return false
        }
        if(isContractual() && aptitude?.valueCoding) {
          return reject({message: "Contract staffs dont have criteria aptitude for command functions"})
        }
        if(isContractual() && (!manner || !manner?.valueCoding)) {
          return reject({message: "Contract staffs must have criteria manner of carrying out its function"})
        }
        if(isCivilServant() && (!aptitude || !aptitude?.valueCoding)) {
          return reject({message: "Civil servant staffs must have criteria aptitude for command functions"})
        }
        if(isCivilServant() && manner?.valueCoding) {
          return reject({message: "Civil servant staffs dont have criteria manner of carrying out its function"})
        }
        let score = 0
        if(generalKnowledge && generalKnowledge.valueCoding?.code) {
          score += parseInt(generalKnowledge.valueCoding?.code)
        }
        if(professionalCulture && professionalCulture.valueCoding?.code) {
          score += parseInt(professionalCulture.valueCoding?.code)
        }
        if(effectiveness && effectiveness.valueCoding?.code) {
          score += parseInt(effectiveness.valueCoding?.code)
        }
        if(aptitude && aptitude.valueCoding?.code) {
          score += parseInt(aptitude.valueCoding?.code)
        }
        if(manner && manner.valueCoding?.code) {
          score += parseInt(manner.valueCoding?.code)
        }
        if(score > 20) {
          return reject({message: "Score must not exceed 20"})
        }
        let scoreindex = performance.extension.findIndex((ext) => {
          return ext.url === "score"
        })
        if(scoreindex === -1) {
          scoreindex = performance.extension.length
        }
        performance.extension[scoreindex] = {
          url: "score",
          valueInteger: score
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
