Instance:       IhrisPractitionerQuestionnaire
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Practitioner Questionnaire"
* description = "iHRIS Practitioner initial data entry questionnaire."
* id = "ihris-practitioner"
* url = "http://ihris.org/fhir/Questionnaire/ihris-practitioner"
* name = "ihris-practitioner"
* status = #active
* date = 2020-06-22
* purpose = "Data entry page for practitioners."

* item[0].linkId = "Practitioner"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[0].text = "Health Worker|Primary demographic details"
* item[0].type = #group

* item[0].item[0].linkId = "Practitioner.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:registrationNumber.value[x]:valueString"
* item[0].item[0].text = "Registration Number"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Practitioner.name[0]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name"
* item[0].item[1].text = "Name"
* item[0].item[1].type = #group

* item[0].item[1].item[0].linkId = "Practitioner.name[0].use"
* item[0].item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.use"
* item[0].item[1].item[0].text = "Name Usage"
* item[0].item[1].item[0].type = #choice
* item[0].item[1].item[0].required = true
* item[0].item[1].item[0].repeats = false
* item[0].item[1].item[0].readOnly = true
* item[0].item[1].item[0].answerOption.valueCoding = http://hl7.org/fhir/name-use#official
* item[0].item[1].item[0].answerOption.initialSelected = true

* item[0].item[1].item[1].linkId = "Practitioner.name[0].family"
* item[0].item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.family"
* item[0].item[1].item[1].text = "Family Name"
* item[0].item[1].item[1].type = #string
* item[0].item[1].item[1].required = true
* item[0].item[1].item[1].repeats = false

* item[0].item[1].item[2].linkId = "Practitioner.name[0].given[0]"
* item[0].item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.given"
* item[0].item[1].item[2].text = "Given Name(s)"
* item[0].item[1].item[2].type = #string
* item[0].item[1].item[2].required = true
* item[0].item[1].item[2].repeats = true

* item[0].item[1].item[3].linkId = "Practitioner.name[0].extension[0]"
* item[0].item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.extension:civility.value[x]:valueCoding"
* item[0].item[1].item[3].text = "Civility"
* item[0].item[1].item[3].type = #choice
* item[0].item[1].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/civility-valueset"
* item[0].item[1].item[3].required = false
* item[0].item[1].item[3].repeats = false

* item[0].item[1].item[4].linkId = "Practitioner.name[0].suffix[0]"
* item[0].item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.suffix"
* item[0].item[1].item[4].text = "Suffix"
* item[0].item[1].item[4].type = #string
* item[0].item[1].item[4].required = false
* item[0].item[1].item[4].repeats = true

* item[0].item[1].item[5].linkId = "Practitioner.photo"
* item[0].item[1].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.photo"
* item[0].item[1].item[5].text = "Photo"
* item[0].item[1].item[5].type = #attachment
* item[0].item[1].item[5].required = true
* item[0].item[1].item[5].repeats = false

* item[0].item[2].linkId = "Practitioner.gender"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.gender"
* item[0].item[2].text = "Gender"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/td-gender-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Practitioner.extension[1]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:marital-status.value[x]:valueCoding"
* item[0].item[3].text = "Marital Status"
* item[0].item[3].type = #choice
* item[0].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/marital-status-valueset"
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Practitioner.birthDate"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.birthDate"
* item[0].item[4].text = "Date of Birth"
* item[0].item[4].type = #date
* item[0].item[4].required = true
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Practitioner.extension[2]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:birth-place.value[x]:valueString"
* item[0].item[5].text = "Place of Birth"
* item[0].item[5].type = #string
* item[0].item[5].required = true
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Practitioner.extension[3]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:nationality.value[x]:valueCoding"
* item[0].item[6].text = "Nationality"
* item[0].item[6].type = #choice
* item[0].item[6].answerValueSet = "http://ihris.org/fhir/ValueSet/nationality-valueset"
* item[0].item[6].required = true
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Practitioner.extension[4]"
* item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:children.value[x]:valueInteger"
* item[0].item[7].text = "Number of Children"
* item[0].item[7].type = #integer
* item[0].item[7].required = true
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "Practitioner.extension[5]"
* item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:residence.value[x]:valueReference"
* item[0].item[8].text = "Residence"
* item[0].item[8].type = #reference
* item[0].item[8].required = false
* item[0].item[8].repeats = false

