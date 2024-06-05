const moment = require("moment")
const fhirAxios = require("../../../modules/fhir/fhirAxios")
const utils = require("../utils")

const staffdirectorate = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let jobtitle = ""
      let qualification = ""
      let specialization = ""
      let contractualcategory = ""
      let civilservcategory = ""
      let appointmentdate = ""
      let servicestartdate = ""
      let integrationdate = ""
      let effectivepresdate = ""
      let location = ""
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
            jobtitle = response.entry[0].resource?.code[0]?.coding[0]?.display
            if(!jobtitle) {
              jobtitle = ""
            }
            appointmentdate = response.entry[0].resource.extension.find((ext) => {
              return ext.url === "http://ihris.org/fhir/StructureDefinition/appointment-date"
            })?.valueDate
            if(appointmentdate) {
              appointmentdate = moment(appointmentdate).format("DD-MM-YYYY")
            } else {
              appointmentdate = ""
            }

            servicestartdate = response.entry[0].resource?.period?.start
            if(servicestartdate) {
              servicestartdate = moment(servicestartdate).format("DD-MM-YYYY")
            } else {
              servicestartdate = ""
            }

            effectivepresdate = response.entry[0].resource.extension.find((ext) => {
              return ext.url === "http://ihris.org/fhir/StructureDefinition/effective-presence-date"
            })?.valueDate
            if(effectivepresdate) {
              effectivepresdate = moment(effectivepresdate).format("DD-MM-YYYY")
            } else {
              effectivepresdate = ""
            }
            if(response.entry[0].resource?.location) {
              location = response.entry[0].resource?.location[0]?.reference
              await fhirAxios.read("Location", location.split("/")[1]).then((loc) => {
                location = loc.name
              })
            }

          }
          resolve()
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
            qualification = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/qualification'
            })?.valueCoding?.display
            if(!qualification) {
              qualification = ""
            }
          }
          resolve()
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })

      const specialty = new Promise((resolve, reject) => {
        let params = {
          practitioner: fields.practitionerid,
          _profile: "http://ihris.org/fhir/StructureDefinition/preservice-training-profile,http://ihris.org/fhir/StructureDefinition/inservice-training-profile"
        }
        fhirAxios.search("Basic", params).then((response) => {
          if(!response || !response.entry || !response.entry.length) {
            return resolve()
          }
          let latest = {
            resource: ""
          }
          for(let entry of response.entry) {
            if(!latest.resource) {
              latest.resource = entry.resource
              continue
            }
            let training = entry.resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/preservice-training'
            })
            if(!training) {
              training = entry.resource.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/inservice-training'
              })
            }
            let endYear = training.extension.find((ext) => {
              return ext.url === "end-year"
            })?.valueDate
            let currTraining = latest.resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/preservice-training'
            })
            if(!currTraining) {
              currTraining = latest.resource.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/inservice-training'
              })
            }
            let currEndYear = currTraining.extension.find((ext) => {
              return ext.url === "end-year"
            })?.valueDate
            if(endYear) {
              endYear = moment(endYear).format("YYYY")
            }
            if(currEndYear) {
              currEndYear = moment(currEndYear).format("YYYY")
            }
            if(moment(currEndYear).isBefore(endYear)) {
              latest.resource = entry.resource
            }
          }
          if(latest.resource) {
            let training = latest.resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/preservice-training'
            })
            if(!training) {
              training = latest.resource.extension.find((ext) => {
                return ext.url === 'http://ihris.org/fhir/StructureDefinition/inservice-training'
              })
            }
            specialization = training.extension.find((ext) => {
              return ext.url === 'specialization'
            })?.valueCoding?.display
            if(!specialization) {
              specialization = ""
            }
          }
          resolve()
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })

      const classification = new Promise((resolve, reject) => {
        let params = {
          practitioner: fields.practitionerid,
          _profile: "http://ihris.org/fhir/StructureDefinition/classification-profile"
        }
        utils.getLatestResourceById({
          resource: "Basic",
          params,
          total: 1
        }).then((response) => {
          if(response && response.entry && response.entry.length) {
            civilservcategory = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/civil-servant-category'
            })?.valueCoding?.display
            contractualcategory = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/contractual-category'
            })?.valueCoding?.display
            if(!civilservcategory) {
              civilservcategory = ""
            }
            if(!contractualcategory) {
              contractualcategory = ""
            }
            integrationdate = response.entry[0].resource.extension.find((ext) => {
              return ext.url === "http://ihris.org/fhir/StructureDefinition/integration-date"
            })?.valueDate
            if(integrationdate) {
              integrationdate = moment(integrationdate).format("DD-MM-YYYY")
            } else {
              integrationdate = ""
            }
          }
          resolve()
        }).catch((err) => {
          console.log(err);
          reject()
        })
      })
      Promise.all([job, situation, specialty, classification]).then(() => {
        let value = jobtitle+"-^-"+qualification+"-^-" + specialization +"-^-" + civilservcategory +"-^-" + contractualcategory + "-^-" + appointmentdate + "-^-" + integrationdate + "-^-" + servicestartdate + "-^-" + effectivepresdate + "-^-" + location
        resolve(value)
      })
    })
  },
  jobtitle: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[0])
    })
  },
  qualification: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[1])
    })
  },
  specialty: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[2])
    })
  },
  civilservcategory: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[3])
    })
  },
  contractualcategory: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[4])
    })
  },
  appointmentdate: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[5])
    })
  },
  integrationdate: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[6])
    })
  },
  servicestartdate: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[7])
    })
  },
  effectivepresdate: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[8])
    })
  },
  location: (fields) => {
    return new Promise((resolve) => {
      if(!fields.staffdirectoratedata) {
        resolve()
      }
      let values = fields.staffdirectoratedata.split("-^-")
      resolve(values[9])
    })
  }
}

module.exports = staffdirectorate