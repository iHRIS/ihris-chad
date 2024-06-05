const ihrissmartrequire = require("ihrissmartrequire")
const winston = require('winston')
const moment = require("moment")
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const utils = require("../utils")

const workflowChangeJob = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      fhirQuestionnaire.processQuestionnaire( req.body ).then(async(bundle) => {
        //get previous role and mark it ended
        utils.getLatestResourceById({
          resource: "PractitionerRole",
          params: {practitioner: "Practitioner/" + req.query.practitioner}
        }).then((response) => {
          console.error(JSON.stringify(response, 0, 2));
          if(response.entry.length) {
            let prevRole = response.entry[0].resource
            let currentRole = bundle.entry.find((entry) => {
              return entry.resource.resourceType === "PractitionerRole"
            })
            console.log('here1');
            console.error(JSON.stringify(prevRole, 0, 2));
            if(moment(prevRole.period.start).isAfter(currentRole.resource.period.start)) {
              return reject({message: "La date de début du rôle actuel doit être après la date de début du rôle précédent"})
            }
            console.log('here0');
            prevRole.period.end = currentRole.resource.period.start
            console.log('here0.1');
            let departureDetails = bundle.entry.find((entry) => {
              return entry.resource.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/role-departure-profile")
            })
            console.log('here2');
            departureDetails.resource.extension.push({
              url: "http://ihris.org/fhir/StructureDefinition/departure-date",
              valueDate: currentRole.resource.period.start
            })
            departureDetails.resource.extension.push({
              url: "http://ihris.org/fhir/StructureDefinition/practitioner-role-reference",
              valueReference: {
                reference: "PractitionerRole/" + prevRole.id
              }
            })
            departureDetails.resource.extension.push({
              url: "http://ihris.org/fhir/StructureDefinition/practitioner-reference",
              valueReference: {
                reference: "Practitioner/" + req.query.practitioner
              }
            })
            currentRole.resource.practitioner = {
              reference: "Practitioner/" + req.query.practitioner
            }
            bundle.entry.push({
              resource: prevRole,
              request: {
                method: "PUT",
                url: "PractitionerRole/" + prevRole.id
              }
            })
            console.log('here3');
            return resolve(bundle)
          } else {
            return reject({message: "Une erreur interne s'est produite"})
          }
        }).catch(() => {
          return reject({message: "Une erreur interne s'est produite"})
        })
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
