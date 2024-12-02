Invariant:      ihris-age-18
Description:    "birthDate must be more than 18 years ago."
Expression:     "birthDate < today() - 18 years"
Severity:       #error


Profile:        IhrisPractitioner
Parent:         Practitioner
Id:             ihris-practitioner
Title:          "iHRIS Practitioner"
Description:    "iHRIS profile of Practitioner."
* identifier 0..* MS
* identifier ^label = "Identifier"
* identifier ^constraint[0].key = "ihris-search-identifier"
* identifier ^constraint[0].severity = #error
* identifier ^constraint[0].expression = "'Practitioner' | 'identifier' | iif(system.exists(), system & '|' & value, value)"
* identifier ^constraint[0].human = "The identifier must be unique and another record has this identifier"
* identifier.use 0..0
* identifier.use ^label = "Use"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.type.coding from http://ihris.org/fhir/ValueSet/td-id-type-valueset
* identifier.type.coding ^label = "Type"
* identifier.system 0..0
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.extension contains IdIssueDate named issueDate 0..1 MS
* identifier.extension[issueDate].valueDate MS
* identifier.extension[issueDate] ^label = "Date of Issue"
* identifier.extension contains IdExpireDate named expireDate 0..1 MS
* identifier.extension[expireDate].valueDate MS
* identifier.extension[expireDate] ^label = "Date of Expiration"
* identifier.extension contains IhrisCountryIssued named countryIssued 0..1 MS
* identifier.extension[countryIssued].valueCoding MS
* identifier.extension[countryIssued] ^label = "Country of Issue"
* identifier.extension contains IdPlaceIssued named placeIssued 0..1 MS
* identifier.extension[placeIssued].valueString MS
* identifier.extension[placeIssued] ^label = "Place of Issue"
* name 1..* MS
* name ^label = "Name"
* name.use MS
* name.use ^label = "Use"
* name.family 1..1 MS
* name.family ^label = "Family"
* name.family ^constraint[0].key = "ihris-name-check"
* name.family ^constraint[0].severity = #error
* name.family ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.family ^constraint[0].human = "Name must be only text."
* name.given 1..* MS
* name.given ^label = "Given Name"
* name.suffix 0..0
* name.suffix ^label = "Suffix"
* name.extension contains Civility named civility 0..1 MS
* name.extension[civility].valueCoding MS
* name.extension[civility].valueCoding ^label = "Civility"
* telecom 0..* MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Contact Type"
* telecom.system from http://ihris.org/fhir/ValueSet/contact-type-valueset
* telecom.use MS
* telecom.use ^label = "Use"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom ^constraint[0].key = "ihris-search-phone"
* telecom ^constraint[0].severity = #error
* telecom ^constraint[0].expression = "'Practitioner' | 'phonenumber' | iif(value.exists(), system & '|' & value, value)"
* telecom ^constraint[0].human = "The identifier must be unique and another record has this identifier"
* address 0..* MS
* address ^label = "Address"
* address.use
* address.use ^label = "Use"
* address.type
* address.type ^label = "Type"
* address.line 1..1 MS
* address.line ^label = "Line"
* address.city MS
* address.city ^label = "City"
* address.district MS
* address.district ^label = "District"
* address.state MS
* address.state ^label = "State"
* address.postalCode MS
* address.postalCode ^label = "Postal Code"
* address.country MS
* address.country ^label = "Country"
* address.extension contains
    AddressDistrict named district 0..1 MS
* address.extension[district] MS
* address.extension[district] ^label = "District"
* address.extension[district].valueReference MS
* gender 1..1 MS
* gender ^label = "Gender"
* birthDate MS
* birthDate ^label = "Birth Date"
* birthDate obeys ihris-age-18
* birthDate ^minValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^minValueQuantity.code = #a
* birthDate ^minValueQuantity.value = 100
* birthDate ^maxValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^maxValueQuantity.code = #a
* birthDate ^maxValueQuantity.value = -18
* photo 0..1 MS
* photo ^label = "Photo"
* communication 0..* MS
* communication ^label = "Communication"
* communication.coding 1..1 MS
* communication.coding ^label = "Language"
* communication.extension contains
    IhrisPractitionerLanguageProficiency named proficiency 0..* MS
* communication.extension[proficiency] MS
* communication.extension[proficiency] ^label = "Language Proficiency"
* communication.extension[proficiency].extension[level].valueCoding MS
* communication.extension[proficiency].extension[type].valueCoding MS
* extension contains
    RegistrationNumber named registrationNumber 1..1 MS and
    BirthPlace named birth-place 0..1 MS and
    IhrisPractitionerNationality named nationality 0..1 MS and
    IhrisPractitionerMaritalStatus named marital-status 0..1 MS and
    IhrisPractitionerChildren named children 0..1 MS and
    FirstServiceStartDate named first-service-start-date 0..1 MS
* extension[birth-place] ^label = "Place of Birth"
* extension[birth-place].valueString MS
* extension[nationality]  ^label = "Nationality"
* extension[nationality].valueCoding MS
* extension[marital-status]  ^label = "Marital Status"
* extension[marital-status].valueCoding MS
* extension[children]  ^label = "Number of Children"
* extension[children].valueInteger MS
* extension[registrationNumber].valueString 1..1 MS
* extension[registrationNumber].valueString ^label = "Registration Number"
* extension[first-service-start-date]  ^label = "First Service Start Date"
* extension[first-service-start-date].valueDate MS
* active 1..1 MS
* active ^label = "Active"

