Profile: KLGateway140DeliveryReport
Parent: Bundle
Id: klgateway-140-delivery-report
Title: "KLGateway140DeliveryReport"
Description: "Deliver report to deliver data for each citizen."
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
    klgateway-140-condition or
    klgateway-140-encounter or
    klgateway-140-focus-condition or
    klgateway-140-organization or
    klgateway-140-planned-intervention or
    klgateway-140-servicerequest
* entry.resource ^short = "Citizen and content constrained to known profiles"
* entry.search ..0
* entry.request ..0
* entry.response ..0
* signature ..0

