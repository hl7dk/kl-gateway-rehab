# KLGatewayRehabilitation

Feel free to modify this index page with your own awesome content!# KLGatewayRehabilitation

Feel free to modify this index page with your own awesome content!### Scope and usage
klgateway-140-citizen is used to identify the subject of a rehabilitation reporting by the personal id number (CPR-nummer) and the managing organization that acts as the custodian of the reported data. The personal id number must be an official Danish CPR-nummer without hyphen, and the SOR code must be an official SOR code.

The managing organization is given by its SOR code. For most municipalities this will be the code for the municipality, but if a municipality delivers services covered by FSIII in different departments using different record systems (thus having mulitple custodians) the SOR codes of the department that acts as custodian is used.


### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter, der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|cpr-nummer|Officielt cpr-nummer på borgeren|patient.identifier.value|
|Journalførende organisation|Organisation som ejer journalen med oplysninger|Patient.managingOrganization.identifier.value|
### Scope and usage
A klgateway-140-condition is reported as long as a condition is true and active, for a living citizen that recieves §140 rehabilitation interventions in Danish municipalities.

Conditions are always defined by Condition.code, which originates from FSIII. Only conditions related to Training SUL §140 (FSIII) are allowed.

Condition.recordedDate is the date where the condition was first recorded, NOT the date where the problem was first known to be present.

Condition.clinicalStatus should be populated with the value "active" if the citizen has the condition, and inactive if the citizen no longer has the condition. Condition.verificationStatus should be used as specified in the FHIR standard. In most use cases, Condition.verificationStatus should be "confirmed". clinicalStatus is mandatory, and it is a good idea to always provide the verificationStatus. If not populated, the verificationStatus is assumed to be “confirmed”.

Condition.category is, in this implementation, used as a way to determine whether the condition is in focus in a professional context. In focus means that this condition is solely or partially the reason why interventions are performed in the professional context. If a condition is "in focus" Condition.category is populated with the value "problem-list-item". An empty Condition.category means that the focus have not been considered (if it is the first version of a condition).

Ending a condition have two meanings. The first is that the citizen no longer has the condition e.g. a mobility problem is no longer there. In this case, Condition.clinicalStatus=inactive. The second meaning of "ended" is that the condition falls out of focus in a professional context e.g. if the citizen moves, or another professional group takes over the care for the citizen. In this case, the Condition.category looses its "problem-list-item" flag. The idea is to state that from a citizen viewpoint the condition has not changed, but in this professional context it is no longer in focus.

To sum up, A condition should be reported to Kl-gateway in the first report after it first occurs in the record. The condition should be reported again if it changes. In this implementation, it changes under two circumstances:
*  The citizen does not have the problem any more. In this case, set Condition.clinicalStatus to inactive and report this condition to KL-Gateway in the next report.
* The citizen still has the problem, but the rehabilitation unit isn't doing anything more about it because the case is closed. In this case, remove the category with the problem-list-item flag from the model, and report this condition to KL-Gateway in the next report.

Condition.subject holds a reference to the citizen.

### Conversions between Danish information model and FHIR-profile
Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|tilstandskode|Udtrykker hvilken klasse tilstanden tilhører.|Condition.code.coding|
|tilstandsoprettelsestid|Tidsangivelse for hvornår tilstanden først blev oprettet i journalen|Condition.recordedDate|
|tilstandsstatus|Klasse der udtrykker en status for om tilstanden er til stede eller ej.|Condition.clinicalStatus og Condition.verificationStatus|
|tilstandsfokus|Klasse der udtrykker, om en faggruppe har tilstanden i fokus for sine indsatser|Condition.category.coding|
|tilstandssubjekt|Den borger som har tilstanden|Condition.subject|

## Scope and usage
This model is used to represent the reporting of rehabilitation deliverd by the municipalities according to §140 in the health act.

The report is a FHIR Bundle that allows different ressources to be grouped and handled as a unit. The ressources that are grouped in this bundle is one, and only one klgateway-140-citizen, together with the content that have changed since the last reporting. The content can be of all the types that are present as profiles in this implementation guide.

The citizen is included in the report in Bundle.entry[citizen]. The entry should include a Bundle.entry.link, which have two fixed values. The citizen resssource should be included in the bundle, together with its url. 

The content is included in the report in Bundle.entry[content]. Each entry includes a Bundle.entry.link, with two fixed values. Each entry also includes a ressource and its url.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indberetningsrapportBorger|Indberetningsrapportens borger|Bundle.entry[citizen]|
|indberetningsrappprtIndhold|Hver af indberetningsrapportens indholds-ressourcer|entry[content]|### Scope and usage
klgateway-140-encounter is used whenever a citizen meets the rehabilitation staff in a Danish municipality context.

In the context of the rehabilitation repporting, all Encounter.status values may be used, but not all are mandatory. The mandatory part is:
* To report all carried out encounters. For encounters carried out, use Encounter.status 'finished'.
* To report, if the first encounter in a care pathway has been cancelled. This helps show that the municipalities adhere to the treatment guarantee (behandlingsgaranti), even though an actual encounter has not been carried out yet. Use Encounter.status 'cancelled'.
* To report errors using status 'entered-in-error'