Extension:      AddressDistrict
Id:             address-district
Title:          "District Address"
Description:    "District Address."
* ^context[0].type = #element
* ^context[0].expression = "Basic"
* value[x] only Reference 
* valueReference only Reference(TDDistrict)
* valueReference ^label = "District"

Extension:      RegistrationNumber
Id:             registration-number
Title:          "Registration Number"
Description:    "Registration Number"
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Registration Number"

Extension:      FirstServiceStartDate
Id:             first-service-start-date
Title:          "First Service Start Date"
Description:    "First Service Start Date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "First Service Start Date"

Extension:      IdIssueDate
Id:             id-issue-date
Title:          "iHRIS ID Issue Date"
Description:    "iHRIS extension for ID issue date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Date of Issue"

Extension:      IdExpireDate
Id:             id-expire-date
Title:          "iHRIS ID Expire Date"
Description:    "iHRIS extension for ID expire date."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Date of Expiration"

Extension:      IdPlaceIssued
Id:             id-place-issued
Title:          "iHRIS ID Place Issued"
Description:    "iHRIS extension for ID place issued."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Place Issued"

Extension:      IhrisCountryIssued
Id:             ihris-country-issued
Title:          "iHRIS Country Issued"
Description:    "iHRIS extension for Country Issued."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Country Issued"
* valueCoding from http://ihris.org/fhir/ValueSet/country-valueset (required)

Extension:      Civility
Id:             civility
Title:          "Civility"
Description:    "Civility."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Civility"
* valueCoding from http://ihris.org/fhir/ValueSet/civility-valueset (required)

Extension:      IhrisPractitionerLanguageProficiency
Id:             ihris-practitioner-language-proficiency
Title:          "iHRIS Practitioner Language Proficiency"
Description:    "iHRIS extension for Practitioner Language Proficiency."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains
    level 0..1 MS and
    type 0..* MS
* extension[level].value[x] only Coding
* extension[level].valueCoding 0..1 MS
* extension[level].valueCoding from http://terminology.hl7.org/ValueSet/v3-LanguageAbilityProficiency
* extension[level].valueCoding ^label = "Proficiency Level"
* extension[type] ^label = "Proficiency Type"
* extension[type].value[x] only Coding
* extension[type].valueCoding 0..1 MS
* extension[type].valueCoding ^label = "Proficiency Type"
* extension[type].valueCoding from http://terminology.hl7.org/ValueSet/v3-LanguageAbilityMode

Extension:      IhrisPractitionerResidence
Id:             ihris-practitioner-residence
Title:          "iHRIS Practitioner Residence"
Description:    "iHRIS extension for Practitioner residence."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference ^label = "Residence"
* valueReference only Reference(TDRegion or TDDistrict)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Location"
* valueReference.type 0..0
* valueReference.identifier 0..0
* valueReference.display 0..0

Extension:      BirthPlace
Id:             birth-place
Title:          "Place of Birth"
Description:    "Place of Birth."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Place of Birth"

Extension:      IhrisPractitionerDependentDetail
Id:             ihris-practitioner-dependent-detail
Title:          "iHRIS Practitioner Dependent Detail"
Description:    "iHRIS extension for Practitioner Dependent Detail."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains name 1..1 MS and
    birthDate 1..1 MS
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Dependent's Name"
* extension[birthDate].value[x] only date
* extension[birthDate].valueDate 1..1 MS
* extension[birthDate].valueDate ^label = "Dependent's Date of Birth"

Extension:      IhrisPractitionerNationality
Id:             ihris-practitioner-nationality
Title:          "iHRIS Practitioner Nationality"
Description:    "iHRIS extension for Practitioner nationality."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Nationality"
* valueCoding from http://ihris.org/fhir/ValueSet/nationality-valueset (required)

Extension:      IhrisPractitionerMaritalStatus
Id:             ihris-practitioner-marital-status
Title:          "iHRIS Practitioner Marital Status"
Description:    "iHRIS extension for Practitioner marital status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Marital Status"
* valueCoding from http://hl7.org/fhir/ValueSet/marital-status (required)

Extension:      IhrisPractitionerChildren
Id:             ihris-practitioner-children
Title:          "iHRIS Practitioner Children"
Description:    "iHRIS extension for Practitioner number of children."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only integer
* valueInteger 1..1 MS
* valueInteger ^label = "Number of Children"

Instance:       ihris-search-registration-number
InstanceOf:     SearchParameter
Title:          "search parameter for registration Number"
Usage:          #definition
* url = "http://ihris.org/fhir/SearchParameter/ihris-search-license-registration"
* description = "search parameter for registration Number"
* name = "search parameter for registration number"
* status = #active
* experimental = false
* code = #regnum
* base[0] = #Practitioner
* type = #string
* expression = "Practitioner.extension('http://ihris.org/fhir/StructureDefinition/registration-number')"
* target[0] = #Practitioner