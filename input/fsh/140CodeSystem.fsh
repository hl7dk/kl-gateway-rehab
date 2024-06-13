// CodeSystem: Tempcodes
// Id: Tempcodes
// Title: "Tempcodes"
// Description: "Tempcodes to be implemented in KL-term"
// * ^experimental = false
// * ^caseSensitive = true
// * #ef491570-7884-4acd-bcf7-43d6b2c64762 "Borger har ikke henvendt sig eller er udeblevet"
// * #ffd81f78-352e-4589-a195-5350dd1df2a4 "almen" "Midlertidig kopi af MedComs kode for genoptræning på alment niveau, som specificeret af den gode genoptræningsplan, https://svn.medcom.dk/svn/releases/Standarder/National%20Sygehus-Kommunesamarbejde/GGOP/Dokumentation/GGOP.pdf"
// * #0c8e2bfc-1350-45d1-90da-c07e2645d073 "specialiseret" "Midlertidig kopi af MedComs kode for genoptræning på specialieret niveau, som specificeret af den gode genoptræningsplan, https://svn.medcom.dk/svn/releases/Standarder/National%20Sygehus-Kommunesamarbejde/GGOP/Dokumentation/GGOP.pdf"
// * #83c89857-8fb8-4163-97b1-eb1a56345c29 "rehabilitering" "Midlertidig kopi af MedComs kode for rehabilitering på specialiseret niveau, som specificeret af den gode genoptræningsplan, https://svn.medcom.dk/svn/releases/Standarder/National%20Sygehus-Kommunesamarbejde/GGOP/Dokumentation/GGOP.pdf"
// * #8b962281-2ab6-4b10-9c91-4bac592d6d49 "basal" "Almen genoptræning på basalt niveau"
// * #b679c454-2da2-46dd-9425-0e52d4aa2bf3 "avanceret" "Almen genoptræning på avanceret niveau"
// * #f64b8f5e-8ced-4a8b-ab73-8994fb524915 "Anden kommmune" "Overgivet til anden kommune, på borgers anmodning"
// * #a8632e22-bf0c-4f5a-92a7-70977ba104d5 "Udskudt" "Udskudt opstart påkrævet som specificeret i GGOP"
// * #3796fa11-305f-47d6-b164-45b05489afb2 "FritValg" "Overgået til FritValg"
// * #8ac7be88-5d16-4dbd-a61a-ab02673f4b34 "Fejl" "Fejlafsendt GGOP"
// * #46a6bc1f-bfe8-4390-a71f-44ad4a384b9d "FritValg afslået" "borger tilbudt fritValg, men vil hellere vente"

ValueSet: ServiceRequestStatusReasons140
Id: ServiceRequestStatusReasons140
Title: "ServiceRequestStatusReasons"
Description: "Status Reason codes as used in §140 rehabilitation"
* ^experimental = false
* $KLCommonCodes#f64b8f5e-8ced-4a8b-ab73-8994fb524915 //"Anden kommmune" "Overgivet til anden kommune, på borgers anmodning"
* $KLCommonCodes#a8632e22-bf0c-4f5a-92a7-70977ba104d5 //"Udskudt" "Udskudt opstart påkrævet som specificeret i GGOP"
* $KLCommonCodes#3796fa11-305f-47d6-b164-45b05489afb2 //"FritValg" "Overgået til FritValg"
* $KLCommonCodes#8ac7be88-5d16-4dbd-a61a-ab02673f4b34 //"Fejl" "Fejlafsendt GGOP"
* $KLCommonCodes#46a6bc1f-bfe8-4390-a71f-44ad4a384b9d //"FritValg afslået" "borger til

ValueSet: ServiceRequestTypes140
Id: ServiceRequestTypes140
Title: "ServiceRequestTypes"
Description: "The type of ServicRequest (GGOP), as defined by MedCom, supplemented by the two municipality specific types"
* ^experimental = false
* $KLCommonCodes#ffd81f78-352e-4589-a195-5350dd1df2a4 //almen
* $KLCommonCodes#8b962281-2ab6-4b10-9c91-4bac592d6d49 //"basal" "Almen genoptræning på basalt niveau"
* $KLCommonCodes#b679c454-2da2-46dd-9425-0e52d4aa2bf3 //"avanceret" "Almen genoptræning på avanceret niveau"
* $KLCommonCodes#0c8e2bfc-1350-45d1-90da-c07e2645d073 //specialiseret
* $KLCommonCodes#83c89857-8fb8-4163-97b1-eb1a56345c29 //rehabilitering

ValueSet: DeliveryTypes140
Id: DeliveryTypes140
Title: "DeliveryTypes"
Description: "The delivery context types allowed in §140 rehabilitation"
* ^experimental = false
* include codes from system $KLCommonCodes where concept descendent-of #3f79cee2-b148-4f2c-9cbd-387820e74685


ValueSet: CancellationTypes
Id: CancellationTypes
Title: "CancellationTypes"
Description: "Cancellation valueset, to be implemented in KL-term or MedCom-term"
* ^experimental = false
* $KLCommonCodes#4bbf6d6a-a1c6-41c2-b8c1-7352b7378adf //"Ikke yderligere behov (borger-vurderet)"
* $KLCommonCodes#a63b6aa6-7d56-4e67-a5b3-d73f6d262af5 //"Ikke yderligere behov (fagperson-vurderet)"
* $KLCommonCodes#3a5a72b7-addf-4857-b80c-04e4246e3072 //"Aktivt fravalg"
* $KLCommonCodes#0cd5734d-b663-47c6-a3da-6b14a937d144 //"Aktivt fravalg pga. anden sygdom"
* $KLCommonCodes#f8436c2e-af1c-44fe-939d-473b518dd01d //"Aktivt fravalg pga. økonomi ifm. transport"
* $KLCommonCodes#8371b769-4bfb-4ac8-b130-d91c54784a56 //"Aktivt fravalg pga. logistik ifm. transport"
* $KLCommonCodes#a3f2bd01-078b-486e-81be-797d192ad7bd //"Aktivt fravalg pga. anden træning"
* $KLCommonCodes#82e99421-31da-4915-96ed-168ccfa1d20c //"Hændelse medfører ophør"
* $KLCommonCodes#ef491570-7884-4acd-bcf7-43d6b2c64762 //"Borger har ikke henvendt sig eller er udeblevet"


