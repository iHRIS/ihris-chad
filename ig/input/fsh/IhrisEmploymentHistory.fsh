Profile:        IhrisBasicEmploymentHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-employment-history
Title:          "Work Experience Information"
Description:    "iHRIS Profile of the Basic resource for Work Experience."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEmploymentHistory named employmentHistory 1..1 MS
* extension[employmentHistory].extension[institution-type].valueCoding 1..1 MS
* extension[employmentHistory].extension[institution-type] ^label = "Institution Type"
* extension[employmentHistory].extension[organization].valueString 1..1 MS
* extension[employmentHistory].extension[organization] ^label = "Organization Name"
* extension[employmentHistory].extension[ministry].valueCoding 1..1 MS
* extension[employmentHistory].extension[ministry] ^label = "Ministry"
* extension[employmentHistory].extension[country].valueCoding MS
* extension[employmentHistory].extension[country] ^label = "Country"
* extension[employmentHistory].extension[job].valueString MS
* extension[employmentHistory].extension[job] ^label = "Function/Job Title"
* extension[employmentHistory].extension[job-description].valueString 1..1  MS
* extension[employmentHistory].extension[job-description] ^label = "Job Description"
* extension[employmentHistory].extension[start-year].valueDate MS
* extension[employmentHistory].extension[start-year] ^label = "Start year"
* extension[employmentHistory].extension[end-year].valueDate MS
* extension[employmentHistory].extension[end-year] ^label = "End year"
* extension[employmentHistory].extension[reason-leaving].valueString MS
* extension[employmentHistory].extension[reason-leaving] ^label = "Reason For Leaving"
* extension[employmentHistory].extension[service].valueCoding MS
* extension[employmentHistory].extension[service] ^label = "Service"
* extension[employmentHistory].extension[location].valueReference MS
* extension[employmentHistory].extension[location] ^label = "Location"

Extension:      IhrisEmploymentHistory
Id:             ihris-employment-history
Title:          "Work Experience details"
* extension contains
    institution-type 1..1 and
    organization 1..1 MS and
    ministry 1..1 MS and
    country 1..1 MS and
    job 1..1 MS and
    job-description 0..1 MS and
    start-year 0..1 MS and
    end-year 0..1 MS and
    reason-leaving 0..1 MS and
    service 0..1 MS and
    location 0..1 MS
* extension[institution-type].value[x] only Coding
* extension[institution-type].valueCoding ^label = "Institution Type"
* extension[institution-type].valueCoding from InstitutionTypeValueSet (required)
* extension[organization].value[x] only string
* extension[organization].valueString ^label = "Organization Name"
* extension[ministry].value[x] only Coding
* extension[ministry].valueCoding ^label = "Ministry"
* extension[ministry].valueCoding from MinistryValueSet (required)
* extension[country].value[x] only Coding
* extension[country].valueCoding ^label = "Country"
* extension[country].valueCoding from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)
* extension[job].value[x] only string
* extension[job].valueString ^label = "Function/Job Title"
* extension[job-description].value[x] only string
* extension[job-description].valueString ^label = "Job Description"
* extension[start-year].value[x] only date
* extension[start-year].valueDate ^label = "Start Year"
* extension[end-year].value[x] only date
* extension[end-year].valueDate ^label = "End Year"
* extension[reason-leaving].value[x] only string
* extension[reason-leaving].valueString ^label = "Reason For Leaving"
* extension[service].value[x] only Coding
* extension[service].valueCoding ^label = "Service"
* extension[service].valueCoding from WorkServiceValueSet (required)
* extension[location].value[x] only Reference(TDRegion or TDDistrict or TDFacility)
* extension[location].valueReference ^label = "Location"

