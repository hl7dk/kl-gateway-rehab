### Scope and usage
klgateway-140-citizen is used to identify the subject of a rehabilitation reporting by the personal id number (CPR-nummer) and the managing organization that acts as the custodian of the reported data. The personal id number must be an official Danish CPR-nummer without hyphen, and the SOR code must be an official SOR code.

The managing organization is given by its SOR code. For most municipalities this will be the code for the municipality, but if a municipality delivers services covered by FSIII in different departments using different record systems (thus having mulitple custodians) the SOR codes of the department that acts as custodian is used.


### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter, der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|borgerCprNummer|Officielt cpr-nummer på borgeren|Patient.identifier.value|
|borgerErDød|boolesk værdi der er sand hvis borgeren er død|Patient.identifier.value|
|borgerJournalførendeOrganisation|Organisation som ejer journalen med oplysninger|Patient.managingOrganization.identifier.value|

* identifier ^short = "[DK] borgerCprNummer"
* deceasedBoolean ^short = "[DK] borgerErDød"
* managingOrganization ^short = "[DK] borgerJournalførendeOrganisation"
