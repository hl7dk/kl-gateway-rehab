### Scope and usage
The  kl-gateway-140-focus-condition holds a diagnosiscode, as it is reported to the municipality in the request for rehabilitation from the hospital (GGOP) using SKS (ICD10). Be aware, that each 'whole meaning' should have its own instance of kl-gateway-140-focus-condition. A 'whole meaning' may be a single diagnosis code OR a diagnosis code with add-on-codes (tillægskoder) e.g. DK257+MN02BA01 means that a hospital patient has a chronic ulcer caused by the intake of acetylsalicylacid. They are a 'whole meaning' because the codes would loose their meaning if represented in two different focus-condition instanses. The code should be represented in Condition.code.

Condition.clinicalStatus should be populated with the value 'active' if the citizen has the condition, and 'inactive' if the citizen no longer has the condition. Condition.verificationStatus should be able to ditiguish between 'confirmed' and 'entered-in-error'. It is a good idea to always provide the verificationStatus. If not populated, the verificationStatus is assumed to be “confirmed”.

The citizen is referred in Condition.subject

### Conversions between Danish information model and FHIR-profile
Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|fokusTilstandskode|Udtrykker hvilken klasse tilstanden tilhører (diagnosekoden).|Condition.code.coding|
|fokusTilstandssubjekt|Den borger som har tilstanden|Condition.subject|
|tilstandsstatus|Klasse der udtrykker en status for om tilstanden er til stede eller ej.|Condition.clinicalStatus og Condition.verificationStatus|
