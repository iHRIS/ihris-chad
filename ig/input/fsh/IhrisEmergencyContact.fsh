Profile:        IhrisBasicEmergency
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-emergency
Title:          "Emergency Information"
Description:    "iHRIS Profile of the Basic resource for Emergency."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEmergency named emergency 1..1 MS
* extension[emergency] ^label = "Emergency"
* extension[emergency].extension[name] ^label = "Full Name"
* extension[emergency].extension[name].valueString 1..1 MS
* extension[emergency].extension[relation] ^label = "Relationship"
* extension[emergency].extension[relation].valueCoding 1..1 MS
* extension[emergency].extension[phone] ^label = "Phone"
* extension[emergency].extension[phone].valueString MS
    
Extension:      IhrisEmergency
Id:             ihris-emergency
Title:          "Emergency details"
* extension contains name 1..1 MS and
    relation 0..1 MS and
    phone 1..1 MS
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Full Name"
* extension[relation].value[x] only Coding
* extension[relation].valueCoding 1..1 MS
* extension[relation].valueCoding ^label = "Relationship"
* extension[relation].valueCoding from IhrisRelationValueSet (required)
* extension[phone].value[x] only string
* extension[phone].valueString 0..1 MS
* extension[phone].valueString ^label = "Phone"

Instance:       IhrisPractitionerWorkflowEmergency
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Emergency Workflow"
* description = "iHRIS workflow to record a Emergency"
* id = "ihris-emergency"
* url = "http://ihris.org/fhir/Questionnaire/ihris-emergency"
* name = "ihris-emergency"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Emergency information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency"
* item[0].text = "Emergency"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:name.value[x]:valueString"
* item[0].item[0].item[0].text = "Full Name"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:relation.value[x]:valueCoding"
* item[0].item[0].item[1].text = "Relation"
* item[0].item[0].item[1].type = #choice
* item[0].item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-relation-valueset"
* item[0].item[0].item[1].required = false
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:phone.value[x]:valueString"
* item[0].item[0].item[2].text = "Phone"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

Instance:       ihris-page-emergency
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Emergency Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-emergency)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Emergency|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='name').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Emergency Contact"
* extension[section][0].extension[description].valueString = "Emergency Contact details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:emergency.extension:name"
* extension[section][0].extension[field][2].valueString = "Basic.extension:emergency.extension:relation"
* extension[section][0].extension[field][3].valueString = "Basic.extension:emergency.extension:phone"