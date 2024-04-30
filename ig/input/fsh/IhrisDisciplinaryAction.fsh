Profile:        IhrisBasicDiscipline
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-discipline
Title:          "Discipline Information"
Description:    "iHRIS Profile of the Basic resource for Discipline."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisDiscipline named discipline 1..1 MS
* extension[discipline] ^label = "Discipline Information"
* extension[discipline].extension[actionType] ^label = "Discipline Action Type"
* extension[discipline].extension[actionType].valueCoding 1..1 MS
* extension[discipline].extension[actionTypeOther] ^label = "Other Action Type"
* extension[discipline].extension[actionTypeOther].valueString MS
* extension[discipline].extension[givenBy] ^label = "Given By"
* extension[discipline].extension[givenBy].valueString MS
* extension[discipline].extension[actionTaken] ^label = "Action Taken"
* extension[discipline].extension[actionTaken].valueCoding MS
* extension[discipline].extension[act-reference] ^label = "Reference of the Act"
* extension[discipline].extension[act-reference].valueString MS
* extension[discipline].extension[start-date].valueDate MS
* extension[discipline].extension[start-date] ^label = "Effective Start Date"
* extension[discipline].extension[end-date].valueDate MS
* extension[discipline].extension[end-date] ^label = "Effective End Date"
* extension[discipline].extension[patterns] ^label = "Patterns"
* extension[discipline].extension[patterns].valueString 1..1 MS
    
Extension:      IhrisDiscipline
Id:             ihris-discipline
Title:          "Discipline details"
* extension contains
    actionType 1..1 MS and
    actionTypeOther 1..1 MS and
    actionTaken 1..1 MS and
    act-reference 1..1 MS and
    givenBy 1..1 MS and
    start-date 1..1 MS and
    end-date 1..1 MS and
    patterns 1..1 MS
* extension[actionType].value[x] only Coding
* extension[actionType].valueCoding 1..1 MS
* extension[actionType].valueCoding ^label = "Discipline Action Type"
* extension[actionType].valueCoding from DisciplinaryActionTypeValueSet (required)
* extension[actionTypeOther].value[x] only string
* extension[actionTypeOther].valueString MS
* extension[actionTypeOther].valueString ^label = "Other Action Type"
* extension[givenBy].value[x] only string
* extension[givenBy].valueString MS
* extension[givenBy].valueString ^label = "Given By"
* extension[actionTaken].value[x] only Coding
* extension[actionTaken].valueCoding MS
* extension[actionTaken].valueCoding ^label = "Action Taken"
* extension[actionTaken].valueCoding from DisciplinaryActionTakenValueSet (required)
* extension[act-reference].value[x] only string
* extension[act-reference].valueString MS
* extension[act-reference].valueString ^label = "Reference of the Act"
* extension[start-date].value[x] only date
* extension[start-date].valueDate ^label = "Effective Start Date"
* extension[end-date].value[x] only date
* extension[end-date].valueDate ^label = "Effective End Date"
* extension[patterns].value[x] only string
* extension[patterns].valueString 1..1 MS
* extension[patterns].valueString ^label = "Patterns"

Instance:       IhrisPractitionerWorkflowDiscipline
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Discipline Workflow"
* description = "iHRIS workflow to record a Discipline"
* id = "ihris-discipline"
* url = "http://ihris.org/fhir/Questionnaire/ihris-discipline"
* name = "ihris-discipline"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Discipline information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline"
* item[0].text = "Discipline"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:actionType.value[x]:valueCoding"
* item[0].item[0].item[0].text = "Disciplinary Action Type"
* item[0].item[0].item[0].type = #choice
* item[0].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/discipline-action-type-valueset"
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:actionTypeOther.value[x]:valueString"
* item[0].item[0].item[1].text = "Other Disciplinary Action Type"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false
* item[0].item[0].item[1].enableWhen[0].question = "Basic.extension[0].extension[0]"
* item[0].item[0].item[1].enableWhen[0].operator = #=
* item[0].item[0].item[1].enableWhen[0].answerCoding = ihris-discipline-action-type-codesystem#other

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:givenBy.value[x]:valueString"
* item[0].item[0].item[2].text = "Given By"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:actionTaken.value[x]:valueCoding"
* item[0].item[0].item[3].text = "Action Taken"
* item[0].item[0].item[3].type = #choice
* item[0].item[0].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/disciplinary-action-taken-valueset"
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:act-reference.value[x]:valueString"
* item[0].item[0].item[4].text = "Reference of the Act"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false

* item[0].item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:start-date.value[x]:valueDate"
* item[0].item[0].item[5].text = "Effective Start date"
* item[0].item[0].item[5].type = #date
* item[0].item[0].item[5].required = true
* item[0].item[0].item[5].repeats = false

* item[0].item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:end-date.value[x]:valueDate"
* item[0].item[0].item[6].text = "Effective End Date"
* item[0].item[0].item[6].type = #date
* item[0].item[0].item[6].required = true
* item[0].item[0].item[6].repeats = false

* item[0].item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-discipline#Basic.extension:discipline.extension:patterns.value[x]:valueString"
* item[0].item[0].item[7].text = "Patterns"
* item[0].item[0].item[7].type = #string
* item[0].item[0].item[7].required = true
* item[0].item[0].item[7].repeats = false

Instance:       ihris-page-discipline
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Discipline Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-discipline)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-discipline/discipline?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Discipline|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-discipline').extension.where(url='actionType').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employee Discipline"
* extension[section][0].extension[description].valueString = "Employee Discipline details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:discipline.extension:actionType"
* extension[section][0].extension[field][2].valueString = "Basic.extension:discipline.extension:givenBy"
* extension[section][0].extension[field][3].valueString = "Basic.extension:discipline.extension:actionTaken"
* extension[section][0].extension[field][4].valueString = "Basic.extension:discipline.extension:act-reference"
* extension[section][0].extension[field][5].valueString = "Basic.extension:discipline.extension:start-date"
* extension[section][0].extension[field][6].valueString = "Basic.extension:discipline.extension:end-date"
* extension[section][0].extension[field][7].valueString = "Basic.extension:discipline.extension:patterns"