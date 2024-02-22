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

CodeSystem:       ClassificationCategoryCodeSystem
Id:               classification-category-codesystem
Title:            "Classification Category Code System"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* #contract "Contract"
* #civilservant "Civil Servant"

ValueSet:          ClassificationCategoryValueSet
Id:                classification-category-valueset
Title:             "Classification Category ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system ClassificationCategoryCodeSystem

CodeSystem:       EducationSectorCodeSystem
Id:               education-sector-codesystem
Title:            "Education Sector Code System"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* #health "Health"

ValueSet:          EducationSectorValueSet
Id:                education-sector-valueset
Title:             "Education Sector ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system EducationSectorCodeSystem

CodeSystem:       TrainingModeCodeSystem
Id:               training-mode-codesystem
Title:            "Training Mode Code System"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* #online "Online"

ValueSet:          TrainingModeValueSet
Id:                training-mode-valueset
Title:             "Training Mode ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system TrainingModeCodeSystem

CodeSystem:       TrainingFundCodeSystem
Id:               training-fund-codesystem
Title:            "Training Fund Code System"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* #government "Government"

ValueSet:          TrainingFundValueSet
Id:                training-fund-valueset
Title:             "Training Fund ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system TrainingFundCodeSystem

CodeSystem:       PerformanceScoreCodeSystem
Id:               performance-score-codesystem
Title:            "Performance Score Code System"
* ^date = "2024-02-02T08:14:00.000Z"
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
* #12 "12"
* #13 "13"
* #14 "14"
* #15 "15"
* #16 "16"
* #17 "17"
* #18 "18"
* #19 "19"
* #20 "20"

ValueSet:          PerformanceScoreValueSet
Id:                performance-score-valueset
Title:             "Performance Score ValueSet"
* ^date = "2024-02-02T08:14:00.000Z"
* ^version = "0.1.0"
* codes from system PerformanceScoreCodeSystem

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

CodeSystem:       InstitutionTypeCodeSystem
Id:               institution-type-codesystem
Title:            "Institution Type Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* #ministry "Ministry"
* #organization "Organization"

ValueSet:          InstitutionTypeValueSet
Id:                institution-type-valueset
Title:            "Institution Type ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system InstitutionTypeCodeSystem

CodeSystem:       MinistryCodeSystem
Id:               ministry-codesystem
Title:            "Ministry Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"

ValueSet:          MinistryValueSet
Id:                ministry-valueset
Title:            "Ministry ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system MinistryCodeSystem

CodeSystem:       WorkServiceCodeSystem
Id:               work-service-codesystem
Title:            "Service Code System"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"

ValueSet:          WorkServiceValueSet
Id:                work-service-valueset
Title:            "Service ValueSet"
* ^date = "2024-02-07T08:12:00.000Z"
* ^version = "0.1.0"
* codes from system WorkServiceCodeSystem

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
* ^date = "2024-02-19T13:41:00.000Z"
* ^version = "0.1.0"
* #yes "Yes"
* #no "No"

ValueSet:          YesNoValueSet
Id:                yes-no-valueset
Title:            "Yes/No ValueSet"
* ^date = "2024-02-19T13:41:00.000Z"
* ^version = "0.1.0"
* codes from system YesNoCodeSystem

CodeSystem:       FacilityTypeCodeSystem
Id:               facility-type-codesystem
Title:            "Facility Type Code System"
* ^date = "2024-02-19T13:43:00.000Z"
* ^version = "0.1.0"

ValueSet:         FacilityTypeValueSet
Id:               facility-type-valueset
Title:            "Facility Type ValueSet"
* ^date = "2024-02-19T13:43:00.000Z"
* ^version = "0.1.0"
* codes from system FacilityTypeCodeSystem

CodeSystem:      TDJurisdictionTypeCodeSystem
Id:              td-jurisdiction-type-codesystem
Title:           "Jurisdiction Type Code System"
* ^date = "2024-02-19T13:41:00.000Z"
* ^version = "0.4.0"
* #country "Country" "Country"
* #region "Province" "Province"
* #district "District" "District"

ValueSet:         TDJurisdictionTypeValueSet
Id:               td-jurisdiction-type-valueset
Title:            "Jurisdiction Type ValueSet"
* ^date = "2024-02-19T13:41:00.000Z"
* ^version = "0.4.0"
* codes from system TDJurisdictionTypeCodeSystem

CodeSystem:      IhrisDisciplinaryActionType
Id:              ihris-discipline-action-type-codesystem
Title:           "Disciplinary Action Type"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* #warning "Warning"
* #layoff "Layoff"
* #blame "Blame"

ValueSet:         DisciplinaryActionTypeValueSet
Id:               discipline-action-type-valueset
Title:            "iHRIS Disciplinary Action Type ValueSet"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisDisciplinaryActionType

CodeSystem:      DisciplinaryActionTakenCodeSystem
Id:              disciplinary-action-taken-codesystem
Title:           "Disciplinary Action Taken"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* #order "Order"
* #decree "Decree"
* #memo "Memo"

ValueSet:         DisciplinaryActionTakenValueSet
Id:               disciplinary-action-taken-valueset
Title:            "iHRIS Disciplinary Action Taken ValueSet"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system DisciplinaryActionTakenCodeSystem