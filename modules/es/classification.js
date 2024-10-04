const utils = require("../utils")
const fhirAxios = require("../../../modules/fhir/fhirAxios")

const classification = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
      let grade = ""
      let classificationcategory = ""
      let classificationcategorycode = ""
      let classificationcatcategory = ""
      let civilservcategory = ""
      let civilservcategorycode = ""
      let contractualcategory = ""
      let contractualcategorycode = ""
      let classificationclass = ""
      let echelon = ""
      let lastadminsituation = ""
      let integrationdate = ""
      let tenuredate = ""
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
            grade = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/grade'
            })?.valueCoding?.display
            classificationcategory = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/classification-category'
            })?.valueCoding?.display
            classificationcategorycode = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/classification-category'
            })?.valueCoding?.code
            civilservcategory = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/civil-servant-category'
            })?.valueCoding?.display
            civilservcategorycode = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/civil-servant-category'
            })?.valueCoding?.code
            contractualcategory = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/contractual-category'
            })?.valueCoding?.display
            contractualcategorycode = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/contractual-category'
            })?.valueCoding?.code
            classificationclass = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/classification-class'
            })?.valueCoding?.display
            echelon = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/echelon'
            })?.valueCoding?.display
            lastadminsituation = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/date-last-admin-situation'
            })?.valueDate
            integrationdate = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/integration-date'
            })?.valueDate
            tenuredate = response.entry[0].resource.extension.find((ext) => {
              return ext.url === 'http://ihris.org/fhir/StructureDefinition/integration-date'
            })?.valueDate
            if(!grade) {
              grade = ""
            }
            if(!classificationcategory) {
              classificationcategory = ""
            }
            if(!civilservcategory) {
              civilservcategory = ""
            }
            if(!contractualcategory) {
              contractualcategory = ""
            }
            if(!classificationclass) {
              classificationclass = ""
            }
            if(!echelon) {
              echelon = ""
            }
            if(!lastadminsituation) {
              lastadminsituation = ""
            }
            if(!integrationdate) {
              integrationdate = ""
            }
            if(!tenuredate) {
              tenuredate = ""
            }
            classificationcatcategory = classificationcategorycode
            if(civilservcategorycode) {
              classificationcatcategory += ":" + civilservcategorycode
            } else if(contractualcategorycode) {
              classificationcatcategory += ":" + contractualcategorycode
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

      Promise.all([job, classification]).then(() => {
        let value = grade +"-^-"+ classificationcategory +"-^-"+ civilservcategory +"-^-" + contractualcategory +"-^-" + classificationclass +"-^-" + echelon +"-^-" + lastadminsituation +"-^-" + integrationdate +"-^-" + tenuredate +"-^-" + classificationcatcategory +"-^-" + facility +"-^-" + district +"-^-" + region
        resolve(value)
      }).catch((err) => {
        console.log(err);
        reject()
      })
    })
  },
  grade: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[0])
    })
  },
  classificationcategory: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[1])
    })
  },
  category: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let values = fields.classificationdata.split("-^-")
      let category = values[2]
      if(!category) {
        category = values[3]
      }
      resolve(category)
    })
  },
  classificationcatcategory: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[9])
    })
  },
  classificationclass: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[4])
    })
  },
  echelon: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[5])
    })
  },
  lastadminsituation: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[6])
    })
  },
  integrationdate: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[7])
    })
  },
  tenuredate: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[8])
    })
  },
  facility: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let values = fields.classificationdata.split("-^-")
      resolve(values[10])
    })
  },
  district: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let values = fields.classificationdata.split("-^-")
      resolve(values[11])
    })
  },
  region: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let values = fields.classificationdata.split("-^-")
      resolve(values[12])
    })
  }
}

module.exports = classification
