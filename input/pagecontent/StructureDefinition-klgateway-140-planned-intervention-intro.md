# Scope and usage
<!-- nedenstående tekst kmmer fra FKI, skal revideres -->
The KLCommonCareSocialPlannedIntervention may be instatiated whenever an intervention is planned for a citizen in Danish municipalities. One or more planned interventions (ydelser/indsatser) may relate to a CommonCareSocialCarePlan, which are more overall in scope, and is mainly used for FFB sociale indsatser. CommonCareSocialPlannedIntervention is only used for planning ahead, when documentation is related to treatment or care, which is already carried out, use CommonCareSocialCompletedIntervention instead.

When a planned intervention is carried out, the resulting encounters may be linked to the planned intervention through the CarePlan.activity.outcomeReference. Planned interventions are only used for interventions that requires a plan, which is autorized by the municipality. Incomming "orders" e.g. referals from general practitioners for the acute nursing teams, are handled using CommonCareSocialServiceRequest, CommonCareSocialEncounter and CommonCareSocialCompletedIntervention.

CarePlan.activity.detail.code.coding holds the intervention code, which may come from FSIII or FFB.

CarePlan.activity.detail.description is a description of the intervention that should be carried out. It is important to support for FSIII, where it is almost always relevant. It is not used in FFB.

It is important to distiguish correctly between the dates and times stated in the model. CarePlan.created is when the PlannedIntervention was first created, also is it only has draft status at the time. CarePlan.period.start is when the PlannedIntervention was authorized (bevillingstid). The planned end-date is CarePlan.period.end, unless the date has already occured and the status is "completed", then it is the actual end-date.
Sometimes you might be interested in the time where the the first activities were performed in connection to the plannedIntervention, this might be tracked through the earliest enconter referred to in CarePlan.activity.outcomeReference.

CarePlan.activity.outcomeReference generally holds all information about known encounters, where PlannedInterventions have been acted upon. 

CarePlan.status and CarePlan.intent are mandatory in the FHIR CarePlan resource. It is important that the intent is set to "order", when the intervention have been approved by municipality authorities (når bevillingen er sket). The status should, as a minimum distinguish between draft, active, revoked and completed plans. Note that the meaning of active is "ready to be acted upon", so it does not signify that the first activities have occured. CarePlan.activity.detail.status is also mandatory, and has the values not-started, scheduled, in-progress, on-hold, completed, cancelled, stopped, unknown, entered-in-error. The detail-status should at least distinguish between not-started, in-progress and stopped, but all the statuses are relevant in a municipality context. In-progress means that the first activity has occured.

The CarePlan.author, is the organisation with is responsible for the autorisation (myndighed), whereas CarePlan.activity.detail.performer is the organisation that carries out the intervention (leverandør). They might be the same.

CarePlan:extension.FollowUpEncounter makes it possible to explicitely state when follow up on the intervention should occur. This attribute is never used for FFB and is not mandatory for FSIII.

CarePlan.basedOn makes it possible to link any number of PlannedIntervention to a KLCommonCareSocialCarePlan. This is what makes it possible in a FFB context to link interventions (ydelser) to a CarePlan (social indsats).

CarePlan.activity.detail.reasonReference holds the link between conditions and interventions which are mandatory is FSIII. This is not used for FFB. 

CarePlan.activity.detail.goal holds the connection between an intervention and its goals. It is used for intervention-goals, and target meassures (målemetoder) in FSIII.

CarePlan:extension.relevantHistory makes it possible to track earlierssignificant versions of the PlannedIntervention.

CarePlan:extension.municipalityCaseNumber is a relation to the municipality case (Sag). The officialCaseIdentifier uses an official http-adress and uuid to relate to a municipality case (Rammearkitektur: Sag.ID). The municipalitySpecificCaseIdentifier uses a municipality specific ID as a value, and a relates to the organization that owns this caseIdentifier(Rammearkitektur Sag.Sagsnummer og Sag.ejer Sagsaktør).

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indsatsskode|Udtrykker hvilken klasse indsatsen tilhører.|CarePlan.activity.detail.code.coding|
|handlingsanvisning|Beskrivelse, der knytter sig til en ydelse, som skal udføres|CarePlan.activity.detail.description|
|indsatsbevillingstid|Tidspunktet for hvornår indsatsen er bevilget|CarePlan.period.start|
|indsatsafslutningstid|Tidspunktet for hvornår indsatsen er afsluttet, eller planlægges afsluttet|CarePlan.period.end|
|indsatsstatus|Indikerer om indsatsplanen er klar til at blive handlet på, om dokumentationen repræsentere en fremtidig intention eller er historisk.|CarePlan.status|
|indsatshensigt|Indikerer niveauet af autorisation og hvor langt i planlægningen indsatsen er|CarePlan.intent|
|indsatssubjekt|Den borger som den planlagte indsats retter sig mod|CarePlan.subject|
<!-- Tjek lige hvad der skal gøres, hvis der kommer to GGOPer, der giver anledning til samme indsats. Det bliver et problem fordi nedenstående har 0..1 kardinalitet -->
|indsatsAnledning|Den henvendelse/henvisning, der er anledning til, at denne indsats igangsættes|CarePlan.activity.reference|
|indsatsleverandør|Organisation, der har ansvaret for at udføre den planlagte indsats|CarePlan.activity.detail.performer|
<!-- |indsatsbegrundelse|Tilstand som indsatsen rettes mod|CarePlan.activity.detail.reasonReference| -->
|indsatsgennemførtAktivitet|Kontakter, der er gennemført som del af den planlagte indsats|CarePlan.activity.outcomeReference|
|indsatsAktivitetsstatus|Indikerer om indsatsen er igangsat, eller om den ikke er startet, er aflyst, eller er færdiggjort|CarePlan.activity.detail.status|
|indsatsAktivitetForklaringAfStatus|Forklaring af hvorfor en indsats er aflyst, fx fordi der ikke længere er behov|CarePlan.activity.detail.statusReason|
|indsatsAktivitetAntalTræningsgange|Antallet af træningsgange der bevilliges i borgerens rehabiliteringsindsats|activity.detail.scheduledTiming.repeat.count|
|indsatsAktivitetLængdeAfTræningsgange|Længden på hver af træningsgangene|activity.detail.scheduledTiming.repeat.duration|
|indsatsAktivitetLængdeAfTræningsgangeEnhed|Enhed for længde, skal altid sættes til minutter|activity.detail.scheduledTiming.repeat.durationUnit|
|interventionstype|Hvorvidt indsatsen leveres individuelt eller gruppebaseret|CarePlan.activity.detail.extension:interventiontype|

