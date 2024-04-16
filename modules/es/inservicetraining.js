const fhirAxios = require("../../../modules/fhir/fhirAxios")
const utils = require("../utils")

const inservicetraining = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let params = {
        practitioner: fields.practitionerid,
        _profile: "http://ihris.org/fhir/StructureDefinition/inservice-training-profile"
      }
      utils.getLatestResourceById({
        resource: "Basic",
        params,
        total: 1
      }).then(async(response) => {
        if(response && response.entry && response.entry.length) {
          let training = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/inservice-training'
          })
          let sector = training.extension.find((ext) => {
            return ext.url === 'sector'
          })?.valueCoding?.display
          let institution = training.extension.find((ext) => {
            return ext.url === 'institution'
          })?.valueString
          let country = training.extension.find((ext) => {
            return ext.url === 'country'
          })?.valueCoding?.display
          let startYear = training.extension.find((ext) => {
            return ext.url === 'start-year'
          })?.valueDate
          let endYear = training.extension.find((ext) => {
            return ext.url === 'end-year'
          })?.valueDate
          let degree = training.extension.find((ext) => {
            return ext.url === 'degree'
          })?.valueReference.reference
          if(degree) {
            await fhirAxios.read("Basic", degree.split("/")[1]).then((resp) => {
              degree = resp.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/ihris-basic-name'
              }).valueString
            })
          }
          let specialization = training.extension.find((ext) => {
            return ext.url === 'specialization'
          })?.valueCoding?.display
          if(!sector) {
            sector = ""
          }
          if(!institution) {
            institution = ""
          }
          if(!country) {
            country = ""
          }
          if(!startYear) {
            startYear = ""
          }
          if(!endYear) {
            endYear = ""
          }
          if(!degree) {
            degree = ""
          }
          if(!specialization) {
            specialization = ""
          }
          let value = sector +"-^-"+ institution +"-^-"+ country +"-^-" + startYear +"-^-" + endYear +"-^-" + degree +"-^-" + specialization
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
  sector: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[0])
    })
  },
  institution: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[1])
    })
  },
  country: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[2])
    })
  },
  startYear: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[3])
    })
  },
  endYear: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[4])
    })
  },
  degree: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[5])
    })
  },
  specialization: (fields) => {
    return new Promise((resolve) => {
      if(!fields.inservicetrainingdata) {
        resolve()
      }
      let inservicetraining = fields.inservicetrainingdata.split("-^-")
      resolve(inservicetraining[6])
    })
  }
}

module.exports = inservicetraining
