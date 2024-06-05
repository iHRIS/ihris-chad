Profile:        PreserviceTrainingProfile
Parent:         IhrisPractitionerBasic
Id:             preservice-training-profile
Title:          "Preservice Training Information"
Description:    "iHRIS Profile of the Basic resource for Preservice Training."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    PreserviceTraining named preservice-training 1..1 MS
* extension[preservice-training].extension[sector] ^label = "Institution Location"
* extension[preservice-training].extension[sector].valueString 1..1 MS
* extension[preservice-training].extension[sector].valueString ^label = "Sector"
* extension[preservice-training].extension[institution] ^label = "Training Institution"
* extension[preservice-training].extension[institution].valueString 1..1 MS
* extension[preservice-training].extension[institution].valueString ^label = "Training Institution"
* extension[preservice-training].extension[country] ^label = "Institution Location"
* extension[preservice-training].extension[country].valueCoding 1..1 MS
* extension[preservice-training].extension[country].valueCoding ^label = "Country of training"
* extension[preservice-training].extension[start-year] ^label = "Year of training start"
* extension[preservice-training].extension[start-year].valueDate ^label = "Year of training start"
* extension[preservice-training].extension[start-year].valueDate 1..1 MS
* extension[preservice-training].extension[end-year] ^label = "Year of training end"
* extension[preservice-training].extension[end-year].valueDate ^label = "Year of training end"
* extension[preservice-training].extension[end-year].valueDate 1..1 MS
* extension[preservice-training].extension[degree] ^label = "Degree"
* extension[preservice-training].extension[degree].valueReference ^label = "Degree"
* extension[preservice-training].extension[degree].valueReference 1..1 MS
* extension[preservice-training].extension[degree-name] ^label = "Degree Name"
* extension[preservice-training].extension[degree-name].valueString ^label = "Degree Name"
* extension[preservice-training].extension[degree-name].valueString 1..1 MS
* extension[preservice-training].extension[specialized] ^label = "Specialized"
* extension[preservice-training].extension[specialized].valueCoding ^label = "Specialized"
* extension[preservice-training].extension[specialized].valueCoding 0..1 MS
* extension[preservice-training].extension[specialization] ^label = "Specialization"
* extension[preservice-training].extension[specialization].valueCoding ^label = "Specialization"
* extension[preservice-training].extension[specialization].valueCoding MS
* extension[preservice-training].extension[training-mode] ^label = "Training Mode"
* extension[preservice-training].extension[training-mode].valueCoding ^label = "Training Mode"
* extension[preservice-training].extension[training-mode].valueCoding MS
* extension[preservice-training].extension[training-fund] ^label = "Training Fund"
* extension[preservice-training].extension[training-fund].valueCoding ^label = "Training Fund"
* extension[preservice-training].extension[training-fund].valueCoding MS
* extension[preservice-training].extension[training-fund-other] ^label = "Other Training Fund"
* extension[preservice-training].extension[training-fund-other].valueString ^label = "Other Training Fund"
* extension[preservice-training].extension[training-fund-other].valueString MS

Profile:        InserviceTrainingProfile
Parent:         IhrisPractitionerBasic
Id:             inservice-training-profile
Title:          "Inservice Training Information"
Description:    "iHRIS Profile of the Basic resource for Inservice Training."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    InserviceTrainingRequestReference named inservice-training-request-reference 1..1 MS and
    InserviceTraining named inservice-training 1..1 MS
