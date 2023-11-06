// Første indberetning
Instance: e87d5e68-e5f3-476f-988f-4efda86b0645
InstanceOf: klgateway-140-delivery-report
Description: "DeliveryReport-Ruddi-1"
Usage: #example
* type = #collection
* timestamp = 2022-05-23T19:25:12Z

* entry[+].fullUrl = "Patient/95ce3be6-dba6-48ab-b5d1-8a25929414dc"
* entry[=].resource = 95ce3be6-dba6-48ab-b5d1-8a25929414dc

* entry[+].fullUrl = "Organization/55a0e014-0e97-4c26-8ef2-29d528bfcc46"
* entry[=].resource = 55a0e014-0e97-4c26-8ef2-29d528bfcc46

* entry[+].fullUrl = "Condition/51d652a8-0ece-4d1d-8071-7baceb9701b2"
* entry[=].resource = 51d652a8-0ece-4d1d-8071-7baceb9701b2

* entry[+].fullUrl = "ServiceRequest/152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22"
* entry[=].resource = 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22

Instance: 95ce3be6-dba6-48ab-b5d1-8a25929414dc
InstanceOf: klgateway-140-citizen
Description: "Test personen Ruddi Test Berggren, fra MedCom test-cprnumre. Holbæk kommune er journalførende organisation."
Usage: #inline
* identifier.use = #official
* identifier.value = "1502779995"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* deceasedBoolean = false
* managingOrganization.identifier.use = #official
* managingOrganization.identifier.value =  "451000016003"
* managingOrganization.identifier.system = "urn:oid:1.2.208.176.1.1"

Instance: 55a0e014-0e97-4c26-8ef2-29d528bfcc46
InstanceOf: klgateway-140-organization
Title: "AfsenderAfRuddisGGOP"
Description: "Ortopædkirurgisk afdeling Holbæk sygehus, der er afsender af Ruddis GGOP"
Usage: #inline
* identifier.use = #official
* identifier.value = "227871000016001"
* identifier.system = "urn:oid:1.2.208.176.1.1"

Instance: 51d652a8-0ece-4d1d-8071-7baceb9701b2
InstanceOf: klgateway-140-focus-condition
Title: "RuddiAktionsdiagnoseGGOP"
Description: "Ruddis aktionsdiagnose fra GGOP, hvor man kan se, at han har haft en pertrokantær femurfraktur"
Usage: #example
* code.coding[SKS-D] = urn:oid:1.2.208.176.2.4.12#DS721 "Pertrokantær femurfraktur"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* subject = Reference(55a0e014-0e97-4c26-8ef2-29d528bfcc46)

Instance: 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22
InstanceOf: klgateway-140-servicerequest
Title: "RuddiGGOPInformation"
Description: "Information fra Ruddis GGOP, der er baggrunden for at igangsætte indsatsen i kommunen"
Usage: #example
* requester = Reference(55a0e014-0e97-4c26-8ef2-29d528bfcc46)
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/request-status#plan
* code.coding = $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592
* category[0].coding = Tempcodes#ffd81f78-352e-4589-a195-5350dd1df2a4 "almen"
* category[1].coding = Tempcodes#8b962281-2ab6-4b10-9c91-4bac592d6d49 "basal"
* extension[dischargeDate].valueDate = 2022-05-24
* reasonReference = Reference(51d652a8-0ece-4d1d-8071-7baceb9701b2)
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* authoredOn = 2022-05-23
* occurrencePeriod.start = 2022-05-28