// Første indberetning
Instance: e87d5e68-e5f3-476f-988f-4efda86b0645
InstanceOf: klgateway-140-delivery-report
Description: "DeliveryReport-Ruddi-1"
Usage: #example
* type = #collection
* timestamp = 2022-05-23T19:25:12Z

* entry[+].fullUrl = "Patient/95ce3be6-dba6-48ab-b5d1-8a25929414dc"
* entry[=].resource = 95ce3be6-dba6-48ab-b5d1-8a25929414dc

* entry[+].fullUrl = "Organization/55a0e014-0e97-4c26-8ef2-29d528bfcc46"
* entry[=].resource = 55a0e014-0e97-4c26-8ef2-29d528bfcc46

* entry[+].fullUrl = "Organization/7fdd6dc0-3f9f-4914-b34a-7c6495ba0880"
* entry[=].resource = 7fdd6dc0-3f9f-4914-b34a-7c6495ba0880

* entry[+].fullUrl = "Condition/51d652a8-0ece-4d1d-8071-7baceb9701b2"
* entry[=].resource = 51d652a8-0ece-4d1d-8071-7baceb9701b2

* entry[+].fullUrl = "ServiceRequest/152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22"
* entry[=].resource = 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22

* entry[+].fullUrl = "CarePlan/0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a"
* entry[=].resource = 0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a



Instance: 95ce3be6-dba6-48ab-b5d1-8a25929414dc
InstanceOf: klgateway-140-citizen
Description: "Test personen Ruddi Test Berggren, fra MedCom test-cprnumre. Holbæk kommune er journalførende organisation."
Usage: #inline
* identifier.use = #official
* identifier.value = "1502779995"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* deceasedBoolean = false
* managingOrganization.identifier.use = #official
* managingOrganization.identifier.value =  "451000016003"
* managingOrganization.identifier.system = "urn:oid:1.2.208.176.1.1"

Instance: 55a0e014-0e97-4c26-8ef2-29d528bfcc46
InstanceOf: klgateway-140-organization
Title: "AfsenderAfRuddisGGOP"
Description: "Ortopædkirurgisk afdeling Holbæk sygehus, der er afsender af Ruddis GGOP"
Usage: #inline
* identifier.use = #official
* identifier.value = "227871000016001"
* identifier.system = "urn:oid:1.2.208.176.1.1"

Instance: 7fdd6dc0-3f9f-4914-b34a-7c6495ba0880
InstanceOf: klgateway-140-organization
Usage: #example
Title: "UdførerAfRuddisGenoptræning"
Description: "Genoptræningscenteret Holbæk kommune, der er udfører af Ruddis genoptræning"
* identifier.use = #official
* identifier.value = "1037801000016003"
* identifier.system = "urn:oid:1.2.208.176.1.1"

Instance: 51d652a8-0ece-4d1d-8071-7baceb9701b2
InstanceOf: klgateway-140-focus-condition
Title: "RuddiAktionsdiagnoseGGOP"
Description: "Ruddis aktionsdiagnose fra GGOP, hvor man kan se, at han har haft en pertrokantær femurfraktur"
Usage: #inline
* code.coding[SKS-D] = urn:oid:1.2.208.176.2.4.12#DS721 "Pertrokantær femurfraktur"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)

Instance: 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22
InstanceOf: klgateway-140-servicerequest
Title: "RuddiGGOPInformation"
Description: "Information fra Ruddis GGOP, der er baggrunden for at igangsætte indsatsen i kommunen"
Usage: #inline
* requester = Reference(55a0e014-0e97-4c26-8ef2-29d528bfcc46)
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/request-status#plan
* code.coding = $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592
* category[0].coding = Tempcodes#ffd81f78-352e-4589-a195-5350dd1df2a4 "almen"
* category[1].coding = Tempcodes#8b962281-2ab6-4b10-9c91-4bac592d6d49 "basal"
* extension[dischargeDate].valueDate = 2022-05-24
* reasonReference = Reference(51d652a8-0ece-4d1d-8071-7baceb9701b2)
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* authoredOn = 2022-05-23
* occurrencePeriod.start = 2022-05-28

