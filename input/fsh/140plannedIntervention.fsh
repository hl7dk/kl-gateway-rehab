Profile: KLGateway140PlannedIntervention
Parent: CarePlan
Id: klgateway-140-planned-intervention
Title: "KLGateway140PlannedIntervention"
Description: "Planned interventions for §140 rehabilitation in Danish Municipalities."

//Requirements
* status ^definition = "Shall be either unknown, entered-in-error, or the status of the intervention at the time of reporting"
* intent = #plan
* activity.detail.status ^definition = "Shall be either unknown, or cancelled, or the activity status of the intervention at the time of reporting"
* activity.detail.statusReason from CancellationTypes //hvilken type, når interventionen stopper, for at lave en ny, fordi der er sendt en ny GGOP

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
* activity.detail.code.coding contains level2 0..1 and level2temp 0..1 and level3 0..1 MS
* activity.detail.code.coding[level2].system = $FSIII
* activity.detail.code.coding[level2] from KLInterventionCodes140
* activity.detail.code.coding[level2temp].system = Canonical(Tempcodes)
* activity.detail.code.coding[level2temp] from KLInterventionCodes140temp
* activity.detail.code.coding[level3].system = "http://gateway.kl.dk/1.0/CodeSystem/LocallyDefinedInterventions"
* activity.detail.code.coding[level3].code 1..1
* activity.detail.code.coding[level3].display 1..1
* activity.detail.code.coding[level3] ^definition = "Shall contain locally defined code if it is a locally defined level 3 intervention"
* activity.detail.reasonCode ..0
* activity.detail.scheduled[x] ..1 //gør det muligt at lægge gentagelser på
//* activity.detail.scheduledTiming.repeat.boundsPeriod.start 1..1
* activity.detail.scheduledTiming.repeat.count 1..1
* activity.detail.scheduledTiming.repeat.duration 1..1
* activity.detail.scheduledTiming.repeat.durationUnit 1..1
* activity.detail.scheduledTiming.repeat.durationUnit = http://unitsofmeasure.org#min
* activity.detail.performer 1..1 //indsatsudfører
* activity.detail.performer only Reference(klgateway-140-organization)
* activity.detail.performer ^type.aggregation = #bundled
* extension contains
   BasedOnServiceRequestExtension named basedOnServiceRequest 1..1

//* extension[basedOnServiceRequest].valueReference only Reference(klgateway-140-servicerequest) //GGOP'en
* extension[basedOnServiceRequest].valueReference ^type.aggregation = #bundled

// udkommenteret relation mellem tilstand og indsats
//* activity.detail.reasonReference only Reference(klgateway-140-condition)
//* activity.detail.reasonReference MS
//* activity.detail.reasonReference ^definition = "Reason for this intervention. Must contain all conditions known to be addressed by this intervention"
//* activity.detail.reasonReference ^type.aggregation = #bundled

//0..0 kardinaliteter
* identifier ..0
* instantiatesCanonical ..0
* instantiatesUri ..0
* basedOn ..0
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
* activity.detail.reasonReference 0..0
* activity.detail.goal ..0
* activity.detail.doNotPerform ..0
* activity.detail.scheduledString ..0
* activity.detail.scheduledPeriod ..0
* activity.detail.scheduledTiming.code 0..0
* activity.detail.scheduledTiming.event 0..0
* activity.detail.scheduledTiming.repeat.boundsPeriod.end 0..0
* activity.detail.scheduledTiming.repeat.frequency 0..0
* activity.detail.scheduledTiming.repeat.durationMax 0..0
* activity.detail.scheduledTiming.repeat.boundsDuration 0..0
* activity.detail.scheduledTiming.repeat.boundsRange 0..0
* activity.detail.scheduledTiming.repeat.countMax 0..0
* activity.detail.scheduledTiming.repeat.dayOfWeek 0..0
* activity.detail.location ..0
* activity.detail.product[x] ..0
* activity.detail.dailyAmount ..0
* activity.detail.quantity ..0
* activity.detail.description ..0
* note ..0

