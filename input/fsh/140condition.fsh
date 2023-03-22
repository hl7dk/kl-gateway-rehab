Profile: KLGateway140Condition
Parent: Condition
Id: klgateway-140-condition
Title: "KLGateway140Condition"
Description: "Detailed information about condition relating to §140 care pathways"
* identifier ..0
* clinicalStatus.coding 1..1
* clinicalStatus.coding.version ..0
* clinicalStatus.coding.display ..0
* clinicalStatus.coding.userSelected ..0
* clinicalStatus.text ..0
* verificationStatus MS
* verificationStatus ^definition = "Shall be present if entered-in-error. Assumed to be confirmed if absent."
* verificationStatus.coding 1..1
* verificationStatus.coding.version ..0
* verificationStatus.coding.display ..0
* verificationStatus.coding.userSelected ..0
* verificationStatus.text ..0
* category ..1 MS
* category ^definition = "Category must be problem-list-item for active and left out for inactive conditions"
* category.coding 1..1
* category.coding.code = #problem-list-item
* category.coding.version ..0
* category.coding.display ..0
* category.coding.userSelected ..0
* category.text ..0
* severity 0..0
* code 1..1
* code from $KLConditionCodes140 (required)
* code.coding 1..1
* bodySite ..0
* subject only Reference(klgateway-140-citizen)
* subject ^type.aggregation = #bundled
* abatement[x] ..0
* encounter ..0
* onset[x] ..0
* recordedDate 1..1
* recorder ..0
* asserter ..0
* stage ..0
* evidence ..0
* note ..0

//Danish descriptions
* code.coding ^short = "[DK] §140 tilstandskode"
* clinicalStatus ^short = "[DK] tilstandsstatus"
* verificationStatus ^short = "[DK] tilstandsstatus"
* recordedDate ^short = "[DK] tilstandsoprettelsestid" 
* subject ^short = "[DK] tilstandssubjekt" 
* category.coding ^short = "[DK] tilstandsfokus"

//Example
Instance: RuddiTilstand
InstanceOf: klgateway-140-condition
Title: "RuddiTilstand"
Description: "Ruddis Tilstand vedrørende gang og bevægelse"
Usage: #example
* code.coding =  $FSIII#3f27a7bc-790d-444e-bcf4-6e22a6b1da7e "Gang og bevægelse"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = 2022-06-02
* subject = Reference(RuddiTestBerggren)
* category.coding = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item