* extension[inservice-training].extension[sector] ^label = "Institution Location"
* extension[inservice-training].extension[sector].valueString 1..1 MS
* extension[inservice-training].extension[sector].valueString ^label = "Sector"
* extension[inservice-training].extension[institution] ^label = "Training Institution"
* extension[inservice-training].extension[institution].valueString 1..1 MS
* extension[inservice-training].extension[institution].valueString ^label = "Training Institution"
* extension[inservice-training].extension[country] ^label = "Institution Location"
* extension[inservice-training].extension[country].valueCoding 1..1 MS
* extension[inservice-training].extension[country].valueCoding ^label = "Country of training"
* extension[inservice-training].extension[start-year] ^label = "Year of training start"
* extension[inservice-training].extension[start-year].valueDate ^label = "Year of training start"
* extension[inservice-training].extension[start-year].valueDate 1..1 MS
* extension[inservice-training].extension[end-year] ^label = "Year of training end"
* extension[inservice-training].extension[end-year].valueDate ^label = "Year of training end"
* extension[inservice-training].extension[end-year].valueDate 1..1 MS
* extension[inservice-training].extension[degree] ^label = "Degree"
* extension[inservice-training].extension[degree].valueReference ^label = "Degree"
* extension[inservice-training].extension[degree].valueReference 1..1 MS
* extension[inservice-training].extension[degree-name] ^label = "Degree Name"
* extension[inservice-training].extension[degree-name].valueString ^label = "Degree Name"
* extension[inservice-training].extension[degree-name].valueString 1..1 MS
* extension[inservice-training].extension[specialized] ^label = "Specialized"
* extension[inservice-training].extension[specialized].valueCoding ^label = "Specialized"
* extension[inservice-training].extension[specialized].valueCoding 0..1 MS
* extension[inservice-training].extension[specialization] ^label = "Specialization"
* extension[inservice-training].extension[specialization].valueCoding ^label = "Specialization"
* extension[inservice-training].extension[specialization].valueCoding MS
* extension[inservice-training].extension[training-mode] 0..1 MS
* extension[inservice-training].extension[training-mode] ^label = "Training Mode"
* extension[inservice-training].extension[training-mode].valueCoding MS
* extension[inservice-training].extension[training-fund] 1..1 MS
* extension[inservice-training].extension[training-fund] ^label = "Training Fund"
* extension[inservice-training].extension[training-fund].valueCoding MS
* extension[inservice-training].extension[training-fund-other] ^label = "Other Training Fund"
* extension[inservice-training].extension[training-fund-other].valueString ^label = "Other Training Fund"
* extension[inservice-training].extension[training-fund-other].valueString MS
* extension[inservice-training].extension[observation] ^label = "Observation"
* extension[inservice-training].extension[observation].valueString 1..1 MS
* extension[inservice-training].extension[observation].valueString ^label = "Observation"
* extension[inservice-training].extension[completed] 1..1 MS
* extension[inservice-training].extension[completed] ^label = "Training Completed"
* extension[inservice-training].extension[completed].valueCoding MS

Profile:        InserviceTrainingRequestProfile
Parent:         IhrisPractitionerBasic
Id:             inservice-training-request-profile
Title:          "Inservice Training Request Information"
Description:    "Inservice Training Request Information Profile."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Practitioner"
* extension contains
    AuthorizationLetter named authorization-letter 1..1 MS and
    AuthorizationReference named authorization-reference 1..1 MS and
    AuthorizationConfirmationLetter named authorization-confirmation-letter 0..1 MS and
    ServiceEndDate named service-end-date 0..1 MS and
    EndServiceReference named end-service-reference 0..1 MS and
    ServiceResumptionDate named service-resumption-date 1..1 MS and
    ServiceResumptionReference named service-resumption-reference 1..1 MS
* extension[authorization-letter]  1..1 MS
* extension[authorization-letter]  ^label = "Authorization Letter"
* extension[authorization-letter].valueAttachment MS
* extension[authorization-reference]  1..1 MS
* extension[authorization-reference]  ^label = "Authorization Reference"
* extension[authorization-reference].valueString MS
* extension[authorization-confirmation-letter]  1..1 MS
* extension[authorization-confirmation-letter]  ^label = "Authorization Confirmation Letter"
* extension[authorization-confirmation-letter].valueAttachment MS
* extension[service-end-date]  1..1 MS
* extension[service-end-date]  ^label = "End of Service Date"
* extension[service-end-date].valueDate MS
* extension[end-service-reference]  1..1 MS
* extension[end-service-reference]  ^label = "End of Service Reference"
* extension[end-service-reference].valueString MS
* extension[service-resumption-date]  1..1 MS
* extension[service-resumption-date]  ^label = "Service Resumption Date"
* extension[service-resumption-date].valueDate MS
* extension[service-resumption-reference]  1..1 MS
* extension[service-resumption-reference]  ^label = "Service Resumption Reference"
* extension[service-resumption-reference].valueString MS
    
