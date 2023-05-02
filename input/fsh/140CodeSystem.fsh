CodeSystem: Tempcodes
Id: Tempcodes
Title: "Tempcodes"
Description: "Tempcodes to be implemented in KL-term"
//* #7273c0b7-1a0d-4c4a-a202-c014b1ddd4a0 "Første kontakt i forløb"
* ^experimental = false
* ^caseSensitive = true
* #4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf "Ikke yderligere behov (borger-vurderet)""Borger vurderer, at han/hun ikke har yderligere behov og afslutter derfor før tid"
* #a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 "Ikke yderligere behov (fagperson-vurderet)" "Fagperson vurderer, at borger ikke har yderligere behov og afslutter derfor før tid"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 "Aktivt fravalg" "Borger har behov, men har foretaget et aktivt fravalg"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #0cd5734d-b663-47c6-a3da-6b14a937d144 "Aktivt fravalg pga. anden sygdom" "Borger har behov, men har foretaget et aktivt fravalg pga. anden sygdom"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #f8436c2e-af1c-44fe-939d-473b518dd01d "Aktivt fravalg pga. økonomi ifm. transport" "Borger har behov, men har foretaget et aktivt fravalg pga. den omkostning der er forbundet med transport til det sted indsatsen tilbydes"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #8371b769-4bfb-4ac8-b130-d91c54784a56 "Aktivt fravalg pga. logistik ifm. transport" "Borger har behov, men har foretaget et aktivt fravalg pga. den logistiske udfordring det er mht. transport, at nå frem til det sted indsatsen tilbydes"
* #3a5a72b7-addf-4857-b80c-04e4246e3072 #a3f2bd01-078b-486e-81be-797d192ad7bd "Aktivt fravalg pga. anden træning" "Borger har behov, men har foretaget et aktivt fravalg fordi han/hun er påbegyndt træning i andet regi fx fitnesscenter"
* #82e99421-31da-4915-96ed-168ccfa1d20c "Hændelse medfører ophør" "En hændelse i borger liv medfører at indsatsen nødvendigvis må ophøre. En hændelse kan fx være flytning til en anden kommune, en hospitalsindlæggelse eller en helbredsmæssig forværring der efter faglig vurdering gør gentræningen umulig"
* #029cb8af-08d5-4b8f-a911-7dfcb7c27483 "ADL-træning på hold"
* #aeb3d2b2-a551-4c3a-86e2-d165c1aaf350 "ADL-træning individuelt"
* #8728bce0-90c7-40c8-8c2f-f5c266dad02d "Fysisk træning på hold"
* #fb26c466-14c9-49a1-b69b-a6339f3890e4 "Fysisk træning individuelt"
* #c6192bb0-266f-43de-976d-e78335c5be0b "Funktionstræning på hold"
* #5002d3be-ee05-4ff7-9fd4-a0d815bd6cbd "Funktionstræning individuelt"
* #6f1107a4-25d3-4d9a-bf35-bd1cf472d183 "Kognitiv træning på hold"
* #7d877253-e385-405c-8822-7fc3d2e7f3b0 "Kognitiv træning individuelt"
* #e5802281-a895-4a3f-868f-c50f1759cc00 "Psykomotorisk træning på hold"
* #8d9eb012-0f2e-4e3f-8ac9-8f3d87cfdc3b "Psykomotorisk træning individuelt"
* #4dbd9b85-8b89-45de-bf6f-9509aa122089 "Vejledning og undervisning på hold"
* #0a995193-b6ab-413b-8692-3456992807d6 "Vejledning og undervisning individuelt"
* #722cb0e4-0e21-4442-af04-fe5e4ce4c540 "Opfølgning på hold"
* #31de6eb9-eae2-4759-81c4-8e2323c73101 "Opfølgning individuelt"
* #4863001e-14c7-4be8-a2da-e4f21a4b6ac4 "Opfølgningsforløb efter §140 genoptræning"

//* #2865f123-15a7-4a36-a514-32ea37c400ca "gruppebaseret indsats"
//* #8d12d74c-17da-47a7-a4fe-e69dbaec0a8c "individuel indsats"


