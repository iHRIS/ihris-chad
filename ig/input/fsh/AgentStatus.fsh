Profile:        AgentStatusProfile
Parent:         IhrisPractitionerBasic
Id:             agent-status-profile
Title:          "Agent Status Information"
Description:    "Agent Status Information Profile."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Practitioner"
* extension contains
    AgentStatus named agent-status 1..1 MS and
    AgentStatusOther named agent-status-other 1..1 MS and
    ResumptionDate named resumption-date 0..1 MS and
    StartDate named start-date 1..1 MS and
    EndDate named end-date 0..1 MS and
    ResumptionReference named resumption-reference 0..1 MS
* extension[agent-status]  1..1 MS
* extension[agent-status]  ^label = "Agent Status"
* extension[agent-status].valueCoding MS
* extension[agent-status-other]  1..1 MS
* extension[agent-status-other]  ^label = "Other Agent Status"
* extension[agent-status-other].valueString MS
* extension[start-date]  1..1 MS
* extension[start-date]  ^label = "Start Date"
* extension[start-date].valueDate MS
* extension[resumption-date]  1..1 MS
* extension[resumption-date]  ^label = "Resumption Date"
* extension[resumption-date].valueDate MS
* extension[resumption-reference]  1..1 MS
* extension[resumption-reference]  ^label = "Resumption Reference"
* extension[resumption-reference].valueString MS
* extension[end-date]  0..1 MS
* extension[end-date]  ^label = "End Date"
* extension[end-date].valueDate MS

Extension:      AgentStatus
Id:             agent-status
Title:          "Agent Status"
Description:    "Agent Status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Agent Status"
* valueCoding from http://ihris.org/fhir/ValueSet/agent-status-valueset (required)

Extension:      AgentStatusOther
Id:             agent-status-other
Title:          "Agent Status"
Description:    "Agent Status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Other Agent Status"

Extension:      ResumptionReference
Id:             resumption-reference
Title:          "Resumption Reference"
Description:    "Resumption Reference."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Resumption Reference"

Extension:      ResumptionDate
Id:             resumption-date
Title:          "Resumption Date"
Description:    "Resumption Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Resumption Date"

Extension:      StartDate
Id:             start-date
Title:          "Start Date"
Description:    "Start Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Start Date"

Extension:      EndDate
Id:             end-date
Title:          "End Date"
Description:    "End Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "End Date"

Instance:       AgentStatus
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Agent Status Information Workflow"
* description = "iHRIS workflow to record agent status information"
* id = "agent-status"
* url = "http://ihris.org/fhir/Questionnaire/agent-status"
* name = "agent-status"
* status = #active
* date = 2020-09-02
* purpose = "Agent Status information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/agent-status-profile"
* item[0].text = "Agent Status"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/agent-status-profile#Basic.extension:agent-status.value[x]:valueCoding"
* item[0].item[0].text = "Status"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/agent-status-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/agent-status-profile#Basic.extension:resumption-date.value[x]:valueDate"
* item[0].item[1].text = "Resumption Date"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false
* item[0].item[1].enableWhen[0].question = "Basic.extension[0]"
* item[0].item[1].enableWhen[0].operator = #=
* item[0].item[1].enableWhen[0].answerCoding = agent-status-codesystem#active

* item[0].item[2].linkId = "Basic.extension[2]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/agent-status-profile#Basic.extension:resumption-reference.value[x]:valueString"
* item[0].item[2].text = "Resumption Reference"
* item[0].item[2].type = #string
* item[0].item[2].required = false
* item[0].item[2].repeats = false
* item[0].item[2].enableWhen[0].question = "Basic.extension[0]"
* item[0].item[2].enableWhen[0].operator = #=
* item[0].item[2].enableWhen[0].answerCoding = agent-status-codesystem#active

* item[0].item[3].linkId = "Basic.extension[3]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/agent-status-profile#Basic.extension:start-date.value[x]:valueDate"
* item[0].item[3].text = "Start Date"
* item[0].item[3].type = #date
* item[0].item[3].required = true
* item[0].item[3].repeats = false
* item[0].item[3].enableWhen[0].question = "Basic.extension[0]"
* item[0].item[3].enableWhen[0].operator = #!=
* item[0].item[3].enableWhen[0].answerCoding = agent-status-codesystem#active

Instance:       ihris-page-agent-status
InstanceOf:     IhrisPage
Title:          "Agent Status Information Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/agent-status-profile)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Agent Status|extension.where(url='http://ihris.org/fhir/StructureDefinition/agent-status').valueCoding"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Agent Status Information"
* extension[section][0].extension[description].valueString = "Agent Status Information"
* extension[section][0].extension[name].valueString = "agentstatusinformation"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:agent-status"
* extension[section][0].extension[field][2].valueString = "Basic.extension:start-date"
* extension[section][0].extension[field][3].valueString = "Basic.extension:end-date"