Extension:      PreserviceTraining
Id:             preservice-training
Title:          "Preservice Training details"
* extension contains
      sector 1..1 MS and
      institution 1..1 MS and
      country 1..1 MS and
      start-year 1..1 MS and
      end-year 1..1 MS and
      degree 1..1 MS and
      degree-name 1..1 MS and
      specialized 1..1 MS and
      specialization 0..1 MS and
      training-mode 0..1 MS and
      training-fund 0..1 MS and
      training-fund-other 0..1 MS and
      observation 0..1 MS
* extension[sector].value[x] only string
* extension[sector].valueString ^label = "Sector"
* extension[institution].value[x] only string
* extension[institution].valueString ^label = "Institution Name"
* extension[country].value[x] only Coding
* extension[country].valueCoding ^label = "Country of training"
* extension[country].valueCoding from http://ihris.org/fhir/ValueSet/country-valueset (required)
* extension[start-year].value[x] only date
* extension[start-year].valueDate ^label = "Year of training start"
* extension[end-year].value[x] only date
* extension[end-year].valueDate ^label = "Year of training end"
* extension[degree].value[x] only Reference(TDEducationTypeProfile)
* extension[degree].valueReference ^label = "Degree"
* extension[degree-name].value[x] only string
* extension[degree-name].valueString ^label = "Degree Name"
* extension[specialized].value[x] only Coding
* extension[specialized].valueCoding ^label = "Specialized"
* extension[specialized].valueCoding from http://ihris.org/fhir/ValueSet/yes-no-valueset (required)
* extension[specialization].value[x] only Coding
* extension[specialization].valueCoding ^label = "Specialization"
* extension[specialization].valueCoding from http://ihris.org/fhir/ValueSet/specialty-valueset (required)
* extension[training-mode].value[x] only Coding
* extension[training-mode].valueCoding ^label = "Training Mode"
* extension[training-mode].valueCoding from http://ihris.org/fhir/ValueSet/training-mode-valueset (required)
* extension[training-fund].value[x] only Coding
* extension[training-fund].valueCoding ^label = "Training Fund"
* extension[training-fund].valueCoding from http://ihris.org/fhir/ValueSet/training-fund-valueset (required)
* extension[training-fund-other].value[x] only string
* extension[training-fund-other].valueString ^label = "Other Training Fund"
* extension[observation].value[x] only string
* extension[observation].valueString ^label = "Observation"

Extension:      InserviceTraining
Id:             inservice-training
Title:          "Inservice Training details"
* extension contains
      sector 1..1 MS and
      institution 1..1 MS and
      country 1..1 MS and
      start-year 1..1 MS and
      end-year 1..1 MS and
      degree 1..1 MS and
      degree-name 1..1 MS and
      specialized 1..1 MS and
      specialization 0..1 MS and
      training-mode 0..1 MS and
      training-fund 1..1 MS and
      training-fund-other 1..1 MS and
      observation 0..1 MS and
      completed 1..1 MS
* extension[sector].value[x] only string
* extension[sector].valueString ^label = "Sector"
* extension[sector].valueString from EducationSectorValueSet (required)
* extension[institution].value[x] only string
* extension[institution].valueString ^label = "Institution Name"
* extension[country].value[x] only Coding
* extension[country].valueCoding ^label = "Country of training"
* extension[country].valueCoding from http://ihris.org/fhir/ValueSet/country-valueset (required)
* extension[start-year].value[x] only date
* extension[start-year].valueDate ^label = "Year of training start"
* extension[end-year].value[x] only date
* extension[end-year].valueDate ^label = "Year of training end"
* extension[degree].value[x] only Reference(TDEducationTypeProfile)
* extension[degree].valueReference ^label = "Degree"
* extension[degree-name].value[x] only string
* extension[degree-name].valueString ^label = "Degree Name"
* extension[specialized].value[x] only Coding
* extension[specialized].valueCoding ^label = "Specialized"
* extension[specialized].valueCoding from http://ihris.org/fhir/ValueSet/yes-no-valueset (required)
* extension[specialization].value[x] only Coding
* extension[specialization].valueCoding ^label = "Specialization"
* extension[specialization].valueCoding from http://ihris.org/fhir/ValueSet/specialty-valueset (required)
* extension[training-mode].value[x] only Coding
* extension[training-mode].valueCoding ^label = "Training Mode"
* extension[training-mode].valueCoding from http://ihris.org/fhir/ValueSet/training-mode-valueset (required)
* extension[training-fund].value[x] only Coding
* extension[training-fund].valueCoding ^label = "Training Fund"
* extension[training-fund].valueCoding from http://ihris.org/fhir/ValueSet/training-fund-valueset (required)
* extension[training-fund-other].value[x] only string
* extension[training-fund-other].valueString ^label = "Other Training Fund"
* extension[observation].value[x] only string
* extension[observation].valueString ^label = "Observation"
* extension[completed].value[x] only Coding
* extension[completed].valueCoding ^label = "Training Completed"
* extension[completed].valueCoding from http://ihris.org/fhir/ValueSet/yes-no-valueset (required)

