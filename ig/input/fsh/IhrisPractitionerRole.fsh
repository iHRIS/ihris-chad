Profile:        IhrisPractitionerRole
Parent:         PractitionerRole
Id:             ihris-practitioner-role
Title:          "iHRIS Practitioner Role"
Description:    "iHRIS profile of Practitioner Role."

* identifier 0..* MS
* identifier ^label = "Identifier"
* identifier.use MS
* identifier.use ^label = "Use"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.system MS
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* active 1..1 MS
* active ^label = "Active"
* period 1..1 MS
* period ^label = "Period of Employment"
* period ^constraint[0].key = "ihris-period-start-end"
* period ^constraint[0].severity = #error
* period ^constraint[0].human = "The end date must be after the start date"
* period ^constraint[0].expression = "end.empty() or end = '' or end >= start"
* period.start 1..1 MS
* period.start ^label = "Start Date"
* period.start ^minValueDateTime = "1950-01-01"
* period.start ^maxValueDateTime = "2030-01-01"
* period.end 0..1 MS
* period.end ^label = "End Date"
* period.end ^minValueDateTime = "1950-01-01"
* period.end ^maxValueDateTime = "2030-01-01"
* practitioner 0..1 MS
* practitioner ^label = "Health Worker"
* practitioner.reference ^label = "Health Worker"
* practitioner only Reference(IhrisPractitioner)
* code 1..1 MS
* code ^label = "Job"
* code from http://ihris.org/fhir/ValueSet/chad-job-valueset
* code.coding 1..1 MS
* code.coding ^label = "Job"
* specialty 0..* MS
* specialty ^label = "Specialty"
* specialty.coding 1..1 MS
* specialty.coding ^label = "Specialty"
* location 1..1 MS 
* location ^label = "Facility"
* location only Reference(TDRegion or TDDistrict or TDFacility or TDDepartment)
* extension contains
    IhrisPractitionerRolePositionStatus named positionStatus 1..1 MS and
    AppointmentDate named appointment-date 1..1 MS and
    AppointmentReference named appointment-reference 1..1 MS and
    ServiceStartReference named service-start-reference 1..1 MS and
    EffectivePresenceDate named effective-presence-date 0..1 MS and
    EffectivePresenceReference named effective-presence-reference 0..1 MS and
    AssignmentAct named assignment-act 1..1 MS and
    Comments named comments 0..1 MS
* extension[appointment-date] ^label = "Date of Assignment or Appointment"
* extension[appointment-date].valueDate MS
* extension[appointment-reference] ^label = "Appointment Reference"
* extension[appointment-reference].valueString MS
* extension[service-start-reference] ^label = "Service Start Reference"
* extension[service-start-reference].valueString MS
* extension[effective-presence-date] ^label = "Date of Effective Presence"
* extension[effective-presence-date].valueDate MS
* extension[effective-presence-reference] ^label = "Effective Presence Reference"
* extension[effective-presence-reference].valueString MS
* extension[assignment-act] ^label = "Act of assignment or appointment"
* extension[assignment-act].valueAttachment MS
* extension[comments] ^label = "Comments"
* extension[comments].valueString MS
* extension[appointment-date].valueDate MS
* extension[appointment-date] ^label = "Date of Assignment or Appointment"
* extension[appointment-reference].valueString MS
* extension[appointment-reference] ^label = "Reference Assignment or Appointment"
* extension[positionStatus].valueCoding MS
* extension[positionStatus] ^label = "Position Status"

Profile:        RoleDepartureProfile
Parent:         IhrisPractitionerBasic
Id:             role-departure-profile
Title:          "Role Departure Details"
Description:    "Role Departure Details."
* extension contains
    PractitionerRoleReference named practitioner-role-reference 1..1 MS and
    DepartureDate named departure-date 1..1 MS and
    PositionDepartureReason named position-departure-reason 1..1 MS
* extension[departure-date].valueDate MS
* extension[departure-date] ^label = "Departure Date"
* extension[position-departure-reason].valueCoding MS
* extension[position-departure-reason] ^label = "Reason for Departure"

