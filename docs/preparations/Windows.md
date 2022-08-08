Om een Windows computer leeg te halen maar tegelijk de Windows installatie te kunnen hergebruiken, doorlopen we de volgende stappen. Je gaan een flinke USB stick (waarschijnlijk 16 GB of groter) of externe harde schijf nodig hebben.

# Benodigdheden
Onderstaande moet je vast klaarleggen om een Windows computer klaar te maken:
- usb stick met CloneZilla
- grote usb stick (meer dan 16 GB) of externe harde schijf
- usb stick met Lubuntu

# Herstellen naar fabrieksinstellingen.
Eerst moet het apparaat hersteld worden naar fabrieksinstellingen. Als dit niet kan voor dit apparaat, dan kan de Windows installatie niet behouden blijven. Dan is dit apparaat nog steeds wel geschikt om er Lubuntu op te zetten.

Herstellen naar fabrieksinstellingen doe je zo:
1. Start de pc/laptop op.
2. Start de laptop opnieuw op, maar houd de SHIFT toets ingedrukt terwijl je op 'opnieuw opstarten' klikt.
3. Kies 'problemen oplossen'.
4. Kies 'deze pc opnieuw instellen'.
5. Kies 'alles verwijderen'.
6. Kies 'lokaal opnieuw installeren'.
7. Kies 'het station volledig opschonen'.
8. Kies 'opnieuw instellen'.

De laptop is vervolgens bezig met herstellen naar fabrieksinstellingen. Zodra dit gereed is moet je de laptop instellen:
1. Doorloop de eerste paar stappen (die spreken voor zich)
2. Zodra je een account moet gaan instellen, moeten we even opletten. We willen namelijk NIET met een Microsoft account instellen.
    - Kies 'instellen voor persoonlijk gebruik'
    - Vul als emailadres in 'gebruiker'. Dan slaat Windows de modus voor Microsoft account over.
    - Kies in de stappen voor 'services' steeds de minimale opties.
3. Wacht totdat Windows geheel is opgestart.

# Windows installatie backuppen
We moeten de Windows installatie backuppen, zodat we deze later terug kunnen zetten.

1. Stop de USB stick met CloneZilla in de laptop.
2. Start de laptop opnieuw op, maar houd de SHIFT toets ingedrukt terwijl je op 'opnieuw opstarten' klikt.
3. Kies 'problemen oplossen'.
4. Kies 'geavanceerde opties'.
5. Als daar iets staat over 'UEFI' dan kies je die. Anders sluit je de laptop af en moet je starten en de knopjes indrukken om in BIOS te komen.
6. Zorg daar dat er eerst vanaf USB stick wordt opgestart, en herstart zodat je CloneZilla start.
7. Kies de standaard taal en toetsenbord indeling.
8. Start clonezilla in de device-image modus, variant local_dev
9. Sluit de grote USB stick of externe harde schijf aan en ga verder. Druk pas op CTRL + C zodra deze herkend is en in het lijstje staat.
10. Kies deze als /home/partimag
11. Kies een plek waar de backup mag worden neergezet.
12. Ga verder in Beginner modus
13. Kies savedisk en de rest wijst zichzelf
14. Na afloop computer afsluiten en externe harde schijf danwel grote USB stick verwijderen.

# Schijf wissen

1. Start op vanaf de Lubuntu USB stick.
2. Bepaal de stationsnaam om te wissen, bijvoorbeeld met GParted. In de voorbeelden hierna is dat steeds /dev/sdb
3. Bekijk eerst met `sudo hdparm -I /dev/sdb` of het station niet gelocked of frozen is.
4. Als het station frozen is, dan doe je dit:
    1. Draai `sudo systemctl suspend`
    2. Wacht 1 minuut
    3. Zet de laptop weer aan en herhaal stap 3.
5. Zet een tijdelijk wachtwoord met `sudo hdparm --user-master u --security-set-pass Eins /dev/sdb'`
6. Wis het station met `sudo time hdparm --user-master u --security-erase Eins /dev/sdb`
7. Controleer het station na afloop met `sudo hdparm -I /dev/sdb`
8. Zet de computer weer uit.

# Windows installatie terugzetten

1. Start de computer op met de CloneZilla USB stick.
2. Kies de standaard taal en toetsenbord indeling.
3. Start clonezilla in de device-image modus, variant local_dev
4. Sluit de grote USB stick of externe harde schijf aan en ga verder. Druk pas op CTRL + C zodra deze herkend is en in het lijstje staat.
5. Kies deze als /home/partimag
6. Kies de plek waar de backup staat.
7. Ga verder in Beginner modus.
8. Kies restoredisk en de rest wijst zichzelf.
9. Na afloop computer afsluiten en alle externe harde schijven en USB sticks verwijderen.

# Windows voorzien van software
1. Start Windows normaal op en maak indien nodig verbinding met WIFI.
2. Zorg dat Windows updates ook updates voor andere Microsoft producten installeert (zie geavanceerde opties bij Windows update)
3. Installeer alle beschikbare updates.
4. Open Microsoft Store en installeer daar alle beschikbare updates.
5. Open een PowerShell terminal met administrator rechten
    1. Voer eerst `Set-ExecutionPolicy Bypass -Scope Process` uit
    2. Voer vervolgens het script `windows-packages.ps` uit

# Gebruikershandleiding aanvullen en uitprinten