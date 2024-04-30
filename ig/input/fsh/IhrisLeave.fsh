Profile:        IhrisBasicLeave
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-leave
Title:          "Leave Information"
Description:    "iHRIS Profile of the Basic resource for Leave."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisLeave named leave 1..1 MS
* extension[leave].extension[leave-type] ^label = "Leave Type"
* extension[leave].extension[leave-type].valueCoding MS
* extension[leave].extension[start-date] ^label = "Leave Start Date"
* extension[leave].extension[start-date].valueDate MS
* extension[leave].extension[end-date] ^label = "Leave End Date"
* extension[leave].extension[end-date].valueDate MS
* extension[leave].extension[dateRequested] ^label = "Requested Date"
* extension[leave].extension[dateRequested].valueDate MS
* extension[leave].extension[leave-order-reference] ^label = "Reference of the Leave Order"
* extension[leave].extension[leave-order-reference].valueString MS
* extension[leave].extension[leave-order-sign-date] ^label = "Date of signing of the order"
* extension[leave].extension[leave-order-sign-date].valueDate MS
* extension[leave].extension[effective-termination-date] ^label = "Effective Termination Date"
* extension[leave].extension[effective-termination-date].valueDate MS
* extension[leave].extension[effective-resumption-date] ^label = "Effective Resumption Date"
* extension[leave].extension[effective-resumption-date].valueDate MS
    
Extension:      IhrisLeave
Id:             ihris-leave
Title:          "Leave details"
* extension contains
      leave-type 1..1 MS and
      start-date 1..1 MS and
      end-date 1..1 MS and
      dateRequested 0..1 MS and
      leave-order-reference 1..1 MS and
      leave-order-sign-date 1..1 MS and
      effective-termination-date 1..1 MS and
      effective-resumption-date 1..1 MS
* extension[leave-type].value[x] only Coding
* extension[leave-type].valueCoding from IhrisLeaveTypeValueSet (required)
* extension[leave-type].valueCoding ^label = "Leave Type"
* extension[start-date].value[x] only date
* extension[start-date].valueDate ^label = "Leave Start Date"
* extension[end-date].value[x] only date
* extension[end-date].valueDate ^label = "Leave End Date"
* extension[dateRequested].value[x] only date
* extension[dateRequested].valueDate ^label = "Requested Date"
* extension[leave-order-reference].value[x] only string
* extension[leave-order-reference].valueString ^label = "Reference of the Leave Order"
* extension[leave-order-sign-date].value[x] only date
* extension[leave-order-sign-date].valueDate ^label = "Date of signing of the order"
* extension[effective-termination-date].value[x] only date
* extension[effective-termination-date].valueDate ^label = "Effective Termination Date"
* extension[effective-resumption-date].value[x] only date
* extension[effective-resumption-date].valueDate ^label = "Effective Resumption Date"

Instance:       IhrisPractitionerWorkflowLeave
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Leave Workflow"
* description = "iHRIS workflow to record a leave"
* id = "ihris-leave"
* url = "http://ihris.org/fhir/Questionnaire/ihris-leave"
* name = "ihris-leave"
* status = #active
* date = 2020-08-20
* purpose = "Workflow page for recording a leave information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave"
* item[0].text = "Leave Details"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave"
* item[0].item[0].text = "Leave Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:leave-type.value[x]:valueCoding"
* item[0].item[0].item[0].text = "Leave Type"
* item[0].item[0].item[0].type = #choice
* item[0].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-leave-type-valueset"
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:start-date.value[x]:valueDate"
* item[0].item[0].item[1].text = "Start Date"
* item[0].item[0].item[1].type = #date
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:end-date.value[x]:valueDate"
* item[0].item[0].item[2].text = "End Date"
* item[0].item[0].item[2].type = #date
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:dateRequested.value[x]:valueDate"
* item[0].item[0].item[3].text = "Date Requested"
* item[0].item[0].item[3].type = #date
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:leave-order-reference.value[x]:valueString"
* item[0].item[0].item[4].text = "Reference of the Leave Order"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false

* item[0].item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:leave-order-sign-date.value[x]:valueDate"
* item[0].item[0].item[5].text = "Date of signing of the order"
* item[0].item[0].item[5].type = #date
* item[0].item[0].item[5].required = true
* item[0].item[0].item[5].repeats = false

* item[0].item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:effective-termination-date.value[x]:valueDate"
* item[0].item[0].item[6].text = "Effective Termination Date"
* item[0].item[0].item[6].type = #date
* item[0].item[0].item[6].required = false
* item[0].item[0].item[6].repeats = false

* item[0].item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-leave#Basic.extension:leave.extension:effective-resumption-date.value[x]:valueDate"
* item[0].item[0].item[7].text = "Effective Resumption Date"
* item[0].item[0].item[7].type = #date
* item[0].item[0].item[7].required = false
* item[0].item[0].item[7].repeats = false

Instance:       ihris-page-leave
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Leave Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-leave)
* extension[display].extension[link].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link].extension[text].valueString = "View Health Worker"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Leave Type|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-leave').extension.where(url='leave-type').valueCoding"
* extension[display].extension[search][1].valueString = "Start Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-leave').extension.where(url='period').valuePeriod.start"
* extension[display].extension[search][2].valueString = "End Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-leave').extension.where(url='period').valuePeriod.end"
* extension[display].extension[search][3].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][4].valueString = "Date Requested|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-leave').extension.where(url='dateRequested').valueDate"
* extension[display].extension[filter][0].valueString = "Leave Type|code|http://ihris.org/fhir/ValueSet/ihris-leave-type-valueset"
* extension[section][0].extension[title].valueString = "Leave"
* extension[section][0].extension[description].valueString = "Leave details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:leave.extension:leave-type"
* extension[section][0].extension[field][2].valueString = "Basic.extension:leave.extension:start-date"
* extension[section][0].extension[field][3].valueString = "Basic.extension:leave.extension:end-date"
* extension[section][0].extension[field][4].valueString = "Basic.extension:leave.extension:dateRequested"
* extension[section][0].extension[field][5].valueString = "Basic.extension:leave.extension:leave-order-reference"
* extension[section][0].extension[field][6].valueString = "Basic.extension:leave.extension:leave-order-sign-date"
* extension[section][0].extension[field][7].valueString = "Basic.extension:leave.extension:effective-termination-date"
* extension[section][0].extension[field][8].valueString = "Basic.extension:leave.extension:effective-resumption-date"

Instance:       ihris-page-leave-type
InstanceOf:     IhrisPage
Title:          "iHRIS Leave Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-leave-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[section][0].extension[title].valueString = "Leave Type"
* extension[section][0].extension[description].valueString = "Leave Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"