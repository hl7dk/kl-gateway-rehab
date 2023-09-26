Extension: PreconditionDate
Title: "PreconditionDate"
Description: "Extension for a date that needs to occur before the service requested can be performed"
* value[x] only dateTime
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "ServiceRequest"

Extension: DeliveryType
Title: "DeliveryType"
Description: "Extension for a code that specifies some context of how a treatment-activity is delivered to a patient"
* value[x] only CodeableConcept
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "CarePlan.activity.detail"

Extension: BasedOnServiceRequestExtension
Title:     "basedOnServiceRequestExtension"
Description: "Extension for pointing to the servicerequest, that started an intervention"
* value[x] 1..1
* value[x] only Reference(klgateway-140-servicerequest)
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "CarePlan"

Extension: BasedOnCarePlanExtension
Title:     "basedOnCarePlanExtension"
Description: "Extension for pointing to the careplan describing why this encounter is taking place, will be part of R5 without needing the extension"
* value[x] 1..1
* value[x] only Reference(klgateway-140-care-plan or klgateway-140-planned-intervention)
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Encounter"