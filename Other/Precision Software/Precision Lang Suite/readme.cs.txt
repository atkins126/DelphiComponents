Precision Language Suite 2.5
============================

Precision Language Suite je sada lokaliza�n�ch n�stroj� pro v�vojov� prost�ed�
Delphi a FreePascal/Lazarus. Umo��uje snadno vytv��et v�ce-jazy�n� aplikace ve
v�ech dostupn�ch r�mc�ch (VCL, FireMonkey, LCL, ...) a pro v�echny podporovan�
platformy (Win32, Win64, OSX, ...).

Produkt obsahuje:
* PLS Engine - lokaliza�n� funkce a komponenty, ur�en� pro za�azen� do zdrojov�ch k�d� Va�� aplikace
* PLS Editor - v�konn� n�stroj pro p��pravu jazykov�ch soubor�
* PLS Translator - bezplatn� verze editoru, ur�en� pro p�ekladatele Va�ich jazykov�ch soubor�

Precision Language Suite vyu��v� textov� form�t jazykov�ch soubor�, co� umo��uje
snadn� p�izp�soben� p�eklad� Va�� aplikace pot�eb�m konkr�tn�ho u�ivatele i bez
instalace speci�ln�ho software. Umo��uje tak� p�epnut� jazykov�ho �ezu p��mo za
b�hu aplikace.


PLS Engine:
-----------
Lokaliza�n� zdrojov� k�dy obsahuj� komponentu TplsController, kter� je ur�ena
pro snadnou implementaci PLS Enginu do Va�ich aplikac� a t��du TLanguageManager,
kter� (spolu s pomocn�m� metodami, funkcemi a prom�nn�mi) �e�� v�echny pot�ebn�
lokaliza�n� operace. Jejich pou�it� je velmi snadn�, a krom� toho, �e je pops�no
v dokumentaci, tak jeho konkr�tn� implementace je nab�zena tak� PLS Editorem,
coby "n�vrhy zdrojov�ch k�d�" pro dan� projekt.

Funkce "vestav�n� lokalizace" umo��uje lokalizaci Va�ich aplikac� p��mo za b�hu.
Pouh�m kliknut�m my�� lze vybrat prvek ve Va�� aplikaci a zadat jeho popisek
v aktu�ln� zvolen�m jazyce. Je vhodn� jak pro drobn� korektury, tak pro komplexn�
lokalizaci extern�m p�ekladatelem, anebo (v tzv. u�ivatelsk�m m�du) tak� pro
koncov� z�kazn�ky Va�ich aplikac�.


PLS Editor:
-----------
PLS Editor je ur�en pro pohodlnou p��pravu p�eklad� Va�ich aplikac�. Jeho sou��st�
je editace text� v�ech jazykov�ch �ez� v p�ehledn� tabulce, navig�tor polo�ek,
rychl� filtrace a vyhled�v�n�, mo�nost vyu�it� p�eddefinovan�ch identifik�tor�,
filtr� a vlastnost� pro lokalizaci, hromadn� nahrazen� text�, evidence Va�ich
projekt�, konrola pravopisu, a dal�� mo�nosti.

P�esto�e m��e b�t pou�it zcela nez�visle na v�vojov�m prost�ed� (lze zad�vat
libovoln�, i neexistuj�c� identifik�tory), nab�z� �adu n�stroj� pro zv��en�
efektivity pr�ce, jako nap�. synchronizace jazykov�ch soubor� se zdrojov�mi
soubory v�vojov�ho prost�ed�, p�enos komponent z formul��� pomoc� schr�nky do
lokaliza�n�ho projektu, n�vrhy zdrojov�ch k�d� pro implementaci lokalizace, apod.


PLS Translator:
---------------
Tento n�stroj je ur�en pro p�ekladatele Va�ich existuj�c�ch projekt�.
Oproti PLS Editoru m� ur�it� omezen�, ale je dod�v�n ZCELA ZDARMA.


Licence:
--------
PLS Engine je dod�v�n jako FREEWARE, podl�haj�c� pr�v�m a omezen�m uveden�m
v licen�n�mu ujedn�n�. PLS Editor a PLS Translator jsou dod�v�ny jako FREEWARE.
V�ce informac� naleznete v souboru License.txt.


Podporovan� v�vojov� prost�ed�:
-------------------------------
  Embarcadero Delphi/RAD Studio
  FreePascal/Lazarus IDE


Syst�mov� po�adavky pro PLS Editor a PLS Translator:
----------------------------------------------------
Hardware:
  IBM-kompatibiln� PC
    1 GB RAM
  240 MB voln�ho m�sta na disku (20 MB aplikace / 220 MB slovn�ky)

Opera�n� syst�m:
  Microsoft Windows 2000/XP/Vista/7/8


Instalace:
----------
Spus�te instal�tor a postupujte dle pokyn� pr�vodce. 
P�enosn� (portable) verze m��e b�t jednodu�e rozbalena do po�adovan� slo�ky.

