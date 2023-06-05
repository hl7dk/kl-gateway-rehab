# KLGatewayRehabilitation
This implementation guide describes the delivery of §140 rehabilitation data to KL Gateway. The data originates from the documentation made by physiotherapist in the Danish municipalities.The reporting aims for compliance with the Danish core profiles and the current work on a shared information model (FKI) for data in the Danish municipalities.  

The profiles for the reporting are restricted to allow only the information that is required to report to the KL Gateway.

## Overview
The data is reported as a collection of instances. A report may contain instances that conforms to the profiles defined in this implementation guide. See figure below.

<img alt="OverviewModel" src="./ReportStructure.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

Whereas the report may seem unconstrained, each profile define constraints on attributes, datatypes and cardinalities. See descriptions below.

## Citizen
Information about the citizen that is the subjects of the report.

##### Attributes
* A civil registration number (CPR-nr)
* An organisation identifier that identifies the municipality holding and reporting the data

##### Validation
* One and only one civil registration number exists, and is a syntactically valid CPR-nr
* One and only one managing organization exitis, and is a syntactically valid SOR code (only code length is currently validated in the profile, but the authorization validates the actual SOR code)

## Organization
The organization profile is used to represent organizations such as general practitioners and hospitals sending service requests. Be aware that the managing organization (the municipality keeping the record) is represented in the citizen profile.

##### Attributes
* An organisation identifier

##### Validation
* One and only one organisation identifier exists, and is a syntactically valid SOR code or FK-org code

## ServiceRequest
This model is used to represent when a municipality recieves a referal for §140 rehabilitation (Danish: GGOP).

##### Attributes
* A reference to the organization that requests the intervention
* The intervention being requested
* The reason for the referal expressed as a reference to FocusCondition
* A reference to the citizen
* The time of the referal
* A reference to the referal that this one replaces
* Two FHIR status attributes (status and intent)

##### Validation
* A reference to the organization is mandatory.
* The code for the intervention being requested should always be present and fixed to 'Træning'
* One or more references to FocusCondition may be present. It is only nessesary to report these, if they can be drawn directly from the MedCom message.
* One and only one reference to the citizen should be present.
* The time of the referal is mandatory
* A reference to a replaced referal may be present.
* Both FHIR statuses are mandatory. Each of them should be drawn from the appropriate standard FHIR-ValueSet 

## FocusCondition
This model holds a diagnosis-code, as it is reported to the municipality as part of the referal from a hospital.

##### Attributes
* A diagnosis code
* A reference to the citizen
* Two FHIR status attributes

##### Validation
* One and only one diagnosis code exists and should be drawn from SKS
* One and only one reference to the citizen exists
* One FHIR status is mandatory and should be drawn from the appropriate standard FHIR-ValueSet. The other is not mandatory, but it is needed for reporting entered-in-error.

## PlannedIntervention
This model holds information about prevention/health promotion interventions planned for a citizen.

##### Attributes
* A FSIII intervention code
* The time where the intervention was granted
* The time where the intervention was stopped
* A reference to the citizen
* A reference to the ServiceRequest, that started the intervention
* The reason for the intervention expressed as a reference to Condition
* A reference to the organization that delivers the intervention
* A reference to the care plan that this planned intervention is part of
* Three FHIR status attributes (status, intent, activity.detail.status)

##### Validation
* One and only one FSIII intervention code may be present and it should be drawn from valid §140 FSIII interventions as expressed by the ValueSet.
* One and only one time for when the intervention was granted
* The time where the intervention was stopped may be present
* One and only one reference to the citizen exists
* A reference to the ServiceRequest is mandatory
* A reference to one or more Conditions may exist, but are not required
* One and only one reference to the organization that delivers the intervention exists
* All FHIR statuses are mandatory. Each of them should be drawn from the appropriate standard FHIR-ValueSet.
* The reference to the care plan is mandatory if the intervention is repeating such as 'Fysisk træning på hold'.

## CarePlan
The CarePlan is used whenever a prevention/health promotion care pathway is planned for a citizen in Danish municipalities. Care plan is a way to describe when a number of planned interventions are delivered together with a common schedule.

##### Attributes
* A category code, which can be either 'Opfølgningsforløb efter §140' or 
'Interventionsforløb efter §140'
* The time where the CarePlan was granted
* The time where the CarePlan was stopped
* A reference to the ServiceRequest, that started the CarePlan
* A reference to the Citizen
* An explaination for cancelling the CarePlan before its completion
* A timing consisting of a count, duration and durationUnit to express the time granted to the intervention e.g. "8 times with a duration of 60min"
* A reference to the organization that delivers the intervention
* Three FHIR status attributes (status, intent, activity.detail.status)

##### Validation
* One and only one category code may be present and it should be drawn from the associated ValueSet.
* One and only one time for when the care plan was granted  is mandatory
* The time where the care plan was stopped may be present
* One and only one reference to the ServiceRequest that started the CarePlan is mandatory
* One and only one reference to the Citizen exists
* One and only one explaination for cancelling the care plan before its completion shall exist if and only if the status is 'cancelled' or 'stopped'. Else it is prohibited.
* The timing shall exist for interventions, when the category-code is 'Interventionsforløb efter §140'
* One and only one reference to the organization that delivers the intervention exists
* All FHIR statuses are mandatory. Each of them should be drawn from the appropriate standard FHIR-ValueSet

## Encounter
Information about whenever a citizen meets the prevention/health promotion staff in a Danish municipality context.

##### Attributes
* Encounter class. The attribute holds a code which describe the place of delivery e.g. home visit or ambulatory.
* The encounter start-time
* The encounter end-time
* A reference to the Citizen
* A reference to the CarePlan that this encounter is a delivery of.
* A reference to the ServiceRequest that is the reason for the delivery of this encounter 
* A FHIR status attribute

##### Validation
* One ond only one encounter class exists, and should be drawn from the standard FHIR-ValueSet
* One and only one encounter start-time exists
* One encounter end-time may exist
* One and only one reference to the Citizen exists
* A reference to the CarePlan may exist
* One and only one reference to the ServiceRequest is mandatory
* One and only one FHIR status exists, and should be drawn from the standard FHIR-ValueSet

## Condition
This model contains information about FSIII conditions. They should be reported as long as a condition is true and active, for a living citizen that recieves §140 rehabilitation in Danish municipalities.

##### Attributes
* A FSIII condition code
* The time where the condition was reported
* A reference to the Citizen
* A condition-focus attribute
* Two FHIR statuses (clinicalStatus and verificationStatus)

##### Validation
* One and only one FSIII condition code may be present and it should be drawn from valid §140 FSIII conditions as expressed by the ValueSet.
* One and only one reporting-time exists
* One and only one reference to the Citizen exists
* The condition-focus attribute may be set to 'problem-list-item', or not be present. See the detailed documentation.
* clinicalStatus is mandatory. VerificationStatus is recommended but only required for when reporting 'entered-in-error'. Each of them should be drawn from the appropriate standard FHIR-ValueSet
