Profile:        IhrisBasicEducationHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-education-history
Title:          "Education History Information"
Description:    "iHRIS Profile of the Basic resource for Education History."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEducationHistory named educationHistory 1..1 MS
* extension[educationHistory].extension[institution] ^label = "Institution Name"
* extension[educationHistory].extension[institution].valueString 1..1 MS
* extension[educationHistory].extension[institution].valueString ^label = "Institution Name"
* extension[educationHistory].extension[location] ^label = "Institution Location"
* extension[educationHistory].extension[location].valueString 1..1 MS
* extension[educationHistory].extension[location].valueString ^label = "Institution Location"
* extension[educationHistory].extension[year] ^label = "Year Of Graduation"
* extension[educationHistory].extension[year].valueDate ^label = "Year Of Graduation"
* extension[educationHistory].extension[year].valueDate 0..1 MS
* extension[educationHistory].extension[degree] ^label = "Degree"
* extension[educationHistory].extension[degree].valueReference ^label = "Degree"
* extension[educationHistory].extension[degree].valueReference 1..1 MS
* extension[educationHistory].extension[specialized] ^label = "Specialized"
* extension[educationHistory].extension[specialized].valueCoding ^label = "Specialized"
* extension[educationHistory].extension[specialized].valueCoding 0..1 MS
* extension[educationHistory].extension[specialization] ^label = "Specialization"
* extension[educationHistory].extension[specialization].valueCoding ^label = "Specialization"
* extension[educationHistory].extension[specialization].valueCoding MS
    
Extension:      IhrisEducationHistory
Id:             ihris-education-history
Title:          "Education History details"
* extension contains
      institution 1..1 MS and
      location 1..1 MS and
      year 0..1 MS and
      degree 1..1 MS and
      specialized 1..1 MS and
      specialization 0..1 MS
* extension[institution].value[x] only string
* extension[institution].valueString ^label = "Institution Name"
* extension[location].value[x] only string
* extension[location].valueString ^label = "Institution Location"
* extension[year].value[x] only date
* extension[year].valueDate ^label = "Year Of Graduation"
* extension[degree].value[x] only Reference(TDDegreeProfile)
* extension[degree].valueReference ^label = "Degree"
* extension[specialized].value[x] only Coding
* extension[specialized].valueCoding ^label = "Specialized"
* extension[specialized].valueCoding from http://ihris.org/fhir/ValueSet/yes-no-valueset (required)
* extension[specialization].value[x] only Coding
* extension[specialization].valueCoding ^label = "Specialization"
* extension[specialization].valueCoding from http://ihris.org/fhir/ValueSet/specialization-valueset (required)

Instance:       IhrisPractitionerWorkflowEducationHistory
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Education History Workflow"
* description = "iHRIS workflow to record a Education History"
* id = "ihris-education-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-education-history"
* name = "ihris-education-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Education History information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history"
* item[0].text = "Education History"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:institution.value[x]:valueString"
* item[0].item[0].text = "Institution Name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:location.value[x]:valueString"
* item[0].item[1].text = "Institution Location"
* item[0].item[1].type = #string
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]#year"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:year.value[x]:valueDate"
* item[0].item[2].text = "Year Of Graduation"
* item[0].item[2].type = #date
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:degree.value[x]:valueReference"
* item[0].item[3].text = "Degree"
* item[0].item[3].type = #reference
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:specialized.value[x]:valueCoding"
* item[0].item[4].text = "Specialized"
* item[0].item[4].type = #choice
* item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/yes-no-valueset"
* item[0].item[4].required = true
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:specialization.value[x]:valueCoding"
* item[0].item[5].text = "Specialization (If Applicable)"
* item[0].item[5].type = #choice
* item[0].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/specialization-valueset"
* item[0].item[5].required = false
* item[0].item[5].repeats = false

Instance:       ihris-page-education-history
InstanceOf:     IhrisPage
Title:          "Education History"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-education-history/education-history?practitioner=FIELD"
* extension[display].extension[link][1].extension[task].valueId = "ihris-task-add-education"
* extension[display].extension[search][0].valueString = "Practitioner|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Institution|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueReference.reference"
* extension[display].extension[search][2].valueString = "Degree|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='degree').valueReference.reference"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[display].extension[field][1].extension[path].valueString = "Basic.extension:educationHistory.extension:year.value[x]:valueDate"
* extension[display].extension[field][1].extension[type].valueString = "year"
* extension[section][0].extension[title].valueString = "Education History"
* extension[section][0].extension[description].valueString = "Education History details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:educationHistory.extension:institution"
* extension[section][0].extension[field][2].valueString = "Basic.extension:educationHistory.extension:location"
* extension[section][0].extension[field][3].valueString = "Basic.extension:educationHistory.extension:year"
* extension[section][0].extension[field][4].valueString = "Basic.extension:educationHistory.extension:degree"
* extension[section][0].extension[field][5].valueString = "Basic.extension:educationHistory.extension:specialized"
* extension[section][0].extension[field][6].valueString = "Basic.extension:educationHistory.extension:specialization"
