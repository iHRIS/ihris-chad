CodeSystem:       TDIDTypeCodeSystem
Id:               td-id-type-codesystem
Title:            "Identifier Types Code System"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* #employeecode "Employee Code"
* #nni "National Identification Number"
* #passport "Passport"
* #drivinglicense "Driving License"
* #cni "National Identification card"

ValueSet:          TDIDTypeValueSet
Id:                td-id-type-valueset
Title:             "Identifier Types ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system TDIDTypeCodeSystem

ValueSet:         TDGenderValueSet
Id:               td-gender-valueset
Title:            "TD Gender ValueSet"
* ^date = "2023-03-28T05:55:04.362Z"
* ^version = "0.1.0"
* include http://hl7.org/fhir/administrative-gender#male
* include http://hl7.org/fhir/administrative-gender#female

CodeSystem:       CivilityCodeSystem
Id:               civility-codesystem
Title:            "Civility Code System"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* #madam "Madam"
* #miss "Miss"
* #sir "Sir"
* #doctor "Doctor"

ValueSet:          CivilityValueSet
Id:                civility-valueset
Title:             "Civility ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system CivilityCodeSystem

CodeSystem:       MaritalStatusCodeSystem
Id:               marital-status-codesystem
Title:            "Marital Status Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #divorced "Divorced"
* #married "Married"
* #single "Single"
* #widowed "Widowed"

ValueSet:          MaritalStatusValueSet
Id:                marital-status-valueset
Title:            "Marital Status ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system MaritalStatusCodeSystem

CodeSystem:       AgentStatusCodeSystem
Id:               agent-status-codesystem
Title:            "Agent Status Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #regularcivilservant "Regular Civil Servant"
* #traineecivilservant "Trainee Civil Servant"
* #politicalpersonality "Political Personality"
* #contractual "Contractual"

ValueSet:          AgentStatusValueSet
Id:                agent-status-valueset
Title:            "Agent Status ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system AgentStatusCodeSystem

CodeSystem:       QualificationCodeSystem
Id:               qualification-codesystem
Title:            "Qualification Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #doctor "Doctor"
* #nurse "Nurse"
* #engineer "Enginner"
* #agent "Agent"

ValueSet:          QualificationValueSet
Id:                qualification-valueset
Title:            "Qualification ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system QualificationCodeSystem

CodeSystem:       SpecializationCodeSystem
Id:               specialization-codesystem
Title:            "Specialization Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #surgery "Surgery"
* #cardiology "Cardiology"
* #dermatology "Dermatology"

ValueSet:          SpecializationValueSet
Id:                specialization-valueset
Title:            "Specialization ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system SpecializationCodeSystem

CodeSystem:       FunctionCodeSystem
Id:               function-codesystem
Title:            "Function Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #hod "Head of Department"
* #director "Director"

ValueSet:          FunctionValueSet
Id:                function-valueset
Title:            "Function ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system FunctionCodeSystem

CodeSystem:       LevelCodeSystem
Id:               level-codesystem
Title:            "Level Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #central "Central"
* #province "Province"
* #district "District"
* #healthstructure "Health Structure"

ValueSet:          LevelValueSet
Id:                level-valueset
Title:            "Level ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system LevelCodeSystem

CodeSystem:       StudyLevelCodeSystem
Id:               study-level-codesystem
Title:            "Level of Study Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #bac2 "BAC+2"
* #bac3 "BAC+3"
* #bac4 "BAC+4"
* #bac5 "BAC+5"
* #bac6 "BAC+6"
* #bac7 "BAC+7"
* #bac8 "BAC+8"
* #bepcet "BEPCET"
* #cepet "CEPET"
* #permisdeconduire "Permis de Conduire"
* #bac "BAC"

ValueSet:          StudyLevelValueSet
Id:                study-level-valueset
Title:            "Level of Study ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system StudyLevelCodeSystem

CodeSystem:       GradeCodeSystem
Id:               grade-codesystem
Title:            "Grade Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #initial "Initial"
* #normal "Normal"
* #terminal "Terminal"

ValueSet:          GradeValueSet
Id:                grade-valueset
Title:            "Grade ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system GradeCodeSystem

CodeSystem:       CivilServantCategoryCodeSystem
Id:               civil-servant-category-codesystem
Title:            "Civil Servant Category Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #A "A"
* #B "B"
* #C "C"

ValueSet:          CivilServantCategoryValueSet
Id:                civil-servant-category-valueset
Title:            "Civil Servant Category ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system CivilServantCategoryCodeSystem

CodeSystem:       ContractualCategoryCodeSystem
Id:               contractual-category-codesystem
Title:            "Contractual Category Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #I "I"
* #II "II"
* #III "III"

ValueSet:          ContractualCategoryValueSet
Id:                contractual-category-valueset
Title:            "Contractual Category ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system ContractualCategoryCodeSystem

CodeSystem:       ClassificationClassCodeSystem
Id:               classification-class-codesystem
Title:            "Classification Class Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #1 "1"
* #2 "2"
* #3 "3"
* #4 "4"
* #5 "5"

ValueSet:          ClassificationClassValueSet
Id:                classification-class-valueset
Title:            "Classification Class ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system ClassificationClassCodeSystem

CodeSystem:       EchelonCodeSystem
Id:               echelon-codesystem
Title:            "Echelon Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #1 "1"
* #2 "2"
* #3 "3"
* #4 "4"
* #5 "5"
* #6 "6"
* #7 "7"
* #8 "8"
* #9 "9"
* #10 "10"
* #11 "11"

ValueSet:          EchelonValueSet
Id:                echelon-valueset
Title:            "Echelon ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system EchelonCodeSystem

CodeSystem:       YesNoCodeSystem
Id:               yes-no-codesystem
Title:            "Yes/No Code System"
* ^date = "2023-11-18T19:04:00.000Z"
* ^version = "0.1.0"
* #yes "Yes"
* #no "No"

ValueSet:          YesNoValueSet
Id:                yes-no-valueset
Title:            "Yes/No ValueSet"
* ^date = "2023-11-18T19:04:00.000Z"
* ^version = "0.1.0"
* codes from system YesNoCodeSystem