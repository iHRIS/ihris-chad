Profile:        ScannedDocumentProfile
Parent:         IhrisPractitionerBasic
Id:             scanned-document-profile
Title:          "Scanned Document Information"
Description:    "Scanned Document Information Profile."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Practitioner"
* extension contains
    IhrisBasicName named name 1..1 MS and
    UploadDate named upload-date 1..1 MS and
    ScannedDocument named scanned-document 1..1 MS
* extension[name]  1..1 MS
* extension[name]  ^label = "Name"
* extension[name].valueString MS
* extension[upload-date]  1..1 MS
* extension[upload-date]  ^label = "Date Uploaded"
* extension[upload-date].valueDate MS
* extension[scanned-document]  1..1 MS
* extension[scanned-document]  ^label = "Document"
* extension[scanned-document].valueAttachment MS

Extension:      UploadDate
Id:             upload-date
Title:          "Upload Date"
Description:    "Upload Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Upload Date"

Extension:      ScannedDocument
Id:             scanned-document
Title:          "Document"
* value[x] only Attachment
* valueAttachment 1..1 MS
* valueAttachment ^label = "Document"

Instance:       ScannedDocument
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Scanned Document Information Workflow"
* description = "iHRIS workflow to record a Scanned Document Information"
* id = "scanned-document"
* url = "http://ihris.org/fhir/Questionnaire/scanned-document"
* name = "scanned-document"
* status = #active
* date = 2024-02-29
* purpose = "Scanned Document information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/scanned-document-profile"
* item[0].text = "Scanned Document"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/scanned-document-profile#Basic.extension:name.value[x]:valueString"
* item[0].item[0].text = "Attachment Name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/scanned-document-profile#Basic.extension:upload-date.value[x]:valueDate"
* item[0].item[1].text = "Date Uploaded"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[2]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/scanned-document-profile#Basic.extension:scanned-document.value[x]:valueAttachment"
* item[0].item[2].text = "Document"
* item[0].item[2].type = #attachment
* item[0].item[2].required = true
* item[0].item[2].repeats = false

Instance:       ihris-page-scanned-document
InstanceOf:     IhrisPage
Title:          "Scanned Document Information Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/scanned-document-profile)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Upload Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/upload-date').valueDate"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Scanned Document Information"
* extension[section][0].extension[description].valueString = "Scanned Document Information"
* extension[section][0].extension[name].valueString = "scanneddocumentinformation"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:name"
* extension[section][0].extension[field][2].valueString = "Basic.extension:upload-date"
* extension[section][0].extension[field][3].valueString = "Basic.extension:scanned-document"