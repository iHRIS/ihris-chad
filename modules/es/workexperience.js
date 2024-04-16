const fhirAxios = require("../../../modules/fhir/fhirAxios")
const utils = require("../utils")

const workexperience = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let params = {
        practitioner: fields.practitionerid,
        _profile: "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history"
      }
      utils.getLatestResourceById({
        resource: "Basic",
        params,
        total: 1
      }).then(async(response) => {
        if(response && response.entry && response.entry.length) {
          let employment = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/ihris-employment-history'
          })
          let ministry = employment.extension.find((ext) => {
            return ext.url === 'ministry'
          })?.valueCoding?.display
          let country = employment.extension.find((ext) => {
            return ext.url === 'country'
          })?.valueCoding?.display
          let job = employment.extension.find((ext) => {
            return ext.url === 'job'
          })?.valueString
          let startYear = employment.extension.find((ext) => {
            return ext.url === 'start-year'
          })?.valueDate
          let endYear = employment.extension.find((ext) => {
            return ext.url === 'end-year'
          })?.valueDate
          let service = employment.extension.find((ext) => {
            return ext.url === 'service'
          })?.valueCoding?.display
          let location = employment.extension.find((ext) => {
            return ext.url === 'location'
          })?.valueReference?.reference
          if(location) {
            await fhirAxios.read("Location", location.split("/")[1]).then((resp) => {
              location = resp.name
            })
          }
          if(!ministry) {
            ministry = ""
          }
          if(!country) {
            country = ""
          }
          if(!job) {
            job = ""
          }
          if(!startYear) {
            startYear = ""
          }
          if(!endYear) {
            endYear = ""
          }
          if(!service) {
            service = ""
          }
          if(!location) {
            location = ""
          }
          let value = ministry +"-^-"+ country +"-^-"+ job +"-^-" + startYear +"-^-" + endYear +"-^-" + service +"-^-" + location
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
  ministry: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[0])
    })
  },
  country: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[1])
    })
  },
  job: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[2])
    })
  },
  startYear: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[3])
    })
  },
  endYear: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[4])
    })
  },
  service: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[5])
    })
  },
  location: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let workexperience = fields.workexperiencedata.split("-^-")
      resolve(workexperience[6])
    })
  }
}

module.exports = workexperience
