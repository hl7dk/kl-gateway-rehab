Profile:        KLGatewayFocusCondition
Parent:         http://hl7.dk/fhir/core/StructureDefinition/dk-core-condition
Id:             kl-gateway-focus-condition
Title:          "FocusCondition"
Description:    "Conditions which may be used to express the problem of a citizen in Danish municipalities. Mostly used for cross sector use cases."

//Slicing code, declaring disciminator, and slicing type
// * code.coding ^slicing.discriminator.type = #value
// * code.coding ^slicing.discriminator.path = "system"
// * code.coding ^slicing.rules = #open
// * code.coding ^slicing.ordered = false   // can be omitted, since false is the default
// * code.coding ^slicing.description = "Slice based on the code.system value which allow both a FSIII/FFB condition code and a SNOMED CT code to represent a condition"  // optional - does not appear
// //Declaring the slices, and their cardinalities, to allow a KL-code and a SNOMED CT code
// * code.coding contains
//    ICD10codescodes 0..1

// * code.coding[ICD10codes].system = "urn:oid:1.2.208.176.2.4.12"

//Implementation based on dk-core
* code.coding.system = "urn:oid:1.2.208.176.2.4.12"
* code.coding[FSIIIConditionCode] 0..0
* code.coding[SCTConditionCode] 0..0
* code.coding[FFBConditionCode] 0..0
* code.coding[ICPC2code] 0..0

* extension[conditionLastAssertedDate] 0..0
* extension[notFollowedAnymore] 0..0
* extension[dueTo] 0..0

//Specifying datatype of abatement, subject, asserter and evidence
* subject only Reference(klgateway-care-citizen)


//Setting other attributes to 0..0
* identifier 0..0
* clinicalStatus 0..0
* verificationStatus 0..0
* category 0..0
* severity 0..0
* code.text 0..0
* code.coding.userSelected 0..0
* code.coding.version 0..0
* bodySite 0..0
* encounter 0..0
* onset[x] 0..0
* abatement[x] 0..0
* recordedDate 0..0
* recorder 0..0
* asserter 0..0
* note 0..0
* evidence 0..0
* stage 0..0

//Adding shorts, to make danish descriptions available

* code.coding ^short = "[DK] fokusTilstandskode"
* subject ^short = "[DK] fokusTilstandsubjekt"
