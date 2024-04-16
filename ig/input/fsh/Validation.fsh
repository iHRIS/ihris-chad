Profile:        ValidationProfile
Parent:         IhrisPractitionerBasic
Id:             validation-profile
Title:          "Validation Information"
Description:    "Validation Information Profile."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Practitioner"
* extension contains
    Validated named validated 1..1 MS and
    Comment named comment 1..1 MS
* extension[validated]  1..1 MS
* extension[validated]  ^label = "Validated"
* extension[validated].valueCoding MS
* extension[comment]  1..1 MS
* extension[comment]  ^label = "Comment"
* extension[comment].valueString MS

Extension:      Validated
Id:             validated
Title:          "Validated"
Description:    "Validated."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Validated"
* valueCoding from http://ihris.org/fhir/ValueSet/yes-no-valueset (required)

Extension:      Comment
Id:             comment
Title:          "Comment"
Description:    "Comment."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Comment"

Instance:       Validation
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Validation Information Workflow"
* description = "iHRIS workflow to record a Validation Information"
* id = "validation"
* url = "http://ihris.org/fhir/Questionnaire/validation"
* name = "validation"
* status = #active
* date = 2020-09-02
* purpose = "Validation information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/validation-profile"
* item[0].text = "Validation"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/validation-profile#Basic.extension:validated.value[x]:valueCoding"
* item[0].item[0].text = "Validated"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/yes-no-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[1]#text"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/validation-profile#Basic.extension:comment.value[x]:valueString"
* item[0].item[1].text = "Comment"
* item[0].item[1].type = #string
* item[0].item[1].required = false
* item[0].item[1].repeats = false


Instance:       ihris-page-validation
InstanceOf:     IhrisPage
Title:          "validation Information Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/validation-profile)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Validated|extension.where(url='http://ihris.org/fhir/StructureDefinition/validated').valueCoding"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "validation Information"
* extension[section][0].extension[description].valueString = "validation Information"
* extension[section][0].extension[name].valueString = "validationinformation"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:validated"
* extension[section][0].extension[field][2].valueString = "Basic.extension:comment"