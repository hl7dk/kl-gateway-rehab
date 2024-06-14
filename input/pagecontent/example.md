
This page describes subsequent delivery reports for the citizen Ruddi Test Berggren.
For each delivery report the story is told (in Danish), and a reporting example is given.

### First Event May 23rd, 2022

#### Story
Ruddis forløb er startet ved at der er sendt en GGOP fra Holbæk sygehus’ ortopædkirurgiske afdeling, med en anmodning om, at Holbæk kommune skal forestå §140 genoptræning.
Den modtages og behandles d. 23. maj 2022 af Holbæk kommunes genoptræningscenter SOR: 1037801000016003. GGOP'en angiver aktionsdiagnosen til ’Pertrokantær femurfraktur', typen af GGOP er angivet til 'almen' og forventet udskrivningsdato til 24. maj 2022.
I kommunens modtage-enhed vurderes GGOP'en, og det planlægges at igangsætte Ruddis forløb d. 28. maj, som derved ligger indenfor 7-dages ventetidsgarantien. Typen af genoptræning specificeres af kommunen som 'basal'.
I første omgang planlægges en terapeutfaglig udredning.

#### Reporting
A delivery report is generated containing the Citizen, two Organization  (The sender of the GGOP and the one delivering the intervention), a FocusCondition, a ServiceRequest and a PlannedIntervention.

The report for this is found here: [DeliveryReport-Ruddi-1](Bundle-e87d5e68-e5f3-476f-988f-4efda86b0645.html)

### Second Event May 28th, 2022

#### Story
Der gennemføres en terapeutfaglig udredning – hvor der beskrives udfordringer på tilstandene 'Mobilitet og bevæge sig' og 'forflytte sig'.
På denne baggrund planlægges et træningsforløb med indsatsen 'fysisk træning'. Da den terapeutfaglig udredning hermed er gennemført, afsluttes indsatsen 'Terapeutfaglig udredning'.

#### Reporting
A delivery report is generated containing the Citizen, two Organizations  (The sender of the GGOP and the one delivering the intervention), a FocusCondition, and a ServiceRequest. These are not updated from last time, but they are reported because the new content references these instances.

The delivery report also contains the updated PlannedIntervention (Terapeutfaglig udredning).

The new content in the delivery report is an Enconter (Terapeutfaglig udredning), two Conditions, a CarePlan (træningsforløb) and a PlannedIntervetion (fysisk træning).

The report for this is found here: [DeliveryReport-Ruddi-2](Bundle-4b9443a2-7231-4387-8e3d-614bf193df49.html)

### Events three to six May 31st to June 21st, 2022

#### Story
Ruddi gennemfører første træning d. 31. maj. Herefter fremmøder Ruddi til 4 gange træning af 60 min. Dette medfører en indberetning til FKGateway af tid forbrugt på kontakterne.

De fire rapporter vil være næsten ens, og derfor er det udelukkende rapporten fra 21. juni, der vises her. Læg mærke til at rapporten ikke indeholder tidligere indberettede kontakter - det er fordi de hverken ændrer sig eller refereres.

#### Reporting
A delivery report is generated containing the Citizen, two Organizations  (The sender of the GGOP and the one delivering the intervention), a FocusCondition, a ServiceRequest and a CarePlan (træningsforløb). These are not updated from last time, but they are reported because the new content references these instances.

The new content in the delivery report is an Enconter (delivery of træningsforløb).

The report for this is found here: [DeliveryReport-Ruddi-6](Bundle-4a391f69-a909-4a79-92bd-1b0f812dc52a.html)

### Seventh event June 22nd

#### Story
En terapeut planlægger et træningsforløb med indsatserne 'fysisk træning' og 'funktionstræning', og ved en fejl gør hun det i Ruddis journal, i stedet for Peters journal. Fejlen sker fordi Ruddi var den sidste borger hun havde, og hun glemte at lukke hans journal ned. Da fejlen ikke er opdaget endnu, indrapporters de som et nyt indsatsforløb i Ruddis journal.

#### Reporting
A delivery report is generated containing the Citizen, one Organizations  (the one delivering the intervention). These are not updated from last time, but they are reported because the new content references these instances.

The new content in the delivery report is an a CarePlan (træningsforløb) and two PlannedInterventions.

The report for this is found here: [DeliveryReport-Ruddi-7](Bundle-9960b8dc-5ebf-4166-83d7-b042bcc6aca5.html)

### Eighth event June 23rd

#### Story
Ruddi oplever markant bedring og ønsker at afslutte træning, da han har mulighed for at fortsætte i det lokale træningscenter. Terapeuten afslutter Ruddis tilstande, træningsforløb og indsatser og det noteres i journalen, at Ruddi ønsker at afslutte den kommunale genoptræningen grundet anden træning.

I forbindelse med at terapeuten er inde i journalen opdager hun at Peters indsatser er lagt ind ved en fejl. De slettes/fejl-registreres i journalen.

#### Reporting
A delivery report is generated containing the Citizen, two Organizations  (The sender of the GGOP and the one delivering the intervention), a FocusCondition, and a ServiceRequest. These are not updated from last time, but they are reported because the updated content references these instances.

The updated content in the delivery report is Ruddis CarePlan, PlannedIntervention, and two Conditions. They are all ended. In addition, the error with Peters data results in an update of his CarePlan and two PlannedInterventions, with status changed to entered-in-error.  

The report for this is found here: [DeliveryReport-Ruddi-8](Bundle-c2f75bbf-2027-41bf-b597-de5e242f2b3d.html)



