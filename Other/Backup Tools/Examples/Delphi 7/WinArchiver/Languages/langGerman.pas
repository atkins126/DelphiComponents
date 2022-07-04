unit langGerman;

interface
procedure SetLanguage;

implementation
uses unTranslation;

procedure SetLanguage;
begin
  // Misc strings
  AddStr(   1, 'W�hlen Sie "Neu", um ein neues Archiv zu erstellen, oder "�ffnen", um ein existierendes Archiv zu �ffnen' );
  AddStr(   2, 'OK' );
  AddStr(   3, 'Abbruch' );
  AddStr(   4, '&Hilfe' );
  // unit fmAboutBox
  AddStr( 500, '�ber' );
  AddStr( 501, 'by Morgan Martinet (C)1998' );
  AddStr( 502, 'Diese Komponenten sind FreeWare.' );
  AddStr( 503, 'Copyright (C) 1998 by NOMSSI NZALI Jacques H. C.' );
  AddStr( 504, 'pasZLib library:' );
  AddStr( 505, 'mmm@imaginet.fr or mmm@mcom.fr' );
  AddStr( 506, 'Die BlowFish Implementation ist von Greg Carter, CRYPTOCard' );
  AddStr( 507, 'Der SFX-code wurde erstellt von Oliver Buschjost' );
  AddStr( 508, 'Homepage:' );
  // unit fmTiming
  AddStr( 600, 'Verstrichene Zeit :' );
  AddStr( 601, 'Verbleibende Zeit :' );
  // unit fmMain
  AddStr( 700, 'Neu...' );
  AddStr( 701, '�ffnen...' );
  AddStr( 702, '&Hinzuf�gen...' );
  AddStr( 703, '&Entpacken...' );
  AddStr( 704, '&L�schen...' );
  AddStr( 705, '&Abbrechen' );
  AddStr( 706, 'Neues Archive' );
  AddStr( 707, 'Archive �ffnen' );
  AddStr( 708, 'Dateien hinzuf�gen...' );
  AddStr( 709, 'Dateien entpacken...' );
  AddStr( 710, 'Dateien l�schen...' );
  AddStr( 711, 'Archive Dateien (*.mmm)|*.mmm|SFX Archive (*.exe)|*.exe|Alle Dateien (*.*)|*.*' );
  AddStr( 712, 'Archive Dateien (*.mmm)|*.mmm|Alle Dateien (*.*)|*.*' );
  AddStr( 713, 'Ein vorhandenes Archiv �ffnen' );
  AddStr( 714, 'Ein neues Archiv erstellen' );
  AddStr( 715, 'Ein Segment eines Archives �ffnen' );
  AddStr( 716, 'Hinzuf�gen von %s (%.0n)' );
  AddStr( 717, 'Entpacken von %s (%d)' );
  AddStr( 718, '%d Datei(n), %s' );
  AddStr( 719, 'Einlesen des Archivinhalts...' );
  AddStr( 720, 'Die Datei "%s", existiert bereits' );
  AddStr( 721, 'M�chten Sie den Inhalt dieses Archives l�schen?' );
  AddStr( 722, 'M�chten Sie dieses Archive l�schen?' );
  AddStr( 723, '%.0n Byte' );
  AddStr( 724, '%.0n Bytes' );
  AddStr( 725, '%.0n Kb' );
  AddStr( 726, '%.0n Mb' );
  AddStr( 727, '%d Datei(en) markiert, %s' );
  AddStr( 728, 'L�sche Dateien...' );
  AddStr( 729, 'Nicht verf�gbar' );
  AddStr( 730, 'Umbenennen des aktuellen Archivs in:' );
  AddStr( 731, 'Fehler beim umbenennen des Archivs in "%s" !' );
  AddStr( 732, 'SFX Konfiguration' );
  AddStr( 733, 'Ein selbstentpackendes Archive erstellen' );
  AddStr( 734, 'Erstellen' );
  AddStr( 735, 'Fehler beim erstellen eines selbstentpackendes Archives !' );
  AddStr( 736, 'Archive Kommentar hinzuf�gen' );
  AddStr( 737, 'Archive Kommentar' );
  AddStr( 738, 'WinArchiver ist bereits am arbeiten. Bitte warten Sie auf deas Ende der jeztigen Aufgabe oder dr�cken Sie abbrechen.' );
  AddStr( 739, 'Sie haben eine Datei ausgef�hrt. Bitte beenden Sie diese und versuchen es danach erneut.' );
  AddStr( 740, 'Sie m�ssen zuerst ein Archiv �ffnen oder erstellen.' );
  AddStr( 741, 'Fehler: Das verkn�pfte Programm (%s) konnte nicht gefunden werden.' );
  AddStr( 742, 'Name' );
  AddStr( 743, 'Datum' );
  AddStr( 744, 'Zeit' );
  AddStr( 745, 'entpackte Gr��e' );
  AddStr( 746, 'Ersparnis' );
  AddStr( 747, 'gepackte Gr��e' );
  AddStr( 748, 'Seg#' );
  AddStr( 749, 'Pfad' );
  AddStr( 750, '&Datei' );
  AddStr( 751, '&Aktionen' );
  AddStr( 752, '&Optionen' );
  AddStr( 753, '&Hilfe' );
  AddStr( 754, '&Neues Archiv...' );
  AddStr( 755, '&Archiv �ffnen...' );
  AddStr( 756, '&Segment �ffnen...' );
  AddStr( 757, 'Archive &schlie�en' );
  AddStr( 758, '&Informationen...' );
  AddStr( 759, 'Archive &umbenennen' );
  AddStr( 760, 'Archiv &leeren' );
  AddStr( 761, 'Archive &l�schen' );
  AddStr( 762, '&Beenden' );
  AddStr( 763, '&Anzeigen...' );
  AddStr( 764, 'Alles &markieren' );
  AddStr( 765, '.E&XE Datei erstellen' );
  AddStr( 766, 'Archive Kommentar hinzuf�gen...' );
  AddStr( 767, '&SFX Konfiguration...' );
  AddStr( 769, '&Info...' );
  AddStr( 770, 'Ein neues Archiv erstellen' );
  AddStr( 771, 'Ein Archive �ffnen' );
  AddStr( 772, 'Ein Segment eines Archives �ffnen' );
  AddStr( 773, 'Dieses Archive schlie�en' );
  AddStr( 774, 'Informationen �ber dieses Archiv anzeigen' );
  AddStr( 775, 'Das Archive umbenennen...' );
  AddStr( 776, 'Den Inhalt des Archives vollst�ndig entfernen' );
  AddStr( 777, 'Archive l�schen' );
  AddStr( 778, 'WinArchiver beenden' );
  AddStr( 781, 'Dateien zum Archiv hinzuf�gen' );
  AddStr( 782, 'entpacken' );
  AddStr( 783, 'Dateien aus dem Archiv l�schen' );
  AddStr( 784, 'Dateien anzeigen' );
  AddStr( 785, 'Alle Dateien des Archives markieren' );
  AddStr( 786, 'Ein selbstentpackendes Archiv erstellen' );
  AddStr( 787, 'Dem Archiv einen Kommentar hinzuf�gen' );
  AddStr( 788, 'Die Konfiguration �ndern' );
  AddStr( 789, 'Die Konfiguration f�r die SFX-Erstellung �ndern' );
  AddStr( 790, '�ber diese Anwendung...' );
  AddStr( 798, '&Konfiguration...' );
  AddStr( 799, '%s Datei' );
  AddStr( 800, 'Schlie�en des Archives...' );
  AddStr( 801, '&Nichts markieren' );
  AddStr( 802, 'Markierung &invertieren' );
  AddStr( 803, 'Stamm' );
  AddStr( 804, 'Verzeichnisstrukturansicht' );
  AddStr( 805, 'Gro�e Symbole' );
  AddStr( 806, 'Kleine Symbole' );
  AddStr( 807, 'Liste' );
  AddStr( 808, 'Details' );
  AddStr( 809, 'Alle ausbreiten' );
  AddStr( 810, 'Alle einklappen' );
  AddStr( 811, 'L�schen der Dateiliste' );
  AddStr( 812, 'Aufbau der Dateiliste' );
  AddStr( 813, 'Sortierung der Dateiliste...' );
  AddStr( 814, 'Das Archive %s existiert nicht !' );
  AddStr( 815, 'Archiv auf Fehler &�berpr�fen' );
  AddStr( 816, 'Das aktuelle Archiv auf Fehler �berpr�fen' );
  AddStr( 817, '&Letzte Meldung...' );
  AddStr( 818, 'Letzte Aufgabe / Letzten Fehler anzeigen' );
  AddStr( 819, 'Installieren' );
  AddStr( 820, 'Archiv entpacken und das Installationsprogramm aufrufen' );
  AddStr( 821, '&Schriftart...' );
  AddStr( 822, '&Sortieren' );
  AddStr( 823, '&Original Reihenfolge' );
  AddStr( 824, 'Die aktuelle Scriftart �ndern' );
  AddStr( 825, 'Eine Sortierreihenfolge ausw�hlen' );
{*}  AddStr( 826, 'F&ilters...' );
{*}  AddStr( 827, 'Lets you define filters to select files to be added' );
  // unit fmAdd and fmAddDropedFiles
  AddStr( 900, 'Hinzuf�gen von' );
  AddStr( 901, 'Name :' );
  AddStr( 902, 'Verzeichnisse' );
  AddStr( 903, 'Mit Unterverzeichnissen' );
  AddStr( 904, 'Aktuelles Verzeichnis einschlie�en' );
  AddStr( 905, 'Leere Verzeichnisse sichern' );
  AddStr( 906, 'Verzeichnisstruktur mitsichern :' );
  AddStr( 907, 'Dateien verschl�sseln ?' );
  AddStr( 908, 'Kompressionsart:' );
  AddStr( 909, 'Hinzuf�gen' );
  AddStr( 910, 'Nein'+#13+
               'vollst�ndig'+#13+
               'relativ' );
  AddStr( 911, 'Maximal (das langsamste)'+#13+
               'Normal'+#13+
               'Schnell'+#13+
               'Sehr schnell'+#13+
               'Keine' );
  AddStr( 912, 'Dateien hinzuf�gen' );
  AddStr( 913, 'Eintr�ge hinzuf�gen' );
  AddStr( 914, 'Filter :' );
  AddStr( 915, 'Zum aktuellen Verzeichnis hinzuf�gen ?' );
{*}AddStr( 916, 'Filter files ?' );
  // unit fmConfiguration
  AddStr( 1000, 'Konfiguration' );
  AddStr( 1001, 'Disketten �bergreifend' );
  AddStr( 1002, 'Archiv Erstellung' );
  AddStr( 1003, 'Optionen' );
  AddStr( 1004, 'Archive aufteilen' );
  AddStr( 1005, 'Maximale Gr��e eines Archivsegmentes:' );
  AddStr( 1006, '720 Kb'+#13+
                '1,44 Mb'+#13+
                'Anders (Kb):' );
  AddStr( 1007, 'Archiv komprimieren' );
  AddStr( 1008, 'Archiv verschl�sseln' );
  AddStr( 1009, 'Solides Archiv' );
  AddStr( 1010, 'Schreibgesch�tzt' );
  AddStr( 1011, 'SFX-Archiv erstellen' );
  AddStr( 1014, 'Blockgr��e' );
  AddStr( 1015, 'Platz freihalten' );
  AddStr( 1016, 'Kb' );
  AddStr( 1017, 'Sprache:' );
  AddStr( 1018, 'Automatisch'+#13+
                'Englisch'+#13+
                'Franz�sisch'+#13+
                'Chinesisch'+#13+
                'Portugiesisch'+#13+
                'Deutsch'+#13+
                'Itali�nisch'+#13+
                'Russisch'+#13+
                'Spanisch'+#13+
{*}             'Danish'+#13+
                'Dutch'+#13+
                'Czech'
                );
  AddStr( 1019, 'Leere Verzeichnisse anzeigen' );
  AddStr( 1020, 'Verzeichnisstruktur anzeigen' );
  // unit fmCreateFolder
  AddStr( 1100, 'Aktuelles Verzeichnis:' );
  AddStr( 1101, 'Name:' );
  // unit fmDelete
  AddStr( 1200, 'L�schen' );
  AddStr( 1201, 'Dateien' );
  AddStr( 1202, '&Vollst�ndiges Archiv'+#13+
                '&Markierte Dateien'+#13+
                '&Dateien:' );
  // unit fmEnterCryptKey
  AddStr( 1300, 'Systemnachricht' );
  AddStr( 1301, 'Passwort verstecken ?' );
  // unit fmExtract
  AddStr( 1400, 'Entpacken' );
  AddStr( 1401, 'Entpacken nach:' );
  AddStr( 1402, 'Dateien' );
  AddStr( 1403, '&Markierte Dateien'+#13+
                '&Alle Dateien'+#13+
                '&Dateien:' );
  AddStr( 1404, '&Verzeichnisnamen benutzen' );
  AddStr( 1405, 'Vorhandene Dateien �berschreiben'+#13+
                'Dateien nicht entpacken'+#13+
                '�ltere Dateien �berschreiben'+#13+
                'Nachfragen'+#13+
                'Nur entpacken, wenn gleichnamige Dateien existieren'+#13+
                'Nur entpacken, wenn gleichnamige, �ltere Dateien existieren' );
  AddStr( 1406, 'Verzeichnisse / Laufwerke' );
  AddStr( 1407, 'Neues Verzeichnis...' );
  // unit fmHelpOnSFX
  AddStr( 1500, 'Die folgenden K�rzel d�rfen in der "Kommandozeile" und'+#13+
                'im "Standart Zielverzeichniss" benutzt werden :' );
  AddStr( 1501, 'wird mit dem Verzeichnis f�r Tempor�re Dateien ersetzt'+#13+
                '(meist ''c:\windows\temp'' oder ''c:\win95\temp'' oder ''c:\temp'')' );
  AddStr( 1502, 'wird mit dem Windows-Verzeichnis ersetzt'+#13+
                '(meist ''c:\windows'' oder ''c:\win95'')' );
  AddStr( 1503, 'wird mit dem System-Verzeichnis ersetzt'+#13+
                '(meist ''c:\windows\system'' oder ''c:\win95\system'')' );
  AddStr( 1504, 'wird mit dem Programme-Verzeichnis ersetzt'+#13+
                '(oft ''c:\Program Files'' [h�ngt aber von der Sprache des'+#13+
                'installiertem Windows ab])' );
  AddStr( 1505, 'wird mit dem Verzeich, in das die Dateien entpackt wurden, '+#13+
                'ersetzt (nur f�r die "Kommandozeile" oder'+#13+
                '"Parameter")' );
  AddStr( 1506, 'Beispiel:' );
  AddStr( 1507, '<PF>Meine Firma\Mein Programm' );
  // unit fmInformation
  AddStr( 1600, 'Pfad:' );
  AddStr( 1601, 'Name:' );
  AddStr( 1602, 'Dateigr��e:' );
  AddStr( 1603, 'Dateien:' );
  AddStr( 1604, 'Kompression:' );
  AddStr( 1605, 'Datum/Zeit:' );
  AddStr( 1606, 'Segment:' );
  AddStr( 1607, 'Attribute' );
  AddStr( 1608, 'Verschl�sselt' );
  AddStr( 1609, 'Komprimiert' );
  AddStr( 1610, 'Solid' );
  AddStr( 1611, 'Schreibgesch�tzt' );
  AddStr( 1612, 'Letztes Segment' );
  AddStr( 1613, 'Informationen' );
  // unit fmSFXComments
  AddStr( 1700, 'Kommentare' );
  AddStr( 1701, 'Kommentar, der beim �ffnen des SFX-Archivs angezeigt wird' );
  AddStr( 1702, 'Kommentar, der nach dem entpacken der Dateien des SFX-Archivs angezeigt wird' );
  AddStr( 1703, 'Kommentare l�schen' );
  // unit fmSFXConfig
  AddStr( 1800, 'SFX Konfiguration' );
  AddStr( 1801, 'Nach dem entpacken eine Datei ausf�hren?' );
  AddStr( 1802, 'Darf der Benutzer w�hlen, welche Dateien er entpacken will ?' );
  AddStr( 1803, 'Darf der Benutzer w�hlen, was bei existierenden Dateien geschehen soll ?');
  AddStr( 1804, '�berschrift:' );
  AddStr( 1805, 'Kommandozeile:' );
  AddStr( 1806, 'Parameter:' );
  AddStr( 1807, 'Standart Zielverzeichnis:' );
  AddStr( 1808, '�berschreib art:' );
  AddStr( 1809, 'Kommentare...' );
  AddStr( 1810, 'Nachfragen'+#13+
                'Vorhandene Dateien �berschreiben'+#13+
                'Dateien nicht entpacken'+#13+
                '�ltere Dateien �berschreiben'+#13+
                'Nur entpacken, wenn gleichnamige Dateien existieren'+#13+
                'Nur entpacken, wenn gleichnamige, �ltere Dateien existieren' );
  AddStr( 1811, 'Darf der Benutzer w�hlen, ob er die Datei ausf�hren m�chte ?' );
  // unit fmTextViewer
  AddStr( 1900, 'Anzeigen von: %s' );
  AddStr( 1901, '&Kopieren' );
  AddStr( 1902, '&Schriftart' );
  // unit fmView
  AddStr( 2000, 'Anzeigen von: %s' );
  AddStr( 2001, 'Benutzen des' );
  AddStr( 2002, 'Anzeigen' );
  AddStr( 2003, '&Verkn�pften Programmes(%s)'+#13+
                '&Internen ASCII Text Anzeiger' );
  // unit fmLastOutput
  AddStr( 2100, 'Letzte Aufgabe / Letzten Fehler anzeigen' );
  // unit fmFilters
{*}  AddStr( 2200, 'Filters' );
{*}  AddStr( 2202, 'Add' );
{*}  AddStr( 2203, 'Edit' );
{*}  AddStr( 2204, 'Delete' );
{*}  AddStr( 2205, 'Clear all' );
{*}  AddStr( 2206, 'Kind of filter' );
{*}  AddStr( 2207, 'Require'+#13+
{*}                'Exclude' );
{*}  AddStr( 2208, 'Edit filter:' );
{*}  AddStr( 2209, 'New filter:' );
end;

end.
