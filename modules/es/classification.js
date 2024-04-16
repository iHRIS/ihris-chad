const utils = require("../utils")

const classification = {
  populate: (fields) => {
    return new Promise((resolve, reject) => {
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
          let grade = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/grade'
          })?.valueCoding?.display
          let classificationcategory = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/classification-category'
          })?.valueCoding?.display
          let civilservcategory = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/civil-servant-category'
          })?.valueCoding?.display
          let contractualcategory = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/contractual-category'
          })?.valueCoding?.display
          let classificationclass = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/classification-class'
          })?.valueCoding?.display
          let echelon = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/echelon'
          })?.valueCoding?.display
          let lastadminsituation = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/date-last-admin-situation'
          })?.valueDate
          let integrationdate = response.entry[0].resource.extension.find((ext) => {
            return ext.url === 'http://ihris.org/fhir/StructureDefinition/integration-date'
          })?.valueDate
          let tenuredate = response.entry[0].resource.extension.find((ext) => {
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
          let value = grade +"-^-"+ classificationcategory +"-^-"+ civilservcategory +"-^-" + contractualcategory +"-^-" + classificationclass +"-^-" + echelon +"-^-" + lastadminsituation +"-^-" + integrationdate +"-^-" + tenuredate
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
  civilservcategory: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[2])
    })
  },
  contractualcategory: (fields) => {
    return new Promise((resolve) => {
      if(!fields.classificationdata) {
        resolve()
      }
      let classification = fields.classificationdata.split("-^-")
      resolve(classification[3])
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
  }
}

module.exports = classification