//Danish descriptions
* activity.detail.code.coding ^short = "[DK] indsatsskode"
* period.start ^short = "[DK] indsatsbevillingstid"
* period.end ^short = "[DK] indsatsafslutningstid"
* status ^short = "[DK] indsatsstatus"
* intent ^short = "[DK] indsatshensigt"
* subject ^short = "[DK] indsatssubjekt"
* activity.reference ^short = "[DK] indsatsAnledning"
//* activity.detail.reasonReference ^short = "[DK] indsatsbegrundelse"
* activity.outcomeReference ^short = "[DK] indsatsgennemførtAktivitet"
* activity.detail.status ^short = "[DK] indsatsAktivitetsstatus"
* activity.detail.statusReason ^short = "[DK] indsatsAktivitetForklaringAfStatus"
//* activity.detail.scheduledTiming.repeat.boundsPeriod.start ^short = "[DK] indsatsAktivitetPlanlagtOpstartsdato"
* activity.detail.scheduledTiming.repeat.count ^short = "[DK] indsatsAktivitetAntalTræningsgange"
* activity.detail.scheduledTiming.repeat.duration ^short = "[DK] indsatsAktivitetLængdeAfTræningsgange"
* activity.detail.scheduledTiming.repeat.durationUnit ^short = "[DK] indsatsAktivitetLængdeAfTræningsgangeEnhed"
* activity.detail.performer ^short = "[DK] indsatsleverandør"

// * obeys klgateway-140-intervention-1
// * obeys klgateway-140-intervention-2


// Invariant: klgateway-140-intervention-1
// Description: "status reason is mandatory if status is cancelled or stopped. Otherwise it is prohibited"
// Severity: #error
// Expression: "activity.detail.all(statusReason.exists() = (%status = 'cancelled' or %status = 'stopped'))"

// Invariant: klgateway-140-intervention-2
// Description: "scheduled timing is mandatory if the intervention is certain types of training. Otherwise it is prohibited"
// Severity: #error
// Expression: "activity.detail.all(scheduledTiming.exists() = (
//        %code.coding.code = 'f8ac963c-6ec5-4ec5-bd90-a22fea4e2d16'
//     or %code.coding.code = '029cb8af-08d5-4b8f-a911-7dfcb7c27483'
//     or %code.coding.code = 'aeb3d2b2-a551-4c3a-86e2-d165c1aaf350'
//     or %code.coding.code = '8728bce0-90c7-40c8-8c2f-f5c266dad02d'
//     or %code.coding.code = 'fb26c466-14c9-49a1-b69b-a6339f3890e4'
//     or %code.coding.code = 'c6192bb0-266f-43de-976d-e78335c5be0b'
//     or %code.coding.code = '5002d3be-ee05-4ff7-9fd4-a0d815bd6cbd'
//     or %code.coding.code = '6f1107a4-25d3-4d9a-bf35-bd1cf472d183'
//     or %code.coding.code = '7d877253-e385-405c-8822-7fc3d2e7f3b0'
//     or %code.coding.code = 'e5802281-a895-4a3f-868f-c50f1759cc00'
//     or %code.coding.code = '8d9eb012-0f2e-4e3f-8ac9-8f3d87cfdc3b'
//     or %code.coding.code = '4dbd9b85-8b89-45de-bf6f-9509aa122089'
//     or %code.coding.code = '0a995193-b6ab-413b-8692-3456992807d6'))"

//make fhir path that makes cancallation type mandatory if status is cancelled or stopped.
//Gør scheduled timing mandatory hvis indsatsen er bestemte typer træning, og ellers ikke tilladt. 

Extension: BasedOnServiceRequestExtension
Title:     "basedOnServiceRequestExtension"
Description: "Extension for pointing to the servicerequest, that started an intervention"
* value[x] 1..1
* value[x] only Reference(klgateway-140-servicerequest)


Instance: RuddiTerapeutfagligUndersoegelse
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTerapeutfagligUndersøgelse"
Description: "Ruddi's terapeutfaglige undersøgelse"
Usage: #example
* activity.detail.code.coding[level2] = $FSIII#1130ad70-6553-490d-87f8-5e8941687a0c
* period.start = 2022-05-23
* period.end = 2022-06-02
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(RuddiTestBerggren)
* extension[basedOnServiceRequest].valueReference = Reference(RuddiGGOPInformation) 
* activity.outcomeReference[0] = Reference(RuddiKontaktUndersoegelseAnnuleret)
* activity.outcomeReference[1] = Reference(RuddiKontaktUndersoegelse)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#completed
* activity.detail.performer = Reference(UdfoererAfRuddisRehab)

Instance: RuddiTraening
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTræning"
Description: "Ruddi's træningsindsats"
Usage: #example
* activity.detail.code.coding[level2temp] = Tempcodes#8728bce0-90c7-40c8-8c2f-f5c266dad02d
* period.start = 2022-05-30
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(RuddiTestBerggren)
* extension[basedOnServiceRequest].valueReference = Reference(RuddiGGOPInformation) 
* activity.outcomeReference = Reference(RuddiKontakt1Traening)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* activity.detail.scheduledTiming.repeat.count = 8
* activity.detail.scheduledTiming.repeat.duration = 60
* activity.detail.scheduledTiming.repeat.durationUnit = #min
* activity.detail.performer = Reference(UdfoererAfRuddisRehab)
