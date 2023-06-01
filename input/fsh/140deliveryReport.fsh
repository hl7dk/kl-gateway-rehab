Profile: KLGateway140DeliveryReport
Parent: Bundle
Id: klgateway-140-delivery-report
Title: "KLGateway140DeliveryReport"
Description: "Delivery report to deliver data for each citizen."
* identifier ..0
* type = #collection
* timestamp 1..1
* total ..0
* link 0..0
* entry.link 0..0
* entry.resource 1..1
* entry.resource only
    Condition or
    CarePlan or
    klgateway-140-encounter or
    klgateway-140-organization or
    klgateway-140-citizen or
    klgateway-140-servicerequest
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains citizen 1..1
* entry[citizen].resource only
    klgateway-140-citizen
* entry.resource ^short = "Citizen and content constrained to known profiles"
* entry.search ..0
* entry.request ..0
* entry.response ..0
* signature ..0
* entry[citizen] ^short = "[DK] indberetningsrapportBorger"
* entry ^short = "[DK] indberetningsrapportIndhold"
* obeys gateway-140-report-1
* obeys gateway-140-report-2


Invariant: gateway-140-report-1
Description: "All condition resources shall conform to either klgateway-140-condition profile, or klgateway-119--focus-condition profile"
Severity: #error
Expression: "entry.ofType(Condition).all(
    resource.conformsTo('http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-condition')
 or resource.conformsTo('http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-focus-condition'))"

Invariant: gateway-140-report-2
Description: "All condition resources shall conform to either klgateway-140-condition profile, or klgateway-119--focus-condition profile"
Severity: #error
Expression: "entry.ofType(CarePlan).all(
    resource.conformsTo('http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-care-plan')
 or resource.conformsTo('http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-planned-intervention'))"

Instance: RuddiIndberetningsrapport
InstanceOf: klgateway-140-delivery-report
Description: "Indberetning for Ruddi"
Usage: #example
* type = #collection
* timestamp = 2020-08-14T00:00:00Z

* entry[+].fullUrl = "Patient/RuddiTestBerggren"
* entry[=].resource = RuddiTestBerggren

* entry[+].fullUrl = "Organization/AfsenderAfRuddisGGOP"
* entry[=].resource = AfsenderAfRuddisGGOP

* entry[+].fullUrl = "Organization/UdfoererAfRuddisRehab"
* entry[=].resource = UdfoererAfRuddisRehab

* entry[+].fullUrl = "Condition/RuddiAktionsdiagnoseGGOP"
* entry[=].resource = RuddiAktionsdiagnoseGGOP

* entry[+].fullUrl = "ServiceRequest/RuddiGGOPInformation"
* entry[=].resource = RuddiGGOPInformation

* entry[+].fullUrl = "CarePlan/RuddiTerapeutfagligUndersoegelse"
* entry[=].resource = RuddiTerapeutfagligUndersoegelse

* entry[+].fullUrl = "Encounter/RuddiKontaktUndersoegelseAnnuleret"
* entry[=].resource = RuddiKontaktUndersoegelseAnnuleret

* entry[+].fullUrl = "Encounter/RuddiKontaktUndersoegelse"
* entry[=].resource = RuddiKontaktUndersoegelse

* entry[+].fullUrl = "CarePlan/RuddiTraeningsforloeb"
* entry[=].resource = RuddiTraeningsforloeb

* entry[+].fullUrl = "CarePlan/RuddiTraening"
* entry[=].resource = RuddiTraening

* entry[+].fullUrl = "Encounter/RuddiKontakt1Traening"
* entry[=].resource = RuddiKontakt1Traening

* entry[+].fullUrl = "Condition/RuddiTilstand"
* entry[=].resource = RuddiTilstand