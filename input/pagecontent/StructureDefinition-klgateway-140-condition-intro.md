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