Instance: 0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTerapeutfagligUndersøgelse"
Description: "Ruddi's terapeutfaglige undersøgelse"
Usage: #inline
* activity.detail.code.coding[level2] = $FSIII#1130ad70-6553-490d-87f8-5e8941687a0c "Terapeutfaglig udredning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "Individuel Indsats"
* period.start = 2022-05-23
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* extension[basedOnServiceRequest].valueReference = Reference(152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22) 
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#scheduled
* activity.detail.performer = Reference(7fdd6dc0-3f9f-4914-b34a-7c6495ba0880)

//2nd

Instance: 4b9443a2-7231-4387-8e3d-614bf193df49
InstanceOf: klgateway-140-delivery-report
Description: "DeliveryReport-Ruddi-2"
Usage: #example
* type = #collection
* timestamp = 2022-05-28T19:25:12Z

* entry[+].fullUrl = "Patient/95ce3be6-dba6-48ab-b5d1-8a25929414dc" //som tidligere
* entry[=].resource = 95ce3be6-dba6-48ab-b5d1-8a25929414dc

* entry[+].fullUrl = "Organization/55a0e014-0e97-4c26-8ef2-29d528bfcc46" //som tidligere
* entry[=].resource = 55a0e014-0e97-4c26-8ef2-29d528bfcc46

* entry[+].fullUrl = "Organization/7fdd6dc0-3f9f-4914-b34a-7c6495ba0880" //som tidligere
* entry[=].resource = 7fdd6dc0-3f9f-4914-b34a-7c6495ba0880

* entry[+].fullUrl = "Condition/51d652a8-0ece-4d1d-8071-7baceb9701b2" //som tidligere
* entry[=].resource = 51d652a8-0ece-4d1d-8071-7baceb9701b2

* entry[+].fullUrl = "ServiceRequest/152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22" //som tidligere
* entry[=].resource = 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22

* entry[+].fullUrl = "CarePlan/0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a" //opdateret fordi den afsluttes
* entry[=].resource = 0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a-v2

* entry[+].fullUrl = "Encounter/c4558767-7524-4aa6-8280-bf042d5d3e85" //undersøgelseskontakten
* entry[=].resource = c4558767-7524-4aa6-8280-bf042d5d3e85

* entry[+].fullUrl = "Condition/a6ed3134-f27a-41bb-976c-b627af1c85bb" //Tilstand gang og bevægelse
* entry[=].resource = a6ed3134-f27a-41bb-976c-b627af1c85bb

* entry[+].fullUrl = "Condition/0b9adc44-6ab6-4060-8adc-a723e7da6608" //Tilstand forflytning
* entry[=].resource = 0b9adc44-6ab6-4060-8adc-a723e7da6608

* entry[+].fullUrl = "CarePlan/1c74e3e8-e038-4182-a545-d86a9f064d44" //RuddiTræningsforløb
* entry[=].resource = 1c74e3e8-e038-4182-a545-d86a9f064d44

* entry[+].fullUrl = "Careplan/663797c4-1024-4971-978c-c02c5caf8861" //Ruddi fysisk træning
* entry[=].resource = 663797c4-1024-4971-978c-c02c5caf8861


Instance: 0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a-v2
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTerapeutfagligUndersøgelse"
Description: "Ruddi's terapeutfaglige undersøgelse afsluttes"
Usage: #inline
* id = "0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a"
* activity.detail.code.coding[level2] = $FSIII#1130ad70-6553-490d-87f8-5e8941687a0c "Terapeutfaglig udredning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "Individuel Indsats"
* period.start = 2022-05-23
* period.end = 2022-05-28
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* extension[basedOnServiceRequest].valueReference = Reference(152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22) 
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#completed
* activity.detail.performer = Reference(7fdd6dc0-3f9f-4914-b34a-7c6495ba0880)

