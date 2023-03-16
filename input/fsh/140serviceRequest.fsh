Profile:        KLGateway140ServiceRequest
Parent:         ServiceRequest
Id:             klgateway-140-servicerequest
Title:          "ServiceRequest"
Description:    "Referal used to represent information about the training-referal (GGOP) from a hospital to a Danish municipalities"
//Requirement pertaining to §140
* requester 1..1
* requester only Reference(klgateway-care-organization) //organization used for people from the outside, KLCommonPractitioner for internal requests
* requester ^type.aggregation = #bundled
* code.coding from ServiceTypes140
* subject only Reference(klgateway-care-citizen)
* subject ^type.aggregation = #bundled
* authoredOn 1..1
* reasonReference only Reference(kl-gateway-focus-condition) //May be there (140)

//Setting 0..0 cardinalities
* identifier 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* replaces 0..0
* requisition 0..0
* category 0..0
* priority 0..0
* doNotPerform 0..0
* orderDetail 0..0
* quantity[x] 0..0
* encounter 0..0
* occurrence[x] 0..0
* asNeeded[x] 0..0
* performerType 0..0
* performer 0..0
* locationCode 0..0
* locationReference 0..0
* reasonCode 0..0
* insurance 0..0
* supportingInfo 0..0
* specimen 0..0
* bodySite 0..0
* note 0..0
* patientInstruction 0..0
* relevantHistory 0..0
* orderDetail 0..0

//Adding shorts for Danish descriptions
* requester ^short = "[DK] anledningAnsvarlig"
* status ^short = "[DK] anledningsStatus"
* intent ^short = "[DK] anledningsHensigt"
* code.coding ^short = "[DK] anledningsIndsats"
* reasonReference ^short = "[DK] anledningsbegrundelse"
* subject ^short = "[DK] anledningsSubjekt"
* authoredOn ^short = "[DK] anledningstid"