Extension:      PractitionerRoleReference
Id:             practitioner-role-reference
Title:          "Practitioner Role Reference"
Description:    "Practitioner Role Reference"
* ^context[0].type = #element
* ^context[0].expression = "Basic"
* value[x] only Reference(IhrisPractitionerRole)
* valueReference 1..1 MS
* valueReference ^label = "Practitioner Role Reference"

Extension:      DepartureDate
Id:             departure-date
Title:          "Departure Date"
Description:    "Departure Date."
* ^context.type = #element
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Departure Date"

Extension:      IhrisPractitionerRolePositionStatus
Id:             ihris-practitionerrole-position-status
Title:          "iHRIS Job Description Position Status"
Description:    "iHRIS extension for Job Description Position Status."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Position Status"
* valueCoding from IhrisPositionStatusValueSet (required)

CodeSystem:      IhrisPositionStatusCodeSystem
Id:              ihris-position-status
Title:           "Position Status"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* #vacant "Vacant" "Vacant"
* #occupied "Occupied" "Occupied" 
* #closed "Closed" "Closed"

ValueSet:         IhrisPositionStatusValueSet
Id:               ihris-position-status
Title:            "iHRIS position Status"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisPositionStatusCodeSystem

Extension:      PositionDepartureReason
Id:             position-departure-reason
Title:          "Departure Reason"
Description:    "Departure Reason."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 0..1 MS
* valueCoding ^label = "Departure Reason"
* valueCoding from PositionDepartureReasonValueSet (required)

CodeSystem:      PositionDepartureReasonCodeSystem
Id:              position-departure-reason-codesystem
Title:           "Reason For Change/Departure"
* ^date = "2020-11-14T08:41:04.362Z"
* ^version = "0.3.0"
* #transfer "Transfer" "Transfer"
* #death "Death" "death"
* #redeployment  "Redeployment" "Redeployment"
* #earlyRetirement "Early Retirement" "Early Retirement"
* #mandatoryRetirement "Mandatory Retirement" "Mandatory Retirement"
* #resignation "Resignation" "Resignation"
* #health "Health Related" "Health Related"
* #quit "Quit" "Quit"

ValueSet:         PositionDepartureReasonValueSet
Id:               position-departure-reason-valueset
Title:            "iHRIS Reason Departure ValueSet"
* ^date = "2020-11-14T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system PositionDepartureReasonCodeSystem

Extension:      IhrisPractitionerRoleJobType
Id:             ihris-practitionerrole-job-type
Title:          "iHRIS Job Description Job Type"
Description:    "iHRIS extension for Job Description Job Type."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Job Type"
* valueCoding from IhrisJobTypeValueSet (required)

CodeSystem:      IhrisJobTypeCodeSystem
Id:              ihris-job-type-codesystem
Title:           "iHRIS Job Type CodeSystem"
* #transfer "Transfer" "Transfer"
* #newHire "New Hire" "New Hire"
* #redeployment  "Redeployment" "Redeployment"

ValueSet:         IhrisJobTypeValueSet
Id:               ihris-job-type-valueset
Title:            "iHRIS Job Type ValueSet"
* codes from system IhrisJobTypeCodeSystem

Extension:      AppointmentDate
Id:             appointment-date
Title:          "iHRIS Job Description First Employment Date"
Description:    "iHRIS extension for First Employment Date."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "First Employment Date"

Extension:      AppointmentReference
Id:             appointment-reference
Title:          "iHRIS Job Description Appointment Reference"
Description:    "iHRIS extension for Appointment Reference."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Appointment Reference"

Extension:      ServiceStartReference
Id:             service-start-reference
Title:          "iHRIS Job Description Service Start Reference"
Description:    "iHRIS extension for Service Start Reference."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Service Start Reference"

Extension:      EffectivePresenceDate
Id:             effective-presence-date
Title:          "iHRIS Job Description Date of Effective Presence"
Description:    "iHRIS extension for Date of Effective Presence."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Date of Effective Presence"

Extension:      EffectivePresenceReference
Id:             effective-presence-reference
Title:          "iHRIS Job Description Effective Presence Reference"
Description:    "iHRIS extension for Effective Presence Reference."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Effective Presence Reference"