Instance: c4558767-7524-4aa6-8280-bf042d5d3e85
InstanceOf: klgateway-140-encounter
Title: "RuddiKontaktUndersøgelse"
Description: "Ruddis kontakt, hvor der er udført en terapeutfaglig undersøgelse"
Usage: #inline
* status = http://hl7.org/fhir/encounter-status#finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* period.start = 2022-05-28T12:10:00.000Z
* period.end = 2022-05-28T12:40:00.000Z
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* extension[basedOnCarePlan].valueReference = Reference(0735f195-a0fc-4f1f-b7be-5b3f6b8fee4a-v2)

Instance: a6ed3134-f27a-41bb-976c-b627af1c85bb
InstanceOf: klgateway-140-condition
Title: "RuddiTilstandBevægelse"
Description: "Ruddis Tilstand vedrørende gang og bevægelse"
Usage: #inline
* code.coding =  $FSIII#3f27a7bc-790d-444e-bcf4-6e22a6b1da7e "Gang og bevægelse"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = 2022-05-28
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* category.coding = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item

Instance: 0b9adc44-6ab6-4060-8adc-a723e7da6608
InstanceOf: klgateway-140-condition
Title: "RuddiTilstandForflytning"
Description: "Ruddis Tilstand vedrørende forflytning"
Usage: #inline
* code.coding =  $FSIII#2a641de6-1017-4647-a0fb-c3c8b7b1f43e "Ændre og opretholde kropsstilling"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = 2022-05-28
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* category.coding = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item

