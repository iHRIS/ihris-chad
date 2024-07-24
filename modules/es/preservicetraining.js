const fhirAxios = require("../../../modules/fhir/fhirAxios")
const utils = require("../utils")

const preservicetraining = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let sector = ""
      let institution = ""
      let country = ""
      let startYear = ""
      let endYear = ""
      let degree = ""
      let specialization = ""
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

      const training = new Promise((resolve, reject) => {
        let params = {
          practitioner: fields.practitionerid,
          _profile: "http://ihris.org/fhir/StructureDefinition/preservice-training-profile"
        }
        utils.getLatestResourceById({
          resource: "Basic",
          params,
          total: 1
        }).then(async(response) => {
          if(response && response.entry && response.entry.length) {
            let training = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/preservice-training'
            })
            sector = training.extension.find((ext) => {
              return ext.url === 'sector'
            })?.valueCoding?.display
            institution = training.extension.find((ext) => {
              return ext.url === 'institution'
            })?.valueString
            country = training.extension.find((ext) => {
              return ext.url === 'country'
            })?.valueCoding?.display
            startYear = training.extension.find((ext) => {
              return ext.url === 'start-year'
            })?.valueDate
            endYear = training.extension.find((ext) => {
              return ext.url === 'end-year'
            })?.valueDate
            degree = training.extension.find((ext) => {
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
            resolve()
          } else {
            return resolve()
          }
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })

      Promise.all([job, training]).then(() => {
        let value = sector +"-^-"+ institution +"-^-"+ country +"-^-" + startYear +"-^-" + endYear +"-^-" + degree +"-^-" + specialization +"-^-" + facility +"-^-" + district +"-^-" + region
        resolve(value)
      }).catch((err) => {
        console.log(err);
        reject()
      })
    })
  },
  sector: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[0])
    })
  },
  institution: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[1])
    })
  },
  country: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[2])
    })
  },
  startYear: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[3])
    })
  },
  endYear: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[4])
    })
  },
  degree: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[5])
    })
  },
  specialization: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let preservicetraining = fields.preservicetrainingdata.split("-^-")
      resolve(preservicetraining[6])
    })
  },
  facility: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let values = fields.preservicetrainingdata.split("-^-")
      resolve(values[7])
    })
  },
  district: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let values = fields.preservicetrainingdata.split("-^-")
      resolve(values[8])
    })
  },
  region: (fields) => {
    return new Promise((resolve) => {
      if(!fields.preservicetrainingdata) {
        resolve()
      }
      let values = fields.preservicetrainingdata.split("-^-")
      resolve(values[9])
    })
  }
}

module.exports = preservicetraining
