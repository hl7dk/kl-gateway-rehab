Profile: KLGateway140Organization
Parent: http://hl7.dk/fhir/core/StructureDefinition/dk-core-organization
Id: klgateway-140-organization
Title: "KLGateway140Organization"
Description: "Organization as expressed in KLGateway for rehabilitation."
* identifier 1..1
* identifier[EAN-ID] 0..0
* identifier[KOMBIT-ORG-ID] 0..1
  * ^short = "[DK] FK-ORG-id"
* identifier[SOR-ID] 0..1
  * ^short = "[DK] SOR-id"
* identifier[Ydernummer] 0..0
* identifier[CVR-ID] 0..0
* identifier[Kommunekode] 0..0
* identifier[Regionskode] 0..0
* active 0..0
* type 0..0
* alias 0..0
* telecom 0..0
* address 0..0
* partOf 0..0
* endpoint 0..0
* contact 0..0

* identifier ^short = "[DK] organisationsid"