Instance: 1c74e3e8-e038-4182-a545-d86a9f064d44
InstanceOf: klgateway-140-care-plan
Title: "RuddiTræningsforløb"
Description: "Ruddi's træningsforløb"
Usage: #inline
* category = $KLCommonCodes#f15b2663-94d9-4d0c-a5de-d8bd8e1e4ebb
* period.start = 2022-05-28
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* extension[basedOnServiceRequest].valueReference = Reference(152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* activity.detail.performer = Reference(7fdd6dc0-3f9f-4914-b34a-7c6495ba0880)

Instance: 663797c4-1024-4971-978c-c02c5caf8861
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTræning"
Description: "Ruddi's træningsindsats"
Usage: #inline
* activity.detail.code.coding[level2] = $FSIII#2abe20c7-c0b4-41c1-b397-52acf36499ef "Fysisk træning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-05-28
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(1c74e3e8-e038-4182-a545-d86a9f064d44)

//3rd to sixth

Instance: 4a391f69-a909-4a79-92bd-1b0f812dc52a
InstanceOf: klgateway-140-delivery-report
Description: "DeliveryReport-Ruddi-6"
Usage: #example
* type = #collection
* timestamp = 2022-06-21T19:25:12Z

* entry[+].fullUrl = "Patient/95ce3be6-dba6-48ab-b5d1-8a25929414dc" //som tidligere
* entry[=].resource = 95ce3be6-dba6-48ab-b5d1-8a25929414dc

* entry[+].fullUrl = "Organization/55a0e014-0e97-4c26-8ef2-29d528bfcc46" //som tidligere
* entry[=].resource = 55a0e014-0e97-4c26-8ef2-29d528bfcc46

* entry[+].fullUrl = "Organization/7fdd6dc0-3f9f-4914-b34a-7c6495ba0880" //som tidligere
* entry[=].resource = 7fdd6dc0-3f9f-4914-b34a-7c6495ba0880

* entry[+].fullUrl = "Condition/51d652a8-0ece-4d1d-8071-7baceb9701b2" //som tidligere
* entry[=].resource = 51d652a8-0ece-4d1d-8071-7baceb9701b2

* entry[+].fullUrl = "ServiceRequest/152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22" //som tidligere
* entry[=].resource = 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22

* entry[+].fullUrl = "CarePlan/1c74e3e8-e038-4182-a545-d86a9f064d44" //RuddiTræningsforløb, som tidligere
* entry[=].resource = 1c74e3e8-e038-4182-a545-d86a9f064d44

* entry[+].fullUrl = "Encounter/955eda13-0ee6-4de0-91d6-598ed92cef5e" //Kontakt på træningsforløb
* entry[=].resource = 955eda13-0ee6-4de0-91d6-598ed92cef5e

Instance: 955eda13-0ee6-4de0-91d6-598ed92cef5e
InstanceOf: klgateway-140-encounter
Title: "RuddiKontakt1Traening"
Description: "Ruddis kontakt, hvor han har fjerde træningsgang"
Usage: #inline
* status = http://hl7.org/fhir/encounter-status#finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* period.start = 2022-06-21T10:20:00.000Z
* period.end = 2022-06-21T11:20:00.000Z
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* extension[basedOnCarePlan].valueReference = Reference(1c74e3e8-e038-4182-a545-d86a9f064d44)


//7th

Instance: 9960b8dc-5ebf-4166-83d7-b042bcc6aca5
InstanceOf: klgateway-140-delivery-report
Description: "DeliveryReport-Ruddi-7"
Usage: #example
* type = #collection
* timestamp = 2022-06-21T19:25:12Z

* entry[+].fullUrl = "Patient/95ce3be6-dba6-48ab-b5d1-8a25929414dc" //som tidligere
* entry[=].resource = 95ce3be6-dba6-48ab-b5d1-8a25929414dc

* entry[+].fullUrl = "Organization/7fdd6dc0-3f9f-4914-b34a-7c6495ba0880" //som tidligere
* entry[=].resource = 7fdd6dc0-3f9f-4914-b34a-7c6495ba0880

* entry[+].fullUrl = "CarePlan/c8be2dc6-caa3-4c7e-81e8-0347896fb4d3" //RonnieTræningsforløb
* entry[=].resource = c8be2dc6-caa3-4c7e-81e8-0347896fb4d3

* entry[+].fullUrl = "CarePlan/8f0db8cd-af6e-4221-9aca-01da21706779" //RonnieTræningsindsats
* entry[=].resource = 8f0db8cd-af6e-4221-9aca-01da21706779

* entry[+].fullUrl = "CarePlan/abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3" //RonnieTræningsindsats
* entry[=].resource = abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3


Instance: c8be2dc6-caa3-4c7e-81e8-0347896fb4d3
InstanceOf: klgateway-140-care-plan
Title: "RonniesTræningsforløbFejl"
Description: "Ronnies's træningsforløb som er en fejl"
Usage: #inline
* category = $KLCommonCodes#f15b2663-94d9-4d0c-a5de-d8bd8e1e4ebb
* period.start = 2022-06-22
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* activity.detail.performer = Reference(7fdd6dc0-3f9f-4914-b34a-7c6495ba0880)

Instance: 8f0db8cd-af6e-4221-9aca-01da21706779
InstanceOf: klgateway-140-planned-intervention
Title: "RonniesFysisikeTræningFejl"
Description: "Ronnies fysiske træning, som er en fejl"
Usage: #inline
* activity.detail.code.coding[level2] = $FSIII#2abe20c7-c0b4-41c1-b397-52acf36499ef "Fysisk træning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-06-22
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(e6f0dc64-bf7f-4177-93a6-32858638bfc2)

Instance: abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3
InstanceOf: klgateway-140-planned-intervention
Title: "RonniesFysisikeTræningFejl"
Description: "Ronnies fysiske træning, som er en fejl"
Usage: #inline
* activity.detail.code.coding[level2] = $FSIII#58293f63-00d7-4730-8dbc-c784d40f9e23 "Funktionstræning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-06-22
* status = http://hl7.org/fhir/request-status#active
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(e6f0dc64-bf7f-4177-93a6-32858638bfc2)

Instance: c2f75bbf-2027-41bf-b597-de5e242f2b3d
InstanceOf: klgateway-140-delivery-report
Description: "DeliveryReport-Ruddi-8"
Usage: #example
* type = #collection
* timestamp = 2022-06-23T19:25:12Z

* entry[+].fullUrl = "Patient/95ce3be6-dba6-48ab-b5d1-8a25929414dc" //som tidligere
* entry[=].resource = 95ce3be6-dba6-48ab-b5d1-8a25929414dc

* entry[+].fullUrl = "Organization/55a0e014-0e97-4c26-8ef2-29d528bfcc46" //som tidligere
* entry[=].resource = 55a0e014-0e97-4c26-8ef2-29d528bfcc46

* entry[+].fullUrl = "Organization/7fdd6dc0-3f9f-4914-b34a-7c6495ba0880" //som tidligere
* entry[=].resource = 7fdd6dc0-3f9f-4914-b34a-7c6495ba0880

* entry[+].fullUrl = "Condition/51d652a8-0ece-4d1d-8071-7baceb9701b2" //som tidligere
* entry[=].resource = 51d652a8-0ece-4d1d-8071-7baceb9701b2

* entry[+].fullUrl = "ServiceRequest/152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22" //som tidligere
* entry[=].resource = 152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22

* entry[+].fullUrl = "Condition/a6ed3134-f27a-41bb-976c-b627af1c85bb" //Tilstand gang og bevægelse, opdateret
* entry[=].resource = a6ed3134-f27a-41bb-976c-b627af1c85bb-v2

* entry[+].fullUrl = "Condition/0b9adc44-6ab6-4060-8adc-a723e7da6608" //Tilstand forflytning, opdateret
* entry[=].resource = 0b9adc44-6ab6-4060-8adc-a723e7da6608-v2

* entry[+].fullUrl = "CarePlan/1c74e3e8-e038-4182-a545-d86a9f064d44" //RuddiTræningsforløb, opdateret
* entry[=].resource = 1c74e3e8-e038-4182-a545-d86a9f064d44-v2

* entry[+].fullUrl = "Careplan/663797c4-1024-4971-978c-c02c5caf8861" //Ruddi fysisk træning, opdateret
* entry[=].resource = 663797c4-1024-4971-978c-c02c5caf8861-v2

* entry[+].fullUrl = "CarePlan/c8be2dc6-caa3-4c7e-81e8-0347896fb4d3" //RonnieTræningsforløb, opdateret
* entry[=].resource = c8be2dc6-caa3-4c7e-81e8-0347896fb4d3-v2

* entry[+].fullUrl = "CarePlan/8f0db8cd-af6e-4221-9aca-01da21706779" //RonnieTræningsindsats, opdateret
* entry[=].resource = 8f0db8cd-af6e-4221-9aca-01da21706779-v2

* entry[+].fullUrl = "CarePlan/abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3" //RonnieTræningsindsats, opdateret
* entry[=].resource = abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3-v2

Instance: a6ed3134-f27a-41bb-976c-b627af1c85bb-v2
InstanceOf: klgateway-140-condition
Title: "RuddiTilstandBevægelse"
Description: "Ruddis Tilstand vedrørende gang og bevægelse"
Usage: #inline
* id = "a6ed3134-f27a-41bb-976c-b627af1c85bb"
* code.coding =  $FSIII#3f27a7bc-790d-444e-bcf4-6e22a6b1da7e "Gang og bevægelse"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = 2022-05-28
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)

