Profile: KLGateway140DeliveryReport
Parent: Bundle
Id: klgateway-140-delivery-report
Title: "KLGateway140DeliveryReport"
Description: "Delivery report to deliver data for each citizen."
* identifier ..0
* type = #collection
* timestamp 1..1
* total ..0
* link 0..1
* entry.link 1..1
* entry.resource 1..1
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "link.url"
* entry ^slicing.rules = #closed
* entry contains citizen 1..1 and content 1..*
* entry[citizen].link.url = "http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-citizen"
* entry[citizen].link.relation = "citizen"
* entry[citizen].resource only
    klgateway-140-citizen
* entry[content].link.url = "http://fhir.kl.dk/rehab/content"
* entry[content].link.relation = "content"
* entry[content].resource only
    Condition or
    klgateway-140-encounter or
    klgateway-140-organization or
    klgateway-140-planned-intervention or
    klgateway-140-servicerequest
* entry.resource ^short = "Citizen and content constrained to known profiles"
* entry.search ..0
* entry.request ..0
* entry.response ..0
* signature ..0
* obeys gateway-140-report-1


Invariant: gateway-140-report-1
Description: "All condition resources shall conform to either klgateway-140-condition profile, or klgateway-140--focus-condition profile"
Severity: #error
Expression: "entry.ofType(Condition).all(
    resource.conformsTo('http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-condition')
 or resource.conformsTo('http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-focus-condition'))"

Instance: RuddiIndberetningsrapport
InstanceOf: KLGateway140DeliveryReport
Description: "Indberetning for Ruddi"
Usage: #example
* type = #collection
* timestamp = 2020-08-14T00:00:00Z
* entry[+].link.url = "http://fhir.kl.dk/rehab/StructureDefinition/klgateway-140-citizen"
* entry[=].link.relation = "citizen"
* entry[=].fullUrl = "Patient/RuddiTestBerggren"
* entry[=].resource = RuddiTestBerggren

* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Organization/AfsenderAfRuddisGGOP"
* entry[=].resource = AfsenderAfRuddisGGOP

* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Organization/UdfoererAfRuddisRehab"
* entry[=].resource = UdfoererAfRuddisRehab

* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Condition/RuddiAktionsdiagnoseGGOP"
* entry[=].resource = RuddiAktionsdiagnoseGGOP

* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "ServiceRequest/RuddiGGOPInformation"
* entry[=].resource = RuddiGGOPInformation

* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "CarePlan/RuddiTerapeutfagligUndersoegelse"
* entry[=].resource = RuddiTerapeutfagligUndersoegelse


* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Encounter/RuddiKontaktUndersoegelseAnnuleret"
* entry[=].resource = RuddiKontaktUndersoegelseAnnuleret


* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Encounter/RuddiKontaktUndersoegelse"
* entry[=].resource = RuddiKontaktUndersoegelse


* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "CarePlan/RuddiTraening"
* entry[=].resource = RuddiTraening


* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Encounter/RuddiKontakt1Traening"
* entry[=].resource = RuddiKontakt1Traening

* entry[+].link.url = "http://fhir.kl.dk/rehab/content"
* entry[=].link.relation = "content"
* entry[=].fullUrl = "Condition/RuddiTilstand"
* entry[=].resource = RuddiTilstand

Instance: RuddiIndberetningsrapport2
InstanceOf: Bundle
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

* entry[+].fullUrl = "CarePlan/RuddiTraening"
* entry[=].resource = RuddiTraening

* entry[+].fullUrl = "Encounter/RuddiKontakt1Traening"
* entry[=].resource = RuddiKontakt1Traening

* entry[+].fullUrl = "Condition/RuddiTilstand"
* entry[=].resource = RuddiTilstand