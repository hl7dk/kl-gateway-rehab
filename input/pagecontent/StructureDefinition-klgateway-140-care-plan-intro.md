### Scope and usage
The CarePlan for §140 is used whenever a rehabilitation care pathway is planned for a citizen in Danish municipalities. Care pathway or plan is a way to describe when a number of planned interventions are delivered together with a common schedule.

The two types of plan in §140 are 'Opfølgningsforløb efter §140' and 'Interventionsforløb efter §140' and one of these two codes should be documented in CarePlan.category.

Both types may be delivered with different repetions and duration.
This is documented using:
* activity.detail.scheduledTiming.repeat.count, for the number of encounters planned as part of the care plan
* activity.detail.scheduledTiming.repeat.duration, for the avarage duration of each encounter
* activity.detail.scheduledTiming.repeat.durationUnit, which has the mandatory value "min" for minutes, because the duration is messured in minutes.

ScheduledTiming is mandatory for 'Interventionsforløb efter §140', but it is optional for 'Opfølgningsforløb efter §140'.

It is important to distiguish correctly between the dates and times stated in the model. CarePlan.period.start is when the CarePlan was authorized (bevillingstid). The planned end-date is CarePlan.period.end, unless the date has already occured and the status is 'completed', then it is the actual end-date. Notice that end-date is not mandatory to report. All dates may be repported with or without time of day.

CarePlan.status and CarePlan.intent are mandatory in the FHIR CarePlan resource. CarePlan.intent is always 'plan' in this implementation guide. CarePlan status should at least distiguish between 'unknown' and 'entered-in-error', but the actual status of the care plan may also be reported. Note that the meaning of 'active' is "ready to be acted upon", so it does not signify that the first activity has occured.

CarePlan.activity.detail.status is also mandatory, and all the statuses in the FHIR ValueSet may be used. It is recommended not to use 'entered-in-error' - if the CarePlan is entered-in-error use CarePlan.status. To get the needed data-quality, the detail-status should at least distinguish between 'unknown' and 'cancelled'. Although it is better to use the appropriate FHIR-statuses, 'unknown' is permitted from the time where the care plan occurs in the record until its completion. 'Cancelled' (or 'stopped') are mandatory, if an care plan is cancelled. It is mandatory to report cancelled care plans, so that the reason for the cancellation can inform the dataset. This is done using CarePlan.activity.detail.statusReason, and a set of codes that represents different reasons for the cancellation. The codes are as follows:

* 'Hændelse medfører ophør'
* 'Ikke yderligere behov (borger-vurderet)'
* 'Ikke yderligere behov (fagperson-vurderet)' 
* 'Aktivt fravalg'
    * 'Aktivt fravalg pga. anden sygdom'
    * 'Aktivt fravalg pga. økonomi ifm. transport'
    * 'Aktivt fravalg pga. logisik ifm. transport' 
    * 'Aktivt fravalg pga. anden træning'

It is premitted to use the code 'Aktivt fravalg' for reporting, but the more detailed codes, though not mandatory, provides for a more nuanced dataset.

CarePlan.subject references the citizen. CarePlan.activity.detail.performer is the organisation that carries out the care plan (leverandør).

The CarePlan.extension[basedOnServiceRequest] points to the ServiceRequest (GGOP) which was the starting point for the care plan. It may happen that an care plan has two ServiceRequests as a starting point. Imagine that a citizen has gotten a hip replacement, has been dicharges from the hospital and has started rehabilitation. Then the citizen falls and gets re-admitted to the hospital. At discharge, a new ServiceRequest is send, but because the damage was small, the municipality care plan preceeds as planned. In this case, change CarePlan.extension[basedOnServiceRequest] from the later, to the newer ServiceRequest. If the patient is admitted for a longer time, so that the care plan changes i.e. the citizen starts over in group based training, cancel the ealier care plan, and start a new one pertaining to the new ServiceRequest. If two different ServiceRequests results in two different care plans (e.g. hip replacement rehabilitation and shoulder rehabilitation), all serviceRequests and care plans exists in parallel, but should reference each other correctly (e.g shoulder GGOP to shoulder training and hip GGOP to mobility training).

Different reasons for changing a CarePlan may exist, and here we provide guidance for how it should be reported:
* Errors should be corrected by reporting the same CarePlan again with the entered-in-error status. And reporting the correct one with a new Id.
* If cancelled, set the CarePlan.activity.detail.status and CarePlan.activity.detail.statusreason and report the Careplan again with the same Id as used earlier.
* If the timing is changing, it is most likely because a status has shown a new or an extra need of the citizen. Report this in a new CarePlan with a new start-date, rather than correcting the timing in the existing plan. This goes for PlannedInterventions that references the CarePlan as well.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indsatsforløbKategori|Udtrykker hvilken kategori indsatsforløbet har.|CarePlan.category|
|indsatsforløbAntalGange|Antallet af gange der bevilliges i borgerens indsatsforløb|activity.detail.scheduledTiming.repeat.count|
|indsatsforløbLængdeAfGange|Længden på hver af gangene i indsatsforløbet|activity.detail.scheduledTiming.repeat.duration|
|indsatsforløbLængdeAfGangeEnhed|Enhed for længde, son altid skal sættes til minutter|activity.detail.scheduledTiming.repeat.durationUnit|
|indsatsforløbBevillingstid|Tidspunktet for hvornår indsatsforløbet er bevilget|CarePlan.period.start|
|indsatforløbAfslutningstid|Tidspunktet for hvornår indsatsforløbet er afsluttet, eller planlægges afsluttet|CarePlan.period.end|
|indsatsforløbsstatus|Indikerer om indsatsforløbet er klar til at blive handlet på, om dokumentationen repræsentere en fremtidig intention eller er historisk.|CarePlan.status|
|indsatsforløbhensigt|Indikerer niveauet af autorisation og hvor langt i planlægningen indsatsen er|CarePlan.intent|
|indsatsforløbsAktivitetsstatus|Indikerer om indsatsforløbet er igangsat, eller om den ikke er startet, er aflyst, eller er færdiggjort|CarePlan.activity.detail.status|
|indsatsforløbForklaringAfStatus|Forklaring af hvorfor et indsatsforløb er aflyst, fx fordi der ikke længere er behov|CarePlan.activity.detail.statusReason|
|indsatsforløbleverandør|Organisation, der har ansvaret for at udføre indsatsforløbet|CarePlan.activity.detail.performer|
|indsatsforløbsubjekt|Den borger som den indsatsforløbet retter sig mod|CarePlan.subject|
|indsatsforløbAnledning|Den anledning/GGOP som er grunden til at indsatsforløbet igangsættes|extension:basedOnServiceRequest|