Instance: 0b9adc44-6ab6-4060-8adc-a723e7da6608-v2
InstanceOf: klgateway-140-condition
Title: "RuddiTilstandForflytning"
Description: "Ruddis Tilstand vedrørende forflytning"
Usage: #inline
* id = "0b9adc44-6ab6-4060-8adc-a723e7da6608"
* code.coding =  $FSIII#2a641de6-1017-4647-a0fb-c3c8b7b1f43e "Ændre og opretholde kropsstilling"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = 2022-05-28
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)

Instance: 1c74e3e8-e038-4182-a545-d86a9f064d44-v2
InstanceOf: klgateway-140-care-plan
Title: "RuddiTræningsforløb"
Description: "Ruddi's træningsforløb"
Usage: #inline
* id = "1c74e3e8-e038-4182-a545-d86a9f064d44"
* category = $KLCommonCodes#f15b2663-94d9-4d0c-a5de-d8bd8e1e4ebb
* period.start = 2022-05-28
* period.end = 2022-06-23
* status = http://hl7.org/fhir/request-status#revoked
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* extension[basedOnServiceRequest].valueReference = Reference(152a1f8f-db33-4fa4-b5ea-c6f4e5cebd22)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#cancelled
* activity.detail.performer = Reference(7fdd6dc0-3f9f-4914-b34a-7c6495ba0880)
* activity.detail.statusReason = $KLCommonCodes#a3f2bd01-078b-486e-81be-797d192ad7bd "Aktivt fravalg pga. anden træning"

