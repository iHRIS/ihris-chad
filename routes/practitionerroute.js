const express = require('express')
const router = express.Router()
const ExcelJS = require('exceljs');
const fs = require('fs')
const async = require('async')
const moment = require('moment')
const { v5: uuidv5 } = require('uuid')
const { nanoid } = require('nanoid')
const fhirAxios = require('../../modules/fhir/fhirAxios')
const fhirSecurity = require('../../modules/fhir/fhirSecurity')

let codesystems = {}

router.post("/practitionersImport", async(req, res) => {
  let rows = []
  const workbookErrors = new ExcelJS.Workbook();
  const importErrors = workbookErrors.addWorksheet("Not Imported");

  const workbook = new ExcelJS.Workbook();
  await workbook.xlsx.load(req.files.leave.data);
  workbook.eachSheet((worksheet) => {
    worksheet.eachRow(async(sheetrow, rowNumber) => {
      if(rowNumber < 2) {
        let row = []
        sheetrow.eachCell({ includeEmpty: true }, (cell, colNumber) => {
          row.push(cell.value)
        })
        populateErrorFile(row, "Error Reasons")
      }
      let row = {}
      if(rowNumber > 1) {
        sheetrow.eachCell({ includeEmpty: true }, (cell, colNumber) => {
          let value = cell.value
          if(!value) {
            value = ""
          } else {
            value = value.toString().trim()
          }
          if(colNumber === 1) {
            row["Registration Number"] = value
          }
          if(colNumber === 2) {
            row["Full name"] = value
          }
          if(colNumber === 3) {
            row["gender"] = value
          }
          if(colNumber === 4) {
            row["Date of birth"] = value
          }
          if(colNumber === 5) {
            row["Lieu de Naissance"] = value
          }
          if(colNumber === 6) {
            row["PROFIL"] = value
          }
          if(colNumber === 7) {
            row["SPECIALITY"] = value
          }
          if(colNumber === 8) {
            row["CAT"] = value
          }
          if(colNumber === 9) {
            row["Echelle"] = value
          }
          if(colNumber === 10) {
            row["Grade"] = value
          }
          if(colNumber === 11) {
            row["Echelon"] = value
          }
          if(colNumber === 12) {
            row["Ancien Poste"] = value
          }
          if(colNumber === 13) {
            row["Province"] = value
          }
          if(colNumber === 14) {
            row["FACILITY"] = value
          }
          if(colNumber === 15) {
            row["Fonction"] = value
          }
          if(colNumber === 16) {
            row["INTEGRATION DATE"] = value
          }
          if(colNumber === 17) {
            row["Date of Appointment"] = value
          }
          if(colNumber === 18) {
            row["Date of service start"] = value
          }
          if(colNumber === 19) {
            row["Agent Status"] = value
          }
        });
      }
      if(!row["Registration Number"] && rowNumber > 1 && !isEmptyRow(row)) {
        populateErrorFile(row, "Missing Registration Number")
      } else if(rowNumber > 1) {
        //if its the last column and its empty, exceljs ignores it on eachCell
        if(!sheetrow.getCell(19).value) {
          row["Agent Status"] = ""
        }
        rows.push(row)
      }
    })
  })
  let bundle = {
    entry: [],
    resourceType: 'Bundle',
    type: 'transaction'
  }
  let processed = []
  async.eachOfSeries(rows, (row, index, nxtRow) => {
    console.log("Processing " + (parseInt(index) + 1));
    let regs = row["Registration Number"].split(",")
    if(regs.length === 2) {
      row["Registration Number"] = regs.join(",")
    }
    let exist = processed.find((pr) => {
      return pr === row["Registration Number"]
    })
    if(exist) {
      populateErrorFile(row, "Dupplicate Registration Number")
      return nxtRow()
    }
    processed.push(row["Registration Number"])
    const searchRegNum = new Promise((reso, reje) => {
      let params = {
        regnum: row["Registration Number"]
      }
      fhirAxios.search("Practitioner", params).then((response) => {
        if(response && response && response.entry && response.entry.length) {
          return reso(true)
        }
        reso(false)
      }).catch((err) => {
        console.log(err);
        reso(false)
      })
    })
    const searchFac = new Promise((reso, reje) => {
      if(!row.FACILITY) {
        return reso()
      }
      searchFacility(row.FACILITY).then((data) => {
        reso(data)
      }).catch(() => {
        reje()
      })
    })
  
    const searchProv = new Promise((reso, reje) => {
      if(!row.Province) {
        return reso()
      }
      searchFacility(row.Province).then((data) => {
        reso(data)
      }).catch(() => {
        reje()
      })
    })
    Promise.all([searchFac, searchProv, searchRegNum]).then(async(response) => {
      if(response[2]) {
        populateErrorFile(row, "Dupplicate Registration Number")
        return nxtRow()
      }
      let name = row['Full name']
      name = titleCase(name)
      name = name.split(' ').filter(n => n).join(' '); 
      let names = name.split(' ')
      let surname = names.pop()
      let practitionerURL = "urn:uuid:" + uuidv5( index.toString(), "e91c9519-eccb-48a8-a506-6659b8c22518" )
      let resource = {
        resourceType: "Practitioner",
        meta: {
          profile: ["http://ihris.org/fhir/StructureDefinition/ihris-practitioner"]
        },
        name: [{
          use: "official",
          family: surname,
          given: names
        }],
        extension: []
      }
      if(row.gender) {
        let gender = row.gender
        if(gender == "F") {
          resource.gender = "female"
        } else if(gender == "M") {
          resource.gender = "male"
        }
      }
      if(row["Date of birth"]) {
        let dob = row["Date of birth"].split("/")
        if(dob.length == 3) {
          let month = dob[0]
          let day = dob[1]
          if(day.toString().length == 1) {
            day = "0"+day
          }
          if(month.toString().length == 1) {
            month = "0"+month
          }
          dob = dob[2] + "-" + month + "-" + day
          if(moment(dob, "YYYY-MM-DD", true).isValid()) {
            resource.birthDate = dob
          }
        }
      }
      if(row.Nationality && row.Nationality) {
        let nationality = await searchCode("nationality-codesystem", row.Nationality)
        resource.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality",
          valueCoding: {
            system: "http://ihris.org/fhir/CodeSystem/nationality-codesystem",
            code: nationality.code,
            display: nationality.display
          }
        })
      }
      if(row["Registration Number"]) {
        resource.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/registration-number",
          valueString: row["Registration Number"]
        })
      }
      if(row["Date of service start"]) {
        let date = row["Date of service start"]
        date = date.split("/")
        if(date.length === 3) {
          if(date[2].length === 2) {
            date[2] = '20' + date[2]
          }
          let month = date[0]
          let day = date[1]
          if(day.toString().length == 1) {
            day = "0"+day
          }
          if(month.toString().length == 1) {
            month = "0"+month
          }
          date = date[2] + "-" + month + "-" + day
          if(moment(date, "YYYY-MM-DD", true).isValid()) {
            resource.extension.push({
              url: "http://ihris.org/fhir/StructureDefinition/first-service-start-date",
              valueDate: date
            })
          }
        }
      }
      bundle.entry.push({
        fullUrl: practitionerURL,
        resource: resource,
        request: {
          method: "POST",
          url: "Practitioner"
        }
      })

      if(row["Agent Status"]) {
        let status = searchCode("agent-status-codesystem", row["Agent Status"])
        if(status) {
          let agentStatus = {
            resourceType: "Basic",
            meta: {
              profile: ["http://ihris.org/fhir/StructureDefinition/agent-status-profile"]
            },
            extension: [{
              url: "http://ihris.org/fhir/StructureDefinition/agent-status",
              valueCoding: {
                system: "http://ihris.org/fhir/CodeSystem/agent-status-codesystem",
                code: status.code,
                display: status.display
              }
            }, {
              url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
              valueReference: {
                reference: practitionerURL
              }
            }]
          }
          bundle.entry.push({
            resource: agentStatus,
            request: {
              method: "POST",
              url: "Basic"
            }
          })
        }
      }
      
      let qualification = await searchCode("qualification-codesystem", row.PROFIL)
      let specialty = await searchCode("specialty-codesystem", row.SPECIALITY)
      let status = await searchCode("agent-status-codesystem", row["Agent Status"])
      let situfunction = await searchCode("function-codesystem", row["Fonction"])
      let situation = {
        resourceType: "Basic",
        meta: {
          profile: [ "http://ihris.org/fhir/StructureDefinition/situation-profile" ]
        },
        extension: []
      }
      if(situfunction) {
        situation.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/function",
          valueCoding: {
            system: "http://ihris.org/fhir/CodeSystem/function-codesystem",
            code: situfunction.code,
            display: situfunction.display
          }
        })
      }
      if(qualification) {
        situation.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/qualification",
          valueCoding: {
            system: "http://ihris.org/fhir/CodeSystem/qualification-codesystem",
            code: qualification.code,
            display: qualification.display
          }
        })
      }
      if(specialty) {
        situation.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/specialty",
          valueCoding: {
            system: "http://ihris.org/fhir/CodeSystem/specialty-codesystem",
            code: specialty.code,
            display: specialty.display
          }
        })
      }
      if(status) {
        situation.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/situation-status",
          valueCoding: {
            system: "http://ihris.org/fhir/CodeSystem/situation-status-codesystem",
            code: status.code,
            display: status.display
          }
        })
      }
      if(situation.extension.length) {
        situation.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
          valueReference: {
            reference: practitionerURL
          }
        })
        bundle.entry.push({
          resource: situation,
          request: {
            method: "POST",
            url: "Basic"
          }
        })
      }
      let classification = {
        resourceType: "Basic",
        meta: {
          profile: [ "http://ihris.org/fhir/StructureDefinition/classification-profile" ]
        },
        extension: []
      }
      if(row.Class && row.Class) {
        let classificationclass
        let classes = [1, 2, 3, 4, 5, 6, 7, 8]
        for(let cls of classes) {
          if(row.Class.includes(cls)) {
            classificationclass = cls
          }
        }
        if(classificationclass) {
          classification.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/classification-class",
            valueCoding: {
              system: "http://ihris.org/fhir/CodeSystem/classification-class-codesystem",
              code: classificationclass,
              display: classificationclass
            }
          })
        }
      }
      if(row.CAT) {
        let civilCat = ["A", "B", "C", "D"]
        let contractCat = ["I", "II", "III", "IV", "V", "VI"]
        let classes = [1, 2, 3, 4, 5, 6, 7, 8]
        let civilservantcategory
        let contractualcategory
        let classificationclass
        for(let cat of civilCat) {
          if(row.CAT.includes(cat)) {
            civilservantcategory = cat
          }
        }
        for(let cat of contractCat) {
          if(row.CAT.includes(cat)) {
            contractualcategory = cat
          }
        }
        for(let cls of classes) {
          if(row.CAT.includes(cls)) {
            classificationclass = cls
          }
        }
        if(civilservantcategory) {
          classification.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/civil-servant-category",
            valueCoding: {
              system: "http://ihris.org/fhir/CodeSystem/civil-servant-category-codesystem",
              code: civilservantcategory,
              display: civilservantcategory
            }
          })
        }
        if(classificationclass) {
          classification.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/classification-class",
            valueCoding: {
              system: "http://ihris.org/fhir/CodeSystem/classification-class-codesystem",
              code: classificationclass,
              display: classificationclass
            }
          })
        }
        if(contractualcategory) {
          classification.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/contractual-category",
            valueCoding: {
              system: "http://ihris.org/fhir/CodeSystem/contractual-category-codesystem",
              code: contractualcategory,
              display: contractualcategory
            }
          })
        }
      }
      let classCat = {}
      if(row["Classification Category"] && row["Classification Category"] === 'Fonctionnaire') {
        classCat.code = "civilservant"
        classCat.display = "Fonctionnaire"
      } else if(row["Classification Category"] && row["Classification Category"] === 'Contractuel') {
        classCat.code = "contract"
        classCat.display = "Contrat"
      }
      if(classCat.code) {
        classification.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/classification-category",
          valueCoding: {
            system: "http://ihris.org/fhir/CodeSystem/classification-category-codesystem",
            code: classCat.code,
            display: classCat.display
          }
        })
      }
      if(row.grade) {
        let code = ""
        let display = ""
        if(row.grade === "Initial") {
          code = "initial"
          display = "Initial"
        }
        if(code) {
          classification.extension.push({
            url: "http://ihris.org/fhir/StructureDefinition/grade",
            valueCoding: {
              system: "http://ihris.org/fhir/CodeSystem/grade-codesystem",
              code: code,
              display: display
            }
          })
        }
      }
      if(row["INTEGRATION DATE"]) {
        let date = row["INTEGRATION DATE"]
        date = date.split("/")
        if(date.length === 3) {
          let month = date[0]
          let day = date[1]
          if(day.toString().length == 1) {
            day = "0"+day
          }
          if(month.toString().length == 1) {
            month = "0"+month
          }
          date = date[2] + "-" + month + "-" + day
          if(moment(date, "YYYY-MM-DD", true).isValid()) {
            classification.extension.push({
              url: "http://ihris.org/fhir/StructureDefinition/integration-date",
              valueDate: date
            })
          }
        }
      }
      if(row["Reference act of integration"] && row["Reference act of integration"]) {
        let reference = row["Reference act of integration"]
        classification.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/reference-integration-act",
          valueString: reference
        })
      }
      if(row["Date of Tenure"] && row["Date of Tenure"]) {
        let date = row["Date of Tenure"]
        date = date.split("/")
        if(date.length === 3) {
          if(date[2].length === 2) {
            date[2] = '20' + date[2]
          }
          let month = date[0]
          let day = date[1]
          if(day.toString().length == 1) {
            day = "0"+day
          }
          if(month.toString().length == 1) {
            month = "0"+month
          }
          date = date[2] + "-" + month + "-" + day
          if(moment(date, "YYYY-MM-DD", true).isValid()) {
            classification.extension.push({
              url: "http://ihris.org/fhir/StructureDefinition/tenure-date",
              valueDate: date
            })
          }
        }
      }
      if(classification.extension.length) {
        classification.extension.push({
          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
          valueReference: {
            reference: practitionerURL
          }
        })
        bundle.entry.push({
          resource: classification,
          request: {
            method: "POST",
            url: "Basic"
          }
        })
      }
      let location
      if(response[0]) {
        location = response[0]
      } else if(response[1]) {
        location = response[1]
      }
      if(location) {
        let role = {
          resourceType: "PractitionerRole",
          meta: {
            profile: ["http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"]
          },
          location: [{
            reference: location
          }],
          practitioner: {
            reference: practitionerURL
          },
          active: true
        }
        if(row['Date of Appointment']) {
          let appdate = row["Date of Appointment"].split("/")
          if(appdate.length == 3) {
            let month = appdate[0]
            let day = appdate[1]
            if(day.toString().length == 1) {
              day = "0"+day
            }
            if(month.toString().length == 1) {
              month = "0"+month
            }
            appdate = appdate[2] + "-" + month + "-" + day
            if(moment(appdate, "YYYY-MM-DD", true).isValid()) {
              role.period = {
                start: appdate
              }
            }
          }
        }
        bundle.entry.push({
          resource: role,
          request: {
            method: "POST",
            url: "PractitionerRole"
          }
        })
      }
      if(bundle.entry.length > 20) {
        let tmpbundle = { ...bundle }
        bundle.entry = []
        save(tmpbundle).then(() => {
          return nxtRow()
        }).catch(() => {
          return nxtRow()
        })
      } else {
        return nxtRow()
      }
    })
  }, () => {
    if(bundle.entry.length > 0) {
      save(bundle).then(() => {
        console.log("Done");
      }).catch(() => {

      })
    }
    if (!fs.existsSync(`${__dirname}/../tmp`)) {
      fs.mkdirSync(`${__dirname}/../tmp`);
    }
    let fileName = `${__dirname}/../tmp/importerror-${nanoid(10)}.xlsx`;
    workbookErrors.xlsx.writeFile(fileName).then(() => {
      res.download(fileName);
      //delete the file after 4 minutes
      setTimeout(() => {
        fs.unlinkSync(fileName);
      }, 240000);
    });
  })

  function searchCode(codesystem, name) {
    return new Promise(async(resolve, reject) => {
      if(!codesystems[codesystem]) {
        await fhirAxios.read("CodeSystem", codesystem).then((response) => {
          codesystems[codesystem] = response.concept
        }).catch((err) => {
          console.log(err);
          return reject()
        })
      }
      let concept = codesystems[codesystem].find((qual) => {
        if(qual.display.localeCompare(name, 'en', { sensitivity: 'base' }) === 0) {
          return true
        }
        return false
      })
      return resolve(concept)
    })
  }

  function searchFacility(name) {
    return new Promise((resolve, reject) => {
      name = titleCase(name)
      let params = {
        name: name
      }
      fhirAxios.search('Location', params).then((location) => {
        if(location.entry && location.entry.length) {
          return resolve("Location/" + location.entry[0].resource.id)
        }
        resolve()
      }).catch((err) => {
        console.log(err);
        reject()
      })
    })
  }

  function populateErrorFile(row, reason) {
    let rowarr = []
    for(let val in row) {
      rowarr.push(row[val])
    }
    rowarr.push(reason)
    importErrors.insertRow(importErrors.rowCount+1, rowarr)
  }

  function titleCase(str) {
    let splitStr = str.toLowerCase().split(' ');
    for (let i = 0; i < splitStr.length; i++) {
      splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);
    }
    return splitStr.join(' '); 
  }

  function isEmptyRow(row) {
    if(!row["Registration Number"] && !row["Full name"] && !row["gender"] && !row["Date of birth"]) {
      return true
    }
    return false
  }

  function save(bundle) {
    return new Promise((resolve, reject) => {
      fhirSecurity.preProcess(bundle).then((uuid) => {
        fhirAxios.create(bundle).then((resp) => {
          fhirSecurity.postProcess(resp, uuid).then(() => {
            return reolve()
          }).catch((err) => {
            return reject()
          })
        })
      }).catch((err) => {
        console.log(err);
        return reject()
      })
    })
  }
})
module.exports = router