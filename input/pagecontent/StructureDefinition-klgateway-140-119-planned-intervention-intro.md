# Scope and usage
The PlannedIntervention for §140 and §119 is used whenever a rehabilitation or prevention intervention is planned for a citizen in Danish municipalities.

CarePlan.activity.detail.code.coding holds the intervention code, which has to come from FSIII. The intervention can be delivered in a group or individually, which is documented using CarePlan.activity.detail.extension:interventiontype. For certain types of interventions , the intervention can be delivered individually or group based (Funktionstræning, Fysisk træning, ADL-træning, Psykomotorisk træning, Vejledning og undervisning, Kognitiv træning). This is documented using CarePlan.activity.detail.extension:interventiontype.

Some intervetions can also be delivered with different repetions and durations (Funktionstræning, Fysisk træning, ADL-træning, Psykomotorisk træning, Vejledning og undervisning, Kognitiv træning, Manuel behandling). This is documented using activity.detail.scheduledTiming.repeat.count, activity.detail.scheduledTiming.repeat and activity.detail.scheduledTiming.repeat.durationUnit.duration.

It is important to distiguish correctly between the dates and times stated in the model. CarePlan.period.start is when the PlannedIntervention was authorized (bevillingstid). The planned end-date is CarePlan.period.end, unless the date has already occured and the status is 'completed', then it is the actual end-date. Notice that end-date is not madatory to report.
When a planned intervention is carried out, the resulting encounters are linked to the planned intervention through the CarePlan.activity.outcomeReference. Sometimes you might be interested in the time where the the first activities were performed in connection to the plannedIntervention, this might be tracked through the earliest enconter referred to in CarePlan.activity.outcomeReference.

CarePlan.status and CarePlan.intent are mandatory in the FHIR CarePlan resource. CarePlan.intent is always 'plan' in this implementation guide. CarePlan status should be either 'unknown', 'entered-in-error', or the status of the intervention at the time of reporting. Note that the meaning of 'active' is "ready to be acted upon", so it does not signify that the first activities have occured. CarePlan.activity.detail.status is also mandatory, and all the statuses in the FHIR ValueSet may be used. It is recommended not to use 'entered-in-error' - if the CarePlan is entered-in-error use CarePlan.status. To get the needed data-quality, the detail-status should at least distinguish between 'unknown' and 'cancelled'. 'Unknown' may be used from the time where the intervention occurs in the recourd until its completion. 'Cancelled' (or 'stopped') are mandatory, if an intervention is cancelled. It is mandatory to track cancelled interventions, so that the reason for the cancellation can inform the dataset. This is done using CarePlan.activity.detail.statusReason, and a set of codes that represents different reasons for the cancellation. 

For §140 the CarePlan.activity.reference points to the ServiceRequest (GGOP) which was the starting point for the intervention. It may happen that an intervention has two ServiceRequests as a starting point. Imagine that a citizen has gotten a hip replacement, has been dicharges from the hospital and has started rehabilitation. Then the citizen falls and gets re-admitted to the hospital. At discharge, a new ServiceRequest is send, but because the damage was small, the municipality intervention preceeds as planned. In this case, change CarePlan.activity.reference from the later, to the newer ServiceRequest. If the patient is admitted for a longer time, so that the intervention changes i.e. the citizen starts over in group based training, cancel the ealier intervention, and start a new one pertaining to the new ServiceRequest.

CarePlan.activity.detail.performer is the organisation that carries out the intervention (leverandør).

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indsatsskode|Udtrykker hvilken klasse indsatsen tilhører.|CarePlan.activity.detail.code.coding|
|indsatstype|Hvorvidt indsatsen leveres individuelt eller gruppebaseret|CarePlan.activity.detail.extension:interventiontype|
|indsatsbevillingstid|Tidspunktet for hvornår indsatsen er bevilget|CarePlan.period.start|
|indsatsafslutningstid|Tidspunktet for hvornår indsatsen er afsluttet, eller planlægges afsluttet|CarePlan.period.end|
|indsatsstatus|Indikerer om indsatsplanen er klar til at blive handlet på, om dokumentationen repræsentere en fremtidig intention eller er historisk.|CarePlan.status|
|indsatshensigt|Indikerer niveauet af autorisation og hvor langt i planlægningen indsatsen er|CarePlan.intent|
|indsatssubjekt|Den borger som den planlagte indsats retter sig mod|CarePlan.subject|
|indsatsAnledning|Den henvendelse/henvisning, der er anledning til, at denne indsats igangsættes|CarePlan.activity.reference|
|indsatsleverandør|Organisation, der har ansvaret for at udføre den planlagte indsats|CarePlan.activity.detail.performer|
<!-- |indsatsbegrundelse|Tilstand som indsatsen rettes mod|CarePlan.activity.detail.reasonReference| -->
|indsatsgennemførtAktivitet|Kontakter, der er gennemført som del af den planlagte indsats|CarePlan.activity.outcomeReference|
|indsatsAktivitetsstatus|Indikerer om indsatsen er igangsat, eller om den ikke er startet, er aflyst, eller er færdiggjort|CarePlan.activity.detail.status|
|indsatsAktivitetForklaringAfStatus|Forklaring af hvorfor en indsats er aflyst, fx fordi der ikke længere er behov|CarePlan.activity.detail.statusReason|
|indsatsAktivitetAntalTræningsgange|Antallet af træningsgange der bevilliges i borgerens rehabiliteringsindsats|activity.detail.scheduledTiming.repeat.count|
|indsatsAktivitetLængdeAfTræningsgange|Længden på hver af træningsgangene|activity.detail.scheduledTiming.repeat.duration|
|indsatsAktivitetLængdeAfTræningsgangeEnhed|Enhed for længde, skal altid sættes til minutter|activity.detail.scheduledTiming.repeat.durationUnit|