Encounter.class is mandatory in FHIR. In Danish municipalities, the values are used as follows.
* Visits in citizens homes have the code 'HH' home health, the code is also used for services that are not strictly health related e.g. help with cleaning. This code is also used, even if the activities stretch outside the citizens residence e.g. a physiotherapist that want to see a citizen walk outside, or a social worker helping with shpping activities.
* Sessions where the citizens visit municipality facilities e.g. for training have the code "AMB" ambulatory.
* For telehealth/telecare encounters, where the patient is contacted by telephone, by teleconference or e-mail, the code is 'VR' virtual.

All encounters should be related to the ServiceRequest (request for rehabilitation according to §140 in the health act), so that it may be tracked which request resulted in what activities. Use Encounter.basedOn. An encounter may only be related to one ServiceRequest. If a second (updated) request is recieved to replace an existing one, while a citizen already recieves rehabilitation, Encounter.basedOn should point to the new service request.

The time of the encounter is documented in Encounter.period.start, and is mandatory. The endtime is not mandatory.

Encounter.subject relates to the citizen that the encounter is about.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|borgerkontaktstatus|Klasse der indikerer om kontakten er igangværende, eller om dokumentationen repræsentere en fremtidig intention eller er historisk|Encounter.status|
|borgerkontaktklasse|Klasse, der udtrykker en generel kategori for kontakten, som rækker ud over den kommunale kontekst.|Encounter.class|
|borgerkontaktstart|Kontaktens start, eller planlagte start|Encounter.period.start|
|borgerkontaktslut|Kontaktens sluttidspunkt, eller planlagte sluttidspunkt|Encounter.period.end|
|borgerkontaktsubjekt|Den borger kontakten vedrører|Encounter.subject|
|borgerkontaktanledning|Den henvisning/henvendelse, der er grunden til at denne kontakt udføres|Encounter.basedOn|### Scope and usage
The  kl-gateway-140-focus-condition holds a diagnosiscode, as it is reported to the municipality in the request for rehabilitation from the hospital (GGOP) using SKS (ICD10). Be aware, that each 'whole meaning' should have its own instance of kl-gateway-140-focus-condition. A 'whole meaning' may be a single diagnosis code OR a diagnosis code with add-on-codes (tillægskoder) e.g. DK257+MN02BA01 means that a hospital patient has a chronic ulcer caused by the intake of acetylsalicylacid. They are a 'whole meaning' because the codes would loose their meaning if represented in two different focus-condition instanses. The code should be represented in Condition.code.

The citizen is referred in Condition.subject

### Conversions between Danish information model and FHIR-profile
Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|fokusTilstandskode|Udtrykker hvilken klasse tilstanden tilhører (diagnosekoden).|Condition.code.coding|
|fokusTilstandssubjekt|Den borger som har tilstanden|Condition.subject|
### Scope and usage
The organization inherits its basic structure from dk-core. When it is used in KL gateway, only identifiers are reported. The identifier can be either a SOR-id or an FK-org code.
Be aware that in the context of KL gateway, the managing organization (the municipality keeping the record) is represented in the [citizen profile]( StructureDefinition-klgateway-140-citizen.html), NOT using this organization profile. The organization profile is used to represent other organizations such as service providers and hospitals sending rehabilitation plans(da: GGOP).


### Conversions between Danish information model and FHIR-profile
Organization svarer til en type af Aktør i den fælleskommunale rammearkitektur.
nedenstående tabel definerer kort den enkelte attribut på dansk og specificerer, hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet. 

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|organisationsid|Id på organisationen der enten er en SOR kode eller et FK-Org id|Organization.identifier|
### Scope and usage
The PlannedIntervention for §140 is used whenever a rehabilitation intervention is planned for a citizen in Danish municipalities.

CarePlan.activity.detail.code.coding holds the intervention code, which has to come from FSIII. Some interventions can be delivered in a group or individually. The code should be chosen accordingly.

Some intervetions are delivered with different repetions and durations (Funktionstræning, Fysisk træning, ADL-træning, Psykomotorisk træning, Vejledning og undervisning, Kognitiv træning, Manuel behandling). This is documented using:
* activity.detail.scheduledTiming.repeat.count, for the number of encounters planned as part of the intervention
* activity.detail.scheduledTiming.repeat.duration, for the avarage duration of each encounter
* activity.detail.scheduledTiming.repeat.durationUnit, which has the mandatory value "min" for minutes, because the duration is messured in minutes. 

It is important to distiguish correctly between the dates and times stated in the model. CarePlan.period.start is when the PlannedIntervention was authorized (bevillingstid). The planned end-date is CarePlan.period.end, unless the date has already occured and the status is 'completed', then it is the actual end-date. Notice that end-date is not madatory to report.
When a planned intervention is carried out, the resulting encounters are linked to the planned intervention through the CarePlan.activity.outcomeReference. Sometimes you might be interested in the time, where the the first activity was performed in connection to the plannedIntervention, this might be tracked through the earliest enconter referred in CarePlan.activity.outcomeReference.

