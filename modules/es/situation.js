const utils = require("../utils")
const fhirAxios = require("../../../modules/fhir/fhirAxios")

const situation = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let status = ""
      let qualification = ""
      let fn = ""
      let level = ""
      let specialty = ""
      let facility = ""
      let district = ""
      let region = ""
      const job = new Promise((resolve, reject) => {
        let params = {
          practitioner: fields.practitionerid,
          _profile: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
        }
        utils.getLatestResourceById({
          resource: "PractitionerRole",
          params,
          total: 1
        }).then(async(response) => {
          if(response && response.entry && response.entry.length) {
            if(response.entry[0].resource?.location) {
              let location = response.entry[0].resource?.location[0]?.reference
              await fhirAxios.read("Location", location.split("/")[1]).then(async(loc) => {
                if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-facility")) {
                  facility = loc.name
                } else if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-district")) {
                  district = loc.name
                } else if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-region")) {
                  region = loc.name
                }
                if(loc.partOf && loc.partOf.reference) {
                  await fhirAxios.read("Location", loc.partOf.reference.split("/")[1]).then(async(loc) => {
                    if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-facility")) {
                      facility = loc.name
                    } else if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-district")) {
                      district = loc.name
                    } else if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-region")) {
                      region = loc.name
                    }
                    if(loc.partOf && loc.partOf.reference) {
                      await fhirAxios.read("Location", loc.partOf.reference.split("/")[1]).then((loc) => {
                        if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-facility")) {
                          facility = loc.name
                        } else if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-district")) {
                          district = loc.name
                        } else if(loc.meta.profile.includes("http://ihris.org/fhir/StructureDefinition/td-region")) {
                          region = loc.name
                        }
                        resolve()
                      })
                    } else {
                      resolve()
                    }
                  })
                } else {
                  resolve()
                }
              })
            } else {
              resolve()
            }
          } else {
            resolve()
          }
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })

      const situation = new Promise((resolve, reject) => {
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
            status = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/agent-status'
            })?.valueCoding?.display
            qualification = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/qualification'
            })?.valueCoding?.display
            fn = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/function'
            })?.valueCoding?.display
            level = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/study-level'
            })?.valueCoding?.display
            specialty = response.entry[0].resource.extension.find((ext) => {
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
            resolve()
          } else {
            return resolve()
          }
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })

      Promise.all([job, situation]).then(() => {
        let value = status+"-^-"+qualification+"-^-" + fn +"-^-" + level +"-^-" + specialty +"-^-" + facility +"-^-" + district +"-^-" + region
        resolve(value)
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
  },
  facility: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let values = fields.situationdata.split("-^-")
      resolve(values[5])
    })
  },
  district: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let values = fields.situationdata.split("-^-")
      resolve(values[6])
    })
  },
  region: (fields) => {
    return new Promise((resolve) => {
      if(!fields.situationdata) {
        resolve()
      }
      let values = fields.situationdata.split("-^-")
      resolve(values[7])
    })
  }
}

module.exports = situation
