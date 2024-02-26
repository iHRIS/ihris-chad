Profile:        TDEducationTypeProfile
Parent:         Basic
Id:             td-education-type-profile
Title:          "Education Type"
Description:    "Education Type."
* code = NAResourceCodeSystem#standard-lists
* extension contains
    IhrisBasicName named name 1..1 MS
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Education Type"

Profile:        TDDegreeProfile
Parent:         Basic
Id:             td-degree-profile
Title:          "Degree"
Description:    "Degree."
* code = NAResourceCodeSystem#standard-lists
* extension contains
    IhrisBasicName named name 1..1 MS and
    EducationType named education-type 1..1 MS
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Degree"
* extension[education-type].valueReference 1..1 MS
* extension[education-type].valueReference ^label = "Education Type"

Extension:      EducationType
Id:             education-type
Title:          "Education Type"
Description:    "Education Type"
* ^context[0].type = #element
* ^context[0].expression = "Basic"
* value[x] only Reference(TDEducationTypeProfile)
* valueReference 1..1 MS
* valueReference ^label = "Education Type"

Instance:       ihris-page-education-type
InstanceOf:     IhrisPage
Title:          "Education Type Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-education-type-profile)
* extension[display].extension[search][0].valueString = "Name|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-basic-name').valueString"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/education-type/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Basic.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Education Type"
* extension[section][0].extension[description].valueString = "Education Type"
* extension[section][0].extension[name].valueString = "Education Type"
* extension[section][0].extension[field][0].valueString = "Basic.extension:name"

Instance:       ihris-page-degree
InstanceOf:     IhrisPage
Title:          "Degree Type Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-degree-profile)
* extension[display].extension[search][0].valueString = "Name|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-basic-name').valueString"
* extension[display].extension[search][1].valueString = "Type|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/education-type').valueReference"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/degree/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Basic.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Degree"
* extension[section][0].extension[description].valueString = "Degree"
* extension[section][0].extension[name].valueString = "Degree"
* extension[section][0].extension[field][0].valueString = "Basic.extension:name"
* extension[section][0].extension[field][1].valueString = "Basic.extension:education-type"

Instance:       ihris-page-specialization
InstanceOf:     IhrisPage
Title:          "Specialization Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/specialization-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Specialization"
* extension[section][0].extension[description].valueString = "Specialization"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-civility
InstanceOf:     IhrisPage
Title:          "Civility Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/civility-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Civility"
* extension[section][0].extension[description].valueString = "Civility"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-qualification
InstanceOf:     IhrisPage
Title:          "Qualification Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/qualification-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Qualification"
* extension[section][0].extension[description].valueString = "Qualification"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-function
InstanceOf:     IhrisPage
Title:          "Function Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/function-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Function"
* extension[section][0].extension[description].valueString = "Function"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-study-level
InstanceOf:     IhrisPage
Title:          "Function Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/study-level-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Level of Study"
* extension[section][0].extension[description].valueString = "Level of Study"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-identifier-type
InstanceOf:     IhrisPage
Title:          "Identifier Type Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/td-id-type-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Identifier Type"
* extension[section][0].extension[description].valueString = "Identifier Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-grade
InstanceOf:     IhrisPage
Title:          "Grade Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/grade-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Grade"
* extension[section][0].extension[description].valueString = "Grade"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-civil-servant-category
InstanceOf:     IhrisPage
Title:          "Civil Servant Category Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/civil-servant-category-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Civil Servant Category"
* extension[section][0].extension[description].valueString = "Civil Servant Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-contractual-category
InstanceOf:     IhrisPage
Title:          "Contractual Category Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/contractual-category-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Contractual Category"
* extension[section][0].extension[description].valueString = "Contractual Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-classification-class
InstanceOf:     IhrisPage
Title:          "Classification Class Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/classification-class-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Classification Class"
* extension[section][0].extension[description].valueString = "Classification Class"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-echelon
InstanceOf:     IhrisPage
Title:          "Echelon Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/echelon-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Echelon"
* extension[section][0].extension[description].valueString = "Echelon"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-education-sector
InstanceOf:     IhrisPage
Title:          "Education Sector Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/education-sector-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Education Sector"
* extension[section][0].extension[description].valueString = "Education Sector"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-training-mode
InstanceOf:     IhrisPage
Title:          "Training Mode Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/training-mode-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Training Mode"
* extension[section][0].extension[description].valueString = "Training Mode"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-training-fund
InstanceOf:     IhrisPage
Title:          "Training Fund Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/training-fund-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Training Fund"
* extension[section][0].extension[description].valueString = "Training Fund"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-ministry
InstanceOf:     IhrisPage
Title:          "Ministry Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ministry-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Ministry"
* extension[section][0].extension[description].valueString = "Ministry"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-service
InstanceOf:     IhrisPage
Title:          "Service Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/work-service-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Service"
* extension[section][0].extension[description].valueString = "Service"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-discipline-action-type
InstanceOf:     IhrisPage
Title:          "iHRIS Discipline Action Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-discipline-action-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Discipline Action Type"
* extension[section][0].extension[description].valueString = "Discipline Action Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-disciplinary-action-taken
InstanceOf:     IhrisPage
Title:          "Disciplinary Action Taken Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/disciplinary-action-taken-codesystem)
* extension[display].extension[search][0].valueString = "Display|display"
* extension[display].extension[search][1].valueString = "Code|code"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Disciplinary Action Taken"
* extension[section][0].extension[description].valueString = "Disciplinary Action Taken"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"

Instance:       ihris-page-facility-type
InstanceOf:     IhrisPage
Title:          "Facility Type Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/facility-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Action|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Facility Type"
* extension[section][0].extension[description].valueString = "Facility Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-country
InstanceOf:     IhrisPage
Title:          "Country Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/country-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Action|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Country"
* extension[section][0].extension[description].valueString = "Country"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-nationality
InstanceOf:     IhrisPage
Title:          "Nationality Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/nationality-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Action|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Nationality"
* extension[section][0].extension[description].valueString = "Nationality"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-search-education-type
InstanceOf:     SearchParameter
Title:          "search parameter for Education Type"
Usage:          #definition
* url = "http://ihris.org/fhir/SearchParameter/ihris-search-education-type"
* description = "search parameter for Education Type"
* name = "search parameter for Education Type"
* status = #active
* experimental = false
* code = #educationtype
* base[0] = #Basic
* type = #reference
* expression = "Basic.extension('http://ihris.org/fhir/StructureDefinition/education-type')"
* target[0] = #Basic