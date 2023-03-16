Profile: KLGateway140Encounter
Parent: Encounter
Id: klgateway-140-encounter
Title: "KLGateway140Encounter"
Description: "Encounter for first planned visits and all executed activities in a §140 care pathway"
* identifier ..0
* statusHistory ..0
* class.version ..0
* class.display ..0
* class.userSelected ..0
* classHistory ..0
//* type from ExtendedEncounterTypes (required)
* type.coding 0..0
* type.coding.version ..0
* type.coding.display 0..0
* type.coding.userSelected ..0
* type.text ..0
* serviceType ..0
* priority ..0
* subject 1..1
* subject only Reference(klgateway-care-citizen)
* subject ^type.aggregation = #bundled
* episodeOfCare ..0
* basedOn only Reference(klgateway-140-119-servicerequest)
* basedOn ^type.aggregation = #bundled
* participant ..0
* appointment ..0
* period 1..1
* period.start 1..1
* period.end ..1
* length ..0
* reasonCode ..0
* reasonReference ..0
* diagnosis ..0
* account ..0
* hospitalization ..0
* location ..0
* serviceProvider ..0
* partOf ..0

//Danish descriptions
* status ^short = "[DK] kontaktstatus"
* class ^short = "[DK] kontaktklasse"
* period.start ^short = "[DK] kontaktstart"
* period.end ^short = "[DK] kontaktslut"
* subject ^short = "[DK] kontaktsubjekt"
* basedOn ^short = "[DK] kontaktanledning"