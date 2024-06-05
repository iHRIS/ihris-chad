Profile:        TDCountry
Parent:         Location
Id:             td-country
Title:          "Country"
Description:    "iHRIS Profile of Locations to manage jurisdictions."
* type 1..1 MS
* type ^label = "Location Type"
* type.coding 1..1 MS
* type.coding ^label = "Location Type"
* type.coding from TDJurisdictionTypeValueSet (required)
* physicalType 1..1 MS
* physicalType ^label = "Location Physical Type"
* name 1..1 MS
* name ^label = "Name"
* status 1..1 MS
* status ^label = "Status"
* partOf 0..0 MS

Profile:        TDRegion
Parent:         Location
Id:             td-region
Title:          "Province"
Description:    "iHRIS Profile of Locations to manage jurisdictions."
* type 1..1 MS
* type ^label = "Location Type"
* type.coding 1..1 MS
* type.coding ^label = "Location Type"
* type.coding from TDJurisdictionTypeValueSet (required)
* physicalType 1..1 MS
* physicalType ^label = "Location Physical Type"
* name 1..1 MS
* name ^label = "Name"
* status 1..1 MS
* status ^label = "Status"
* partOf 1..1 MS
* partOf only Reference(TDCountry)
* partOf ^label = "Country"

Profile:        TDDistrict
Parent:         Location
Id:             td-district
Title:          "District"
Description:    "iHRIS Profile of Locations to manage jurisdictions."
* type 1..1 MS
* type ^label = "Location Type"
* type.coding 1..1 MS
* type.coding ^label = "Location Type"
* type.coding from TDJurisdictionTypeValueSet (required)
* physicalType 1..1 MS
* physicalType ^label = "Location Physical Type"
* name 1..1 MS
* name ^label = "Name"
* status 1..1 MS
* status ^label = "Status"
* partOf 1..1 MS
* partOf only Reference(TDRegion)
* partOf ^label = "Province"

Profile:        TDFacility
Parent:         Location
Id:             td-facility
Title:          "Facility"
Description:    "Profile of Locations to manage facilities."
* type 1..1 MS
* type ^label = "Facility Type"
* type.coding 1..1 MS
* type.coding from FacilityTypeValueSet
* type.coding ^label = "Facility Type"
* identifier 0..1 MS
* identifier ^label = "Identifier"
* identifier.value MS
* identifier.value ^label = "Facility Code"
* name 1..1 MS
* name ^label = "Name"
* status 1..1 MS
* status ^label = "Status"
* position 0..1 MS
* position ^label = "Co-ordinates"
* position.longitude 1..1 MS
* position.longitude ^label = "Longitude"
* position.latitude 1..1 MS
* position.latitude ^label = "Latitude"
* partOf 1..1 MS 
* partOf only Reference(TDDistrict or TDRegion or TDCountry)
* partOf ^label = "Location"

Profile:        TDDepartment
Parent:         Location
Id:             td-department
Title:          "Department"
Description:    "Profile of Locations to manage department."
* identifier 0..1 MS
* identifier ^label = "Identifier"
* identifier.value MS
* identifier.value ^label = "Department Code"
* name 1..1 MS
* name ^label = "Name"
* status 1..1 MS
* status ^label = "Status"
* partOf 1..1 MS 
* partOf only Reference(TDFacility)
* partOf ^label = "Location"

Instance:       ihris-page-td-department
InstanceOf:     IhrisPage
Title:          "District Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-department)
* extension[display].extension[search][0].valueString = "Name|name"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/td-department/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Location.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Department"
* extension[section][0].extension[description].valueString = "Department"
* extension[section][0].extension[name].valueString = "Department"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.type"
* extension[section][0].extension[field][2].valueString = "Location.identifier"
* extension[section][0].extension[field][3].valueString = "Location.partOf"
* extension[section][0].extension[field][4].valueString = "Location.status"


Instance:       ihris-page-td-facility
InstanceOf:     IhrisPage
Title:          "iHRIS Facility Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-facility)
* extension[display].extension[search][0].valueString = "Facility Name|name"
* extension[display].extension[search][1].valueString = "Facility Type|type.coding.display"
* extension[display].extension[search][2].valueString = "Location|partOf"
* extension[display].extension[search][3].valueString = "Status|status"
* extension[display].extension[search][4].valueString = "Longitute|position.longitude"
* extension[display].extension[search][5].valueString = "Latitude|position.latitude"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Type|type|http://ihris.org/fhir/ValueSet/facility-type-valueset"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/td-facility/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Location.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Facility"
* extension[section][0].extension[description].valueString = "Facility"
* extension[section][0].extension[name].valueString = "Location"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.type"
* extension[section][0].extension[field][2].valueString = "Location.identifier"
* extension[section][0].extension[field][3].valueString = "Location.partOf"
* extension[section][0].extension[field][4].valueString = "Location.status"
* extension[section][0].extension[field][5].valueString = "Location.position"

Instance:       ihris-page-td-country
InstanceOf:     IhrisPage
Title:          "District Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-country)
* extension[display].extension[search][0].valueString = "Name|name"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/td-country/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Location.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Countries"
* extension[section][0].extension[description].valueString = "Countries"
* extension[section][0].extension[name].valueString = "Countries"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.type"
* extension[section][0].extension[field][2].valueString = "Location.status"

Instance:       ihris-page-td-region
InstanceOf:     IhrisPage
Title:          "Region Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-region)
* extension[display].extension[search][0].valueString = "Name|name"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/td-region/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Location.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Province"
* extension[section][0].extension[description].valueString = "Regions"
* extension[section][0].extension[name].valueString = "province"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.type"
* extension[section][0].extension[field][2].valueString = "Location.partOf"
* extension[section][0].extension[field][3].valueString = "Location.status"

Instance:       ihris-page-td-district
InstanceOf:     IhrisPage
Title:          "Namibia District Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/td-district)
* extension[display].extension[search][0].valueString = "Name|name"
* extension[display].extension[search][1].valueString = "Region|partOf"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/td-district/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Location.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "primary"
* extension[section][0].extension[title].valueString = "Districts"
* extension[section][0].extension[description].valueString = "Districts"
* extension[section][0].extension[name].valueString = "Districts"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.type"
* extension[section][0].extension[field][2].valueString = "Location.partOf"
* extension[section][0].extension[field][3].valueString = "Location.status"

Alias: $td-jurisdiction-type-codesystem = http://ihris.org/fhir/CodeSystem/td-jurisdiction-type-codesystem

Instance: countrytd
InstanceOf: Location
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2023-05-03T21:33:07.462+03:00"
* meta.source = "#HtC6uAx9AM64G20N"
* meta.profile = "http://ihris.org/fhir/StructureDefinition/td-country"
* status = #active
* name = "Chad"
* type.coding.version = "0.4.0"
* type.coding = $td-jurisdiction-type-codesystem#country "Country"