Jeliko� jsou v�echny soubory z bal��ku Precision Language Suite instalov�ny
pod zvolenou slo�ku, vyberte pro instalaci takov� adres��, do kter�ho m�te
pr�vo z�pisu (tzn. nikoliv "C:\Program Files\", apod.). V opa�n�m p��pad�
nebudete moci zkompilovat p��klady, ulo�it zm�ny v p��kladov�ch projektech, apod.

Ve�ker� zdrojov� k�dy, dokumentace a p��klady najdete p��mo ve zvolen�m
instala�n�m um�st�n�. Odkaz na slo�ku "Source" dopl�te do nastaven�
Delphi (Library Path) a p��padn� tak� do souboru Dcc32.cfg (pokud pou��v�te
kompil�tor p��kazov� ��dky).

Komponentu TplsController nainstalujete do Va�eho prost�ed� Delphi (nebo Lazarus)
pomoc� p��slu�n�ho bal��ku, kter� naleznete v podslo�ce "Packages".

N�stroje PLS Editor (PrecisionLangSuite.exe) a PLS Translator (PLSTranslator.exe)
jsou um�st�ny v podslo�ce "Editor".

Na Windows Vista a vy���ch mus�te b�heme registrace produktu povolit zv��en�
p��stupov�ch pr�v na administr�torsk�.


Historie zm�n:
--------------
- Version 2.5.2 (30.9.2014)

  PLS Editor:
  * aktualizov�no: Definice knihovny t��d pro komponenty DevExpress
  
  PLS Engine:  
  * p�id�no: Podpora pro Delphi XE6 a XE7
  * opraveno: Na��t�n� vlastnost� polo�ek kolekc� (TCollectionItem), je� jsou sou��st� objekt� (TPersistent) pod��zen�ch c�lov� komponent�

- Verze 2.5 (20.10.2013)

  PLS Editor:
  * aktualizov�no: "Microsoft Terminology Collection" (nyn� je sou��st� instalace pln� rozsah tohoto slovn�ku)
  * p�id�no: Slovn�k "Precision Apps" (kolekce fr�z� a text� pou��van�ch v produktech Precision software & consulting)
  * vylep�eno: Funkce automatick�ch p�eklad� doznala velmi v�razn�ch vylep�en�:
       * Podpora pou�it� libovoln�ho po�tu slovn�k� najednou, v�etn� mo�nosti stanoven� priorit
  	   * Podpora pou�it� tzv. "API Keys" (autoriza�n�ch kl���) pro placen� p�ekladov� slu�by (kl��e jsou samoz�ejm� ulo�eny s pomoc� �ifrov�n�)
       * Podpora SSL komunikace pro webov� p�ekladov� slu�by
       * Lze definovat a pou��vat vlastn� p�edkladov� slu�by 
       * Jako slovn�ky lze pou��t soubory form�tu TMX (Translation Memory eXchange) 
       * Jako slovn�ky lze pou��t soubory form�tu TBX (TermBase eXchange) 
       * Po dokon�en� automatick�ho p�ekladu je k dispozici protokol s hl�en�mi a chybami
  	   * P�eklad jedn� lokaliza�n� polo�ky m��e b�t proveden pomoc� jednoho zvolen�ho slovn�ku (�i slu�by) a potvrzovac�ho dialogu
  	   * Automatick� p�eklad je nyn� k dispozici p��mo z edita�n�ho dialogu lokaliza�n� polo�ky
       * Pro v�echny pou�it� slovn�ky je nyn� pou�ita vyrovn�vac� pam� (pro rychlej�� zpracov�n� p�i dal��m p�ekladu)
  	   * P�ibyly nov� volby pro "Ulo�en� projektu jako slovn�ku" a "Otev�en� slovn�ku pro editaci"
  	   * Lep�� podpora automatick�ho p�ekladu text� obsahuj�c�ch form�tovac� makra (%d, %s, apod.)
  * p�id�no: Kontrola pravopisu (s vyu�it�m knihovny Hunspell)
  * p�id�no: Podpora pro skriptovateln� dopl�ky, v�etn� pln�ho rozhran� k funkc�m a dat�m PLS Editoru
  * p�id�no: Podpora u�ivatelsky definovan�ch dopl�k� (kter� mohou b�t ps�ny v JavaScriptu, VBScriptu, Pascal Scriptu, a dal��ch skriptovac�ch jazyc�ch)
             v�etn� pln�ho rozhran� k funkc�m a dat�m PLS Editoru, je� je dostupn� pomoc� OLE automatizace.
  * p�id�no: Spr�vce dopl�k� (pro u�ivatelsk� nastaven� pou��van�ch dopl�k�, kl�vesov�ch zkratek k nim, apod.)
  * p�id�no: N�stroj "Extension Editor" (pro tvorbu nov�ch dopl�k�)
  * p�id�no: Z�lo�ky na lokaliza�n� polo�ky
  * p�id�no: Tureck� lokalizace PLS Editoru
  * vylep�eno: Dialog pro vyhled�n� nyn� p�eb�r� v�choz� text z pol��ka pro filtrov�n� polo�ek
  * vylep�eno: Dialog pro vyhled�n� a nahrazen� textu nyn� obsahuje mo�nost br�t v �vahu (anebo ignorovat) identifik�tory polo�ek
  * vylep�eno: V poli pro filtrov�n� polo�ek nyn� m��ete pou��t kl�vesu Enter pro postupn� nastavov�n� se na jednotliv� polo�ky vyhovuj�c� filtru
  * opraveno: Skryt� sloupce (jazyky) ji� nejsou br�ny v �vahu p�i hled�n�, ani nahrazov�n� textu
  * vylep�eno: Byl implementov�n nov� analyz�tor (parser) zdrojov�ch soubor� formul��� (DFM, LFM, FMX), co� vy�e�ilo n�kter� drobn� chyby nalezen� v p�edchoz�ch verz�ch editoru
  * zm�n�no: Syntaxe sekce pro deklaraci zn�m�ch vlastnost� VCL komponent v souborech knihoven (.PLP). Nyn� je tato sekce ji� ignorov�na,
             tak�e pokud jste m�li definov�ny vlastn� t��dy a vlastnosti, definujte je pros�m znovu - v nov�m "Spr�vci knihovny t��d".
  * p�id�no: Spr�vce knihovny t��d - umo��uje pohodlnou editaci seznamu zn�m�ch a ignorovan�ch t��d komponent a jejich vlastnost�, je� jsou pou��v�ny p�i anal�ze zdrojov�ch soubor� formul��� (DFM, FMX, LFM)
  * p�id�no: Utilita "Class Library Generator" pro vytvo�en� �vodn�ho konceptu u�ivatelsk� knihovny t��d (pro anal�zu soubor� DFM/FMX/LFM) na z�klad� zadan�ch zdrojov�ch soubor� 
  * p�id�no: Podpora nov�ch verz� v�vojov�ho prost�ed� Delphi XE3, XE4 a XE5 (spr�vn� zpracov�n� jmenn�ch prostor� pro importy �et�zcov�ch konstant ze sekc� "resourcestring")
  * p�id�no: V�choz� jazyk projektu m��e b�t nyn� zm�n�n tak� pomoc� kliknut� prav�ho tla��tka my�i spolu s kl�vesou Shift na zvolen� sloupec jazyka
  * p�id�no: Z�hlav� sloupce v�choz�ho jazyka je nyn� zobrazeno tu�n� 
  * vylep�eno: Logick� �azen� indexovan�ch polo�ek (nap�. collections)
  * vylep�eno: Volba stylu zobrazen� "tag�"
  * p�id�no: "Tagy" mohou b�t nyn� p�i�azeny p��mo v dialogu pro editaci polo�ky
  * p�id�no: Popisky "tag�" (pro lep�� pochopen� jejich v�znamu)
  * p�id�no: Mo�nost p�i�adit do projektu v�echny zdrojov� soubory z vybran� slo�ky (v�etn� podslo�ek)
  * p�id�no: Indikace zm�n ve zdrojov�ch souborech od posledn�ho otev�en� projektu (nov� polo�ky, smazan� polo�ky, atd.)
  * p�id�no: Upozorn�n� na zm�nu obsahu zdrojov�ch soubor� jinou aplikac� v pr�b�hu pr�ce s projektem 
  * p�id�no: Podpora v�stupn�ch sestav (report�)
  * vylep�eno: Podpora pr�ce se schr�nkou (nyn� lze kop�rovat a vkl�dat polo�ky tak� jako prost� text
  * vylep�eno: Export polo�ek nyn� obsahuje jen opravdu viditeln� polo�ky a jazyky (sloupce) - d��ve byly exportov�ny sice jen viditeln� polo�ky, ale v�etn� skryt�ch jazyk� (sloupc�)
  * p�id�no: Export do form�tu HTML
  * opraveno: Import soubor� ve form�tu FastReport (oprava zpracov�n� k�dov�n� UTF-8)
  * opraveno: Generace unity LangConsts.pas:
       * Jestli�e nebyly definov�ny ��dn� konstanty, procedura LanguageChanged byla deklarov�na v sekci "interface", ale chyb�la v sekci "implementation"
       * Indexovan� konstanty jsou nyn� limitov�ny na max. 1024 polo�ek v poli, aby se zabr�nilo deklarac�m nadm�rn� rozs�hl�ch pol� a probl�m�m s vyu�it�m pam�ti
  * vylep�eno: N�vrhy zdrojov�ch k�d� (zobrazuj� se kontextov� k platform� projektu, byla p�id�na podpora vlastn�ch �ablon)
  * opraveno: O�et�en� vlastn�ch n�zv� jazyk� v dialogu "Nastaven� projektu"
  * opraveno: Mo�nost definice v�ce ne� jedn� dodatkov� slo�ky pro ukl�d�n� kopi� jazykov�ch soubor�
  * opraveno: Info ve stavov�m ��dku (celkov� po�et polo�ek) nebylo aktualizov�no po odebr�n� jazyka nebo zdrojov�ho souboru
  * a dal�� drobn� vylep�en� a opravy ...

  PLS Translator:
  * Nov� n�stroj v r�mci Precision Language Suite, jen� je ur�en pro p�ekladatele Va�ich existuj�c�ch projekt�.
    Je poskytov�n ZCELA ZDARMA a v porovn�n� s plnohodnotn�m PLS Editorem m� n�sleduj�c� omezen�:
      - P�id�v�n�, maz�n� a duplikov�n� polo�ek nen� povoleno
      - Funkce Import nen� k dispozici (oproti tomu Export dostupn� je)
      - Funkce vlo�en� ze schr�nky nepodporuje objekty zkop�rovan� z prost�ed� Delphi/Lazarus
      - N�vrhy zdrojov�ch k�d� nejsou k dispozici
      - Seznam zdrojov�ch soubor� je skryt, zdrojov� soubory nejsou analyzov�ny, ani synchronizov�ny (ale v projektov�m souboru samoz�ejm� z�st�v�j� zachov�ny)
      - Spr�vce knihovny t��d nen� k dispozici
      - Volby pro p�id�n� p�eddefinovan�ch konstant a zpr�v nejsou k dispozici
      - Zdrojov� soubor LangConsts.pas nen� generov�n a ve�ker� volby na n�j navazuj�c� jsou skryty (ale v projektov�m souboru samoz�ejm� z�st�v�j� zachov�ny)
      - U�ivatel m��e do�asn� zm�nit v�choz� jazyk projektu, ale tato zm�na se neprojev� v ulo�en�m projektov�m souboru
      - Dodate�n� slo�ky pro ulo�en� kopi� jazykov�ch soubor� .LNG jsou ignorov�ny (ale v projektov�m souboru samoz�ejm� z�st�v� tento seznam zachov�n)
      - Volby pro spu�t�n� vlastn�ch utilit "p�ed otev�en�m" a "po ulo�en�" projektu nejsou k dispozici (ale samoz�ejm� z�st�vaj� zachov�ny v projektov�m souboru)
      - Mo�nost volby platformy (VCL/FMX/LCL) je v dialogu "Nastaven� projektu" dostupn� jen p�i vytv��en� nov�ho projektu
      - Nov� projekty lze vytv��et, ale polo�ky lokalizace lze do projektu p�id�van jen za�azen�m existuj�c�ch .LNG soubor�
      - V�echny v��e zm�n�n� funkce jsou vypnuty rovn� ve skriptovateln�m rozhran�, tak�e dopl�ky, kter� jsou ur�eny pro PLS Editor lze pou��vat, ale jejich funk�nost je omezena na mo�nosti PLS Translatoru

  PLS Engine:
  * p�id�no: Podpora pro Delphi XE3, XE4 a XE5
  * p�id�no: Podpora 64bitov�ho kompil�toru pro Windows
  * p�id�no: Podpora FireMonkey 
  * p�id�no: Podpora Metropolis UI 
  * p�id�no: Podpora m�du "Object pascal" pro Lazarus/FPC
  * p�id�no: Komponenta TplsController pro je�t� snadn�j�� implementaci PLS Enginu do Va�ich aplikac�
  * p�id�no: Metoda TLanguageManager.LangForm - jedn� se o alias metody TLanguageManager.LangVCL, kter� byl zaveden proto, aby nedoch�zelo ke zmatk�m p�i pou�it� v jin�ch v�vojov�ch r�mc�ch (FMX, LCL, atd.)
  * p�id�no: Metoda TLanguageManager.LangString - pracuje obdobn� jako GNU gettext, tak�e vrac� p�eklad �et�zce p�edan�ho funkci coby parameter
  * p�id�no: Glob�ln� funkce _ (podtr��tko) - coby alias pro metodu LangString glob�ln�ho LanguageManageru (kv�li podpo�e stylu z�pisu funkce GNU gettext)
  * vylep�eno: Procedura _EscapeText je nyn� v unit� plsLangMan deklarov�na jako public 
  * vylep�eno: V unit� plsDialogs jsou nyn� k dispozici p�et�en� funkce MessageDlg a InputQuery (bez postfixu LM)
  * vylep�eno: V�echny zdrojov� soubory PLS Enginu byly p�epracov�ny tak, aby umo��ovaly pou�it� stejn�ho zdrojov�ho k�du pro v�echny podporovan� r�mce (VCL, LCL, FMX)
  * zm�n�no: Funkce vestav�n� lokalizace je nyn� poskytov�na zdarma, jako sou��st PLS Enginu (doposud byla k dispozici jen po zakoupen� PLS Editoru)
  * zm�n�no: Podpora pro Delphi 5 a 6 byla zru�ena
  * a dal�� drobn� vylep�en� ...


- Verze 2.2.7 (25.09.2011)

  PLS Editor:
  * p�id�no: Japonsk� lokalizace
  * p�id�no: tag "naposledy importov�no" - p�i�azuje se v�em importovan�m polo�k�m (a polo�k�m vlo�en�m ze schr�nky), p�i�em� je automaticky odstran�n p�i zav�en� dan�ho projektu
             (p�i�azov�n� tohoto tagu m��ete vypnout volbou "Nastavovat 'naposledy importov�no'" v p�edvolb�ch editoru)
  * p�id�no: tag "neukl�dat" - je implementov�n p�edev��m pro zamezen� ukl�d�n� necht�n�ch vlastnost� z VCL formul��� do v�sledn�ch jazykov�ch soubor�
  * p�id�no: volba pro podm�n�n� import, kter� zamez� p�episov�n� ji� p�elo�en�ch polo�ek - p�i tomto zp�sobu importu se budou p�episovat jen pr�zdn� polo�ky a polo�ky s p�i�azen�m tagem "p�elo�it"
  * p�id�no: skriptovateln� rozhran� pro import/export (jazykov� xml soubory komponent FastReport jsou podporov�ny coby prvotn� p��klad vyu�it�)
  * vylep�eno: p�i importu DFM soubor� (a vkl�d�n� VCL komponent ze schr�nky) jsou nyn� automaticky na��t�ny tak� kolekce (vlastnosti typu TCollection a jejich p�idru�en� lokalizovateln� vlastnosti)
  * vylep�eno: vlastnosti typu TShortCut jsou nyn� automaticky na��t�ny do editoru v textov� podob� (tedy nap�. "Ctrl+C", apod.).
  * vylep�eno: byla p�id�na volba "Ukl�dat polo�ky v�dy v po�ad� dle identifik�toru"
  * vylep�eno: tip s cel�m textem bu�ky se nyn� zobrazuje i v prvn�m sloupci s identifik�torem
  * vylep�eno: definice vlastnosti komponent pro automatick� import byla roz���ena o n�kolik komponent spole�nosti Bergsoft (http://www.bergsoft.net/)
  * opraveno: procedura LanguageChanged je nyn� v souboru LangConsts.pas rozd�lov�na na v�ce procedur, pokud je po�et konstant p��li� velk� na to, aby mohl b�t zpracov�n v r�mci jedn� procedury
  * opraveno: podpora na��t�n� DFM soubor� s definic� TFrame a DFM soubor� formul��� obsahuj�c�ch vlo�en� objekty typu TFrame

  PLS Engine:
  * p�id�no: kompatibilita s Delphi XE2
  * zm�n�no: v�choz� hodnota vlastnosti TLanguageManager.AllowSpecialProps je nyn� True, a to z d�vodu zpracov�n� speci�ln�ch vlastnost� (jako nap�. ShortCut) v u�vatelsky p��v�tiv� podob� v r�mci editoru.
  * p�id�no: podpora vlo�en�ch r�mc� (TFrame) pro "vestav�nou lokalizaci"

- Verze 2.2.6 (21.07.2011)

  PLS Editor:
  * p�id�no: Italsk� lokalizace
  * p�id�no: Volba pro p�epnut� tagu u vybran�ch polo�ek p�i dvojit�m kliknut� na barvu tagu (my�leno v seznam� tag�)
  * vylep�eno: Filtrov�n� polo�ek nyn� bere v �vahu skryt� jazyky (polo�ka nebude zobrazena ve filtrovan�m seznamu, i kdy� vyhovuje filtru, pokud je jej� jazyk skryt�)

  ... plus zm�ny z pr�b�n�ch beta verz� a opravn�ch vyd�n� (v2.2.4.21 a v2.2.5.2):
  * vylep�eno: Nov� volba "Zobrazit polo�ky bez tag�", kter� je k dispozici v z�lo�ce "Tagy"
  * vylep�eno: Nov� filtr v navig�toru pro zobrazen� "jen lokalizovan�ch polo�ek"
  * vylep�eno: Vyhled�v�n� v polo�k�ch dle masky. M��ete vyu��t znaky * a ?
  * vylep�eno: Indikace pro vy�i�t�n� filtru v pol�ch pro vyhled�v�n� (ikona k��ku)
  * opraveno: Chyba "Access violation ..." p�i pokusu o p�id�n� nov� polo�ky v situaci, kdy je seznam polo�ek t��d�n podle jednoho z jazyk�. Tato chyba se neobjevvovala v situaci, kdy byl seznam t��d�n standardn� dle identifik�tor� polo�ek.
  * opraveno: Import z DFM soubor� - na��t�n� vlastnost� typu TStrings, jejich� hodnoty obsahuj� apostrofy anebo speci�ln� znaky
  * opraveno: Import DFM soubor�, kde n�kter� hodnoty vlastnost� za��naj� k�dovan�mi znaky (nap�. #286,#1086, atd.). Vlastnosti, jejich� hodnoty za��naly standardn�m znakem, se p�ev�d�ly spr�vn�.
  * opraveno: Zobrazov�n� stavu za�krtnut� pro vybranou p�ekladovou slu�bu nebo vybran� u�ivatelsk� slovn�k na Windows XP/Vista/7.

  PLS Engine:
  * opraveno: Podpora pro lokalizaci strukturovan�ch objekt� (nap�. Collection s polo�kami, kter� obsahuj� dal�� Collection, atd.)

  ... plus zm�ny z pr�b�n�ch beta verz� a opravn�ch vyd�n� (v2.2.4.21 a v2.2.5.2):
  * opraveno: Chybn� direktiva podm�n�n�ho p�ekladu pro Delphi 6 v demonstra�n�ch projektech LangSuiteDemo a EmbeddedEditDemo (kter� zp�sobovala chybu kompilace "an unknown method ValueFromIndex" pro objekt TStringList).


- Verze 2.2.4.19 (02.01.2011)

  PLS Editor:
  * p�id�no - p�ekladov� slovn�ky "Microsoft Terminology Collection"
  * p�id�no - p��klady a postupy: "Lokalizace komponent DevExpress", "Lokalizace konstant BusinessSkinForm" a "P�echod z komponent DKLang" (viz "N�pov�da - P��klady a postupy")
  * p�id�no - podpora tzv. extern�ch jazykov�ch soubor� (tedy soubor� ve standardn�m form�tu LNG, ov�em s odli�nou p��ponou, kter� lze v editoru norm�ln� upravovat,
              ale jejich na�ten� v lokalizovan� aplikaci je na volb� v�voj��e, a nikoliv na t��d� TLanguageManager). Takov� jazykov� soubory lze s �sp�chem vyu��t
              pro lokalizaci komponent, kter� maj� implementov�ny vlastn� mechanismy lokalizace (nap�. BusinessSkinForm, DynamicSkinForm, a dal��).
              Spoluautorem tohoto �e�en� je pan Calin Paiusan ze spole�nosti Soft Consulting West Team, www.softwestteam.ro.
  * vylep�eno - mo�nosti importu byly roz���eny o na�ten� projekt� a lokaliza�n�ch soubor� v n�sleduj�c�ch form�tech:
                DKLang, Ini, Seznamy konstant (ve form� identifik�tor=text), a intern� form�ty LNG a LNGU
  * p�id�no - funkce pro hromadn� "potvrzen�" hodnot ze zdrojov�ch soubor� (formul���, zdrojov�ch �et�zc�) - tzn. jejich p�evzet� a ulo�en� do jazykov�ch soubor�
  * p�id�no - mo�nost ozna�en� jazyka p��znakem "bi-directional"
  * vylep�eno - p�eklad z u�ivatelsk�ch slovn�k� nyn� zachov�v� velk�/mal� p�smena na za��tku v�ty, co� plat� tak� pro znaky akceler�tor� (&)
  * vylep�eno - p�ejmenov�n� formul��� a komponent p��mo v navig�toru polo�ek
  * vylep�eno - �azen� u�ivatelsk�ch slovn�k� v nab�dce dle abecedy
  * vylep�eno - seznam v�choz�ch dostupn�ch jazyk� pro editor byl dopln�n o jazyky obsa�en� v "Microsoft Terminology Collection"
  * vylep�eno - rychlost na��t�n� a ukl�d�n� projekt�, rychlost synchronizace se zdrojov�mi k�dy (podpora pr�ce s velmi rozs�hl�mi projekty)
  * opraveno - import soubor� ve form�tech .RC a .DRC, kter� byly upraveny v nov�j��ch verz�ch Delphi n�strojem Translation Editor.
               Translation Editor ukl�d� upraven� soubory s p�vodn� p��ponou .RC, ale jejich form�t zm�n� na .DRC a vytvo�� dopl�kov� soubor .RCN obsahuj�c� informace,
               kter� byly p�vodn� ulo�eny p��mo v souboru .RC (v jeho standardn�m form�tu). Takto zm�n�n� soubory zdroj� je ji� tedy mo�n� tak� importovat do Precision Language Suite.

  PLS Engine:
  * p�id�no - podpora v�vojov�ho prost�ed� FreePascal/Lazarus
  * p�id�no - vlastnost TLanguageManager.BiDiMode
  * p�id�no - vlastnost TLanguageManager.ActiveFiles, kter� obsahuje seznam aktu�ln� na�ten�ch jazykov�ch soubor�
  * vylep�eno - parametr "ButtonElevation" pro funkci MessageDlgLM (autorem dopln�n� je ouiouioui, www.toutenvrac.org)
  * p�id�no - unita "xplsDKLang.pas", kter� obsahuje funkce pro jednodu��� p�echod z lokaliza�n�ch komponent DKLang (viz tak� "N�pov�da - P��klady a postupy - P�echod z komponent DKLang")
  * p�id�no - podpora pro v�vojov� prost�ed� FreePascal/Lazarus v r�mci "vestav�n� lokalizace"
  * p�id�no - podpora ukl�d�n� zm�n do soubor� v komprimovan�m form�tu (lngz) v r�mci "vestav�n� lokalizace"


- Verze 2.1.3.17 (17.12.2010)

  PLS Editor:
  * p�id�no - Ma�arsk� lokalizace
  * p�id�no - Zna�ky (tagy) pro lokalizovan� polo�ky, v�etn� podpory automatick�ho ozna�ov�n�. M��ete pou��vat v�choz� tagy ("p�elo�it", "p�elo�eno automaticky",
              "nelokalizovat", "neukl�dat do langconsts"), stejn� tak, jako m��ete definovat tagy vlastn�, pomoc� vytvo�en� u�ivatelsk� knihovny tag� (zna�ek).
  * p�id�no - U�ivatelsk� slovn�ky pro automatick� p�eklady. P�izp�sobiteln� pravidla p�ekladu a mo�nost sou�asn�ho pou�it� s webovou p�ekladovou slu�bou.
              Jak�koliv projekt Precision Language Suite m��e b�t pou�it coby p�ekladov� slovn�k (za slovn�ky jsou automaticky br�ny projekty ulo�en� ve slo�ce "Templates\Dictionaries").
  * p�id�no - Lokalizace resource strings (zdrojov�ch �et�zc�). Tyto �et�zce lze importovat ze soubor� typu PAS, INC, DPR, RC a DRC.
  * p�id�no - Jednor�zov� import Delphi formul��� (DFM soubor�), implementovan� jako dopln�k k automatick� synchronizaci VCL soubor� a ke vkl�d�n� komponent ze schr�nky.
  * vylep�eno - Import v�ce soubor� najednou, v�etn� automatick�ho p�id�n� p��slu�n�ho jazyka, definovan�ho v importovan�ch souborech zdroj� (.RC soubory)
  * vylep�eno - Automatick� synchronizace VCL soubor� nyn� podporuje i form�ty PAS, INC a DPR
  * p�id�no - Podpora pro p�edzpracov�n� a n�sledn�ho zpracov�n� projektu. P�ed otev�en�m, a po ulo�en� projektu, lze spustit libovolnou definovanou extern� aplikaci.
  * p�id�no - Mo�nost ukl�d�n� jazykov�ch soubor� v komprimovan�m (pk-zip kompatibiln�m) form�tu (p��pona LNGZ).
              Toto plat� pro ukl�d�n� soubor� do dopl�kov�ch um�st�n� (viz "Nastaven� projektu"). Va�e zdrojov� lokaliza�n� soubory z�st�vaj� ve standardn�m LNG form�tu.
  * vylep�eno - Funkce "Duplikovat" nyn� vytv��� spr�vn� po�ad� index� pro "konstanty typu pole", i pro ostatn� polo�ky s ��seln�m ozna�en�m na konci identifik�toru
  * vylep�eno - Mo�nost ulo�en� vlastn�ch filtr� pro Navig�tor polo�ek (kliknut�m na ikonu lupy v poli pro vyhled�v�n� dle textu)
  * vylep�eno - Informace o verzi jazykov�ho souboru (autor, ��slo verze, atd.) jsou nyn� synchronizov�ny s informacemi o verzi projektu
  * vylep�eno - Mo�nost otev�en� soubor� knihoven (.PLP) pro �pravy p��mo z prost�ed� editoru
  * vylep�eno - Byly p�id�ny hork� kl�vesy pro aktivaci vyhled�vac�ho pole (Ctrl+G) a vypnut� filtru polo�ek (Ctrl+Q)
  * p�id�no - Volba "zah�jit editaci p�i psan�", kterou lze aktivovat nam�sto "inkrement�ln�ho vyhled�v�n�", a kter� umo�n� zah�jit editaci polo�ky bez p�edchoz�ho stisku kl�vesy F2
  * opraveno - Podpora relativn�ch cest k soubor�m VCL za�azen�m do projektu
  * opraveno - Do generovan�ho souboru LangConst.pas je nyn� spr�vn� za�azov�na unita SysUtils, pokud v projektu vyu��v�te "konstanty typu pole"
  * opraveno - Dlouh� �et�zce (del�� ne� 255 znak�) jsou nyn� do souboru LangConsts.pas generov�ny spr�vn� (v�etn� rozd�len� na v�ce ��dk�)
  * opraveno - �et�zce s apostrofy (') jsou nyn� do souboru LangConsts.pas generov�ny spr�vn�

  PLS Engine:
  * p�id�no - Podpora Delphi XE
  * p�id�no - Lokalizace resource strings (zdrojov�ch �et�zc�). Viz funkce LangResourceStr v unit� plsLangMan.pas, projekt LangSuiteDemo, a funkce Import v editoru.
  * p�id�no - Podpora na��t�n� jazykov�ch soubor� v komprimovan�m (pk-zip kompatibiln�m) form�tu (p��pona LNGZ). Tato funkce se aktivuje definov�n�m direktivy podm�n�n�ho p�ekladu "PLS_LNGZ".
  * opraveno - dopln�n� funkc� GetLangPrimaryCode a GetLangSubCode dle aktu�ln� specifikace jazykov�ch identifik�tor� (viz http://msdn.microsoft.com/en-us/library/dd318693(VS.85).aspx)
  * p�id�no - funkce GetLangCountry, kter� vrac� cel� �et�zcov� identifik�tor jazyka a zem� (nap�. "cs-CZ")
  * p�id�no - direktiva {$M+}
  * p�id�no - Podpora na��t�n� jazykov�ch soubor� ulo�en�ch v k�dov�n� UTF-8 i pro Delphi verze 7 a� 2007.
              Pro tyto verze Delphi ji� tedy nen� pot�eba konvertovat jazykov� soubory vytvo�en� editorem do p��slu�n� k�dov� str�nky dan�ho jazyka.


- Verze 2.0.1.2 (10.06.2010)

  PLS Editor:
  * p�id�no - Rusk� lokalizace
  * p�id�no - Francouzsk� lokalizace
  * p�id�no - Mo�nost p�ekladu pomoc� slu�by Bing (Microsoft Translator)
  * p�id�no - Import a Export polo�ek z a do form�tu CSV (jako dal�� mo�nost
              zaji�t�n� p�ekladu extern�m p�ekladatelem)
  * p�id�no - Mo�nost ukl�d�n� jazykov�ch soubor� i do dal��ch zvolen�ch slo�ek
              (p�i ka�d�m ulo�en� projektu)
  * vylep�eno - Podpora zd�d�n�ch ("inherited") formul��� a komponent p�i na��t�n�
                VCL soubor�, v�etn� p��kladu pou�it� takov�chto formul��� p�i
                lokalizaci samotn�
  * vylep�eno - Podpora na��t�n� VCL soubor� v bin�rn�m form�tu
  * vylep�eno - Krom� z�lohov�n� jazykov�ch soubor� se nyn� p�i ukl�d�n� projektu
                z�lohuje tak� soubor konstant ("LangConsts.pas")
  * opraveno - Podpora speci�ln�ch znak� (nap�. �e�tina) p�i na��t�n� VCL soubor�
  * opraveno - P�i na��t�n� VCL soubor� jsou nyn� podporov�ny hodnoty vlastnost�,
               kter� obsahuj� v�ce ��dk� textu
  * opraveno - Podpora na��t�n� vlastnost� typu "Items.Strings", "Items.Text",
               "Lines.Strings" a "Lines.Text" z VCL soubor�
  * opraveno - Kritick� chyba ("Access violation ...") ve funkci "Nahradit text"
  * vylep�eno - Pomoc� funkce "Nahradit" lze nyn� hromadn� zm�nit tak� n�zvy
                identifik�tor� (formul���, komponent, vlastnost�)
  * opraveno - Textov� popisky v dialogu "Naj�t" nyn� odpov�daj� aktu�ln� vybran�mu
               jazyku u�ivatelsk�ho prost�ed� i p�i jeho pr�b�n� zm�n�
  * a dal�� drobn� vylep�en� a opravy

  PLS Engine:
  * p�id�no - Metoda "plsDialogs.InputQueryMemoLM" pro dotaz na v�ce-��dkov� text
  * p�id�no - Podp�rn� metody pro "vestav�nou lokalizaci"
  * p�id�no - Nov� p��klady (vestav�n� lokalizace, lokalizace "od nuly",
              rychlost na��t�n� lokalizovan�ch text�)
  * p�id�no - P��klad lokalizace zd�d�n�ch ("inherited") formul��� (v n�pov�d�
              produktu)
  * p�id�no - Vestav�n� lokalizace: tato nov� p�idan� funkce umo��uje lokalizaci Va�ich aplikac� p��mo za b�hu.
              Pouh�m kliknut�m my�� lze vybrat prvek ve Va�� aplikaci a zadat jeho popisek
              v aktu�ln� zvolen�m jazyce. (v�ce informac� naleznete v n�pov�d� k produktu)


- Verze 1.0.1.83 (22.09.2009)

  * prvn� ve�ejn� distribuovan� verze produktu


Pou�it� komponenty a knihovny t�et�ch stran:
--------------------------------------------

PLS Editor:
- Embarcadero Delphi Professional, http://www.embarcadero.com/
- TMS Component Pack Professional, http://www.tmssoftware.com
- VirtualTree, http://www.soft-gems.net
- Precision Language Suite, http://www.be-precision.com/products/precision-langs/
- pdScript (embedded), http://www.be-precision.com/products/pdscript/
- PNG Components, http://www.thany.org
- THDDInfo Delphi component, http://artsoft.nm.ru, artsoft@nm.ru
- SynEdit, http://synedit.sourceforge.net/
- TmPasParser, Martin Waldenburg
- SciZipFile, Patrik Spanel - scilib@sendme.cz
- MSXML SDK, http://msdn.microsoft.com/en-us/library/ms760399(VS.85).aspx
- Open SSL, http://www.openssl.org/
- Hunspell library, http://hunspell.sourceforge.net/ (v�etn� r�zn�ch slovn�k� t�et�ch stran)
- Google Translate API, https://developers.google.com/translate/
- Microsoft Translator HTTP interface (REST), http://www.microsofttranslator.com/dev/
- Microsoft Terminology Collection, http://www.microsoft.com/language/en-us/default.aspx
- Flot, http://www.flotcharts.org/
- InnoSetup, http://www.jrsoftware.org
- ISTool, http://www.istool.org/
- IcoFX, http://icofx.ro/
- Rumshot, http://www.shellscape.org/rumshot/
- Fugue Small Icons, http://www.pinvoke.com/
- Silk Icons, http://www.famfamfam.com/lab/icons/silk/
- Developers Icons, http://sekkyumu.deviantart.com/art/Developpers-Icons-63052312
- Human O2 Icons, http://schollidesign.deviantart.com/art/Human-O2-Iconset-105344123
- Oxygen Icons, http://www.oxygen-icons.org/

PLS Engine:
Lokaliza�n� zdrojov� k�dy nevyu��vaj� ��dn� sou��sti t�et�ch stran,
ale pouze k�dy standardn� obsa�en� ve v�vojov�m prost�ed� Delphi (resp. FPC/Lazarus).
V�j�mku tvo�� voliteln� podpora soubor� v komprimovan�m form�tu (SciZipFile.pas):
- SciZipFile, Patrik Spanel - scilib@sendme.cz


Pod�kov�n�:
-----------
- Komponenta TplsController je vyv�jena ve spolupr�ci s MiTeC company (Michal Mutl), http://www.mitec.cz/
- Implementace podpory pro zobrazen� ikon "�t�t�" p�i po�adavku na zv��en� opr�vn�n� v unit� plsDialogs - Alexandre Veuillet, http://www.toutenvrac.org/


Kontakt:
--------
Precision software & consulting
e-mail:  info@be-precision.com
www:     http://www.be-precision.com
podpora: www.be-precision.com/support
         support@be-precision.com
f�rum:   www.be-precision.com/forum
rss:     www.be-precision.com/rss_cz.xml


========================================================
Copyright (c) 2008-2014  Precision software & consulting
V�echna pr�va vyhrazena.