Extension:      InserviceTrainingRequestReference
Id:             inservice-training-request-reference
Title:          "Inservice Training Request Reference"
Description:    "Inservice Training Request Reference to link Inservice Training resource to a Inservice Training Request Resource."
* ^context[0].type = #element
* ^context[0].expression = "Basic"
* value[x] only Reference 
* valueReference only Reference(InserviceTrainingRequestProfile)
* valueReference ^label = "Practitioner"

Extension:      AuthorizationLetter
Id:             authorization-letter
Title:          "Authorization Letter"
Description:    "Authorization Letter."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only Attachment
* valueAttachment 1..1 MS
* valueAttachment ^label = "Authorization Letter"

Extension:      AuthorizationReference
Id:             authorization-reference
Title:          "Authorization Reference"
Description:    "Authorization Reference."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Authorization Reference"

Extension:      AuthorizationConfirmationLetter
Id:             authorization-confirmation-letter
Title:          "Authorization Confirmation Letter"
Description:    "Authorization Confirmation Letter."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only Attachment
* valueAttachment 1..1 MS
* valueAttachment ^label = "Authorization Confirmation Letter"

Extension:      ServiceEndDate
Id:             service-end-date
Title:          "End of Service Date"
Description:    "End of Service Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "End of Service Date"

Extension:      EndServiceReference
Id:             end-service-reference
Title:          "End of Service Reference"
Description:    "End of Service Reference."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "End of Service Reference"

Extension:      ServiceResumptionDate
Id:             service-resumption-date
Title:          "Service Resumption Date"
Description:    "Service Resumption Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Service Resumption Date"

Extension:      ServiceResumptionReference
Id:             service-resumption-reference
Title:          "Service Resumption Reference"
Description:    "Service Resumption Reference."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Service Resumption Reference"

Instance:       PreserviceTraining
InstanceOf:      Questionnaire
Usage:          #definition
* title = "Preservice Training Workflow"
* description = "iHRIS workflow to record a Preservice Training"
* id = "preservice-training"
* url = "http://ihris.org/fhir/Questionnaire/preservice-training"
* name = "preservice-training"
* status = #active
* date = 2024-02-15
* purpose = "Workflow page for recording a Preservice Training information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile"
* item[0].text = "Preservice Training"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:sector.value[x]:valueString"
* item[0].item[0].item[0].text = "Sector"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:institution.value[x]:valueString"
* item[0].item[0].item[1].text = "Institution Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:country.value[x]:valueCoding"
* item[0].item[0].item[2].text = "Country of training"
* item[0].item[0].item[2].type = #choice
* item[0].item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/country-valueset"
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]#year"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:start-year.value[x]:valueDate"
* item[0].item[0].item[3].text = "Year of training start"
* item[0].item[0].item[3].type = #date
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]#year"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:end-year.value[x]:valueDate"
* item[0].item[0].item[4].text = "Year of training end"
* item[0].item[0].item[4].type = #date
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false

* item[0].item[0].item[5].linkId = "Basic.extension[0].extension[5]#preloaded"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:degree.value[x]:valueReference"
* item[0].item[0].item[5].text = "Diploma"
* item[0].item[0].item[5].type = #reference
* item[0].item[0].item[5].required = true
* item[0].item[0].item[5].repeats = false

* item[0].item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:degree-name.value[x]:valueString"
* item[0].item[0].item[6].text = "Diploma Name"
* item[0].item[0].item[6].type = #string
* item[0].item[0].item[6].required = true
* item[0].item[0].item[6].repeats = false

