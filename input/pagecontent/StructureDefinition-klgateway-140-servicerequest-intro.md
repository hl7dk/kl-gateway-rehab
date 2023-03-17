## Scope and usage
This model is used to represent when a municipality recieves a request for rehabilitation according to §140 in the health act (DK: §140 træning ifølge sundhedsloven).

The ServiceRequest, should have the sending organisation as the requester i.e the hospital that sends the request (GGOP), and intent should always be "plan". The status attribute should be used according to the FHIR-guidance. The requester is mandatory for §140. The citizen is referred in ServiceRequest.subject.

ServiceRequest.authoredOn holds the time, where the GGOP was recieved in the municipality, if this is available. Else, the time that the GGOP was send from the hosptal may be used.

ServiceRequest.status and ServiceRequest.intent are mandatory. ServiceRequest.intent always have the value 'plan'. ServiceRequest.status uses the required FHIR ValueSet as appropriate.

It may happen that a new GGOP is recieved, while another one is already active for the citizen. In this case, choose the appropriate use case:
* If the new GGOP calls for the same interventions (with just minor modifications). Then the new GGOP replaces the old one. This is documented by reporting both the old and the new ServiceRequest. The new serviceRequest referes the old one using the attribute serviceRequest.replaces. The old ServiceRequest sets ServiceRequest.status to 'revoked'  Example: A citizen has gotten a hip replacement, has been dicharges from the hospital and has started rehabilitation. Then the citizen falls and gets re-admitted to the hospital. At discharge, a new ServiceRequest is send, but because the damage was small, the municipality intervention preceeds as planned.
* It could also happen that the new GGOP means that the citizen interventions should be modified. E.g. the therapist start over with the examination (terapeutfaglig undersøgelse) and/or plan another intervention. In this case, revoke the old ServiceRequest, and use the new one as a reference in all interventions and encounters. Example: If the patient is admitted for a longer time, so that the intervention changes i.e. a new examination is made and the citizen starts over in group based training.
* In the last case, both GGOPS are relevant at the same time, and each calls for different interventions. In this case, both ServiceRequests remains active, and each have different interventions and encounters associated with it. Example: A citizen has gotten a hip replacement, has been dicharges from the hospital and has started rehabilitation. The citizen is then examined for shoulder and neck pain in the hospital, and a new GGOP is send to the municipality, to also help with neck/shoulder interventions.

SeviceRequest.reasonReference is only used, if a code or codes were recieved in a MedCom message as a referal diagnosis (i GGOP). The reasonReference describes this through a reference to FocusCondition, which again uses SKS diagnosis codes to describe the problem/diagnosis, that led the hospital to request §140 rehabilitation. 

ServiceRequest.code.coding is used to state, what kind of interventions the requester wants for the citizen. The value is always 'Træning'.

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
|anledningsbegrundelse|Den borgertilstand, der ligger til grund for henvendelsen/henvisningen.|SeviceRequest.reasonReference|
|anledningErstatter|Den tidligere anledning som denne erstatter|SeviceRequest.replaces|