ValueSet: CarePlanCategories140
Id: CarePlanCategories140
Title: "CarePlanCategories"
Description: "The care plan categories usefull for §140"
* ^experimental = false
* $KLCommonCodes#4863001e-14c7-4be8-a2da-e4f21a4b6ac4 //"Opfølgningsforløb efter §140"
* $KLCommonCodes#f15b2663-94d9-4d0c-a5de-d8bd8e1e4ebb //"Interventionsforløb efter §140"


ValueSet: ServiceTypes140
Id: ServiceTypes140
Title: "ServiceTypes"
Description: "The service types allowed in §140" 
* ^experimental = false
* $KLCommonCodes#7fc66c15-0cb3-4c89-9e18-f3a01e6a6592	//Træning

ValueSet: Conditions140
Id: Conditions140
Title: "§140 tilstande"
Description: "Danish municipality theraphy condition codes, exclusions ensure that simplification is respected"
* ^experimental = false
* include codes from valueset http://fhir.kl.dk/term/ValueSet/KLConditionCodesTheraphy //50 koder minus 33 altså 17
* exclude $FSIII#0c126894-60e1-4781-96b7-9b227677bfb6 // Vaske sig 
* exclude $FSIII#dc2691db-fcc5-406f-a790-3c1f2f91c6b9 //Kropspleje
* exclude $FSIII#cffd4ef7-0282-4a68-a542-bae128172047 //Gå på toilet
* exclude $FSIII#1e199483-7201-43ef-a685-7fee7f4398ce //Af- og påklædning
* exclude $FSIII#a05628c5-0128-42f7-844c-0f8261041328 //Spise og drikke
* exclude $FSIII#91fbebf5-9cd2-4a95-ab7f-3e94e635253e //Varetage egen sundhed
* exclude $FSIII#2a641de6-1017-4647-a0fb-c3c8b7b1f43e //Ændre og opretholde kropsstilling
* exclude $FSIII#3f27a7bc-790d-444e-bcf4-6e22a6b1da7e //Gang og bevægelse
* exclude $FSIII#713fcbca-3776-4fb5-b423-2b82fcab7865 //Håndtere genstande
* exclude $FSIII#271c791c-7b6e-4a43-bf2f-d2a815386749 //Færden med transportmidler
* exclude $FSIII#3bba13c9-c429-408e-b82c-3f2bf25b8d39 //Læring og anvendelse af viden
* exclude $FSIII#a2e013fb-7c91-4c5a-90c6-d119ff3e0ce8 //Udføre daglige rutiner
* exclude $FSIII#5f2310b3-cad1-43f6-9dc7-d982da141860 //Varetage beskæftigelse
* exclude $FSIII#73642409-bcd7-41b7-a2ed-50ae37352167 //Varetage uddannelse
* exclude $FSIII#9c2c29fb-4df7-4be4-a72f-383b488d575d //Deltage i fritidsaktiviteter og fællesskaber
* exclude $FSIII#04d9580e-669a-42d5-b20f-3c651ad5b8bf //Samspil og kontakt
* exclude $FSIII#396c3048-410b-46a8-89e6-ba89cd0e8fda //Muskelfunktion
* exclude $FSIII#3c366bd0-0c87-4f2d-a755-0fba564c7a9d //Ledfunktion
* exclude $FSIII#d6a26f74-bff7-40e0-95d5-0b382119ad6d //Koordination
* exclude $FSIII#2d3a12d0-c0d9-4702-a96e-1d7824c80c6c //Sanser
* exclude $FSIII#40cbf3ef-9ec0-4795-bb3b-ea7c788b49e2 //Smerter
* exclude $FSIII#1b5ad154-d22c-4949-a5db-c01ccefd64d9 //Balance
* exclude $FSIII#95fbdaed-00a4-461e-961d-629322c89914 //Orienteringsevne
* exclude $FSIII#36248229-67ac-4f5a-9446-b72c7208e34d //Opmærksomhed
* exclude $FSIII#87a689e9-fe3b-4696-a15f-07b7be8fecf4 //Psykomotoriske funktioner
* exclude $FSIII#d377b371-64f5-416c-93f3-852e437ae1cb //Følelsesfunktioner
* exclude $FSIII#2c99f93c-4459-471d-a6b8-303d32c15ed6 //Overordnede kognitive funktioner
* exclude $FSIII#eec8fc0a-7a30-49ea-ba3d-1c1d3cb50bfb //Oplevelse af egen krop
* exclude $FSIII#fa0028ca-72c5-4180-aefe-7b696698b196 //Respiration
* exclude $FSIII#a2253dcc-4806-4491-af3a-373344a70ccc //Cirkulation
* exclude $FSIII#acb817ea-63aa-4d7e-aa67-f557c73f7c8a //Udholdenhed
* exclude $FSIII#65ca1484-390b-4f1e-ba14-86a170ba75b9 //Ødem
* exclude $FSIII#c0624874-bdd4-4879-99c5-3a7330f83cc9 //Fødeindtagelse