Instance:       IhrisPractitionerWorkflowEmploymentHistory
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Work Experience Workflow"
* description = "iHRIS workflow to record a Work Experience"
* id = "ihris-employment-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-employment-history"
* name = "ihris-employment-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Work Experience information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history"
* item[0].text = "Work Experience"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:institution-type.value[x]:valueCoding"
* item[0].item[0].item[0].text = "Institution Type"
* item[0].item[0].item[0].type = #choice
* item[0].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/institution-type-valueset"
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:organization.value[x]:valueString"
* item[0].item[0].item[1].text = "Organization Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false
* item[0].item[0].item[1].enableWhen[0].question = "Basic.extension[0].extension[0]"
* item[0].item[0].item[1].enableWhen[0].operator = #=
* item[0].item[0].item[1].enableWhen[0].answerCoding = institution-type-codesystem#organization

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:ministry.value[x]:valueCoding"
* item[0].item[0].item[2].text = "Ministry"
* item[0].item[0].item[2].type = #choice
* item[0].item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ministry-valueset"
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false
* item[0].item[0].item[2].enableWhen[0].question = "Basic.extension[0].extension[0]"
* item[0].item[0].item[2].enableWhen[0].operator = #=
* item[0].item[0].item[2].enableWhen[0].answerCoding = institution-type-codesystem#ministry

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:country.value[x]:valueCoding"
* item[0].item[0].item[3].text = "Country"
* item[0].item[0].item[3].type = #choice
* item[0].item[0].item[3].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:job.value[x]:valueString"
* item[0].item[0].item[4].text = "Function/Job Title"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false

* item[0].item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:job-description.value[x]:valueString"
* item[0].item[0].item[5].text = "Job Description"
* item[0].item[0].item[5].type = #string
* item[0].item[0].item[5].required = false
* item[0].item[0].item[5].repeats = false

* item[0].item[0].item[6].linkId = "Basic.extension[0].extension[6]#year"
* item[0].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:start-year.value[x]:valueDate"
* item[0].item[0].item[6].text = "Start Year"
* item[0].item[0].item[6].type = #date
* item[0].item[0].item[6].required = false
* item[0].item[0].item[6].repeats = false

* item[0].item[0].item[7].linkId = "Basic.extension[0].extension[7]#year"
* item[0].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:end-year.value[x]:valueDate"
* item[0].item[0].item[7].text = "End Year"
* item[0].item[0].item[7].type = #date
* item[0].item[0].item[7].required = false
* item[0].item[0].item[7].repeats = false

* item[0].item[0].item[8].linkId = "Basic.extension[0].extension[8]#text"
* item[0].item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:reason-leaving.value[x]:valueString"
* item[0].item[0].item[8].text = "Reason For Leaving"
* item[0].item[0].item[8].type = #string
* item[0].item[0].item[8].required = false
* item[0].item[0].item[8].repeats = false

* item[0].item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:service.value[x]:valueCoding"
* item[0].item[0].item[9].text = "Service"
* item[0].item[0].item[9].type = #choice
* item[0].item[0].item[9].answerValueSet = "http://hl7.org/fhir/ValueSet/work-service-valueset"
* item[0].item[0].item[9].required = false
* item[0].item[0].item[9].repeats = false

* item[0].item[0].item[10].linkId = "Basic.extension[0].extension[10]#tree"
* item[0].item[0].item[10].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history#Basic.extension:employmentHistory.extension:location.value[x]:valueReference"
* item[0].item[0].item[10].text = "Location"
* item[0].item[0].item[10].type = #reference
* item[0].item[0].item[10].required = false
* item[0].item[0].item[10].repeats = false

Instance:       ihris-page-employment-history
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Work Experience Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-employment-history)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Organization|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='organization').valueString"
* extension[display].extension[search][1].valueString = "Starting Position|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='startingPosition').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Work Experience"
* extension[section][0].extension[description].valueString = "Work Experience details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:employmentHistory.extension:institution-type"
* extension[section][0].extension[field][2].valueString = "Basic.extension:employmentHistory.extension:organization"
* extension[section][0].extension[field][3].valueString = "Basic.extension:employmentHistory.extension:ministry"
* extension[section][0].extension[field][4].valueString = "Basic.extension:employmentHistory.extension:country"
* extension[section][0].extension[field][5].valueString = "Basic.extension:employmentHistory.extension:job"
* extension[section][0].extension[field][6].valueString = "Basic.extension:employmentHistory.extension:job-description"
* extension[section][0].extension[field][7].valueString = "Basic.extension:employmentHistory.extension:start-year"
* extension[section][0].extension[field][8].valueString = "Basic.extension:employmentHistory.extension:end-year"
* extension[section][0].extension[field][9].valueString = "Basic.extension:employmentHistory.extension:reason-leaving"
* extension[section][0].extension[field][10].valueString = "Basic.extension:employmentHistory.extension:service"
* extension[section][0].extension[field][11].valueString = "Basic.extension:employmentHistory.extension:location"