* item[0].item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:specialized.value[x]:valueCoding"
* item[0].item[0].item[7].text = "Specialized"
* item[0].item[0].item[7].type = #choice
* item[0].item[0].item[7].answerValueSet = "http://ihris.org/fhir/ValueSet/yes-no-valueset"
* item[0].item[0].item[7].required = true
* item[0].item[0].item[7].repeats = false

* item[0].item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:specialization.value[x]:valueCoding"
* item[0].item[0].item[8].text = "Specialization"
* item[0].item[0].item[8].type = #choice
* item[0].item[0].item[8].answerValueSet = "http://ihris.org/fhir/ValueSet/specialty-valueset"
* item[0].item[0].item[8].required = false
* item[0].item[0].item[8].repeats = false
* item[0].item[0].item[8].enableWhen[0].question = "Basic.extension[0].extension[7]"
* item[0].item[0].item[8].enableWhen[0].operator = #=
* item[0].item[0].item[8].enableWhen[0].answerCoding = yes-no-codesystem#yes

* item[0].item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:training-mode.value[x]:valueCoding"
* item[0].item[0].item[9].text = "Training Mode"
* item[0].item[0].item[9].type = #choice
* item[0].item[0].item[9].answerValueSet = "http://ihris.org/fhir/ValueSet/training-mode-valueset"
* item[0].item[0].item[9].required = false
* item[0].item[0].item[9].repeats = false

* item[0].item[0].item[10].linkId = "Basic.extension[0].extension[10]"
* item[0].item[0].item[10].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:training-fund.value[x]:valueCoding"
* item[0].item[0].item[10].text = "Funding"
* item[0].item[0].item[10].type = #choice
* item[0].item[0].item[10].answerValueSet = "http://ihris.org/fhir/ValueSet/training-fund-valueset"
* item[0].item[0].item[10].required = false
* item[0].item[0].item[10].repeats = false

* item[0].item[0].item[11].linkId = "Basic.extension[0].extension[11]"
* item[0].item[0].item[11].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:training-fund-other.value[x]:valueString"
* item[0].item[0].item[11].text = "Other Funding"
* item[0].item[0].item[11].type = #string
* item[0].item[0].item[11].required = true
* item[0].item[0].item[11].repeats = false
* item[0].item[0].item[11].enableWhen[0].question = "Basic.extension[0].extension[10]"
* item[0].item[0].item[11].enableWhen[0].operator = #=
* item[0].item[0].item[11].enableWhen[0].answerCoding = training-fund-codesystem#other

* item[0].item[0].item[12].linkId = "Basic.extension[0].extension[12]"
* item[0].item[0].item[12].definition = "http://ihris.org/fhir/StructureDefinition/preservice-training-profile#Basic.extension:preservice-training.extension:observation.value[x]:valueString"
* item[0].item[0].item[12].text = "Observation"
* item[0].item[0].item[12].type = #string
* item[0].item[0].item[12].required = false
* item[0].item[0].item[12].repeats = false

Instance:       InserviceTraining
InstanceOf:      Questionnaire
Usage:          #definition
* title = "Inservice Training Workflow"
* description = "iHRIS workflow to record a Inservice Training"
* id = "inservice-training"
* url = "http://ihris.org/fhir/Questionnaire/inservice-training"
* name = "inservice-training"
* status = #active
* date = 2024-02-15
* purpose = "Workflow page for recording a Inservice Training information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile"
* item[0].text = "Inservice Training"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:sector.value[x]:valueString"
* item[0].item[0].item[0].text = "Sector"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:institution.value[x]:valueString"
* item[0].item[0].item[1].text = "Institution Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:country.value[x]:valueCoding"
* item[0].item[0].item[2].text = "Country of training"
* item[0].item[0].item[2].type = #choice
* item[0].item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/country-valueset"
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]#year"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:start-year.value[x]:valueDate"
* item[0].item[0].item[3].text = "Year of training start"
* item[0].item[0].item[3].type = #date
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]#year"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:end-year.value[x]:valueDate"
* item[0].item[0].item[4].text = "Year of training end"
* item[0].item[0].item[4].type = #date
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false

* item[0].item[0].item[5].linkId = "Basic.extension[0].extension[5]#preloaded"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:degree.value[x]:valueReference"
* item[0].item[0].item[5].text = "Diploma"
* item[0].item[0].item[5].type = #reference
* item[0].item[0].item[5].required = true
* item[0].item[0].item[5].repeats = false

