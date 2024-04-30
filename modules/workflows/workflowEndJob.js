const ihrissmartrequire = require("ihrissmartrequire")
const moment = require("moment")
const nconf = ihrissmartrequire('modules/config')
const winston = require('winston')
const fhirQuestionnaire = ihrissmartrequire('modules/fhir/fhirQuestionnaire')
const fhirAxios = nconf.fhirAxios

const workflowEndJob = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      fhirQuestionnaire.processQuestionnaire( req.body ).then(async(bundle) => {
        fhirAxios.read("PractitionerRole", req.query.practitionerrole).then((role) => {
          let endingRole = bundle.entry.find((entry) => {
            return entry.resource.resourceType === "PractitionerRole"
          })
          let departureReason = bundle.entry.find((entry) => {
            return entry.resource.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/role-departure-profile")
          })
          departureReason.resource.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/practitioner-role-reference",
            valueReference: {
              reference: "PractitionerRole/" + req.query.practitionerrole
            }
          })
          departureReason.resource.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/departure-date",
            valueDate: endingRole.resource.period.end
          })
          let end = endingRole.resource.period.end
          if(moment(role.period.start).isAfter(end)) {
            return reject({message: "La date de fin est avant la date de début du poste"})
          }
          role.period.end = end
          bundle.entry[0].resource = role
          bundle.entry[0].request.method = "PUT"
          bundle.entry[0].request.url = "PractitionerRole/" + req.query.practitionerrole
          return resolve(bundle)
        }).catch((err) => {
          console.log(err);
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
 
module.exports = workflowEndJob
