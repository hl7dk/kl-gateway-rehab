### Scope and usage
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
|borgerkontaktanledning|Den henvisning/henvendelse, der er grunden til at denne kontakt udføres|Encounter.basedOn|