* item[0].item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:degree-name.value[x]:valueString"
* item[0].item[0].item[6].text = "Diploma Name"
* item[0].item[0].item[6].type = #string
* item[0].item[0].item[6].required = true
* item[0].item[0].item[6].repeats = false

* item[0].item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:specialized.value[x]:valueCoding"
* item[0].item[0].item[7].text = "Specialized"
* item[0].item[0].item[7].type = #choice
* item[0].item[0].item[7].answerValueSet = "http://ihris.org/fhir/ValueSet/yes-no-valueset"
* item[0].item[0].item[7].required = true
* item[0].item[0].item[7].repeats = false

* item[0].item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:specialization.value[x]:valueCoding"
* item[0].item[0].item[8].text = "Specialization"
* item[0].item[0].item[8].type = #choice
* item[0].item[0].item[8].answerValueSet = "http://ihris.org/fhir/ValueSet/specialty-valueset"
* item[0].item[0].item[8].required = false
* item[0].item[0].item[8].repeats = false
* item[0].item[0].item[8].enableWhen[0].question = "Basic.extension[0].extension[7]"
* item[0].item[0].item[8].enableWhen[0].operator = #=
* item[0].item[0].item[8].enableWhen[0].answerCoding = yes-no-codesystem#yes

* item[0].item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:training-mode.value[x]:valueCoding"
* item[0].item[0].item[9].text = "Training Mode"
* item[0].item[0].item[9].type = #choice
* item[0].item[0].item[9].answerValueSet = "http://ihris.org/fhir/ValueSet/training-mode-valueset"
* item[0].item[0].item[9].required = false
* item[0].item[0].item[9].repeats = false

* item[0].item[0].item[10].linkId = "Basic.extension[0].extension[10]"
* item[0].item[0].item[10].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:training-fund.value[x]:valueCoding"
* item[0].item[0].item[10].text = "Funding"
* item[0].item[0].item[10].type = #choice
* item[0].item[0].item[10].answerValueSet = "http://ihris.org/fhir/ValueSet/training-fund-valueset"
* item[0].item[0].item[10].required = true
* item[0].item[0].item[10].repeats = false

* item[0].item[0].item[11].linkId = "Basic.extension[0].extension[11]"
* item[0].item[0].item[11].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:training-fund-other.value[x]:valueString"
* item[0].item[0].item[11].text = "Other Funding"
* item[0].item[0].item[11].type = #string
* item[0].item[0].item[11].required = true
* item[0].item[0].item[11].repeats = false
* item[0].item[0].item[11].enableWhen[0].question = "Basic.extension[0].extension[10]"
* item[0].item[0].item[11].enableWhen[0].operator = #=
* item[0].item[0].item[11].enableWhen[0].answerCoding = training-fund-codesystem#other

* item[0].item[0].item[12].linkId = "Basic.extension[0].extension[12]"
* item[0].item[0].item[12].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:observation.value[x]:valueString"
* item[0].item[0].item[12].text = "Observation"
* item[0].item[0].item[12].type = #string
* item[0].item[0].item[12].required = false
* item[0].item[0].item[12].repeats = false

* item[0].item[0].item[13].linkId = "Basic.extension[0].extension[13]"
* item[0].item[0].item[13].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-profile#Basic.extension:inservice-training.extension:completed.value[x]:valueCoding"
* item[0].item[0].item[13].text = "Training Completed"
* item[0].item[0].item[13].type = #choice
* item[0].item[0].item[13].answerValueSet = "http://ihris.org/fhir/ValueSet/yes-no-valueset"
* item[0].item[0].item[13].required = true
* item[0].item[0].item[13].repeats = false

Instance:       InserviceTrainingRequest
InstanceOf:      Questionnaire
Usage:          #definition
* title = "Inservice Training Request Workflow"
* description = "iHRIS workflow to record a Inservice Training Request"
* id = "inservice-training-request"
* url = "http://ihris.org/fhir/Questionnaire/inservice-training-request"
* name = "inservice-training-request"
* status = #active
* date = 2024-02-15
* purpose = "Workflow page for recording a Inservice Training Request information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile"
* item[0].text = "Request Inservice Training"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:authorization-letter.value[x]:valueAttachment"
* item[0].item[0].text = "Authorization Letter"
* item[0].item[0].type = #attachment
* item[0].item[0].required = true

