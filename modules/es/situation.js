const utils = require("../utils")

const situation = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let params = {
        practitioner: fields.practitionerid,
        _profile: "http://ihris.org/fhir/StructureDefinition/situation-profile"
      }
      utils.getLatestResourceById({
        resource: "Basic",
        params,
        total: 1
      }).then((response) => {
        if(response && response.entry && response.entry.length) {
          let status = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/agent-status'
          })?.valueCoding?.display
          let qualification = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/qualification'
          })?.valueCoding?.display
          let fn = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/function'
          })?.valueCoding?.display
          let level = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/study-level'
          })?.valueCoding?.display
          let specialty = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/specialty'
          })?.valueCoding?.display
          if(!status) {
            status = ""
          }
          if(!qualification) {
            qualification = ""
          }
          if(!fn) {
            fn = ""
          }
          if(!level) {
            level = ""
          }
          if(!specialty) {
            specialty = ""
          }
          let value = status+"-^-"+qualification+"-^-" + fn +"-^-" + level +"-^-" + specialty
          resolve(value)
        } else {
          return resolve()
        }
      }).catch((err) => {
        console.log(err);
        reject()
      })
    })
  },
  status: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let situation = fields.situationdata.split("-^-")
      resolve(situation[0])
    })
  },
  qualification: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let situation = fields.situationdata.split("-^-")
      resolve(situation[1])
    })
  },
  fn: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let situation = fields.situationdata.split("-^-")
      resolve(situation[2])
    })
  },
  level: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let situation = fields.situationdata.split("-^-")
      resolve(situation[3])
    })
  },
  specialty: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let situation = fields.situationdata.split("-^-")
      resolve(situation[4])
    })
  }
}

module.exports = situation
