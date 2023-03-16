CodeSystem: Tempcodes
Id: Tempcodes
Title: "Tempcodes"
Description: "Tempcodes to be implemented in KL-term"
* #7273c0b7-1a0d-4c4a-a202-c014b1ddd4a0 "Første kontakt i forløb"
* #4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf "Ikke yderligere behov (borger-vurderet)""Borger vurderer, at han/hun ikke har yderligere behov og afslutter derfor før tid"
* #a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 "Ikke yderligere behov (fagperson-vurderet)" "Fagperson vurderer, at borger ikke har yderligere behov og afslutter derfor før tid"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 "Aktivt fravalg" "Borger har behov, men har foretaget et aktivt fravalg"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #0cd5734d-b663-47c6-a3da-6b14a937d144 "Aktivt fravalg pga. anden sygdom" "Borger har behov, men har foretaget et aktivt fravalg pga. anden sygdom"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #f8436c2e-af1c-44fe-939d-473b518dd01d "Aktivt fravalg pga. økonomi ifm. transport" "Borger har behov, men har foretaget et aktivt fravalg pga. den omkostning der er forbundet med transport til det sted indsatsen tilbydes"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #8371b769-4bfb-4ac8-b130-d91c54784a56 "Aktivt fravalg pga. logisik ifm. transport" "Borger har behov, men har foretaget et aktivt fravalg pga. den logistiske udfordring det er mht. transport, at nå frem til det sted indsatsen tilbydes"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #a3f2bd01-078b-486e-81be-797d192ad7bd "Aktivt fravalg pga. anden træning" "Borger har behov, men har foretaget et aktivt fravalg fordi han/hun er påbegyndt træning i andet regi fx fitnesscenter"
* #2865f123-15a7-4a36-a514-32ea37c400ca "gruppebaseret indsats"
* #8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "individuel indsats"


ValueSet: CancellationTypes
Id: CancellationTypes
Title: "CancellationTypes"
Description: "Cancellation valueset, to be implemented in KL-term and FKI"
* Tempcodes#4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf // "Ikke yderligere behov (borger-vurderet)"
* Tempcodes#a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 //"Ikke yderligere behov (fagperson-vurderet)"
* Tempcodes#3a5a72b7-addf-4857-b80c-04e4246e3072 //"Aktivt fravalg"
* Tempcodes#0cd5734d-b663-47c6-a3da-6b14a937d144 //"Aktivt fravalg pga. anden sygdom"
* Tempcodes#f8436c2e-af1c-44fe-939d-473b518dd01d //"Aktivt fravalg pga. økonomi ifm. transport"
* Tempcodes#8371b769-4bfb-4ac8-b130-d91c54784a56 //"Aktivt fravalg pga. logisik ifm. transport"
* Tempcodes#a3f2bd01-078b-486e-81be-797d192ad7bd //"Aktivt fravalg pga. anden træning"

ValueSet: ExtendedEncounterTypes
Id: ExtendedEncounterTypes
Title: "ExtendedEncounterTypes"
Description: "Extension on encountertype valueset, to be implemented in KL-term and FKI"
* ^experimental = false
* include codes from valueset http://fhir.kl.dk/term/ValueSet/KLEncounterTypes
* Tempcodes#7273c0b7-1a0d-4c4a-a202-c014b1ddd4a0

ValueSet: InterventionTypes
Id: InterventionTypes
Title: "InterventionTypes"
Description: "A type stating whether the intervention id groups based or indivudual"
* ^experimental = false
* Tempcodes#2865f123-15a7-4a36-a514-32ea37c400ca "gruppebaseret indsats"
* Tempcodes#8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "individuel indsats"

ValueSet: ServiceTypes140119
Id: ServiceTypes140119
Title: "ServiceTypes"
Description: "The service types allowed in §140 and §119" 
* ^experimental = false
* $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592	//Træning
* $KLCommonCodes#a71921ea-fe83-441d-933b-cc21d0b3c8c3	//Sundhedsfremme og forebyggelse

ValueSet: KLConditionCodesRP
Title: "KLTilstandKoderRehab_forebyggelse"
Description: "Danish municipality FSIII condition codes for rehabilitation and prevention"
* ^experimental = false
* codes from valueset http://fhir.kl.dk/term/ValueSet/KLConditionCodesTheraphy
* codes from valueset http://fhir.kl.dk/term/ValueSet/KLConditionCodesPrevention

ValueSet: KLInterventionsRP
Title: "KLIndsatserFSIII" 
Description: "Interventions as described by FSIII"
* ^experimental = false
* codes from valueset http://fhir.kl.dk/term/ValueSet/KLTrainingInterventionsFSIII
* codes from valueset http://fhir.kl.dk/term/ValueSet/KLPreventionInterventionsFSIII