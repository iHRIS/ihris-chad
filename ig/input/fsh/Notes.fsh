Profile:        NotesProfile
Parent:         IhrisPractitionerBasic
Id:             notes-profile
Title:          "Notes Information"
Description:    "Notes Information Profile."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Practitioner"
* extension contains
    NoteDate named note-date 1..1 MS and
    Note named note 1..1 MS
* extension[note-date]  1..1 MS
* extension[note-date]  ^label = "Date Added"
* extension[note-date].valueDate MS
* extension[note]  1..1 MS
* extension[note]  ^label = "Note"
* extension[note].valueString MS

Extension:      NoteDate
Id:             note-date
Title:          "Note Date"
Description:    "Note Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Note Date"

Extension:      Note
Id:             note
Title:          "Note"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Note"

Instance:       Note
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Note Information Workflow"
* description = "iHRIS workflow to record a Note Information"
* id = "notes"
* url = "http://ihris.org/fhir/Questionnaire/notes"
* name = "notes"
* status = #active
* date = 2024-02-29
* purpose = "Note information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/notes-profile"
* item[0].text = "Note"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/notes-profile#Basic.extension:note-date.value[x]:valueDate"
* item[0].item[0].text = "Date Added"
* item[0].item[0].type = #date
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[1]#text"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/notes-profile#Basic.extension:note.value[x]:valueString"
* item[0].item[1].text = "Note"
* item[0].item[1].type = #string
* item[0].item[1].required = true
* item[0].item[1].repeats = false

Instance:       ihris-page-notes
InstanceOf:     IhrisPage
Title:          "Note Information Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/notes-profile)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Note Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/note-date').valueDate"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Notes Information"
* extension[section][0].extension[description].valueString = "Notes Information"
* extension[section][0].extension[name].valueString = "notesinformation"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:note-date"
* extension[section][0].extension[field][2].valueString = "Basic.extension:note"