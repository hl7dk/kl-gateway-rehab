CodeSystem: Tempcodes
Id: Tempcodes
Title: "Tempcodes"
Description: "Tempcodes to be implemented in KL-term"
* #7273c0b7-1a0d-4c4a-a202-c014b1ddd4a0 "Første kontakt i forløb"
* #a304b34f-4d23-4475-b7db-21d14925acd6 "Anden sygdom forhindrer borger i fremmøde"
* #11d54ee7-1015-4c83-8651-7471afc7b828 "Overgået til andet træningstilbud (fx fitnesscenter)"
* #4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf "Borger vurderer, at han/hun ikke har yderligere behov og afslutter derfor før tid"
* #a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 "Fagperson vurderer, at borger ikke har yderligere behov og afslutter derfor før tid"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 "Borger har behov, men har ikke mulighed for at prioritere de resterende træningsgange"
* #ec844e97-0ab9-402a-aeaa-7486aa9781af "Anden grund til annullering af indsats"
* #2865f123-15a7-4a36-a514-32ea37c400ca "gruppebaseret indsats"
* #8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "individuel indsats"

ValueSet: CancellationTypes
Id: CancellationTypes
Title: "CancellationTypes"
Description: "Cancellation valueset, to be implemented in KL-term and FKI"
* Tempcodes#a304b34f-4d23-4475-b7db-21d14925acd6 "Anden sygdom forhindrer borger i fremmøde"
* Tempcodes#11d54ee7-1015-4c83-8651-7471afc7b828 "Overgået til andet træningstilbud (fx fitnesscenter)"
* Tempcodes#4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf "Borger vurderer, at han/hun ikke har yderligere behov og afslutter derfor før tid"
* Tempcodes#a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 "Fagperson vurderer, at borger ikke har yderligere behov og afslutter derfor før tid"
* Tempcodes#3a5a72b7-addf-4857-b80c-04e4246e3072 "Borger har behov, men har ikke mulighed for at prioritere de resterende træningsgange"
* Tempcodes#ec844e97-0ab9-402a-aeaa-7486aa9781af "Andet"

ValueSet: ExtendedEncounterTypes
Id: ExtendedEncounterTypes
Title: "ExtendedEncounterTypes"
Description: "Extension on encountertype valueset, to be implemented in KL-term and FKI"
* include codes from valueset http://fhir.kl.dk/term/ValueSet/KLEncounterTypes
* Tempcodes#7273c0b7-1a0d-4c4a-a202-c014b1ddd4a0

ValueSet: InterventionTypes
Id: InterventionTypes
Title: "InterventionTypes"
Description: "A type stating whether the intervention id groups based or indivudual"
* Tempcodes#2865f123-15a7-4a36-a514-32ea37c400ca "gruppebaseret indsats"
* Tempcodes#8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "individuel indsats"