* item[0].item[1].linkId = "Basic.extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:authorization-reference.value[x]:valueString"
* item[0].item[1].text = "Authorization Reference"
* item[0].item[1].type = #string
* item[0].item[1].required = true

* item[0].item[2].linkId = "Basic.extension[2]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:authorization-confirmation-letter.value[x]:valueAttachment"
* item[0].item[2].text = "Authorization Confirmation Letter"
* item[0].item[2].type = #attachment
* item[0].item[2].required = false

* item[0].item[3].linkId = "Basic.extension[3]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:service-end-date.value[x]:valueDate"
* item[0].item[3].text = "End of Service Date"
* item[0].item[3].type = #date
* item[0].item[3].required = false

* item[0].item[4].linkId = "Basic.extension[4]"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:end-service-reference.value[x]:valueString"
* item[0].item[4].text = "End of Service Reference"
* item[0].item[4].type = #string
* item[0].item[4].required = false

* item[0].item[5].linkId = "Basic.extension[5]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:service-resumption-date.value[x]:valueDate"
* item[0].item[5].text = "Service Resumption Date"
* item[0].item[5].type = #date
* item[0].item[5].required = false

* item[0].item[6].linkId = "Basic.extension[6]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/inservice-training-request-profile#Basic.extension:service-resumption-reference.value[x]:valueString"
* item[0].item[6].text = "Service Resumption Reference"
* item[0].item[6].type = #string
* item[0].item[6].required = false

Instance:       ihris-page-preservice-training
InstanceOf:     IhrisPage
Title:          "Preservice Training"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/preservice-training-profile)
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
* extension[display].extension[link][1].extension[task].valueId = "ihris-task-add-preservice-training"
* extension[display].extension[search][0].valueString = "Practitioner|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Institution|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueReference.reference"
* extension[display].extension[search][2].valueString = "Degree|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='degree').valueReference.reference"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[display].extension[field][1].extension[path].valueString = "Basic.extension:preservice-training.extension:year.value[x]:valueDate"
* extension[display].extension[field][1].extension[type].valueString = "year"
* extension[section][0].extension[title].valueString = "Preservice Training"
* extension[section][0].extension[description].valueString = "Preservice Training details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:preservice-training.extension:institution"
* extension[section][0].extension[field][2].valueString = "Basic.extension:preservice-training.extension:location"
* extension[section][0].extension[field][3].valueString = "Basic.extension:preservice-training.extension:year"
* extension[section][0].extension[field][4].valueString = "Basic.extension:preservice-training.extension:degree"
* extension[section][0].extension[field][5].valueString = "Basic.extension:preservice-training.extension:specialized"
* extension[section][0].extension[field][6].valueString = "Basic.extension:preservice-training.extension:specialization"
* extension[section][0].extension[field][7].valueString = "Basic.extension:preservice-training.extension:training-mode"
* extension[section][0].extension[field][8].valueString = "Basic.extension:preservice-training.extension:training-fund"
* extension[section][0].extension[field][9].valueString = "Basic.extension:preservice-training.extension:training-fund-other"
* extension[section][0].extension[field][10].valueString = "Basic.extension:preservice-training.extension:observation"

Instance:       ihris-page-inservice-training
InstanceOf:     IhrisPage
Title:          "Inservice Training"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/inservice-training-profile)
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
* extension[display].extension[link][1].extension[task].valueId = "ihris-task-add-inservice-training"
* extension[display].extension[search][0].valueString = "Practitioner|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Institution|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='institution').valueReference.reference"
* extension[display].extension[search][2].valueString = "Degree|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='degree').valueReference.reference"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Inservice Training"
* extension[section][0].extension[description].valueString = "Inservice Training details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:inservice-training.extension:institution"
* extension[section][0].extension[field][2].valueString = "Basic.extension:inservice-training.extension:location"
* extension[section][0].extension[field][3].valueString = "Basic.extension:inservice-training.extension:year"
* extension[section][0].extension[field][4].valueString = "Basic.extension:inservice-training.extension:degree"
* extension[section][0].extension[field][5].valueString = "Basic.extension:inservice-training.extension:specialized"
* extension[section][0].extension[field][6].valueString = "Basic.extension:inservice-training.extension:specialization"
* extension[section][0].extension[field][7].valueString = "Basic.extension:inservice-training.extension:training-mode"
* extension[section][0].extension[field][8].valueString = "Basic.extension:inservice-training.extension:training-fund"
* extension[section][0].extension[field][9].valueString = "Basic.extension:inservice-training.extension:training-fund-other"
* extension[section][0].extension[field][10].valueString = "Basic.extension:inservice-training.extension:observation"

