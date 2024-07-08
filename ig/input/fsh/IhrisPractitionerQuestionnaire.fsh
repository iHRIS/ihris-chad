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

* item[0].item[2].linkId = "Practitioner.photo"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.photo"
* item[0].item[2].text = "Photo"
* item[0].item[2].type = #attachment
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Practitioner.gender"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.gender"
* item[0].item[3].text = "Gender"
* item[0].item[3].type = #choice
* item[0].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/td-gender-valueset"
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Practitioner.extension[1]"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:marital-status.value[x]:valueCoding"
* item[0].item[4].text = "Marital Status"
* item[0].item[4].type = #choice
* item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/marital-status-valueset"
* item[0].item[4].required = true
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Practitioner.birthDate"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.birthDate"
* item[0].item[5].text = "Date of Birth"
* item[0].item[5].type = #date
* item[0].item[5].required = true
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Practitioner.extension[2]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:birth-place.value[x]:valueString"
* item[0].item[6].text = "Place of Birth"
* item[0].item[6].type = #string
* item[0].item[6].required = true
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Practitioner.extension[3]"
* item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:nationality.value[x]:valueCoding"
* item[0].item[7].text = "Nationality"
* item[0].item[7].type = #choice
* item[0].item[7].answerValueSet = "http://ihris.org/fhir/ValueSet/nationality-valueset"
* item[0].item[7].required = true
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "Practitioner.extension[4]"
* item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:children.value[x]:valueInteger"
* item[0].item[8].text = "Number of Children"
* item[0].item[8].type = #integer
* item[0].item[8].required = true
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

* item[1].item[0].item[4].linkId = "Practitioner.address[0].extension[0]#tree"
* item[1].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.extension:district.value[x]:valueReference"
* item[1].item[0].item[4].text = "District"
* item[1].item[0].item[4].type = #reference
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

* item[1].item[1].linkId = "Practitioner.telecom[0]"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom"
* item[1].item[1].text = "Telecom"
* item[1].item[1].type = #group
* item[1].item[1].repeats = true
* item[1].item[1].required = true

* item[1].item[1].item[0].linkId = "Practitioner.telecom[0].use"
* item[1].item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.use"
* item[1].item[1].item[0].text = "Telecom Use"
* item[1].item[1].item[0].type = #choice
* item[1].item[1].item[0].answerValueSet = "http://hl7.org/fhir/contact-point-use"
* item[1].item[1].item[0].required = true
* item[1].item[1].item[0].repeats = false
* item[1].item[1].item[0].readOnly = true
* item[1].item[1].item[0].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#mobile
* item[1].item[1].item[0].answerOption.initialSelected = true

* item[1].item[1].item[1].linkId = "Practitioner.telecom[0].system"
* item[1].item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[1].item[1].text = "Telecom Type"
* item[1].item[1].item[1].type = #choice
* item[1].item[1].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/contact-type-valueset"
* item[1].item[1].item[1].required = true
* item[1].item[1].item[1].repeats = false

* item[1].item[1].item[2].linkId = "Practitioner.telecom[0].value"
* item[1].item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[1].item[2].text = "Value"
* item[1].item[1].item[2].type = #string
* item[1].item[1].item[2].required = true
* item[1].item[1].item[2].repeats = false

* item[2].linkId = "Practitioner.identifier"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[2].text = "Identifiers|Identifiers for the practitioner"
* item[2].type = #group

* item[2].item[0].linkId = "Practitioner.identifier[0]"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[2].item[0].text = "Identification"
* item[2].item[0].type = #group
* item[2].item[0].repeats = true
* item[2].item[0].required = true

* item[2].item[0].item[0].linkId = "Practitioner.identifier[0].type"
* item[2].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[2].item[0].item[0].text = "Identification Type"
* item[2].item[0].item[0].type = #choice
* item[2].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/td-id-type-valueset"
* item[2].item[0].item[0].repeats = false
* item[2].item[0].item[0].required = true

* item[2].item[0].item[1].linkId = "Practitioner.identifier[0].value"
* item[2].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[2].item[0].item[1].text = "Identification Number"
* item[2].item[0].item[1].type = #string
* item[2].item[0].item[1].repeats = false
* item[2].item[0].item[1].required = true

* item[2].item[0].item[2].linkId = "Practitioner.identifier[0].extension[0]"
* item[2].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:issueDate.value[x]:valueDate"
* item[2].item[0].item[2].text = "Date of Issue"
* item[2].item[0].item[2].type = #date
* item[2].item[0].item[2].repeats = false
* item[2].item[0].item[2].required = false

* item[2].item[0].item[3].linkId = "Practitioner.identifier[0].extension[1]"
* item[2].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:expireDate.value[x]:valueDate"
* item[2].item[0].item[3].text = "Date of Expiration"
* item[2].item[0].item[3].type = #date
* item[2].item[0].item[3].repeats = false
* item[2].item[0].item[3].required = false

* item[2].item[0].item[4].linkId = "Practitioner.identifier[0].extension[2]"
* item[2].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:countryIssued.value[x]:valueCoding"
* item[2].item[0].item[4].text = "Country of Issue"
* item[2].item[0].item[4].type = #choice
* item[2].item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/country-valueset"
* item[2].item[0].item[4].initial[0].valueCoding = CountryCodeSystem#country98
* item[2].item[0].item[4].repeats = false
* item[2].item[0].item[4].required = false

* item[2].item[0].item[5].linkId = "Practitioner.identifier[0].extension[3]"
* item[2].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.extension:placeIssued.value[x]:valueString"
* item[2].item[0].item[5].text = "Place of Issue"
* item[2].item[0].item[5].type = #string
* item[2].item[0].item[5].repeats = false
* item[2].item[0].item[5].required = false