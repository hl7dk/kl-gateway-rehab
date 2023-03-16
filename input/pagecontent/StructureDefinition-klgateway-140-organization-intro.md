### Scope and usage
The organization inherits its basic structure from dk-core. When it is used in KL gateway, only identifiers are reported.  The identifier can be either a SOR-id or an FK-org code.
Be aware that in the context of KL gateway, the managing organization (the municipality keeping the record) is represented in the [citizen profile]( StructureDefinition-klgateway-care-citizen.html), NOT using this organization profile. The organization profile is used to represent other organizations such as service providers and hospitals sending rehabilitation plans(da: GGOP).


### Conversions between Danish information model and FHIR-profile
Organization svarer til en type af Aktør i den fælleskommunale rammearkitektur.
nedenstående tabel definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|Organisations-id|Id på organisationen der enten er en SOR kode eller et FK-Org id|Organization.identifier|
