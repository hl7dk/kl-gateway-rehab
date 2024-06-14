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
Description: "Danish municipality theraphy condition codes"
* ^experimental = false
* $FSIII#2bd07f7c-e6bb-424b-ab8f-f7c1de2afe80 // Lave mad
* $FSIII#b53bca74-fd3f-4127-89ae-1a39d7836b93 // Lave husligt arbejde
* $FSIII#bd088375-65fc-4e1d-9a8b-78dc918e6581 // Indkøb
* $FSIII#86e1982c-f459-4658-9071-e4bf3453a687 // Forflytte sig
* $FSIII#dd41df82-3c13-4523-b9c5-e83676425299 // Mobilitet og bevægelse
* $FSIII#243ae4ae-4e36-4192-88cb-399711ac3766 // Personlig pleje
* $FSIII#290baa56-5d8c-40a6-b40c-1de05649f0d1 // Spise og drikke
* $FSIII#6a2c3341-c13e-4638-961d-72ba0fe29a80 // Sundhedskompetence	
* $FSIII#064f983b-5ec5-40a3-bc90-c3fcec6b6ef5 // Kommunikation		
* $FSIII#1d9759c6-6526-4d07-994a-5dee3fa65177 // Energi og handlekraft		
* $FSIII#56860429-eabe-4d48-b8ad-d7f7b28f6df5 // Hukommelse		
* $FSIII#b16668ff-9c02-491e-b082-7b699d93f5bc // Kognitive funktioner		
* $FSIII#263a2c2f-7ae2-4264-8808-7e8216b1a118 // Sår og cicatriser		
* $FSIII#26b05040-94f3-4c8c-9ede-c7223bddf518 // Respiration og cirkulation		
* $FSIII#3c685f14-5d48-4b1c-a451-9da780e2b41c // Sanser og smerter		
* $FSIII#bbc99471-a9f3-41f1-a95b-6842abfb551a // Kontinens	
* $FSIII#c6f49b84-58af-43df-bb3e-0d6a67fa0aba // Bevægeapparat