CodeSystem: Tempcodes
Id: Tempcodes
Title: "Tempcodes"
Description: "Tempcodes to be implemented in KL-term"
* ^experimental = false
* ^caseSensitive = true
* #ef491570-7884-4acd-bcf7-43d6b2c64762 "Borger har ikke henvendt sig eller er udeblevet"
* #ffd81f78-352e-4589-a195-5350dd1df2a4 "almen" "Midlertidig kopi af MedComs kode for genoptræning på alment niveau, som specificeret af den gode genoptræningsplan, https://svn.medcom.dk/svn/releases/Standarder/National%20Sygehus-Kommunesamarbejde/GGOP/Dokumentation/GGOP.pdf"
* #0c8e2bfc-1350-45d1-90da-c07e2645d073 "specialiseret" "Midlertidig kopi af MedComs kode for genoptræning på specialieret niveau, som specificeret af den gode genoptræningsplan, https://svn.medcom.dk/svn/releases/Standarder/National%20Sygehus-Kommunesamarbejde/GGOP/Dokumentation/GGOP.pdf"
* #83c89857-8fb8-4163-97b1-eb1a56345c29 "rehabilitering" "Midlertidig kopi af MedComs kode for rehabilitering på specialiseret niveau, som specificeret af den gode genoptræningsplan, https://svn.medcom.dk/svn/releases/Standarder/National%20Sygehus-Kommunesamarbejde/GGOP/Dokumentation/GGOP.pdf"
* #8b962281-2ab6-4b10-9c91-4bac592d6d49 "basal" "Almen genoptræning på basalt niveau"
* #b679c454-2da2-46dd-9425-0e52d4aa2bf3 "avanceret" "Almen genoptræning på avanceret niveau"
* #f64b8f5e-8ced-4a8b-ab73-8994fb524915 "Anden kommmune" "Overgivet til anden kommune, på borgers anmodning"
* #a8632e22-bf0c-4f5a-92a7-70977ba104d5 "Udskudt" "Udskudt opstart påkrævet som specificeret i GGOP"
* #3796fa11-305f-47d6-b164-45b05489afb2 "FritValg" "Overgået til FritValg"
* #8ac7be88-5d16-4dbd-a61a-ab02673f4b34 "Fejl" "Fejlafsendt GGOP"
* #46a6bc1f-bfe8-4390-a71f-44ad4a384b9d "FritValg afslået" "borger tilbudt fritValg, men vil hellere vente"

ValueSet: ServiceRequestStatusReasons140
Id: ServiceRequestStatusReasons140
Title: "ServiceRequestStatusReasons"
Description: "Status Reason codes as used in §140 rehabilitation"
* ^experimental = false
* Tempcodes#f64b8f5e-8ced-4a8b-ab73-8994fb524915 //"Anden kommmune" "Overgivet til anden kommune, på borgers anmodning"
* Tempcodes#a8632e22-bf0c-4f5a-92a7-70977ba104d5 //"Udskudt" "Udskudt opstart påkrævet som specificeret i GGOP"
* Tempcodes#3796fa11-305f-47d6-b164-45b05489afb2 //"FritValg" "Overgået til FritValg"
* Tempcodes#8ac7be88-5d16-4dbd-a61a-ab02673f4b34 //"Fejl" "Fejlafsendt GGOP"
* Tempcodes#46a6bc1f-bfe8-4390-a71f-44ad4a384b9d //"FritValg afslået" "borger til

ValueSet: ServiceRequestTypes140
Id: ServiceRequestTypes140
Title: "ServiceRequestTypes"
Description: "The type of ServicRequest (GGOP), as defined by MedCom, supplemented by the two municipality specific types"
* ^experimental = false
* Tempcodes#ffd81f78-352e-4589-a195-5350dd1df2a4 //almen
* Tempcodes#8b962281-2ab6-4b10-9c91-4bac592d6d49 //"basal" "Almen genoptræning på basalt niveau"
* Tempcodes#b679c454-2da2-46dd-9425-0e52d4aa2bf3 //"avanceret" "Almen genoptræning på avanceret niveau"
* Tempcodes#0c8e2bfc-1350-45d1-90da-c07e2645d073 //specialiseret
* Tempcodes#83c89857-8fb8-4163-97b1-eb1a56345c29 //rehabilitering

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
* Tempcodes#ef491570-7884-4acd-bcf7-43d6b2c64762 //"Borger har ikke henvendt sig eller er udeblevet"


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

ValueSet: InterventionTypes140
Id: InterventionTypes140
Title: "InterventionTypes"
Description: "The type of intervention. Should be either group or individual"
* ^experimental = false
* include codes from system $KLCommonCodes where concept descendent-of #3f79cee2-b148-4f2c-9cbd-387820e74685



