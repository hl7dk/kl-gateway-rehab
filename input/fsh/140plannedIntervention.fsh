Profile: KLGateway140PlannedIntervention
Parent: CarePlan
Id: klgateway-140-planned-intervention
Title: "140PlannedIntervention"
Description: "Planned interventions for §140 training in Danish Municipalities."
* identifier ..0
* instantiatesCanonical ..0
* instantiatesUri ..0
* basedOn ..0
* replaces ..0
* partOf ..0
* status ^definition = "Shall be either unknown, entered-in-error, or the status of the intervention at the time of reporting"
* intent = #plan
* category ..0
* title ..0
* description ..0
* subject only Reference(klgateway-care-citizen)
* subject ^type.aggregation = #bundled
* encounter ..0
* period 1..1
* period.start 1..1
* created ..0
* author ..0
* contributor ..0
* careTeam 0..0
* addresses ..0
* supportingInfo ..0
* goal ..0
* activity 1..1
* activity.outcomeCodeableConcept ..0
* activity.outcomeReference ..0
* activity.progress ..0
* activity.reference only Reference(klgateway-140-servicerequest)
* activity ^type.aggregation = #bundled
* activity.detail 1..
* activity.detail.kind ..0
* activity.detail.instantiatesCanonical ..0
* activity.detail.instantiatesUri ..0
* activity.detail.code 1..1
* activity.detail.code.coding ^slicing.discriminator.type = #value
* activity.detail.code.coding ^slicing.discriminator.path = "system"
* activity.detail.code.coding ^slicing.rules = #closed
* activity.detail.code.coding contains level2 1..1 and level3 0..1 MS
* activity.detail.code.coding[level2].system = "urn:oid:1.2.208.176.2.21"
* activity.detail.code.coding[level2] from http://fhir.kl.dk/term/ValueSet/KLTrainingInterventionsFSIII
* activity.detail.code.coding[level3].system = "http://gateway.kl.dk/1.0/CodeSystem/LocallyDefinedInterventions"
* activity.detail.code.coding[level3].code 1..1
* activity.detail.code.coding[level3].display 1..1
* activity.detail.code.coding[level3] ^definition = "Shall contain locally defined code if it is a locally defined level 3 intervention"
* activity.detail.reasonCode ..0
* activity.detail.reasonReference only Reference(KLGateway140Condition)
* activity.detail.reasonReference MS
* activity.detail.reasonReference ^definition = "Reason for this intervention. Must contain all conditions known to be addressed by this intervention"
* activity.detail.reasonReference ^type.aggregation = #bundled
* activity.detail.goal ..0
* activity.detail.status ^definition = "Shall be either unknown, entered-in-error, or the activity status of the intervention at the time of reporting"
* activity.detail.statusReason from CancellationTypes
* activity.detail.doNotPerform ..0
* activity.detail.scheduled[x] ..1
* activity.detail.scheduledString ..0
* activity.detail.scheduledPeriod ..0
* activity.detail.scheduledTiming.code 0..0
* activity.detail.scheduledTiming.event 0..0
* activity.detail.scheduledTiming.repeat.boundsPeriod.start 1..1
* activity.detail.scheduledTiming.repeat.boundsPeriod.end 0..0
* activity.detail.scheduledTiming.repeat.count 1..1
* activity.detail.scheduledTiming.repeat.duration 1..1
* activity.detail.scheduledTiming.repeat.durationUnit 1..1
* activity.detail.scheduledTiming.repeat.durationUnit = http://unitsofmeasure.org#min
* activity.detail.scheduledTiming.repeat.frequency 0..0
* activity.detail.scheduledTiming.repeat.durationMax 0..0
* activity.detail.scheduledTiming.repeat.boundsDuration 0..0
* activity.detail.scheduledTiming.repeat.boundsRange 0..0
* activity.detail.scheduledTiming.repeat.countMax 0..0
* activity.detail.scheduledTiming.repeat.dayOfWeek 0..0
* activity.detail.location ..0
* activity.detail.performer 1..1
* activity.detail.performer only Reference(klgateway-care-organization)
* activity.detail.performer ^type.aggregation = #bundled
* activity.detail.product[x] ..0
* activity.detail.dailyAmount ..0
* activity.detail.quantity ..0
* activity.detail.description ..0
* note ..0
* extension contains klgateway-140-interventiontype-extension named interventiontype 0..1 MS
* extension[interventiontype] ^definition = "Type of intervention. Individual or group"

//Danish descriptions
* activity.detail.code.coding ^short = "[DK] indsatsskode"
* period.start ^short = "[DK] indsatsbevillingstid"
* period.end ^short = "[DK] indsatsafslutningstid"
* status ^short = "[DK] indsatsstatus"
* intent ^short = "[DK] indsatshensigt"
* subject ^short = "[DK] indsatssubjekt"
* activity.reference ^short = "[DK] indsatsAnledning"
* activity.detail.reasonReference ^short = "[DK] indsatsbegrundelse"
* activity.outcomeReference ^short = "[DK] indsatsgennemførtAktivitet"
* activity.detail.status ^short = "[DK] indsatsAktivitetsstatus"
* activity.detail.statusReason ^short = "[DK] indsatsAktivitetForklaringAfStatus"
* activity.detail.scheduledTiming.repeat.boundsPeriod.start ^short = "[DK] indsatsAktivitetPlanlagtOpstartsdato"
* activity.detail.scheduledTiming.repeat.count ^short = "[DK] indsatsAktivitetAntalTræningsgange"
* activity.detail.scheduledTiming.repeat.duration ^short = "[DK] indsatsAktivitetLængdeAfTræningsgange"
* activity.detail.scheduledTiming.repeat.durationUnit ^short = "[DK] indsatsAktivitetLængdeAfTræningsgangeEnhed"
* activity.detail.performer ^short = "[DK] indsatsleverandør"
* extension[interventiontype] ^short = "[DK] interventionstype, individuel eller gruppe"