* item[0].item[9].linkId = "Practitioner.active"
* item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.active"
* item[0].item[9].text = "Active"
* item[0].item[9].type = #boolean
* item[0].item[9].required = true

* item[1].linkId = "__Practitioner:contact"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[1].text = "Contact Details|Address, email, phone numbers"
* item[1].type = #group

* item[1].item[0].linkId = "Practitioner.address[0]"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address"
* item[1].item[0].text = "Home Address"
* item[1].item[0].type = #group

* item[1].item[0].item[0].linkId = "Practitioner.address[0].use"
* item[1].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.use"
* item[1].item[0].item[0].text = "Address Use"
* item[1].item[0].item[0].type = #choice
* item[1].item[0].item[0].required = true
* item[1].item[0].item[0].repeats = false
* item[1].item[0].item[0].readOnly = true
* item[1].item[0].item[0].answerOption.valueCoding = http://hl7.org/fhir/address-use#home
* item[1].item[0].item[0].answerOption.initialSelected = true

* item[1].item[0].item[1].linkId = "Practitioner.address[0].type"
* item[1].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.type"
* item[1].item[0].item[1].text = "Address Type"
* item[1].item[0].item[1].type = #choice
* item[1].item[0].item[1].required = true
* item[1].item[0].item[1].repeats = false
* item[1].item[0].item[1].readOnly = true
* item[1].item[0].item[1].answerOption.valueCoding = http://hl7.org/fhir/address-type#physical
* item[1].item[0].item[1].answerOption.initialSelected = true

* item[1].item[0].item[2].linkId = "Practitioner.address[0].line"
* item[1].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.line"
* item[1].item[0].item[2].text = "Street Address"
* item[1].item[0].item[2].type = #string
* item[1].item[0].item[2].required = true
* item[1].item[0].item[2].repeats = true

* item[1].item[0].item[3].linkId = "Practitioner.address[0].city"
* item[1].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.city"
* item[1].item[0].item[3].text = "City"
* item[1].item[0].item[3].type = #string
* item[1].item[0].item[3].required = false
* item[1].item[0].item[3].repeats = false

* item[1].item[0].item[4].linkId = "Practitioner.address[0].district"
* item[1].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.district"
* item[1].item[0].item[4].text = "District"
* item[1].item[0].item[4].type = #string
* item[1].item[0].item[4].required = false
* item[1].item[0].item[4].repeats = false

* item[1].item[0].item[5].linkId = "Practitioner.address[0].state"
* item[1].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.state"
* item[1].item[0].item[5].text = "State"
* item[1].item[0].item[5].type = #string
* item[1].item[0].item[5].required = false
* item[1].item[0].item[5].repeats = false

* item[1].item[0].item[6].linkId = "Practitioner.address[0].postalCode"
* item[1].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.postalCode"
* item[1].item[0].item[6].text = "Postal Code"
* item[1].item[0].item[6].type = #string
* item[1].item[0].item[6].required = false
* item[1].item[0].item[6].repeats = false

* item[1].item[0].item[7].linkId = "Practitioner.address[0].country"
* item[1].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.country"
* item[1].item[0].item[7].text = "Country"
* item[1].item[0].item[7].type = #string
* item[1].item[0].item[7].required = false
* item[1].item[0].item[7].repeats = false

* item[1].item[1].linkId = "Practitioner.telecom[0].use"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.use"
* item[1].item[1].text = "Telecom Use"
* item[1].item[1].type = #choice
* item[1].item[1].required = true
* item[1].item[1].repeats = false
* item[1].item[1].readOnly = true
* item[1].item[1].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#mobile
* item[1].item[1].answerOption.initialSelected = true