ValueSet: CancellationTypes
Id: CancellationTypes
Title: "CancellationTypes"
Description: "Cancellation valueset, to be implemented in KL-term and FKI"
* ^experimental = false
* Tempcodes#4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf //"Ikke yderligere behov (borger-vurderet)"
* Tempcodes#a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 //"Ikke yderligere behov (fagperson-vurderet)"
* Tempcodes#3a5a72b7-addf-4857-b80c-04e4246e3072 //"Aktivt fravalg"
* Tempcodes#0cd5734d-b663-47c6-a3da-6b14a937d144 //"Aktivt fravalg pga. anden sygdom"
* Tempcodes#f8436c2e-af1c-44fe-939d-473b518dd01d //"Aktivt fravalg pga. økonomi ifm. transport"
* Tempcodes#8371b769-4bfb-4ac8-b130-d91c54784a56 //"Aktivt fravalg pga. logistik ifm. transport"
* Tempcodes#a3f2bd01-078b-486e-81be-797d192ad7bd //"Aktivt fravalg pga. anden træning"
* Tempcodes#82e99421-31da-4915-96ed-168ccfa1d20c //"Hændelse medfører ophør"


ValueSet: CarePlanCategories140
Id: CarePlanCategories140
Title: "CarePlanCategories"
Description: "The care plan categories usefull for §140"
* ^experimental = false
* Tempcodes#4863001e-14c7-4be8-a2da-e4f21a4b6ac4 //"Opfølgningsforløb efter §140 genoptræning"
* $KLCommonCodes#ddd2f670-5ec7-4f9c-9a2c-aee25cb133bf //genoptræning efter 140


// ValueSet: ExtendedEncounterTypes
// Id: ExtendedEncounterTypes
// Title: "ExtendedEncounterTypes"
// Description: "Extension on encountertype valueset, to be implemented in KL-term and FKI"
// * ^experimental = false
// * include codes from valueset http://fhir.kl.dk/term/ValueSet/KLEncounterTypes
//* Tempcodes#7273c0b7-1a0d-4c4a-a202-c014b1ddd4a0

ValueSet: ServiceTypes140
Id: ServiceTypes140
Title: "ServiceTypes"
Description: "The service types allowed in §140" 
* ^experimental = false
* $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592	//Træning

ValueSet: KLInterventionCodes140
Id: KLInterventionCodes140
Title: "KLInterventionCodes140"
* ^experimental = false
* $FSIII#1130ad70-6553-490d-87f8-5e8941687a0c //Terapeutfaglig udredning
* $FSIII#f8ac963c-6ec5-4ec5-bd90-a22fea4e2d16 //Manuel behandling
* $FSIII#ba3e17bd-d4aa-4848-acad-25adc8285c19 //Koordinering og kommunikation

ValueSet: KLInterventionCodes140temp
Id: KLInterventionCodes140temp
Title: "KLInterventionCodes140temp"
* ^experimental = false
* Tempcodes#029cb8af-08d5-4b8f-a911-7dfcb7c27483 //"ADL-træning på hold"
* Tempcodes#aeb3d2b2-a551-4c3a-86e2-d165c1aaf350 //"ADL-træning individuelt"
* Tempcodes#8728bce0-90c7-40c8-8c2f-f5c266dad02d //"Fysisk træning på hold"
* Tempcodes#fb26c466-14c9-49a1-b69b-a6339f3890e4 //"Fysisk træning, individuelt"
* Tempcodes#c6192bb0-266f-43de-976d-e78335c5be0b //"Funktionstræning på hold"
* Tempcodes#5002d3be-ee05-4ff7-9fd4-a0d815bd6cbd //"Funktionstræning individuelt"
* Tempcodes#6f1107a4-25d3-4d9a-bf35-bd1cf472d183 //"Kognitiv træning på hold"
* Tempcodes#7d877253-e385-405c-8822-7fc3d2e7f3b0 //"Kognitiv træning individuelt"
* Tempcodes#e5802281-a895-4a3f-868f-c50f1759cc00 //"Psykomotorisk træning på hold"
* Tempcodes#8d9eb012-0f2e-4e3f-8ac9-8f3d87cfdc3b //"Psykomotorisk træning individuelt"
* Tempcodes#4dbd9b85-8b89-45de-bf6f-9509aa122089 //"Vejledning og undervisning på hold"
* Tempcodes#0a995193-b6ab-413b-8692-3456992807d6 //"Vejledning og undervisning individuelt"
* Tempcodes#722cb0e4-0e21-4442-af04-fe5e4ce4c540 //"Opfølgning på hold"
* Tempcodes#31de6eb9-eae2-4759-81c4-8e2323c73101 //"Opfølgning individuelt"
