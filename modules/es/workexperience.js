const fhirAxios = require("../../../modules/fhir/fhirAxios")
const utils = require("../utils")

const workexperience = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let ministry = ""
      let country = ""
      let job = ""
      let startYear = ""
      let endYear = ""
      let service = ""
      let location = ""
      let facility = ""
      let district = ""
      let region = ""
      const role = new Promise((resolve, reject) => {
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

      const experience = new Promise((resolve, reject) => {
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
            resolve()
          } else {
            return resolve()
          }
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })

      Promise.all([role, experience]).then(() => {
        let value = ministry +"-^-"+ country +"-^-"+ job +"-^-" + startYear +"-^-" + endYear +"-^-" + service +"-^-" + location +"-^-" + facility +"-^-" + district +"-^-" + region
        resolve(value)
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
  },
  facility: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let values = fields.workexperiencedata.split("-^-")
      resolve(values[7])
    })
  },
  district: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let values = fields.workexperiencedata.split("-^-")
      resolve(values[8])
    })
  },
  region: (fields) => {
    return new Promise((resolve) => {
      if(!fields.workexperiencedata) {
        resolve()
      }
      let values = fields.workexperiencedata.split("-^-")
      resolve(values[9])
    })
  }
}

module.exports = workexperience
