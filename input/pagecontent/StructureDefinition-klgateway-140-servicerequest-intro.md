## Scope and usage
This model is used to represent when a municipality recieves a request for rehabilitation according to §140 in the health act (DK: §140 træning ifølge sundhedsloven).

The ServiceRequest, should have the sending organisation as the requester i.e the hospital that sends the request, and intent should always be "plan". The status attribute should be used according to the FHIR-guidance.

reasonCode.text (anledningsårsag) is the text-based description of why an entity have contacted the municipality and asked for help. Sometimes, this text already describes what exactly should be delivered. Sometimes, it describes some concern that the municipality should look further into. As such, the attribute relates directly to the text option for "FSIII Henvendelses-/henvisningsårsag".

SeviceRequest.reasonReference (anledningsbegrundelse) is a FocusCondition that describe the citizen's problem, which is the background for the ServiceRequest. The reasonReference describes this through a reference to FocusCondition, which again uses hospital diagnosis codes to describe the problem/diagnosis, that led the hospital to request §140rehabilitation. 

ServiceRequest.code.coding is used to state, what kind of interventions the requester wants for the citizen. In this use case, the value is always 7fc66c15-0cb3-4c89-9e18-f3a01e6a6592 "Træning", which just states that it is a request for rehabilitation/traning. 

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|anledningAnsvarlig|Den som har ansvar for henvendelsen/henvisningen|ServiceRequest.requester|
|anledningsstatus|Klasse der udtrykker status for henvendelsen|ServiceRequest.status|
|anledningsHensigt|Klasse der udtrykker hensigten med henvendelsen|ServiceRequest.intent|
|anledningsIndsats|Klasse der udtrykker, hvilken type kommunal indsats/ydelse der anmodes om.|ServiceRequest.code.coding|
|anledningsSubjekt|Den borger som henvisningen/henvendelsen vedrører|ServiceRequest.subject|
|anledningstid|Det tidspunkt hvor henvisning/henvendelsen er forfattet af den ansvarlige|ServiceRequest.authoredOn|
|anledningsbegrundelse|Den borgertilstand, der ligger til grund for henvendelsen/henvisningen. |SeviceRequest.reasonReference|