* item[1].item[2].linkId = "Practitioner.telecom[0].system"
* item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[2].text = "Telecom System"
* item[1].item[2].type = #choice
* item[1].item[2].required = true
* item[1].item[2].repeats = false
* item[1].item[2].readOnly = true
* item[1].item[2].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#phone
* item[1].item[2].answerOption.initialSelected = true

* item[1].item[3].linkId = "Practitioner.telecom[0].value"
* item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[3].text = "Mobile Phone"
* item[1].item[3].type = #string
* item[1].item[3].required = true
* item[1].item[3].repeats = false

* item[1].item[4].linkId = "Practitioner.telecom[1].use"
* item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.use"
* item[1].item[4].text = "Telecom Use"
* item[1].item[4].type = #choice
* item[1].item[4].required = true
* item[1].item[4].repeats = false
* item[1].item[4].readOnly = true
* item[1].item[4].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#work
* item[1].item[4].answerOption.initialSelected = true

* item[1].item[5].linkId = "Practitioner.telecom[1].system"
* item[1].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[5].text = "Telecom System"
* item[1].item[5].type = #choice
* item[1].item[5].required = true
* item[1].item[5].repeats = false
* item[1].item[5].readOnly = true
* item[1].item[5].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#email
* item[1].item[5].answerOption.initialSelected = true

* item[1].item[6].linkId = "Practitioner.telecom[1].value"
* item[1].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[6].text = "Work Email"
* item[1].item[6].type = #string
* item[1].item[6].required = false
* item[1].item[6].repeats = false

* item[2].linkId = "PractitionerRole"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[2].text = "Position|Position the person holds"
* item[2].type = #group
* item[2].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[2].extension[constraint][0].extension[severity].valueCode = #error
* item[2].extension[constraint][0].extension[expression].valueString = "where(linkId='PractitionerRole.period.end').answer.first().valueDateTime.empty() or where(linkId='PractitionerRole.period.end').answer.first().valueDateTime >= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[2].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."

* item[2].item[0].linkId = "PractitionerRole.practitioner"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.practitioner"
* item[2].item[0].text = "Practitioner"
* item[2].item[0].type = #string
* item[2].item[0].required = true
* item[2].item[0].repeats = false
* item[2].item[0].readOnly = true
* item[2].item[0].answerOption.valueString = "__REPLACE__Practitioner"
* item[2].item[0].answerOption.initialSelected = true

* item[2].item[1].linkId = "PractitionerRole.code"
* item[2].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.code"
* item[2].item[1].text = "Job Title"
* item[2].item[1].type = #choice
* item[2].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job"
* item[2].item[1].required = true
* item[2].item[1].repeats = false

* item[2].item[2].linkId = "PractitionerRole.extension[0]"
* item[2].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:appointment-date.value[x]:valueDate"
* item[2].item[2].text = "Date of Assignment or Appointment"
* item[2].item[2].type = #date
* item[2].item[2].required = true
* item[2].item[2].repeats = false

* item[2].item[3].linkId = "PractitionerRole.extension[1]"
* item[2].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:appointment-reference.value[x]:valueString"
* item[2].item[3].text = "Reference Assignment or Appointment"
* item[2].item[3].type = #string
* item[2].item[3].required = true
* item[2].item[3].repeats = false

* item[2].item[4].linkId = "PractitionerRole.period.start"
* item[2].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.start"
* item[2].item[4].text = "Service Start Date"
* item[2].item[4].type = #dateTime
* item[2].item[4].required = true
* item[2].item[4].repeats = false

* item[2].item[5].linkId = "PractitionerRole.period.end"
* item[2].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.end"
* item[2].item[5].text = "Service End Date"
* item[2].item[5].type = #dateTime
* item[2].item[5].required = false
* item[2].item[5].repeats = false

* item[2].item[6].linkId = "PractitionerRole.extension[2]"
* item[2].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:service-start-reference.value[x]:valueString"
* item[2].item[6].text = "Service Start Reference"
* item[2].item[6].type = #string
* item[2].item[6].required = false
* item[2].item[6].repeats = false

