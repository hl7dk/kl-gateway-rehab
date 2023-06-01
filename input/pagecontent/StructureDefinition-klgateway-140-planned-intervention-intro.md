### Scope and usage
The PlannedIntervention for §140 is used whenever a rehabilitation intervention is planned for a citizen in Danish municipalities.

CarePlan.activity.detail.code.coding holds the intervention code, which has to come from FSIII. Some interventions can be delivered in a group or individually. The code should be chosen accordingly.

It is important to distiguish correctly between the dates and times stated in the model. CarePlan.period.start is when the PlannedIntervention was authorized (bevillingstid). The planned end-date is CarePlan.period.end, unless the date has already occured and the status is 'completed', then it is the actual end-date. Notice that end-date is not madatory to report. All dates may be repported with or without time of day.

CarePlan.status and CarePlan.intent are mandatory in the FHIR CarePlan resource. CarePlan.intent is always 'plan' in this implementation guide. CarePlan status should be either 'unknown', 'entered-in-error', or the status of the intervention at the time of reporting. Note that the meaning of 'active' is "ready to be acted upon", so it does not signify that the first activity has occured.

CarePlan.activity.detail.status is also mandatory, and all the statuses in the FHIR ValueSet may be used, however 'unknown' is permitted from the time where the intervention occurs in the record until its completion. It is recommended not to use 'entered-in-error' - if the CarePlan is entered-in-error use CarePlan.status.
The codes detailing 'Aktivt fravalg' are not mandatory to report.

The CarePlan.extension[basedOnServiceRequest] points to the ServiceRequest (GGOP) which was the starting point for the intervention. It may happen that an intervention has two ServiceRequests as a starting point. Imagine that a citizen has gotten a hip replacement, has been dicharges from the hospital and has started rehabilitation. Then the citizen falls and gets re-admitted to the hospital. At discharge, a new ServiceRequest is send, but because the damage was small, the municipality intervention preceeds as planned. In this case, change CarePlan.activity.reference from the later, to the newer ServiceRequest. If the patient is admitted for a longer time, so that the intervention changes i.e. the citizen starts over in group based training, cancel the ealier intervention, and start a new one pertaining to the new ServiceRequest. If two different ServiceRequests results in two different interventions (e.g. hip replacement rehabilitation and shoulder rehabilitation), all serviceRequests and interventions exists in parallel, but should reference each other correctly (e.g shoulder GGOP to shoulder training and hip GGOP to mobility training).

CarePlan.subject references the citizen. CarePlan.activity.detail.performer is the organisation that carries out the intervention (leverandør).

CarePlan.activity.detail.reasonReference holds the link between conditions and interventions. It is optional to report.

CarePlan.basedOn referes to the care-pathway or plan, that this intervention is part of. It is mandatory to report for plannend interventions with a treatment focus. See which intervention codes appply in the invariant klgateway-140-intervention-1. It is optional for Interventions of type 'Opfølgning'.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indsatsskode|Udtrykker hvilken klasse indsatsen tilhører.|CarePlan.activity.detail.code.coding|
|indsatsbevillingstid|Tidspunktet for hvornår indsatsen er bevilget|CarePlan.period.start|
|indsatsafslutningstid|Tidspunktet for hvornår indsatsen er afsluttet, eller planlægges afsluttet|CarePlan.period.end|
|indsatsstatus|Indikerer om indsatsplanen er klar til at blive handlet på, om dokumentationen repræsentere en fremtidig intention eller er historisk.|CarePlan.status|
|indsatshensigt|Indikerer niveauet af autorisation og hvor langt i planlægningen indsatsen er|CarePlan.intent|
|indsatsAktivitetsstatus|Indikerer om indsatsen er igangsat, eller om den ikke er startet, er aflyst, eller er færdiggjort|CarePlan.activity.detail.status|
|indsatsAnledning|Den henvendelse/henvisning, der er anledning til, at denne indsats igangsættes|extension:basedOnServiceRequest|
|indsatsleverandør|Organisation, der har ansvaret for at udføre den planlagte indsats|CarePlan.activity.detail.performer|
|indsatssubjekt|Den borger som den planlagte indsats retter sig mod|CarePlan.subject|
|indsatsbegrundelse|Tilstand som indsatsen rettes mod|CarePlan.activity.detail.reasonReference|
|indsatsDelAfPlan|Det indsatsforløb, som denne indsats er en del af|CarePlan.basedOn|