Instance:       ihris-page-inservice-training-request
InstanceOf:     IhrisPage
Title:          "Inservice Training Request"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/inservice-training-request-profile)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Authorization Reference|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/authorization-reference').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[display].extension[field][1].extension[path].valueString = "Basic.extension:inservice-training-request-reference.value[x]:valueReference"
* extension[display].extension[field][1].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Request Inservice Training"
* extension[section][0].extension[description].valueString = "Request Inservice Training details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:inservice-training-request-reference"
* extension[section][0].extension[field][2].valueString = "Basic.extension:authorization-letter"
* extension[section][0].extension[field][3].valueString = "Basic.extension:authorization-reference"
* extension[section][0].extension[field][4].valueString = "Basic.extension:authorization-confirmation-letter"
* extension[section][0].extension[field][5].valueString = "Basic.extension:service-end-date"
* extension[section][0].extension[field][6].valueString = "Basic.extension:end-service-reference"
* extension[section][0].extension[field][7].valueString = "Basic.extension:service-resumption-date"
* extension[section][0].extension[field][8].valueString = "Basic.extension:service-resumption-reference"
* extension[section][1].extension[title].valueString = "Inservice Training Information"
* extension[section][1].extension[description].valueString = "Inservice Training Information"
* extension[section][1].extension[name].valueString = "inservicetraining"
* extension[section][1].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/inservice-training-profile)
* extension[section][1].extension[resource].extension[searchfield].valueString = "inservicetrainingrequest"
* extension[section][1].extension[resource].extension[searchfieldtarget].valueString = "Basic"
* extension[section][1].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training-request-reference').valueReference.reference"
* extension[section][1].extension[resource].extension[column][0].extension[header].valueString = "Diploma"
* extension[section][1].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='degree').valueReference"
* extension[section][1].extension[resource].extension[column][1].extension[header].valueString = "Sector"
* extension[section][1].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='sector').valueCoding"
* extension[section][1].extension[resource].extension[column][2].extension[header].valueString = "Institution"
* extension[section][1].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='institution').valueString"
* extension[section][1].extension[resource].extension[column][3].extension[header].valueString = "Country"
* extension[section][1].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='country').valueCoding"
* extension[section][1].extension[resource].extension[column][4].extension[header].valueString = "Graduation Year"
* extension[section][1].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/inservice-training').extension.where(url='end-year').valueDate"
* extension[section][1].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][1].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][1].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/inservice-training/inservice-training?request=FHIRID"
* extension[section][1].extension[resource].extension[action][0].extension[text].valueString = "Add Inservice Training"
* extension[section][1].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][1].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][1].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][1].extension[resource].extension[action][0].extension[task].valueId = "ihris-task-add-inservice-training"
* extension[section][1].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/inservice-training/ITEMID"
* extension[section][1].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][1].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][1].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][1].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/inservice-training/inservice-training/ITEMID?request=FHIRID"
* extension[section][1].extension[resource].extension[action][2].extension[text].valueString = "Edit"
* extension[section][1].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][1].extension[resource].extension[action][2].extension[class].valueString = "primary"
* extension[section][1].extension[resource].extension[action][2].extension[task].valueId = "ihris-task-edit-inservice-training"

Instance:       ihris-search-inservice-training-request
InstanceOf:     SearchParameter
Title:          "search parameter for inservice training request"
Usage:          #definition
* url = "http://ihris.org/fhir/SearchParameter/ihris-search-inservice-training-request"
* description = "search parameter for Inservice Training Request"
* name = "search parameter for Inservice Training Request"
* status = #active
* experimental = false
* code = #inservicetrainingrequest
* base[0] = #Basic
* type = #reference
* expression = "Basic.extension('http://ihris.org/fhir/StructureDefinition/inservice-training-request-reference')"
* target[0] = #Basic