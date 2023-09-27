Profile: KLGateway140PlannedIntervention
Parent: CarePlan
Id: klgateway-140-planned-intervention
Title: "KLGateway140PlannedIntervention"
Description: "Planned interventions for §140 rehabilitation in Danish Municipalities."

//Requirements
* status ^definition = "Shall be either unknown, entered-in-error, or the status of the intervention at the time of reporting"
* intent = #plan
* activity.detail.status ^definition = "Shall be either unknown, or cancelled, or the activity status of the intervention at the time of reporting"
* basedOn ..1
* basedOn only Reference(klgateway-140-care-plan)
* basedOn ^type.aggregation = #bundled
* subject only Reference(klgateway-140-citizen) //borger
* subject ^type.aggregation = #bundled
* period 1..1
* period.start 1..1 //Bevillingsdato
//period.end er mulig men ikke obligatorisk
* activity 1..1
* activity.outcomeReference only Reference(klgateway-140-encounter) //kontakter
* activity.outcomeReference ^type.aggregation = #bundled
* activity.reference 0..0
* activity.detail 1.. 
* activity.detail.code 1..1 //Indsatskoder niveau 2 og 3
* activity.detail.code.coding ^slicing.discriminator.type = #value
* activity.detail.code.coding ^slicing.discriminator.path = "system"
* activity.detail.code.coding ^slicing.rules = #closed
* activity.detail.code.coding contains level2 0..1 and level3 0..1 MS
* activity.detail.code.coding[level2].system = $FSIII
* activity.detail.code.coding[level2] from KLTrainingInterventionsFSIII
//kl-term update delete two lines above
* activity.detail.code.coding[level3].system = "http://gateway.kl.dk/1.0/CodeSystem/LocallyDefinedInterventions"
* activity.detail.code.coding[level3].code 1..1
* activity.detail.code.coding[level3].display 1..1
* activity.detail.code.coding[level3] ^definition = "Shall contain locally defined code if it is a locally defined level 3 intervention"
* activity.detail.extension contains DeliveryType named deliveryType 1..1
* activity.detail.extension[deliveryType].valueCodeableConcept.coding from DeliveryTypes140 (required)
* activity.detail.reasonCode ..0
* activity.detail.scheduled[x] 0..0
* activity.detail.performer 0..1 //indsatsudfører
* activity.detail.performer only Reference(klgateway-140-organization)
* activity.detail.performer ^type.aggregation = #bundled
* extension contains
   BasedOnServiceRequestExtension named basedOnServiceRequest 0..1

* extension[basedOnServiceRequest].valueReference ^type.aggregation = #bundled

// relation mellem tilstand og indsats
* activity.detail.reasonReference only Reference(klgateway-140-condition)
* activity.detail.reasonReference MS
* activity.detail.reasonReference ^definition = "Reason for this intervention. Must contain all conditions known to be addressed by this intervention"
* activity.detail.reasonReference ^type.aggregation = #bundled

//0..0 kardinaliteter
* identifier ..0
* instantiatesCanonical ..0
* instantiatesUri ..0
* replaces ..0
* partOf ..0
* category ..0
* title ..0
* description ..0
* encounter ..0
* created ..0
* author ..0
* contributor ..0
* careTeam 0..0
* addresses ..0
* supportingInfo ..0
* goal ..0
* activity.outcomeCodeableConcept ..0
* activity.progress ..0
* activity.detail.kind ..0
* activity.detail.instantiatesCanonical ..0
* activity.detail.instantiatesUri ..0
* activity.detail.reasonReference 0..*
* activity.detail.goal ..0
* activity.detail.doNotPerform ..0
// * activity.detail.scheduledString ..0
// * activity.detail.scheduledPeriod ..0
// * activity.detail.scheduledTiming.code 0..0
// * activity.detail.scheduledTiming.event 0..0
// * activity.detail.scheduledTiming.repeat.boundsPeriod.end 0..0
// * activity.detail.scheduledTiming.repeat.frequency 0..0
// * activity.detail.scheduledTiming.repeat.durationMax 0..0
// * activity.detail.scheduledTiming.repeat.boundsDuration 0..0
// * activity.detail.scheduledTiming.repeat.boundsRange 0..0
// * activity.detail.scheduledTiming.repeat.countMax 0..0
// * activity.detail.scheduledTiming.repeat.dayOfWeek 0..0
* activity.detail.statusReason 0..0
* activity.detail.location ..0
* activity.detail.product[x] ..0
* activity.detail.dailyAmount ..0
* activity.detail.quantity ..0
* activity.detail.description ..0
* activity.outcomeReference 0..0
* note ..0