Extension:      AssignmentAct
Id:             assignment-act
Title:          "iHRIS Job Description Act of assignment or appointment"
Description:    "iHRIS extension for Act of assignment or appointment."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Attachment
* valueAttachment 1..1 MS
* valueAttachment ^label = "Act of assignment or appointment"

Extension:      Comments
Id:             comments
Title:          "iHRIS Job Description Comments"
Description:    "iHRIS extension for Comments."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Comments"

Instance:       ihris-page-practitionerrole
InstanceOf:     IhrisPage
Title:          "iHRIS PractitionerRole Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-practitioner-role)
* extension[display].extension[link].extension[field].valueString = "PractitionerRole.practitioner.reference"
* extension[display].extension[link].extension[text].valueString = "View Practitioner"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Job|PractitionerRole.code[0].coding[0]"
* extension[display].extension[search][1].valueString = "Start Date|PractitionerRole.period.start"
* extension[display].extension[search][2].valueString = "Practitioner|PractitionerRole.practitioner"
* extension[display].extension[search][3].valueString = "Facility|PractitionerRole.location"
* extension[display].extension[search][4].valueString = "Specialty|PractitionerRole.specialty"
* extension[display].extension[filter][0].valueString = "Job|role|http://ihris.org/fhir/ValueSet/ihris-job"
* extension[section][0].extension[title].valueString = "Position"
* extension[section][0].extension[description].valueString = "Position details"
* extension[section][0].extension[name].valueString = "PractitionerRole"
* extension[section][0].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][0].extension[field][1].valueString = "PractitionerRole.practitioner"
* extension[section][0].extension[field][2].valueString = "PractitionerRole.location"
* extension[section][0].extension[field][3].valueString = "PractitionerRole.period"
* extension[section][0].extension[field][4].valueString = "PractitionerRole.specialty"
* extension[section][0].extension[field][5].valueString = "PractitionerRole.identifier"
* extension[section][1].extension[title].valueString = "Departure Reason"
* extension[section][1].extension[description].valueString = "Departure Reason"
* extension[section][1].extension[name].valueString = "departurereason"
* extension[section][1].extension[field][0].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/practitioner-role-reference').valueReference.reference"
* extension[section][1].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/role-departure-profile)
* extension[section][1].extension[resource].extension[searchfield].valueString = "practitionerrole"
* extension[section][1].extension[resource].extension[searchfieldtarget].valueString = "PractitionerRole"
* extension[section][1].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/practitioner-role-reference').valueReference.reference"
* extension[section][1].extension[resource].extension[column][0].extension[header].valueString = "Reason"
* extension[section][1].extension[resource].extension[column][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/position-departure-reason').valueCoding.display"
* extension[section][1].extension[resource].extension[column][1].extension[header].valueString = "Departure Date"
* extension[section][1].extension[resource].extension[column][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/departure-date').valueDate"

Instance:       ihris-page-job
InstanceOf:     IhrisPage
Title:          "iHRIS Job CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-job)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[search][2].valueString = "Cadre|cadre"
* extension[display].extension[search][3].valueString = "Classification|classification"
* extension[section][0].extension[title].valueString = "Job"
* extension[section][0].extension[description].valueString = "Job Titles"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.code"
* extension[section][0].extension[field][1].valueString = "CodeSystem.definition"
* extension[section][0].extension[field][2].valueString = "CodeSystem.display"
* extension[section][0].extension[field][3].valueString = "CodeSystem.cadre"
* extension[section][0].extension[field][4].valueString = "CodeSystem.classification"
* extension[section][0].extension[field][5].valueString = "CodeSystem.salary-grade"

Instance:       ihris-page-salary-grade
InstanceOf:     IhrisPage
Title:          "iHRIS Salary Scale CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-salary-grade)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[section][0].extension[title].valueString = "Salary Grade"
* extension[section][0].extension[description].valueString = "Salary Grade"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-job-classification
InstanceOf:     IhrisPage
Title:          "iHRIS Classification CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-classification)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[section][0].extension[title].valueString = "Classification"
* extension[section][0].extension[description].valueString = "Classification"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-cadre
InstanceOf:     IhrisPage
Title:          "iHRIS Cadre CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-cadre)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[section][0].extension[title].valueString = "Cadre"
* extension[section][0].extension[description].valueString = "Cadre"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-employment-status
InstanceOf:     IhrisPage
Title:          "iHRIS Employment Status CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-employment-status-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employment Status"
* extension[section][0].extension[description].valueString = "Employment Status"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-job-type
InstanceOf:     IhrisPage
Title:          "iHRIS Job Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-job-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Job Type"
* extension[section][0].extension[description].valueString = "Job Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-salary-scale
InstanceOf:     IhrisPage
Title:          "iHRIS Salary Scale CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-salary-grade)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Salary Scale"
* extension[section][0].extension[description].valueString = "Salary Scale"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-reason-departure
InstanceOf:     IhrisPage
Title:          "iHRIS Reason for Departure CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/position-departure-reason-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Reason for Departure"
* extension[section][0].extension[description].valueString = "Reason for Departure"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       AssignJob
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Assign Job Workflow"
* description = "iHRIS workflow to assign a position"
* id = "assign-job"
* url = "http://ihris.org/fhir/Questionnaire/assign-job"
* name = "assign-job"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for assigning job."

* item[0].linkId = "PractitionerRole"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[0].text = "Position|Position the person holds"
* item[0].type = #group

* item[0].item[0].linkId = "PractitionerRole.code"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.code"
* item[0].item[0].text = "Job Title"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/chad-job-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "PractitionerRole.extension[0]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:appointment-date.value[x]:valueDate"
* item[0].item[1].text = "Date of Assignment or Appointment"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "PractitionerRole.extension[1]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:appointment-reference.value[x]:valueString"
* item[0].item[2].text = "Reference Assignment or Appointment"
* item[0].item[2].type = #string
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "PractitionerRole.period.start"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.start"
* item[0].item[3].text = "Service Start Date"
* item[0].item[3].type = #date
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "PractitionerRole.period.end"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.end"
* item[0].item[4].text = "Service End Date"
* item[0].item[4].type = #date
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "PractitionerRole.extension[2]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:service-start-reference.value[x]:valueString"
* item[0].item[5].text = "Service Start Reference"
* item[0].item[5].type = #string
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "PractitionerRole.extension[3]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:effective-presence-date.value[x]:valueDate"
* item[0].item[6].text = "Date of Effective Presence"
* item[0].item[6].type = #date
* item[0].item[6].required = false
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "PractitionerRole.extension[4]"
* item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:effective-presence-reference.value[x]:valueString"
* item[0].item[7].text = "Effective Presence Reference"
* item[0].item[7].type = #string
* item[0].item[7].required = false
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "PractitionerRole.extension[5]"
* item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:assignment-act.value[x]:valueAttachment"
* item[0].item[8].text = "Act of Assignment or Appointment"
* item[0].item[8].type = #attachment
* item[0].item[8].required = false
* item[0].item[8].repeats = false

* item[0].item[9].linkId = "PractitionerRole.extension[6]#text"
* item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:comments.value[x]:valueString"
* item[0].item[9].text = "Comments"
* item[0].item[9].type = #string
* item[0].item[9].required = false
* item[0].item[9].repeats = false

* item[0].item[10].linkId = "PractitionerRole.location"
* item[0].item[10].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.location"
* item[0].item[10].text = "Facility"
* item[0].item[10].type = #reference
* item[0].item[10].required = true
* item[0].item[10].repeats = false

Instance:       ChangeJob
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Change Job Workflow"
* description = "iHRIS workflow to change job"
* id = "change-job"
* url = "http://ihris.org/fhir/Questionnaire/change-job"
* name = "change-job"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for changing job."

* item[0].linkId = "PractitionerRole"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[0].text = "Position|Position the person holds"
* item[0].type = #group

* item[0].item[0].linkId = "PractitionerRole.code"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.code"
* item[0].item[0].text = "Job Title"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/chad-job-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "PractitionerRole.extension[0]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:appointment-date.value[x]:valueDate"
* item[0].item[1].text = "Date of Assignment or Appointment"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "PractitionerRole.extension[1]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:appointment-reference.value[x]:valueString"
* item[0].item[2].text = "Reference Assignment or Appointment"
* item[0].item[2].type = #string
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "PractitionerRole.period.start"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.start"
* item[0].item[3].text = "Service Start Date"
* item[0].item[3].type = #dateTime
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "PractitionerRole.period.end"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.end"
* item[0].item[4].text = "Service End Date"
* item[0].item[4].type = #dateTime
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "PractitionerRole.extension[2]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:service-start-reference.value[x]:valueString"
* item[0].item[5].text = "Service Start Reference"
* item[0].item[5].type = #string
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "PractitionerRole.extension[3]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:effective-presence-date.value[x]:valueDate"
* item[0].item[6].text = "Date of Effective Presence"
* item[0].item[6].type = #date
* item[0].item[6].required = false
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "PractitionerRole.extension[4]"
* item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:effective-presence-reference.value[x]:valueString"
* item[0].item[7].text = "Effective Presence Reference"
* item[0].item[7].type = #string
* item[0].item[7].required = false
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "PractitionerRole.extension[5]"
* item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:assignment-act.value[x]:valueAttachment"
* item[0].item[8].text = "Act of Assignment or Appointment"
* item[0].item[8].type = #attachment
* item[0].item[8].required = false
* item[0].item[8].repeats = false

* item[0].item[9].linkId = "PractitionerRole.extension[6]#text"
* item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:comments.value[x]:valueString"
* item[0].item[9].text = "Comments"
* item[0].item[9].type = #string
* item[0].item[9].required = false
* item[0].item[9].repeats = false

* item[0].item[10].linkId = "PractitionerRole.location"
* item[0].item[10].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.location"
* item[0].item[10].text = "Facility"
* item[0].item[10].type = #reference
* item[0].item[10].required = true
* item[0].item[10].repeats = false

* item[1].linkId = "Basic[0]"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/role-departure-profile"
* item[1].text = "Change Reasons Information"
* item[1].type = #group

* item[1].item[0].linkId = "Basic[0].extension[0]"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/role-departure-profile#Basic.extension:position-departure-reason.value[x]:valueCoding"
* item[1].item[0].text = "Reason for change"
* item[1].item[0].type = #choice
* item[1].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/position-departure-reason-valueset"
* item[1].item[0].required = true
* item[1].item[0].repeats = false

Instance:       IhrisPractitionerWorkflowEndRole
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS End Role Workflow"
* description = "iHRIS workflow to end a current role/job"
* id = "ihris-endrole"
* url = "http://ihris.org/fhir/Questionnaire/ihris-endrole"
* name = "ihris-endrole"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for ending a role/job."

* item[0].linkId = "PractitionerRole"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[0].text = "End Current Appointment"
* item[0].type = #group

* item[0].item[0].linkId = "PractitionerRole.period.end"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.end"
* item[0].item[0].text = "End Date"
* item[0].item[0].type = #date
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[1].linkId = "Basic[0]"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/role-departure-profile"
* item[1].text = "Change Reasons Information"
* item[1].type = #group

* item[1].item[0].linkId = "Basic[0].extension[0]"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/role-departure-profile#Basic.extension:position-departure-reason.value[x]:valueCoding"
* item[1].item[0].text = "Reason for change"
* item[1].item[0].type = #choice
* item[1].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/position-departure-reason-valueset"
* item[1].item[0].required = true
* item[1].item[0].repeats = false

CodeSystem:     NAResourceCodeSystem
Id:             na-resource-codesystem
Title:          "Code System for iHRIS Basic Resources."
* #standard-lists         "Standard Lists"

ValueSet:       NAResourceValueSet
Id:             na-resource-valueset
Title:          "Value Set for iHRIS Namibia Basic Resources."
* codes from system NAResourceCodeSystem

Instance: basic-practitioner-role
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ihris.org/fhir/SearchParameter/basic-practitioner-role"
* name = "Search Parameter on an practitioner role extension on Basic resources"
* status = #active
* description = "Search by practitioner role for a Basic resource."
* code = #practitionerrole
* base = #Basic
* type = #reference
* expression = "Basic.extension('http://ihris.org/fhir/StructureDefinition/practitioner-role-reference')"
* xpath = "f:Basic/f:extension[@url='http://ihris.org/fhir/StructureDefinition/practitioner-role-reference']"
* xpathUsage = #normal
* target = #PractitionerRole