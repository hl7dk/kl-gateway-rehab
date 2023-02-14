Extension:  KLGatewayCareFollowUpEncounterExtension
Id: klgateway-care-follow-up-encounter-extension
Title: "CareFollowUpEncounterExtension"
Description: "Encounter for following up on this information."
* value[x] 1..
* value[x] only Reference(klgateway-140-encounter)
* value[x] ^type.aggregation = #bundled