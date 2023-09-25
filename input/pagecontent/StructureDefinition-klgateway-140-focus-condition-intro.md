### Scope and usage
The  kl-gateway-140-focus-condition holds a diagnosiscode, as it is reported to the municipality in the request for rehabilitation from the hospital (GGOP) using SKS (ICD10). Be aware, that each code (either primary or secondary) as defined by MedCom should have its own instance of kl-gateway-140-focus-condition.

The mapping the the GGOP is specified as follows. If ICD10_aktionsdiagnosekodetype or ICD10_bidiagnosekodetype is of type 'ICD10Kode' or 'SKSdiagnosekode' then Condition.code.coding.code = ICD10_aktionsdiagnosekode/ICD10_bidiagnosekode and Condition.code.coding.display = ICD10_aktionsdiagnose/ICD10_bidiagnose.

It is usually recommended in FHIR that ad-ons to a code (tillægskoder) are reported together as 'whole meanings' because the codes would loose their meaning if represented in two different focus-condition instanses. However, MedComs GGOP does not allow the distinction between seconday diagnosis and add-on codes. As a result each code gets its own instance.

It is not very common yet that SKS codes are send to the municipality, as a result a text can be used to represent the condition as well. If the GGOP attribute Diagnose_fritekst is populated repport it as Condition send it as a separate Condition instance 

Condition.clinicalStatus should be populated with the value 'active' if the citizen has the condition, and 'inactive' if the citizen no longer has the condition. Condition.verificationStatus should be able to ditiguish between 'confirmed' and 'entered-in-error'. It is a good idea to always provide the verificationStatus. If not populated, the verificationStatus is assumed to be “confirmed”.

The citizen is referred in Condition.subject

### Conversions between Danish information model and FHIR-profile
Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|fokusTilstandskode|Udtrykker hvilken klasse tilstanden tilhører (diagnosekoden).|Condition.code.coding|
|fokusTilstandKodetekst|Udtrykker tilstanden som en tekst|Condition.code.text|
|fokusTilstandssubjekt|Den borger som har tilstanden|Condition.subject|
|tilstandsstatus|Klasse der udtrykker en status for om tilstanden er til stede eller ej.|Condition.clinicalStatus og Condition.verificationStatus|
