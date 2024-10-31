Profile:        KLGateway140ServiceRequest
Parent:         ServiceRequest
Id:             klgateway-140-servicerequest
Title:          "KLGateway140ServiceRequest"
Description:    "Referal used to represent information about the training-referal (GGOP) from a hospital to a Danish municipalities"
//Requirement pertaining to §140
* requester 1..1
* requester only Reference(klgateway-140-organization) //organization used for people from the outside, KLCommonPractitioner for internal requests
* requester ^type.aggregation = #bundled
* code 1..1
* code.coding from ServiceTypes140
* category 1..2
* category.coding from ServiceRequestTypes140
* subject only Reference(klgateway-140-citizen)
* subject ^type.aggregation = #bundled
* authoredOn 1..1
* reasonReference only Reference(klgateway-140-focus-condition) //May be there (140)
* reasonReference ^type.aggregation = #bundled
* replaces 0..1
* replaces only Reference(klgateway-140-servicerequest)
* replaces ^type.aggregation = #bundled
* intent = http://hl7.org/fhir/request-status#plan
* extension contains PreconditionDate named dischargeDate 1..1 MS and
                    $ExtRequestStatusReason named statusReason 0..1 MS
* extension[statusReason].valueCodeableConcept.coding from ServiceRequestStatusReasons140 (required)
* occurrence[x] 0..1
* occurrenceDateTime 0..0
* occurrenceTiming 0..0
* occurrencePeriod 0..1
* occurrencePeriod.start 0..1 MS
* occurrencePeriod.end 0..0

//Setting 0..0 cardinalities
* orderDetail 0..0
* identifier 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* requisition 0..0
* priority 0..0
* doNotPerform 0..0
* quantity[x] 0..0
* encounter 0..0
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

//Adding shorts for Danish descriptions
* requester ^short = "[DK] anledningAnsvarlig"
* status ^short = "[DK] anledningsStatus"
* intent ^short = "[DK] anledningsHensigt"
* code.coding ^short = "[DK] anledningsIndsats"
* reasonReference ^short = "[DK] anledningsbegrundelse"
* subject ^short = "[DK] anledningsSubjekt"
* authoredOn ^short = "[DK] anledningstid"
* replaces ^short = "[DK] anledningErstatter"
* category ^short = "[DK] anledningTypeAfGGOP"
* extension[dischargeDate] ^short = "[DK] anledningUdskrivningsdato"
* extension[statusReason] ^short = "[DK] anledningÅrsagManglendeAktivitet"
* occurrencePeriod.start ^short = "[DK] anledningTilbudtFørsteKontakt"

* obeys gateway-140-service-request-1

Instance: RuddiGGOPInformation
InstanceOf: klgateway-140-servicerequest
Title: "RuddiGGOPInformation"
Description: "Information fra Ruddis GGOP, der er baggrunden for at igangsætte indsatsen i kommunen"
Usage: #example
* requester = Reference(AfsenderAfRuddisGGOP)
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/request-status#plan
* code.coding = $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592
* category[0].coding = $KLCommonCodes#ffd81f78-352e-4589-a195-5350dd1df2a4 "almen"
* category[1].coding = $KLCommonCodes#8b962281-2ab6-4b10-9c91-4bac592d6d49 "basal"
* extension[dischargeDate].valueDate = 2022-05-24
* reasonReference = Reference(RuddiAktionsdiagnoseGGOP)
* subject = Reference(RuddiTestBerggren)
* authoredOn = 2022-05-23
* occurrencePeriod.start = 2022-05-28

Invariant: gateway-140-service-request-1
Description: "one of the order detail codes, should always be almen, specialiseret eller rehabilitering"
Severity: #error
Expression: "category.select(coding.code = 'ffd81f78-352e-4589-a195-5350dd1df2a4' or
             coding.code = '0c8e2bfc-1350-45d1-90da-c07e2645d073' or
             coding.code = '83c89857-8fb8-4163-97b1-eb1a56345c29').anyTrue()"