Instance: 663797c4-1024-4971-978c-c02c5caf8861-v2
InstanceOf: klgateway-140-planned-intervention
Title: "RuddiTræning"
Description: "Ruddi's træningsindsats"
Usage: #inline
* id = "663797c4-1024-4971-978c-c02c5caf8861"
* activity.detail.code.coding[level2] = $FSIII#2abe20c7-c0b4-41c1-b397-52acf36499ef "Fysisk træning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-05-28
* period.end = 2022-06-23
* status = http://hl7.org/fhir/request-status#revoked
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#cancelled
* basedOn = Reference(1c74e3e8-e038-4182-a545-d86a9f064d44)

Instance: c8be2dc6-caa3-4c7e-81e8-0347896fb4d3-v2
InstanceOf: klgateway-140-care-plan
Title: "RonniesTræningsforløbFejl"
Description: "Ronnies's træningsforløb som er en fejl"
Usage: #inline
* id = "c8be2dc6-caa3-4c7e-81e8-0347896fb4d3"
* category = $KLCommonCodes#f15b2663-94d9-4d0c-a5de-d8bd8e1e4ebb
* period.start = 2022-06-22
* status = http://hl7.org/fhir/request-status#entered-in-error
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* activity.detail.performer = Reference(7fdd6dc0-3f9f-4914-b34a-7c6495ba0880)

Instance: 8f0db8cd-af6e-4221-9aca-01da21706779-v2
InstanceOf: klgateway-140-planned-intervention
Title: "RonniesFysisikeTræningFejl"
Description: "Ronnies fysiske træning, som er en fejl"
Usage: #inline
* id = "8f0db8cd-af6e-4221-9aca-01da21706779"
* activity.detail.code.coding[level2] = $FSIII#2abe20c7-c0b4-41c1-b397-52acf36499ef "Fysisk træning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-06-22
* status = http://hl7.org/fhir/request-status#entered-in-error
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(e6f0dc64-bf7f-4177-93a6-32858638bfc2)

Instance: abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3-v2
InstanceOf: klgateway-140-planned-intervention
Title: "RonniesFysiskeTræningFejl"
Description: "Ronnies fysiske træning, som er en fejl"
Usage: #inline
* id = "abf3df7f-8b61-4c01-89dd-ac6ca9c58ae3"
* activity.detail.code.coding[level2] = $FSIII#58293f63-00d7-4730-8dbc-c784d40f9e23 "Funktionstræning"
* activity.detail.extension[deliveryType].valueCodeableConcept = $KLCommonCodes#2865f123-15a7-4a36-a514-32ea37c400ca "Gruppebaseret indsats"
* period.start = 2022-06-22
* status = http://hl7.org/fhir/request-status#entered-in-error
* intent = http://hl7.org/fhir/care-plan-intent#plan
* subject = Reference(95ce3be6-dba6-48ab-b5d1-8a25929414dc)
* activity.detail.status = http://hl7.org/fhir/care-plan-activity-status#in-progress
* basedOn = Reference(e6f0dc64-bf7f-4177-93a6-32858638bfc2)