CarePlan.status and CarePlan.intent are mandatory in the FHIR CarePlan resource. CarePlan.intent is always 'plan' in this implementation guide. CarePlan status should be either 'unknown', 'entered-in-error', or the status of the intervention at the time of reporting. Note that the meaning of 'active' is "ready to be acted upon", so it does not signify that the first activity has occured.

CarePlan.activity.detail.status is also mandatory, and all the statuses in the FHIR ValueSet may be used. It is recommended not to use 'entered-in-error' - if the CarePlan is entered-in-error use CarePlan.status. To get the needed data-quality, the detail-status should at least distinguish between 'unknown' and 'cancelled'. Although it is better to use the appropriate FHIR-statuses, 'unknown' is permitted from the time where the intervention occurs in the record until its completion. 'Cancelled' (or 'stopped') are mandatory, if an intervention is cancelled. It is mandatory to report cancelled interventions, so that the reason for the cancellation can inform the dataset. This is done using CarePlan.activity.detail.statusReason, and a set of codes that represents different reasons for the cancellation. The codes are as follows:

* 'Ikke yderligere behov (borger-vurderet)'
* 'Ikke yderligere behov (fagperson-vurderet)' 
* 'Aktivt fravalg'
    * 'Aktivt fravalg pga. anden sygdom'
    * 'Aktivt fravalg pga. økonomi ifm. transport'
    * 'Aktivt fravalg pga. logisik ifm. transport' 
    * 'Aktivt fravalg pga. anden træning'

The codes detailing 'Aktivt fravalg' are not mandatory to report.

The CarePlan.activity.reference points to the ServiceRequest (GGOP) which was the starting point for the intervention. It may happen that an intervention has two ServiceRequests as a starting point. Imagine that a citizen has gotten a hip replacement, has been dicharges from the hospital and has started rehabilitation. Then the citizen falls and gets re-admitted to the hospital. At discharge, a new ServiceRequest is send, but because the damage was small, the municipality intervention preceeds as planned. In this case, change CarePlan.activity.reference from the later, to the newer ServiceRequest. If the patient is admitted for a longer time, so that the intervention changes i.e. the citizen starts over in group based training, cancel the ealier intervention, and start a new one pertaining to the new ServiceRequest.

CarePlan.subject references the citizen. CarePlan.activity.detail.performer is the organisation that carries out the intervention (leverandør).

CarePlan.activity.detail.reasonReference holds the link between conditions and interventions. It is optional to report.

### Conversions between Danish information model and FHIR-profile

Nedenstående tabel oversætter mellem de attributter der er defineret i den fælleskommunale informationsmodel (FKI), definerer kort den enkelte attribut på dansk og specificere hvilke af FHIR-profilens atributter der skal bruges til specifikation af indholdet

{:class="grid"}
|   FKI-attribut      | Definition        | FHIR  |
| ------------- |-------------| -----|
|indsatsskode|Udtrykker hvilken klasse indsatsen tilhører.|CarePlan.activity.detail.code.coding|
|indsatsAktivitetAntalTræningsgange|Antallet af træningsgange der bevilliges i borgerens rehabiliteringsindsats|activity.detail.scheduledTiming.repeat.count|
|indsatsAktivitetLængdeAfTræningsgange|Længden på hver af træningsgangene|activity.detail.scheduledTiming.repeat.duration|
|indsatsAktivitetLængdeAfTræningsgangeEnhed|Enhed for længde, skal altid sættes til minutter|activity.detail.scheduledTiming.repeat.durationUnit|
|indsatsbevillingstid|Tidspunktet for hvornår indsatsen er bevilget|CarePlan.period.start|
|indsatsafslutningstid|Tidspunktet for hvornår indsatsen er afsluttet, eller planlægges afsluttet|CarePlan.period.end|
|indsatsgennemførtAktivitet|Kontakter, der er gennemført som del af den planlagte indsats|CarePlan.activity.outcomeReference|
|indsatsstatus|Indikerer om indsatsplanen er klar til at blive handlet på, om dokumentationen repræsentere en fremtidig intention eller er historisk.|CarePlan.status|
|indsatshensigt|Indikerer niveauet af autorisation og hvor langt i planlægningen indsatsen er|CarePlan.intent|
|indsatsAktivitetsstatus|Indikerer om indsatsen er igangsat, eller om den ikke er startet, er aflyst, eller er færdiggjort|CarePlan.activity.detail.status|
|indsatsAktivitetForklaringAfStatus|Forklaring af hvorfor en indsats er aflyst, fx fordi der ikke længere er behov|CarePlan.activity.detail.statusReason|
|indsatsAnledning|Den henvendelse/henvisning, der er anledning til, at denne indsats igangsættes|CarePlan.activity.reference|
|indsatsleverandør|Organisation, der har ansvaret for at udføre den planlagte indsats|CarePlan.activity.detail.performer|
|indsatssubjekt|Den borger som den planlagte indsats retter sig mod|CarePlan.subject|
|indsatsbegrundelse|Tilstand som indsatsen rettes mod|CarePlan.activity.detail.reasonReference|### Scope and usage
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