//Danish descriptions
* activity.detail.code.coding ^short = "[DK] indsatsskode"
* period.start ^short = "[DK] indsatsbevillingstid"
* period.end ^short = "[DK] indsatsafslutningstid"
* status ^short = "[DK] indsatsstatus"
* intent ^short = "[DK] indsatshensigt"
* subject ^short = "[DK] indsatssubjekt"
* extension[basedOnServiceRequest] ^short = "[DK] indsatsAnledning"
* activity.detail.reasonReference ^short = "[DK] indsatsbegrundelse"
* activity.detail.status ^short = "[DK] indsatsAktivitetsstatus"
* activity.detail.performer ^short = "[DK] indsatsleverandør"
* basedOn ^short = "[DK] indsatsDelAfPlan"
* activity.detail.extension[deliveryType] ^short = "[DK] indsatsLeveringstype"

* obeys klgateway-140-intervention-1
* obeys klgateway-140-intervention-2


Invariant: klgateway-140-intervention-1
Description: "has a reference to careplan if the intervention is a certain type of training"
Severity: #error
Expression: "activity.detail.code.coding.code = '7f825e3e-1a5c-4249-bf41-9f7171fb6b8a'
    or activity.detail.code.coding.code = '2abe20c7-c0b4-41c1-b397-52acf36499ef'
    or activity.detail.code.coding.code = '58293f63-00d7-4730-8dbc-c784d40f9e23'
    or activity.detail.code.coding.code = '2c661159-1bb3-4af2-bdf1-f3a9927a99e2'
    or activity.detail.code.coding.code = '8d714c98-f23a-4722-8a2f-85c162fe4840'
    or activity.detail.code.coding.code = '66fb32c9-ecc3-484b-be49-f20094be237c'
    or activity.detail.code.coding.code = 'f8ac963c-6ec5-4ec5-bd90-a22fea4e2d16' implies basedOn.exists()"

Invariant: klgateway-140-intervention-2
Description: "does not have a reference to careplan if the intervention is a certain type of intervention"
Severity: #error
Expression: "activity.detail.code.coding.code = '1130ad70-6553-490d-87f8-5e8941687a0c'
    or activity.detail.code.coding.code = 'ba3e17bd-d4aa-4848-acad-25adc8285c19' implies basedOn.empty()"


Instance: RuddiTerapeutfagligUndersoegelse
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTerapeutfagligUndersøgelse"
Description: "Ruddi's terapeutfaglige undersøgelse"
Usage: #example
* activity.detail.code.coding[level2] = $FSIII#1130ad70-6553-490d-87f8-5e8941687a0c
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "Individuel Indsats"
* period.start = 2022-05-23
* period.end = 2022-06-02
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(RuddiTestBerggren)
* extension[basedOnServiceRequest].valueReference = Reference(RuddiGGOPInformation) 
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#completed
* activity.detail.performer = Reference(UdfoererAfRuddisRehab)

Instance: RuddiTraening
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTræning"
Description: "Ruddi's træningsindsats"
Usage: #example
* activity.detail.code.coding[level2] = $FSIII#2abe20c7-c0b4-41c1-b397-52acf36499ef "Fysisk træning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-05-30
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(RuddiTestBerggren)
* extension[basedOnServiceRequest].valueReference = Reference(RuddiGGOPInformation)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(RuddiTraeningsforloeb)

Instance: RuddiFunctionalTraening
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiFundktionsTræning"
Description: "Ruddi's funktions-træningsindsats"
Usage: #example
* activity.detail.code.coding[level2] = $FSIII#58293f63-00d7-4730-8dbc-c784d40f9e23 "Funktionstræning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-05-30
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(RuddiTestBerggren)
* extension[basedOnServiceRequest].valueReference = Reference(RuddiGGOPInformation)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(RuddiTraeningsforloeb)