* item[2].item[7].linkId = "PractitionerRole.extension[3]"
* item[2].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:effective-presence-date.value[x]:valueDate"
* item[2].item[7].text = "Date of Effective Presence"
* item[2].item[7].type = #date
* item[2].item[7].required = false
* item[2].item[7].repeats = false

* item[2].item[8].linkId = "PractitionerRole.extension[4]"
* item[2].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:effective-presence-reference.value[x]:valueString"
* item[2].item[8].text = "Effective Presence Reference"
* item[2].item[8].type = #string
* item[2].item[8].required = false
* item[2].item[8].repeats = false

* item[2].item[9].linkId = "PractitionerRole.extension[5]"
* item[2].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:assignment-act.value[x]:valueAttachment"
* item[2].item[9].text = "Act of Assignment or Appointment"
* item[2].item[9].type = #attachment
* item[2].item[9].required = false
* item[2].item[9].repeats = false

* item[2].item[10].linkId = "PractitionerRole.extension[6]#text"
* item[2].item[10].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:comments.value[x]:valueString"
* item[2].item[10].text = "Comments"
* item[2].item[10].type = #string
* item[2].item[10].required = false
* item[2].item[10].repeats = false

* item[2].item[11].linkId = "PractitionerRole.location"
* item[2].item[11].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.location"
* item[2].item[11].text = "Facility"
* item[2].item[11].type = #reference
* item[2].item[11].required = true
* item[2].item[11].repeats = false

* item[3].linkId = "Practitioner.identifier"
* item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].text = "Identifiers|Identifiers for the practitioner"
* item[3].type = #group

* item[3].item[0].linkId = "Practitioner.identifier[0]"
* item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].item[0].text = "Identification"
* item[3].item[0].type = #group
* item[3].item[0].repeats = true
* item[3].item[0].required = true

* item[3].item[0].item[0].linkId = "Practitioner.identifier[0].type"
* item[3].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[3].item[0].item[0].text = "Identification Type"
* item[3].item[0].item[0].type = #choice
* item[3].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/td-id-type-valueset"
* item[3].item[0].item[0].repeats = false
* item[3].item[0].item[0].required = true

* item[3].item[0].item[1].linkId = "Practitioner.identifier[0].value"
* item[3].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[3].item[0].item[1].text = "Identification Number"
* item[3].item[0].item[1].type = #string
* item[3].item[0].item[1].repeats = false
* item[3].item[0].item[1].required = true

* item[3].item[0].item[2].linkId = "Practitioner.identifier[0].extension[0]"
* item[3].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:issueDate.value[x]:valueDate"
* item[3].item[0].item[2].text = "Date of Issue"
* item[3].item[0].item[2].type = #date
* item[3].item[0].item[2].repeats = false
* item[3].item[0].item[2].required = false

* item[3].item[0].item[3].linkId = "Practitioner.identifier[0].extension[1]"
* item[3].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:expireDate.value[x]:valueDate"
* item[3].item[0].item[3].text = "Date of Expiration"
* item[3].item[0].item[3].type = #date
* item[3].item[0].item[3].repeats = false
* item[3].item[0].item[3].required = false

* item[3].item[0].item[4].linkId = "Practitioner.identifier[0].extension[2]"
* item[3].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:countryIssued.value[x]:valueCoding"
* item[3].item[0].item[4].text = "Country of Issue"
* item[3].item[0].item[4].type = #choice
* item[3].item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/country-valueset"
* item[3].item[0].item[4].initial[0].valueCoding = CountryCodeSystem#country98
* item[3].item[0].item[4].repeats = false
* item[3].item[0].item[4].required = false

* item[3].item[0].item[5].linkId = "Practitioner.identifier[0].extension[3]"
* item[3].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:placeIssued.value[x]:valueString"
* item[3].item[0].item[5].text = "Place of Issue"
* item[3].item[0].item[5].type = #string
* item[3].item[0].item[5].repeats = false
* item[3].item[0].item[5].required = false