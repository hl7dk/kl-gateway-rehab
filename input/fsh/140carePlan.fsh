Profile: KLGateway140CarePlan
Parent: CarePlan
Id: klgateway-140-care-plan
Title: "KLGateway140care-plan"
Description: "Care plans for §140 rehabilitation in Danish Municipalities."

//Requirements
* status ^definition = "Shall be either unknown, entered-in-error, or the status of the intervention at the time of reporting"
* intent = #plan
* category 1..1
* category from CarePlanCategories140 (required)
* activity.detail.status ^definition = "Shall be either unknown, or cancelled, or the activity status of the intervention at the time of reporting"
* activity.detail.statusReason from CancellationTypes //hvilken type, når interventionen stopper, for at lave en ny, fordi der er sendt en ny GGOP

* subject only Reference(klgateway-140-citizen) //borger
* subject ^type.aggregation = #bundled
* period 1..1
* period.start 1..1 //Bevillingsdato
//period.end er mulig men ikke obligatorisk
* activity 1..1
//* activity.outcomeReference only Reference(klgateway-140-encounter) //kontakter
//* activity.outcomeReference ^type.aggregation = #bundled
* activity.reference 0..0
* activity.detail 1.. 
* activity.detail.code 0..0 
* activity.detail.reasonCode ..0
* activity.detail.performer 1..1 //indsatsudfører
* activity.detail.performer only Reference(klgateway-140-organization)
* activity.detail.performer ^type.aggregation = #bundled
* extension contains
   BasedOnServiceRequestExtension named basedOnServiceRequest 1..1

//* extension[basedOnServiceRequest].valueReference only Reference(klgateway-140-servicerequest) //GGOP'en
* extension[basedOnServiceRequest].valueReference ^type.aggregation = #bundled


//0..0 kardinaliteter
* activity.detail.scheduled[x] 0..0
* identifier ..0
* instantiatesCanonical ..0
* instantiatesUri ..0
* basedOn ..0
* replaces ..0
* partOf ..0
* activity.detail.reasonReference 0..0
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
* activity.detail.location ..0
* activity.detail.product[x] ..0
* activity.detail.dailyAmount ..0
* activity.detail.quantity ..0
* activity.detail.description ..0
* activity.outcomeReference 0..0
* note ..0

//Danish descriptions
* category ^short = "[DK] indsatsforløbKategori"
* period.start ^short = "[DK] indsatsforløbBevillingstid"
* period.end ^short = "[DK] indsatforløbAfslutningstid"
* status ^short = "[DK] indsatsforløbsstatus"
* intent ^short = "[DK] indsatshensigt"
* subject ^short = "[DK] indsatssubjekt"
* extension[basedOnServiceRequest] ^short = "[DK] indsatsforløbAnledning"
* activity.detail.status ^short = "[DK] indsatsforløbsAktivitetsstatus"
* activity.detail.statusReason ^short = "[DK] indsatsforløbForklaringAfStatus"
* activity.detail.performer ^short = "[DK] indsatsleverandør"
* obeys klgateway-140-care-plan-1

Invariant: klgateway-140-care-plan-1
Description: "status reason is mandatory if status is cancelled or stopped. Otherwise it is prohibited"
Severity: #error
Expression: "activity.detail.all(statusReason.exists() = (status = 'cancelled' or status = 'stopped'))"

Instance: RuddiTraeningsforloeb
InstanceOf: klgateway-140-care-plan
Title: "RuddiTræningsforløb"
Description: "Ruddi's træningsforløb"
Usage: #example
* category = $KLCommonCodes#f15b2663-94d9-4d0c-a5de-d8bd8e1e4ebb
* period.start = 2022-05-30
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(RuddiTestBerggren)
* extension[basedOnServiceRequest].valueReference = Reference(RuddiGGOPInformation)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* activity.detail.performer = Reference(UdfoererAfRuddisRehab)
