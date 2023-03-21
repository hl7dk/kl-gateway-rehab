Profile:        KLGateway140ServiceRequest
Parent:         ServiceRequest
Id:             klgateway-140-servicerequest
Title:          "KLGateway140ServiceRequest"
Description:    "Referal used to represent information about the training-referal (GGOP) from a hospital to a Danish municipalities"
//Requirement pertaining to §140
* requester 1..1
* requester only Reference(klgateway-140-organization) //organization used for people from the outside, KLCommonPractitioner for internal requests
* requester ^type.aggregation = #bundled
* code.coding from ServiceTypes140
* subject only Reference(klgateway-140-citizen)
* subject ^type.aggregation = #bundled
* authoredOn 1..1
* reasonReference only Reference(klgateway-140-focus-condition) //May be there (140)
* reasonReference ^type.aggregation = #bundled
* replaces 0..1
* replaces only Reference(klgateway-140-servicerequest)
* replaces ^type.aggregation = #bundled
* intent = http://hl7.org/fhir/request-status#plan

//Setting 0..0 cardinalities
* identifier 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
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
* replaces ^short = "[DK] anledningErstatter"

Instance: RuddiGGOPInformation
InstanceOf: klgateway-140-servicerequest
Title: "RuddiGGOPInformation"
Description: "Information fra Ruddis GGOP, der er baggrunden for at igangsætte indsatsen i kommunen"
Usage: #inline
* requester = Reference(AfsenderAfRuddisGGOP)
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/request-status#plan
* code.coding = $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592
* reasonReference = Reference(RuddiAktionsdiagnoseGGOP)
* subject = Reference(RuddiTestBerggren)
* authoredOn = 2022-05-23