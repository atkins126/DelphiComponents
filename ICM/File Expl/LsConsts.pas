{*************************************************************************}
{
   LsConsts.pas
   ------------
     version : 2.886
     Updated : 12/5/2005
 =========================================================================
 ResourceStrings for the following languages:
   - English (Default)
   - Chinese_Tra (Chinese Tradition)
   - Chinese_Sim (Chinese Simplified)
   - Dutch
   - French
   - German
   - Italian
   - Japanese
   - Korean
   - Polish
   - Brazillian Portuguese
   - Slovenian
   - Slovak
   - Spanish
   - Swedish
   - Turkish

 ACKNOWLEDGMENTS
 ===============
   I would like thank Andreas Roth, Bernd Ohse, Bernard Bourguignon,
   Ferruccio Accalai, David Abdaleon, Alberto Meyer, Sam Francke, Zenon
   Mieszkuniec, Martin Berta, Scarfman Lin, Yoshihiro Sugahara,
   Matjaz Prtenjak, Olle Johansson, Do-wan Kim and Yasar Ozanlagan for
   their German, French, Italian, Spanish, Brazillian-Portuguese, Dutch,
   Polish, Slovak, Chinese(Traditional and Simplified), Japanese, Slovenian,
   Swedish, Korean and Turkish language translations.
}
{*************************************************************************}

unit LsConsts;

interface

ResourceString

//------------------------------------------
//               English
//------------------------------------------
  //872<
  //LsFileListview28 Column Caption
  ENGLISH_ColIdName   = 'Name';
  ENGLISH_ColIdSize   = 'Size';
  ENGLISH_ColIdType   = 'Type';
  ENGLISH_ColIdDate   = 'Modified';
  ENGLISH_ColIdAttr   = 'Attr';
  ENGLISH_ColIdHdSize = 'Disk Size';
  ENGLISH_ColIdFSpace = 'Free Space';
  //Drive Type
  ENGLISH_DrvTypeStr0 = 'Unknown';
  ENGLISH_DrvTypeStr1 = 'Not exist';
  ENGLISH_DrvTypeStr2 = 'Removable Disk';
  ENGLISH_DrvTypeStr3 = 'Fixed Disk';
  ENGLISH_DrvTypeStr4 = 'Network Disk';
  ENGLISH_DrvTypeStr5 = 'CD-ROM Disk';
  ENGLISH_DrvTypeStr6 = 'RAM Disk';
  //LsFileListview28Popup MenuItem Caption
  ENGLISH_LvItemID_0  = '&Open';
  ENGLISH_LvItemID_1  = '&View';
  ENGLISH_LvItemID_3  = 'Se&nd To';
  ENGLISH_LvItemID_5  = 'Cu&t';
  ENGLISH_LvItemID_6  = '&Copy';
  ENGLISH_LvItemID_7  = '&Paste';
  ENGLISH_LvItemID_9  = '&Rename';
  ENGLISH_LvItemID_10 = '&Delete';
  ENGLISH_LvItemID_12 = '&Properties';
  ENGLISH_LvItemID_14 = '&New Folder...';
  ENGLISH_LvItemID_30 = 'Any Folder ...';
  ENGLISH_LvItemID_31 = 'Clipboard as Contents';
  ENGLISH_LvItemID_32 = 'Clipboard as FileName';
  ENGLISH_LvItemID_33 = 'DeskTop as ShortCut';
  //LsDirTree21Popup MenuItem Caption
  ENGLISH_TvItemID_0  = '&New Folder';
  ENGLISH_TvItemID_1  = '&Rename Folder';
  ENGLISH_TvItemID_2  = '&Delete Folder';
  ENGLISH_TvItemID_4  = 'Cu&t';
  ENGLISH_TvItemID_5  = '&Copy';
  ENGLISH_TvItemID_6  = '&Paste';
  ENGLISH_TvItemID_8  = 'Tree &Size';
  ENGLISH_TvItemID_9  = '&Folder Contents';
  ENGLISH_TvItemID_11 = '&Map Network Drive ...';
  ENGLISH_TvItemID_12 = 'Dis&Connect Network Drive';
  ENGLISH_TvItemID_14 = '&Property';
  //Error words
  ENGLISH_ewDrive = 'Drive ';  //873
  ENGLISH_ewFolder = 'Folder "';  //873
  ENGLISH_ewError = 'ERROR - ';
  ENGLISH_ewFile = ' file ';
  ENGLISH_ewFrom = 'From  : ';
  ENGLISH_ewTo = 'To     : ';
  ENGLISH_ewCancel = 'Cancel';
  ENGLISH_ewBrowse = 'Browse';
  ENGLISH_ewReadOnly = 'ReadOnly';
  ENGLISH_ewArchive = 'Archive';
  ENGLISH_ewHidden = 'Hidden';
  ENGLISH_ewSystem = 'System';
  //Error strings
  ENGLISH_esCannot = 'ERROR - Can''t ';
  ENGLISH_esSpecifyDir = 'Please specify a directory';
  ENGLISH_esInvalidDrvID = 'Not a valid Drive ID';
  ENGLISH_esDrvNotReady = 'There is no disk in Drive or Drive is not ready';
  ENGLISH_esExists = 'already exists !';
  ENGLISH_esInvalidDirName = 'Error - Invalid Directory Name';
  ENGLISH_esConfirmRename = 'Do you want to rename the selected folder';
  ENGLISH_esCannotAddDrv = 'Can''t add drives';
  ENGLISH_esNewFolder = 'New Folder';
  ENGLISH_esInvalidChars = 'Folder Name contains invalid characters';
  ENGLISH_esNotFound = 'not found';
  ENGLISH_esFilesIn = 'Files in ';
  ENGLISH_esFileOpFailed = 'File operation failed';
  ENGLISH_esReadOnly = 'It''s ReadOnly';
  ENGLISH_esNoFileSelected = 'No file(s) selected';
  ENGLISH_esSendToFolder = 'Send to any folder';
  ENGLISH_esSendToPath = 'Please enter the send_to path';
  ENGLISH_esPersistSaveError = 'Error - PersistFile.Save failed';
  ENGLISH_esSetAttr = 'Set Attributes';
  ENGLISH_esTreeSize = 'TREE SIZE';  //873
  ENGLISH_esAllSubDir = 'and all its Sub-Folders ';  //873
  //>872

//------------------------------------------
//               Chinese Tradition
//------------------------------------------
  //879<
  //LsFileListview28 Column Caption
  CHINESE_Tra_ColIdName   = '嘿';
  CHINESE_Tra_ColIdSize   = '';
  CHINESE_Tra_ColIdType   = '摸';
  CHINESE_Tra_ColIdDate   = 'э';
  CHINESE_Tra_ColIdAttr   = '妮┦';
  CHINESE_Tra_ColIdHdSize = '合盒甧秖';
  CHINESE_Tra_ColIdFSpace = '逞緇丁';
  //Drive Type
  CHINESE_Tra_DrvTypeStr0 = 'ぃ';
  CHINESE_Tra_DrvTypeStr1 = 'ぃ';
  CHINESE_Tra_DrvTypeStr2 = '簿埃Α合盒';
  CHINESE_Tra_DrvTypeStr3 = 'セ诀合盒';
  CHINESE_Tra_DrvTypeStr4 = '呼隔合盒诀';
  CHINESE_Tra_DrvTypeStr5 = '盒诀';
  CHINESE_Tra_DrvTypeStr6 = '店览合盒诀';
  //LsFileListview28Popup MenuItem Caption
  CHINESE_Tra_LvItemID_0  = '秨币(&O)';
  CHINESE_Tra_LvItemID_1  = '浪跌(&V)';
  CHINESE_Tra_LvItemID_3  = '肚癳(&N)';
  CHINESE_Tra_LvItemID_5  = '芭(&T)';
  CHINESE_Tra_LvItemID_6  = '狡籹(&C)';
  CHINESE_Tra_LvItemID_7  = '禟(&P)';
  CHINESE_Tra_LvItemID_9  = '(&R)';
  CHINESE_Tra_LvItemID_10 = '埃(&D)';
  CHINESE_Tra_LvItemID_12 = 'ず甧(&P)';
  CHINESE_Tra_LvItemID_14 = '穝糤戈Ж(&N)...';
  CHINESE_Tra_LvItemID_30 = 'ㄤ戈Ж ...';
  CHINESE_Tra_LvItemID_31 = '狡籹ず甧芭禟茂';
  CHINESE_Tra_LvItemID_32 = '狡籹郎芭禟茂';
  CHINESE_Tra_LvItemID_33 = 'ミ倍畖';
  //LsDirTree21Popup MenuItem Caption
  CHINESE_Tra_TvItemID_0  = '穝糤戈Ж(&N)';
  CHINESE_Tra_TvItemID_1  = '戈Ж(&R)';
  CHINESE_Tra_TvItemID_2  = '埃戈Ж(&D)';
  CHINESE_Tra_TvItemID_4  = '芭(&T)';
  CHINESE_Tra_TvItemID_5  = '狡籹(&C)';
  CHINESE_Tra_TvItemID_6  = '禟(&P)';
  CHINESE_Tra_TvItemID_8  = '戈Ж(&S)';
  CHINESE_Tra_TvItemID_9  = '戈Жず甧(&F)';
  CHINESE_Tra_TvItemID_11 = '硈絬呼隔合盒诀(&M)';
  CHINESE_Tra_TvItemID_12 = 'い耞呼隔合盒诀(&C)';
  CHINESE_Tra_TvItemID_14 = 'ず甧(&P)';
  //Error words
  CHINESE_Tra_ewDrive = '合盒 ';  //873
  CHINESE_Tra_ewFolder = '戈Ж "';  //873
  CHINESE_Tra_ewError = '岿粇 - ';
  CHINESE_Tra_ewFile = ' 郎 ';
  CHINESE_Tra_ewFrom = '眖  : ';
  CHINESE_Tra_ewTo = '     : ';
  CHINESE_Tra_ewCancel = '';
  CHINESE_Tra_ewBrowse = '聅凝';
  CHINESE_Tra_ewReadOnly = '斑弄';
  CHINESE_Tra_ewArchive = '玂';
  CHINESE_Tra_ewHidden = '留旅';
  CHINESE_Tra_ewSystem = '╰参';
  //Error strings
  CHINESE_Tra_esCannot = '岿粇- 礚猭 ';
  CHINESE_Tra_esSpecifyDir = '叫﹚隔畖';
  CHINESE_Tra_esInvalidDrvID = 'ぃ琌Τ合盒诀腹';
  CHINESE_Tra_esDrvNotReady = '合盒诀ず⊿Τ盒┪合盒诀﹟ゼ诀';
  CHINESE_Tra_esExists = '竒 !';
  CHINESE_Tra_esInvalidDirName = '岿粇 - 礚隔畖嘿';
  CHINESE_Tra_esConfirmRename = '璶笆硂戈Ж嘿盾';
  CHINESE_Tra_esCannotAddDrv = '礚猭合盒诀';
  CHINESE_Tra_esNewFolder = '穝糤戈Ж';
  CHINESE_Tra_esInvalidChars = '戈Ж嘿いΤ礚じ';
  CHINESE_Tra_esNotFound = 'тぃ';
  CHINESE_Tra_esFilesIn = '郎 ';
  CHINESE_Tra_esFileOpFailed = '郎穨ア毖';
  CHINESE_Tra_esReadOnly = '硂琌斑弄';
  CHINESE_Tra_esNoFileSelected = '⊿Τ匡郎';
  CHINESE_Tra_esSendToFolder = '肚癳ㄤ戈Ж';
  CHINESE_Tra_esSendToPath = '叫块肚癳隔畖';
  CHINESE_Tra_esPersistSaveError = '岿粇 - PersistFile.Save ア毖';
  CHINESE_Tra_esSetAttr = '砞﹚郎妮┦';
  CHINESE_Tra_esTreeSize = '戈Жず甧';  //873
  CHINESE_Tra_esAllSubDir = '籔ㄤ场戈Ж ';  //873
  //>879

//------------------------------------------
//               Chinese Simplified
//------------------------------------------
  //879<
  //LsFileListview28 Column Caption
  CHINESE_Sim_ColIdName   = '名称';
  CHINESE_Sim_ColIdSize   = '大小';
  CHINESE_Sim_ColIdType   = '类型';
  CHINESE_Sim_ColIdDate   = '已修改';
  CHINESE_Sim_ColIdAttr   = '属性';
  CHINESE_Sim_ColIdHdSize = '磁盘容量';
  CHINESE_Sim_ColIdFSpace = '剩余空间';
  //Drive Type
  CHINESE_Sim_DrvTypeStr0 = '不明';
  CHINESE_Sim_DrvTypeStr1 = '不存在';
  CHINESE_Sim_DrvTypeStr2 = '可移除式磁盘';
  CHINESE_Sim_DrvTypeStr3 = '本机磁盘';
  CHINESE_Sim_DrvTypeStr4 = '网络磁盘机';
  CHINESE_Sim_DrvTypeStr5 = '光碟机';
  CHINESE_Sim_DrvTypeStr6 = '虚盘机';
  //LsFileListview28Popup MenuItem Caption
  CHINESE_Sim_LvItemID_0  = '开启(&O)';
  CHINESE_Sim_LvItemID_1  = '检视(&V)';
  CHINESE_Sim_LvItemID_3  = '传送到(&N)';
  CHINESE_Sim_LvItemID_5  = '剪下(&T)';
  CHINESE_Sim_LvItemID_6  = '复制(&C)';
  CHINESE_Sim_LvItemID_7  = '贴上(&P)';
  CHINESE_Sim_LvItemID_9  = '更名(&R)';
  CHINESE_Sim_LvItemID_10 = '删除(&D)';
  CHINESE_Sim_LvItemID_12 = '内容(&P)';
  CHINESE_Sim_LvItemID_14 = '新增资料夹(&N)...';
  CHINESE_Sim_LvItemID_30 = '其他资料夹 ...';
  CHINESE_Sim_LvItemID_31 = '复制内容到剪贴簿';
  CHINESE_Sim_LvItemID_32 = '复制档名到剪贴簿';
  CHINESE_Sim_LvItemID_33 = '在桌面创建捷径';
  //LsDirTree21Popup MenuItem Caption
  CHINESE_Sim_TvItemID_0  = '新增子资料夹(&N)';
  CHINESE_Sim_TvItemID_1  = '更名资料夹(&R)';
  CHINESE_Sim_TvItemID_2  = '删除资料夹(&D)';
  CHINESE_Sim_TvItemID_4  = '剪下(&T)';
  CHINESE_Sim_TvItemID_5  = '复制(&C)';
  CHINESE_Sim_TvItemID_6  = '贴上(&P)';
  CHINESE_Sim_TvItemID_8  = '资料夹大小(&S)';
  CHINESE_Sim_TvItemID_9  = '资料夹内容(&F)';
  CHINESE_Sim_TvItemID_11 = '连机网络磁盘机(&M)';
  CHINESE_Sim_TvItemID_12 = '中断网络磁盘机(&C)';
  CHINESE_Sim_TvItemID_14 = '内容(&P)';
  //Error words
  CHINESE_Sim_ewDrive = '磁盘 ';  //873
  CHINESE_Sim_ewFolder = '资料夹 "';  //873
  CHINESE_Sim_ewError = '错误 - ';
  CHINESE_Sim_ewFile = ' 文件 ';
  CHINESE_Sim_ewFrom = '从  : ';
  CHINESE_Sim_ewTo = '到     : ';
  CHINESE_Sim_ewCancel = '取消';
  CHINESE_Sim_ewBrowse = '浏览';
  CHINESE_Sim_ewReadOnly = '唯读';
  CHINESE_Sim_ewArchive = '保存';
  CHINESE_Sim_ewHidden = '隐藏';
  CHINESE_Sim_ewSystem = '系统';
  //Error strings
  CHINESE_Sim_esCannot = '错误- 无法 ';
  CHINESE_Sim_esSpecifyDir = '请指定一个路径';
  CHINESE_Sim_esInvalidDrvID = '不是有效的磁盘机代号';
  CHINESE_Sim_esDrvNotReady = '磁盘机内没有碟片，或磁盘机尚未待机';
  CHINESE_Sim_esExists = '已经存在 !';
  CHINESE_Sim_esInvalidDirName = '错误 - 无效的路径名称';
  CHINESE_Sim_esConfirmRename = '你要更动这个资料夹的名称吗';
  CHINESE_Sim_esCannotAddDrv = '无法加入磁盘机';
  CHINESE_Sim_esNewFolder = '新增资料夹';
  CHINESE_Sim_esInvalidChars = '资料夹名称中含有无效字符';
  CHINESE_Sim_esNotFound = '找不到';
  CHINESE_Sim_esFilesIn = '文件在 ';
  CHINESE_Sim_esFileOpFailed = '文件作业失败';
  CHINESE_Sim_esReadOnly = '这是唯读的';
  CHINESE_Sim_esNoFileSelected = '没有选到文件';
  CHINESE_Sim_esSendToFolder = '传送到其他资料夹';
  CHINESE_Sim_esSendToPath = '请输入传送的路径';
  CHINESE_Sim_esPersistSaveError = '错误 - PersistFile.Save 失败';
  CHINESE_Sim_esSetAttr = '设定文件属性';
  CHINESE_Sim_esTreeSize = '资料夹内容大小';  //873
  CHINESE_Sim_esAllSubDir = '与其全部的子资料夹 ';  //873
  //>879

//------------------------------------------
//               Dutch
//------------------------------------------
  //875<
  //LsFileListview28 Column Caption
  DUTCH_ColIdName   = 'Naam';
  DUTCH_ColIdSize   = 'Grootte';
  DUTCH_ColIdType   = 'Type';
  DUTCH_ColIdDate   = 'Gewijzigd op';
  DUTCH_ColIdAttr   = 'Attr';
  DUTCH_ColIdHdSize = 'Schijf groote';
  DUTCH_ColIdFSpace = 'Vrije ruimte';
  //Drive Type
  DUTCH_DrvTypeStr0 = 'Onbekend';
  DUTCH_DrvTypeStr1 = 'Bestaat niet';
  DUTCH_DrvTypeStr2 = 'Verwijderbare schijf';
  DUTCH_DrvTypeStr3 = 'Vaste schijf';
  DUTCH_DrvTypeStr4 = 'Netwerk schijf';
  DUTCH_DrvTypeStr5 = 'CD-ROM';
  DUTCH_DrvTypeStr6 = 'RAM schijf';
  //LsFileListview28Popup MenuItem Caption
  DUTCH_LvItemID_0  = '&Open';
  DUTCH_LvItemID_1  = '&Beeld';
  DUTCH_LvItemID_3  = '&Versturen naar';
  DUTCH_LvItemID_5  = '&Knippen';
  DUTCH_LvItemID_6  = 'K&opi雛en';
  DUTCH_LvItemID_7  = '&Plakken';
  DUTCH_LvItemID_9  = '&Naam wijzigen';
  DUTCH_LvItemID_10 = '&Verwijderen';
  DUTCH_LvItemID_12 = '&Eigenschappen';
  DUTCH_LvItemID_14 = '&Nieuwe map ...';
  DUTCH_LvItemID_30 = 'Elke map ...';
  DUTCH_LvItemID_31 = 'Klembord als inhoud';
  DUTCH_LvItemID_32 = 'Klembord als bestandsnaam';
  DUTCH_LvItemID_33 = 'Bureaublad als snelkoppeling';
  //LsDirTree21Popup MenuItem Caption
  DUTCH_TvItemID_0  = '&Nieuwe map';
  DUTCH_TvItemID_1  = '&Geef map andere naam';
  DUTCH_TvItemID_2  = '&Verwijer map';
  DUTCH_TvItemID_4  = 'Knippen';
  DUTCH_TvItemID_5  = '&Kopi雛en';
  DUTCH_TvItemID_6  = '&Plakken';
  DUTCH_TvItemID_8  = 'Map grootte';
  DUTCH_TvItemID_9  = '&Map inhoud';
  DUTCH_TvItemID_11 = '&Map netwerk schijf ...';
  DUTCH_TvItemID_12 = 'Verbreek verbinding met netwerk schijf';
  DUTCH_TvItemID_14 = '&Eigenschap';
  //Error words
  DUTCH_ewDrive = 'Schijf ';  //873
  DUTCH_ewFolder = 'Map "';  //873
  DUTCH_ewError = 'FOUT - ';
  DUTCH_ewFile = ' bestand ';
  DUTCH_ewFrom = 'Van  : ';
  DUTCH_ewTo = 'Naar     : ';
  DUTCH_ewCancel = 'Afbreken';
  DUTCH_ewBrowse = 'Verkennen';
  DUTCH_ewReadOnly = 'Alleen lezen';
  DUTCH_ewArchive = 'Archief';
  DUTCH_ewHidden = 'Verborgen';
  DUTCH_ewSystem = 'Systeem';
  //Error strings
  DUTCH_esCannot = 'FOUT - kan niet ';
  DUTCH_esSpecifyDir = 'Geef svp directorie op';
  DUTCH_esInvalidDrvID = 'Geen geldige drive ID';
  DUTCH_esDrvNotReady = 'Er is geen disk in de drive of de drive is niet klaar';
  DUTCH_esExists = 'bestaat al !';
  DUTCH_esInvalidDirName = 'FOUT - verkeerde directorie naam';
  DUTCH_esConfirmRename = 'Wilt u de geselecteerde map een ander naam geven';
  DUTCH_esCannotAddDrv = 'Kan geen schijven toevoegen';
  DUTCH_esNewFolder = 'Nieuwe map';
  DUTCH_esInvalidChars = 'De map naam bevat ongeldige letters';
  DUTCH_esNotFound = 'niet gevonden';
  DUTCH_esFilesIn = 'Bestanden in ';
  DUTCH_esFileOpFailed = 'Bestands operatie mislukte';
  DUTCH_esReadOnly = 'Het is aleen-lezen';
  DUTCH_esNoFileSelected = 'Geen bestand(en) geselecteerd';
  DUTCH_esSendToFolder = 'Stuur naar welke map dan ook';
  DUTCH_esSendToPath = 'Geef svp het doel pad';
  DUTCH_esPersistSaveError = 'ERROR - herhaalde bestand.opslaan mislukte';
  DUTCH_esSetAttr = 'Zet attributen';
  DUTCH_esTreeSize = 'BOOM GROOTTE';  //873
  DUTCH_esAllSubDir = 'en alle-sub-mappen ';  //873
  //>875

//------------------------------------------
//               French
//------------------------------------------
  //872<
  //LsFileListview28 Column Caption
  FRENCH_ColIdName    = 'Nom';
  FRENCH_ColIdSize    = 'Taille';
  FRENCH_ColIdType    = 'Type';
  FRENCH_ColIdDate    = 'Date';
  FRENCH_ColIdAttr    = 'Attributs';
  FRENCH_ColIdHdSize  = 'Taille Disque';
  FRENCH_ColIdFSpace  = 'Espace libre';
  //Drive Type
  FRENCH_DrvTypeStr0  = 'Inconnu';
  FRENCH_DrvTypeStr1  = 'N''existe pas';
  FRENCH_DrvTypeStr2  = 'Disque amovible';
  FRENCH_DrvTypeStr3  = 'Disque Fixe';
  FRENCH_DrvTypeStr4  = 'Disque R閟eau';
  FRENCH_DrvTypeStr5  = 'CD-ROM';
  FRENCH_DrvTypeStr6  = 'RAM Disk';
  //LsFileListview28Popup MenuItem Caption
  FRENCH_LvItemID_0   = '&Ouvrir';
  FRENCH_LvItemID_1   = '&Voir';
  FRENCH_LvItemID_3   = 'Co&pier dans';
  FRENCH_LvItemID_5   = 'C&ouper';
  FRENCH_LvItemID_6   = '&Copier';
  FRENCH_LvItemID_7   = 'Co&ller';
  FRENCH_LvItemID_9   = '&Renommer';
  FRENCH_LvItemID_10  = '&Supprimer';
  FRENCH_LvItemID_12  = '&Propri閠閟';
  FRENCH_LvItemID_14  = '&Nouveau Dossier ...';
  FRENCH_LvItemID_30  = 'le Dossier ...';  //873
  FRENCH_LvItemID_31  = 'Contenu dans le Presse-Papier';
  FRENCH_LvItemID_32  = 'Nom du fichier  dans le Presse-Papier';  //873
  FRENCH_LvItemID_33  = 'Comme Raccourci sur le Bureau';
  //LsDirTree21Popup MenuItem Caption
  FRENCH_TvItemID_0   = '&Nouveau Dossier';
  FRENCH_TvItemID_1   = '&Renommer le Dossier';
  FRENCH_TvItemID_2   = '&Effacer le Dossier';
  FRENCH_TvItemID_4   = 'Cou&per';
  FRENCH_TvItemID_5   = '&Copier';
  FRENCH_TvItemID_6   = 'Co&ller';
  FRENCH_TvItemID_8   = 'Taille de l''&arborescence';
  FRENCH_TvItemID_9   = '&Contenu du Dossier';
  FRENCH_TvItemID_11  = '&Connecter Lecteur R閟eau ...';
  FRENCH_TvItemID_12  = '&D閏onnecter Lecteur R閟eau';
  FRENCH_TvItemID_14  = '&Propri閠閟';
  //Error words
  FRENCH_ewDrive = 'Lecteur ';  //873
  FRENCH_ewFolder = 'Dossier "';  //873
  FRENCH_ewError = 'ERREUR - ';
  FRENCH_ewFile = ' le fichier  ';
  FRENCH_ewFrom = 'de  : ';
  FRENCH_ewTo = '�     : ';
  FRENCH_ewCancel = 'Annule';
  FRENCH_ewBrowse = 'Parcourir';  //873
  FRENCH_ewReadOnly = 'Lecture Seule';
  FRENCH_ewArchive = 'Archive';  //873
  FRENCH_ewHidden = 'Cach�';
  FRENCH_ewSystem = 'Syst鑝e';
  //Error strings
  FRENCH_esCannot = 'ERREUR - Impossible de ';
  FRENCH_esSpecifyDir = 'SVP choisissez un r閜ertoire';
  FRENCH_esInvalidDrvID = 'ID de lecteur non valide';
  FRENCH_esDrvNotReady = 'Il n''y a pas de disque dans le lecteur' +
                          'ou le lecteur n''est pas pr阾.';
  FRENCH_esExists = '" existe d閖� !';
  FRENCH_esInvalidDirName = 'Erreur - Nom de r閜ertoire invalide';
  FRENCH_esConfirmRename = 'Voulez-vous renommer le dossier s閘ectionn�';
  FRENCH_esCannotAddDrv = 'Impossible d''ajouter des lecteurs';
  FRENCH_esNewFolder = 'Nouveau Dossier';
  FRENCH_esInvalidChars = 'Le nom de dossier contient des caract鑢es interdits';
  FRENCH_esNotFound = 'pas trouv�';
  FRENCH_esFilesIn = 'Fichiers dans ';
  FRENCH_esFileOpFailed = 'L''op閞ation sur le fichier a 閏hou�';
  FRENCH_esReadOnly = 'Lecteur en Lecture Seule';  //873
  FRENCH_esNoFileSelected = 'Pas de fichier s閘ectionn�';
  FRENCH_esSendToFolder = 'Copier dans le dossier...';
  FRENCH_esSendToPath = 'Veuillez donner le chemin de destination';
  FRENCH_esPersistSaveError = 'Erreur - Fichier prot間�.L''enregistrement � 閏hou�';
  FRENCH_esSetAttr = 'Donnez les Attributs';
  FRENCH_esTreeSize = 'Taille de l''arbre';  //873
  FRENCH_esAllSubDir = 'et de tous ses sous-dossiers ';  //873
  //>872

//------------------------------------------
//               German
//------------------------------------------
  //872<
  //LsFileListview28 Column Caption
  GERMAN_ColIdName    = 'Dateiname';
  GERMAN_ColIdSize    = 'Gr鲞e';
  GERMAN_ColIdType    = 'Typ';
  GERMAN_ColIdDate    = 'Ge鋘dert am';
  GERMAN_ColIdAttr    = 'Attribute';
  GERMAN_ColIdHdSize  = 'Gesamtgr鲞e';
  GERMAN_ColIdFSpace  = 'Freier Speicher';
  //Drive Type
  GERMAN_DrvTypeStr0  = 'Unbekannt';
  GERMAN_DrvTypeStr1  = 'Nicht existent';
  GERMAN_DrvTypeStr2  = 'Disketten-Laufwerk';
  GERMAN_DrvTypeStr3  = 'Lokales Laufwerk';
  GERMAN_DrvTypeStr4  = 'Netz-Laufwerk';
  GERMAN_DrvTypeStr5  = 'CD-ROM-Laufwerk';
  GERMAN_DrvTypeStr6  = 'RAM-Laufwerk';
  //LsFileListview28Popup MenuItem Caption
  GERMAN_LvItemID_0   =  '�&ffnen';
  GERMAN_LvItemID_1   =  'An&zeigen';
  GERMAN_LvItemID_3   =  'Se&nden an';
  GERMAN_LvItemID_5   =  '&Ausschneiden';
  GERMAN_LvItemID_6   =  '&Kopieren';
  GERMAN_LvItemID_7   =  '&Einf黦en';
  GERMAN_LvItemID_9   =  '&Umbenennen';
  GERMAN_LvItemID_10  =  '&L鰏chen';
  GERMAN_LvItemID_12  =  'Eigen&schaften';
  GERMAN_LvItemID_14  =  'Neuer &Ordner';
  GERMAN_LvItemID_30  =  'Ordne&r...';
  GERMAN_LvItenID_31  =  '&Datei(en) an Zwischenablage';
  GERMAN_LvItemID_32  =  'Dateiname(n) an Z&wischenablage';
  GERMAN_LvItemID_33  =  '&Verkn黳fung auf den Desktop';
  //LsDirTree21Popup MenuItem Caption
  GERMAN_TvItemID_0   = '&Neuer Ordner';
  GERMAN_TvItemID_1   = '&Ordner umbenennen';
  GERMAN_TvItemID_2   = 'Ordner &l鰏chen';
  GERMAN_TvItemID_4   = '&Ausschneiden';
  GERMAN_TvItemID_5   = '&Kopieren';
  GERMAN_TvItemID_6   = '&Einf黦en';
  GERMAN_TvItemID_8   = 'Ordner&gr鲞e';
  GERMAN_TvItemID_9   = 'Ordner&inhalt';
  GERMAN_TvItemID_11  = 'Netzlaufwerk &verbinden...';
  GERMAN_TvItemID_12  = 'Netzlaufwerk &trennen...';
  GERMAN_TvItemID_14  = 'Eigen&schaften';
  //Error words
  GERMAN_ewDrive = 'Laufwerk ';  //873
  GERMAN_ewFolder = 'Ordner "';  //873
  GERMAN_ewError = 'Fehler - ';
  GERMAN_ewFile = '" ist fehlgeschlagen mit Datei ';
  GERMAN_ewFrom = 'Von  : ';
  GERMAN_ewTo = 'Nach : ';
  GERMAN_ewCancel = '&Abbrechen';
  GERMAN_ewBrowse = 'Ordner &w鋒len';
  GERMAN_ewReadOnly = 'Schreibgesch黷zt';
  GERMAN_ewArchive = 'Archiv';
  GERMAN_ewHidden = 'Versteckt';
  GERMAN_ewSystem = 'System';
  //Error strings
  GERMAN_esCannot = 'Fehler - Dateioperation "';
  GERMAN_esSpecifyDir = 'Bitte w鋒len Sie ein Verzeichnis:';
  GERMAN_esInvalidDrvID = 'Keine g黮tige Laufwerksbezeichnung!';
  GERMAN_esDrvNotReady = 'Kein Datentr鋑er im Laufwerk ' +
                          'oder Laufwerk nicht bereit!';
  GERMAN_esExists = ' existiert bereits!';
  GERMAN_esInvalidDirName = 'Fehler - Ung黮tiger Verzeichnisname:';
  GERMAN_esConfirmRename = 'Wollen Sie den markierten Ordner umbenennen';
  GERMAN_esCannotAddDrv = 'Hinzuf黦en von Laufwerken nicht m鰃lich!';
  GERMAN_esNewFolder = 'Neuer Ordner';
  GERMAN_esInvalidChars = 'Ordnername enth鋖t ung黮tige Zeichen!';
  GERMAN_esNotFound = ' nicht gefunden!';
  GERMAN_esFilesIn = 'Dateien in ';
  GERMAN_esFileOpFailed = 'Dateioperation ist fehlgeschlagen!';
  GERMAN_esReadOnly = 'Die Datei ist schreibgesch黷zt!';
  GERMAN_esNoFileSelected = 'Keine Datei(en) markiert!';
  GERMAN_esSendToFolder = 'An Ordner senden...';
  GERMAN_esSendToPath = 'Bitte geben Sie den Zielpfad ein:';
  GERMAN_esPersistSaveError = 'Verkn黳fung konnte nicht erstellt werden!';
  GERMAN_esSetAttr = 'Attribute setzen...';
  GERMAN_esTreeSize = 'BAUMGR诌E';  //873
  GERMAN_esAllSubDir = 'und alle untergeordneten Ordner ';  //873
  //>872

//------------------------------------------
//               Italiano
//------------------------------------------
  //874<
  //LsFileListview28 Column Caaption
  ITALIAN_ColIdName   = 'Nome';
  ITALIAN_ColIdSize   = 'Capacit�';
  ITALIAN_ColIdType   = 'Tipo';
  ITALIAN_ColIdDate   = 'Modificato';
  ITALIAN_ColIdAttr   = 'Attributi';
  ITALIAN_ColIdHdSize = 'Capacit� disco';
  ITALIAN_ColIdFSpace = 'Disponibile';
  //Drive Type
  ITALIAN_DrvTypeStr0 = 'Sconosciuto';
  ITALIAN_DrvTypeStr1 = 'Inesistente';
  ITALIAN_DrvTypeStr2 = 'Disco rimovibile';
  ITALIAN_DrvTypeStr3 = 'Disco locale';
  ITALIAN_DrvTypeStr4 = 'Disco di rete';
  ITALIAN_DrvTypeStr5 = 'Disco CD-ROM';
  ITALIAN_DrvTypeStr6 = 'Disco RAM';
  //LsFileListview28Popup MenuItem Caption
  ITALIAN_LvItemID_0  = '&Apri';
  ITALIAN_LvItemID_1  = '&An&teprima';
  ITALIAN_LvItemID_3  = 'In&via a';
  ITALIAN_LvItemID_5  = 'Tagl&ia';
  ITALIAN_LvItemID_6  = '&Copia';
  ITALIAN_LvItemID_7  = '&Incolla';
  ITALIAN_LvItemID_9  = '&Rin&omina';
  ITALIAN_LvItemID_10 = '&Elimina';
  ITALIAN_LvItemID_12 = '&Propriet�';
  ITALIAN_LvItemID_14 = '&Nuova Cartella...';
  ITALIAN_LvItemID_30 = 'Cartella ...';
  ITALIAN_LvItemID_31 = 'Copia il contenuto negli appunti';
  ITALIAN_LvItemID_32 = 'Copia il nome negli appunti';
  ITALIAN_LvItemID_33 = 'Collegamento al Desktop';
  //LsDirTree21Popup MenuItem Caption
  ITALIAN_TvItemID_0  = '&Nuova Cartella';
  ITALIAN_TvItemID_1  = '&Rinomina Cartella';
  ITALIAN_TvItemID_2  = '&Elimina Cartella';
  ITALIAN_TvItemID_4  = 'Ta&glia';
  ITALIAN_TvItemID_5  = '&Copia';
  ITALIAN_TvItemID_6  = '&Incolla';
  ITALIAN_TvItemID_8  = '&Dimensioni elenco';
  ITALIAN_TvItemID_9  = 'Co&ntenuto Cartella';
  ITALIAN_TvItemID_11 = 'Connetti &unit� di rete...';
  ITALIAN_TvItemID_12 = 'Dis&connetti unit� di rete';
  ITALIAN_TvItemID_14 = '&Proriet�';
  //Error words
  ITALIAN_ewDrive = 'Unit� ';
  ITALIAN_ewFolder = 'Cartella "';
  ITALIAN_ewError = 'ERRORE - ';
  ITALIAN_ewFile = ' file ';
  ITALIAN_ewFrom = 'Da  : ';
  ITALIAN_ewTo = 'A     : ';
  ITALIAN_ewCancel = 'Annulla';
  ITALIAN_ewBrowse = 'Esplora';
  ITALIAN_ewReadOnly = 'Sola lettura';
  ITALIAN_ewArchive = 'Archivio';
  ITALIAN_ewHidden = 'Nascosto';
  ITALIAN_ewSystem = 'Sistema';
  //Error strings
  ITALIAN_esCannot = 'ERRORE - Impossibile ';
  ITALIAN_esSpecifyDir = 'Specificare una cartella';
  ITALIAN_esInvalidDrvID = 'Lettera di unit� non valida';
  ITALIAN_esDrvNotReady = 'Nessun disco nell''unit� o unit� non pronta';
  ITALIAN_esExists = 'gi� esistente !';
  ITALIAN_esInvalidDirName = 'Errore - Nome cartella non valido';
  ITALIAN_esConfirmRename = 'Vuoi rinominare la cartella selezionata';
  ITALIAN_esCannotAddDrv = 'Impossibile aggiungere unit�';
  ITALIAN_esNewFolder = 'Nuova cartella';
  ITALIAN_esInvalidChars = 'Il nome della cartella contiene un carattere non valido';
  ITALIAN_esNotFound = 'non trovato';
  ITALIAN_esFilesIn = 'Files in ';
  ITALIAN_esFileOpFailed = 'Operazione fallita';
  ITALIAN_esReadOnly = 'E'' in sola lettura';
  ITALIAN_esNoFileSelected = 'Nessun file selezionato';
  ITALIAN_esSendToFolder = 'Invia alla cartella';
  ITALIAN_esSendToPath = 'Inserire il percorso di destinazione';
  ITALIAN_esPersistSaveError = 'Errore - PersistFile.Save fallito';
  ITALIAN_esSetAttr = 'Fissa attributi';
  ITALIAN_esTreeSize = 'Capacit�';  //873
  ITALIAN_esAllSubDir = 'e tutte le sotto-cartelle ';
  //>874

//------------------------------------------
//               Japanese
//------------------------------------------
  //880<
  //LsFileListview28 Column Caption
  JAPANESE_ColIdName   = '柤慜';
  JAPANESE_ColIdSize   = '僒僀僘';
  JAPANESE_ColIdType   = '庬椶';
  JAPANESE_ColIdDate   = '峏怴擔帪';
  JAPANESE_ColIdAttr   = '懏惈';
  JAPANESE_ColIdHdSize = '崌寁僒僀僘';
  JAPANESE_ColIdFSpace = '嬻偒椞堟';
  //Drive Type
  JAPANESE_DrvTypeStr0 = '晄柧';
  JAPANESE_DrvTypeStr1 = '懚嵼偟傑偣傫';
  JAPANESE_DrvTypeStr2 = '儕儉乕僶僽儖僨僶僀僗';
  JAPANESE_DrvTypeStr3 = '僴乕僪僨傿僗僋';
  JAPANESE_DrvTypeStr4 = '僱僢僩儚乕僋僪儔僀僽';
  JAPANESE_DrvTypeStr5 = 'CD-ROM 僪儔僀僽';
  JAPANESE_DrvTypeStr6 = 'RAM Disk';
  //LsFileListview28Popup MenuItem Caption
  JAPANESE_LvItemID_0  = '奐偔(&O)';
  JAPANESE_LvItemID_1  = '尒傞(&V)';
  JAPANESE_LvItemID_3  = '憲傞(&n)';
  JAPANESE_LvItemID_5  = '愗傝庢傝(&t)';
  JAPANESE_LvItemID_6  = '僐僺乕(&C)';
  JAPANESE_LvItemID_7  = '揬傝晅偗(&P)';
  JAPANESE_LvItemID_9  = '柤慜偺曄峏(&R)';
  JAPANESE_LvItemID_10 = '嶍彍(&D)';
  JAPANESE_LvItemID_12 = '僾儘僷僥傿(&P)';
  JAPANESE_LvItemID_14 = '怴婯僼僅儖僟嶌惉(&N)';
  JAPANESE_LvItemID_30 = '僼僅儖僟偺巜掕 ...';
  JAPANESE_LvItemID_31 = '僼傽僀儖偺撪梕傪僋儕僢僾儃乕僪傊僐僺乕';
  JAPANESE_LvItemID_32 = '僼傽僀儖柤傪僋儕僢僾儃乕僪傊僐僺乕';
  JAPANESE_LvItemID_33 = '僨僗僋僩僢僾傊僔儑乕僩僇僢僩傪嶌惉';
  //LsDirTree21Popup MenuItem Caption
  JAPANESE_TvItemID_0  = '怴婯僼僅儖僟嶌惉(&N)';
  JAPANESE_TvItemID_1  = '僼僅儖僟柤曄峏(&R)';
  JAPANESE_TvItemID_2  = '僼僅儖僟嶍彍(&D)';
  JAPANESE_TvItemID_4  = '愗傝庢傝(&t)';
  JAPANESE_TvItemID_5  = '僐僺乕(&C)';
  JAPANESE_TvItemID_6  = '揬傝晅偗(&P)';
  JAPANESE_TvItemID_8  = '僼僅儖僟僒僀僘(&S)';
  JAPANESE_TvItemID_9  = '僼僅儖僟撪梕(&F)';
  JAPANESE_TvItemID_11 = '僱僢僩儚乕僋僪儔僀僽偺妱傝摉偰(&M)';
  JAPANESE_TvItemID_12 = '僱僢僩儚乕僋僪儔僀僽偺愗抐(&C)';
  JAPANESE_TvItemID_14 = '僾儘僷僥傿(&P)';
  //Error words
  JAPANESE_ewDrive = '僪儔僀僽 ';  //873
  JAPANESE_ewFolder = '僼僅儖僟 "';  //873
  JAPANESE_ewError = '僄儔乕 - ';
  JAPANESE_ewFile = ' 僼傽僀儖 ';
  JAPANESE_ewFrom = '偐傜  : ';
  JAPANESE_ewTo = '傊     : ';
  JAPANESE_ewCancel = '僉儍儞僙儖';
  JAPANESE_ewBrowse = '...嶲徠';
  JAPANESE_ewReadOnly = '撉傒庢傝愱梡';
  JAPANESE_ewArchive = '傾乕僇僀僽';
  JAPANESE_ewHidden = '塀偟僼傽僀儖';
  JAPANESE_ewSystem = '僔僗僥儉僼傽僀儖';
  //Error strings
  JAPANESE_esCannot = '僄儔乕 - 幚峴弌棃傑偣傫 ';
  JAPANESE_esSpecifyDir = '僨傿儗僋僩儕傪巜掕偟偰壓偝偄';
  JAPANESE_esInvalidDrvID = '晄惓側 僪儔僀僽ID 偱偡';
  JAPANESE_esDrvNotReady = '僨傿僗僋偑憓擖偝傟偰偄側偄偐丄僪儔僀僽偺弨旛偑弌棃偰偄傑偣傫';
  JAPANESE_esExists = '婛偵摨柤偺傕偺偑懚嵼偟偰偄傑偡 !';
  JAPANESE_esInvalidDirName = '僄儔乕 - 晄惓側僨傿儗僋僩儕柤偱偡';
  JAPANESE_esConfirmRename = '慖戰偟偨僼僅儖僟偺柤慜傪曄峏偟傑偡偐丠';
  JAPANESE_esCannotAddDrv = '僪儔僀僽傪捛壛偱偒傑偣傫';
  JAPANESE_esNewFolder = '怴偟偄僼僅儖僟';
  JAPANESE_esInvalidChars = '僼僅儖僟柤偵晄惓側暥帤偑娷傑傟偰偄傑偡';
  JAPANESE_esNotFound = '尒偮偐傝傑偣傫';
  JAPANESE_esFilesIn = '僼傽僀儖 in ';
  JAPANESE_esFileOpFailed = '僼傽僀儖偺憖嶌偵幐攕偟傑偟偨';
  JAPANESE_esReadOnly = '撉傒庢傝愱梡偱偡';
  JAPANESE_esNoFileSelected = '僼傽僀儖偑慖戰偝傟偰偄傑偣傫';
  JAPANESE_esSendToFolder = '巜掕偺僼僅儖僟傊乽憲傞乿';
  JAPANESE_esSendToPath = '乽憲傞乿愭偺僷僗傪擖椡偟偰偔偩偝偄';
  JAPANESE_esPersistSaveError = '僄儔乕 - 僔儑乕僩僇僢僩偺嶌惉幐攕';
  JAPANESE_esSetAttr = '懏惈曄峏';
  JAPANESE_esTreeSize = '僼僅儖僟僒僀僘';
  JAPANESE_esAllSubDir = '偲埲壓慡偰偺僒僽僼僅儖僟偺僒僀僘 ';
  //>880
//------------------------------------------
//               Korean
//------------------------------------------
  //885<
  //LsFileListview28 Column Caption
  KOREAN_ColIdName   = '捞抚';
  KOREAN_ColIdSize   = '农扁';
  KOREAN_ColIdType   = '辆幅';
  KOREAN_ColIdDate   = '荐沥茄 朝楼';
  KOREAN_ColIdAttr   = '加己';
  KOREAN_ColIdHdSize = '叼胶农 农扁';
  KOREAN_ColIdFSpace = '咯蜡 傍埃';
  //Drive Type
  KOREAN_DrvTypeStr0 = '葛抚';
  KOREAN_DrvTypeStr1 = '粮犁窍瘤 臼澜';
  KOREAN_DrvTypeStr2 = '力芭啊瓷 叼胶农 靛扼捞宏';
  KOREAN_DrvTypeStr3 = '绊沥 叼胶农 靛扼捞宏';
  KOREAN_DrvTypeStr4 = '匙飘亏 叼胶农 靛扼捞宏';
  KOREAN_DrvTypeStr5 = 'CD-ROM 叼胶农 靛扼捞宏';
  KOREAN_DrvTypeStr6 = 'RAM 叼胶农 靛扼捞宏';
  //LsFileListview28Popup MenuItem Caption
  KOREAN_LvItemID_0  = '凯扁(&O)';
  KOREAN_LvItemID_1  = '焊扁(&V)';
  KOREAN_LvItemID_3  = '焊郴扁(&S)';
  KOREAN_LvItemID_5  = '磊福扁(&X)';
  KOREAN_LvItemID_6  = '汗荤(&C)';
  KOREAN_LvItemID_7  = '嘿捞扁(&P)';
  KOREAN_LvItemID_9  = '捞抚 函版(&R)';
  KOREAN_LvItemID_10 = '瘤快扁(&D)';
  KOREAN_LvItemID_12 = '沥焊(&P)';
  KOREAN_LvItemID_14 = '货 弃歹(&N)...';
  KOREAN_LvItemID_30 = '弃歹肺(&O)...';
  KOREAN_LvItemID_31 = '努赋焊靛肺 郴侩 汗荤(&K)';
  KOREAN_LvItemID_32 = '努赋焊靛肺 颇老 捞抚 汗荤(&L)';
  KOREAN_LvItemID_33 = '官帕拳搁俊 官肺啊扁肺 父甸扁(&S)';
  //LsDirTree21Popup MenuItem Caption
  KOREAN_TvItemID_0  = '货 弃歹(&N)';
  KOREAN_TvItemID_1  = '弃歹 捞抚 官操扁(&R)';
  KOREAN_TvItemID_2  = '弃歹 瘤快扁(&D)';
  KOREAN_TvItemID_4  = '磊福扁(&T)';
  KOREAN_TvItemID_5  = '汗荤(&C)';
  KOREAN_TvItemID_6  = '嘿捞扁(&P)';
  KOREAN_TvItemID_8  = '飘府 农扁(&S)';
  KOREAN_TvItemID_9  = '弃歹 郴侩(&F)';
  KOREAN_TvItemID_11 = '匙飘亏 靛扼捞宏 父甸扁(&N)...';
  KOREAN_TvItemID_12 = '匙飘亏 靛扼捞宏 楷搬谗扁(&U)';
  KOREAN_TvItemID_14 = '沥焊(&P)';
  //Error words
  KOREAN_ewDrive = '靛扼捞宏 ';  //873
  KOREAN_ewFolder = '弃歹 "';  //873
  KOREAN_ewError = '俊矾 - ';
  KOREAN_ewFile = ' 颇老 ';
  KOREAN_ewFrom = '俊辑  : ';
  KOREAN_ewTo = '(栏)肺     : ';
  KOREAN_ewCancel = '秒家';
  KOREAN_ewBrowse = '凯恩';
  KOREAN_ewReadOnly = '佬扁傈侩';
  KOREAN_ewArchive = '焊包';
  KOREAN_ewHidden = '见辫';
  KOREAN_ewSystem = '矫胶袍';
  //Error strings
  KOREAN_esCannot = '俊矾 - 且荐 绝澜 ';
  KOREAN_esSpecifyDir = '叼泛配府甫 舅妨林寂夸';
  KOREAN_esInvalidDrvID = '嘎瘤 臼绰 靛扼捞宏 ID';
  KOREAN_esDrvNotReady = '叼胶农啊 绝芭唱 霖厚登瘤 臼疽嚼聪促';
  KOREAN_esExists = '捞固 粮犁钦聪促 !';
  KOREAN_esInvalidDirName = '俊矾 - 肋给等 叼泛配府 捞抚涝聪促';
  KOREAN_esConfirmRename = '弃歹狼 捞抚阑 官操矫摆嚼聪鳖 -';
  KOREAN_esCannotAddDrv = '靛扼捞宏甫 眠啊且 荐 绝嚼聪促';
  KOREAN_esNewFolder = '货 弃歹';
  KOREAN_esInvalidChars = '弃歹 捞抚俊 肋给等 巩磊啊 乐嚼聪促';
  KOREAN_esNotFound = '茫阑 荐 绝嚼聪促';
  KOREAN_esFilesIn = '颇老 ';
  KOREAN_esFileOpFailed = '颇老 贸府 角菩';
  KOREAN_esReadOnly = '佬扁 傈侩 颇老涝聪促';
  KOREAN_esNoFileSelected = '急琶等 颇老捞 绝嚼聪促';
  KOREAN_esSendToFolder = '弃歹肺 焊郴扁';
  KOREAN_esSendToPath = '焊郴扁甫 且 弃歹甫 涝仿秦林寂夸 ';
  KOREAN_esPersistSaveError = '俊矾 - PersistFile.Save 角菩';
  KOREAN_esSetAttr = '加己 汲沥';
  KOREAN_esTreeSize = '飘府 农扁';  //873
  KOREAN_esAllSubDir = '弊府绊 葛电 窍困 弃歹 ';  //873
  //>885
//------------------------------------------
//               Polish
//------------------------------------------
  //876<
  //LsFileListview28 Column Caption
  POLISH_ColIdName = 'Nazwa';
  POLISH_ColIdSize = 'Rozmiar';
  POLISH_ColIdType = 'Typ';
  POLISH_ColIdDate = 'Modyfikowany';
  POLISH_ColIdAttr = 'Atrybut';
  POLISH_ColIdHdSize = 'Rozmiar Dysku';
  POLISH_ColIdFSpace = 'Wolne Miejsce';
  //Drive Type
  POLISH_DrvTypeStr0 = 'Nieznany';
  POLISH_DrvTypeStr1 = 'Nie Istnieje';
  POLISH_DrvTypeStr2 = 'Dysk Wymienny';
  POLISH_DrvTypeStr3 = 'Dysk Sta硑';
  POLISH_DrvTypeStr4 = 'Dysk Sieciowy';
  POLISH_DrvTypeStr5 = 'CD-ROM Dysk';
  POLISH_DrvTypeStr6 = 'RAM Dysk';
  //LsFileListView28Popup MenuItem Caption
  POLISH_LvItemID_0 = '&Otw髍z';
  POLISH_LvItemID_1 = '&Podgl筪';
  POLISH_LvItemID_3 = 'Wy渓ij &do';
  POLISH_LvItemID_5 = 'Wyt&nij';
  POLISH_LvItemID_6 = '&Kopiuj';
  POLISH_LvItemID_7 = 'Wkl&ej';
  POLISH_LvItemID_9 = '&Zmiana Nazwy';
  POLISH_LvItemID_10 = '&Usu�';
  POLISH_LvItemID_12 = '&W砤渃iwo渃i';
  POLISH_LvItemID_14 = 'Nowy &Folder';
  POLISH_LvItemID_30 = 'Nast阷ny Folder';
  POLISH_LvItemID_31 = 'Zapisz jako Tre滄';
  POLISH_LvItemID_32 = 'Zapisz jako Nazwa Pliku';
  POLISH_LvItemID_33 = 'Utw髍z Skr髏 na Pulpicie';
  //LsDirTree21Popup MenuItem Caption
  POLISH_TvItemID_0 = 'Nowy &Folder';
  POLISH_TvItemID_1 = 'Zmiana &Nazwy Foldera';
  POLISH_TvItemID_2 = '&Usu� Folder';
  POLISH_TvItemID_4 = 'Wyt&nij';
  POLISH_TvItemID_5 = '&Kopiuj';
  POLISH_TvItemID_6 = 'Wkl&ej';
  POLISH_TvItemID_8 = 'Poka� &Drzewo';
  POLISH_TvItemID_9 = '&Poka� Tre滄 Foldera';
  POLISH_TvItemID_11 = 'Po彻cz z Dyskiem Sieciowym';
  POLISH_TvItemID_12 = 'Roz彻cz Dysk Sieciowy';
  POLISH_TvItemID_14 = '&W砤渃iwo渃i';
  //Error words
  POLISH_ewDrive = 'Dysk ';
  POLISH_ewFolder = 'Folder "';
  POLISH_ewError = 'B％D - ';
  POLISH_ewFile = ' plik ';
  POLISH_ewFrom = 'Z   : ';
  POLISH_ewTo = 'Do   : ';
  POLISH_ewCancel = 'Anuluj';
  POLISH_ewBrowse = 'Przegl筪aj';
  POLISH_ewReadOnly = 'Tylko do Odczytu';
  POLISH_ewArchive = 'Archiwalny';
  POLISH_ewHidden = 'Ukryty';
  POLISH_ewSystem = 'Systemowy';
  //Error strings
  POLISH_esCannot = 'B％D - "';
  POLISH_esSpecifyDir = 'Prosz� wybra� miejsce docelowe ';
  POLISH_esInvalidDrvID = 'Nie mog� zidentyfikowa� dysku, wybierz inny';
  POLISH_esDrvNotReady = 'Ten dysk jest tylko do odczytu';
  POLISH_esExists = 'ju� istnieje';
  POLISH_esInvalidDirName = 'B％D - 痩e podano 渃ie縦�';
  POLISH_esConfirmRename = 'Czy napewno chcesz zmieni� nazw� wybranego foldera ?';
  POLISH_esCannotAddDrv = 'Nie mog� doda� dysku';
  POLISH_esNewFolder = 'Nowy Folder';
  POLISH_esInvalidChars = 'a nazwa folderu';
  POLISH_esNotFound = 'nie znalaz砮m';
  POLISH_esFilesIn = 'Plik體 w ';
  POLISH_esFileOpFailed = 'Operacja na pliku nie udana';
  POLISH_esReadOnly = 'Plik " jest tylko do odczytu';
  POLISH_esNoFileSelected = 'Nie wybrano pliku(體)';
  POLISH_esSendToFolder = 'Wy渓ij do nast阷nego foldera ';
  POLISH_esSendToPath = 'Prosz� wybra� 渃ie縦� i nacisn规 Enter';
  POLISH_esPersistSaveError = 'B彻d - PersistFile.Zapis nie powi骴� si�';
  POLISH_esSetAttr = 'Dodaj atrybuty';
  POLISH_esTreeSize = 'POKA� DRZEWO';
  POLISH_esAllSubDir = 'oraz wszystkie jego Sub-Foldery';
  //>876

//------------------------------------------
//         Brazillian Portuguese
//------------------------------------------
  //873<
  //LsFileListview28 Column Caption
  BRAZ_PORT_ColIdName   = 'Nome';
  BRAZ_PORT_ColIdSize   = 'Tamanho';
  BRAZ_PORT_ColIdType   = 'Tipo';
  BRAZ_PORT_ColIdDate   = 'Modificado';
  BRAZ_PORT_ColIdAttr   = 'Atributos';
  BRAZ_PORT_ColIdHdSize = 'Tamanho total';
  BRAZ_PORT_ColIdFSpace = 'Espa鏾 livre';
  //Drive Type
  BRAZ_PORT_DrvTypeStr0 = 'Desconhecido';
  BRAZ_PORT_DrvTypeStr1 = 'N鉶 existe';
  BRAZ_PORT_DrvTypeStr2 = 'Disco remov韛el';
  BRAZ_PORT_DrvTypeStr3 = 'Disco fixo';
  BRAZ_PORT_DrvTypeStr4 = 'Disco de rede';
  BRAZ_PORT_DrvTypeStr5 = 'CD-ROM';
  BRAZ_PORT_DrvTypeStr6 = 'Disco RAM';
  //LsFileListview28Popup MenuItem Caption
  BRAZ_PORT_LvItemID_0   = '&Abrir';
  BRAZ_PORT_LvItemID_1   = '&Visualizar';
  BRAZ_PORT_LvItemID_3   = 'E&nviar para';
  BRAZ_PORT_LvItemID_5   = 'Cor&tar';
  BRAZ_PORT_LvItemID_6   = '&Copiar';
  BRAZ_PORT_LvItemID_7   = 'Col&ar';
  BRAZ_PORT_LvItemID_9   = '&Renomear';
  BRAZ_PORT_LvItemID_10  = '&Apagar';
  BRAZ_PORT_LvItemID_12  = '&Propriedades';
  BRAZ_PORT_LvItemID_14  = '&Nova pasta ...';
  BRAZ_PORT_LvItemID_30  = 'Para a pasta ...';
  BRAZ_PORT_LvItemID_31  = 'Copiar conte鷇o para 醨ea de transfer阯cia';
  BRAZ_PORT_LvItemID_32  = 'Copiar somente o nome para 醨ea de transfer阯cia';
  BRAZ_PORT_LvItemID_33  = '羠ea de Trabalhao como Atalho';
  //LsDirTree21Popup MenuItem Caption
  BRAZ_PORT_TvItemID_0   = '&Nova pasta';
  BRAZ_PORT_TvItemID_1   = '&Renomear pasta';
  BRAZ_PORT_TvItemID_2   = '&Apagar pasta';
  BRAZ_PORT_TvItemID_4   = 'Cor&tar';
  BRAZ_PORT_TvItemID_5   = '&Copiar';
  BRAZ_PORT_TvItemID_6   = 'Col&ar';
  BRAZ_PORT_TvItemID_8   = 'Ta&manho do diret髍io';
  BRAZ_PORT_TvItemID_9   = 'C&onte鷇o da pasta';
  BRAZ_PORT_TvItemID_11  = 'Con&ectar unidade de rede';
  BRAZ_PORT_TvItemID_12  = 'De&sconectar unidade de rede';
  BRAZ_PORT_TvItemID_14  = '&Propriedades';
  //Error words
  BRAZ_PORT_ewDrive = 'Unidade ';
  BRAZ_PORT_ewFolder = 'Pasta "';
  BRAZ_PORT_ewError = 'ERRO - ';
  BRAZ_PORT_ewFile = ' arquivo  ';
  BRAZ_PORT_ewFrom = 'De  : ';
  BRAZ_PORT_ewTo = 'Para     : ';
  BRAZ_PORT_ewCancel = 'Cancelar';
  BRAZ_PORT_ewBrowse = 'Explorar';
  BRAZ_PORT_ewReadOnly = 'Somente leitura';
  BRAZ_PORT_ewArchive = 'Arquivo';
  BRAZ_PORT_ewHidden = 'Oculto';
  BRAZ_PORT_ewSystem = 'Sistema';
  //Error strings
  BRAZ_PORT_esCannot = 'ERRO - imposs韛el ';
  BRAZ_PORT_esSpecifyDir = 'Por favor especifique uma pasta';
  BRAZ_PORT_esInvalidDrvID = 'N鉶 � uma letra de unidade v醠ida';
  BRAZ_PORT_esDrvNotReady = 'N鉶 h� um disco na unidade ' +
                          'ou a unidade n鉶 est� preparada.';
  BRAZ_PORT_esExists = ' j� existe !';
  BRAZ_PORT_esInvalidDirName = 'Erro - Nome da pasta n鉶 � v醠ido';
  BRAZ_PORT_esConfirmRename = 'Deseja renomear a pasta selecionada';
  BRAZ_PORT_esCannotAddDrv = 'N鉶 � poss韛el adicionar unidades';
  BRAZ_PORT_esNewFolder = 'Nova pasta';
  BRAZ_PORT_esInvalidChars = 'o nome da pasta cont閙 caracteres inv醠idos.';
  BRAZ_PORT_esNotFound = 'n鉶 encontrado';
  BRAZ_PORT_esFilesIn = 'Arquivos em ';
  BRAZ_PORT_esFileOpFailed = 'Opera玢o com arquivos falhou';
  BRAZ_PORT_esReadOnly = 'Somente para leitura';
  BRAZ_PORT_esNoFileSelected = 'N鉶 h� pasta(s) selecionada(s)';
  BRAZ_PORT_esSendToFolder = 'Enviar para a pasta';
  BRAZ_PORT_esSendToPath = 'Por favor digite caminho da pasta de destino';
  BRAZ_PORT_esPersistSaveError = 'Erro - PersistFile.Save falhou';
  BRAZ_PORT_esSetAttr = 'Setar atributos';
  BRAZ_PORT_esTreeSize = 'Tamanho do diret髍io';
  BRAZ_PORT_esAllSubDir = 'e todas as sub-pastas ';
  //>873
//MPX1
//------------------------------------------
//   Slovenian
//------------------------------------------
  //881<
  //LsFileListview28 Column Caaption
  SLO_ColIdName   = 'Ime';
  SLO_ColIdSize   = 'Velikost';
  SLO_ColIdType   = 'Tip';
  SLO_ColIdDate   = 'Popravljeno';
  SLO_ColIdAttr   = 'Attr';
  SLO_ColIdHdSize = 'Velikost diska';
  SLO_ColIdFSpace = 'Prazen prostor';
  //Drive Type
  SLO_DrvTypeStr0 = 'Neznan';
  SLO_DrvTypeStr1 = 'Ne obstaja';
  SLO_DrvTypeStr2 = 'Odstranljiv disk';
  SLO_DrvTypeStr3 = 'Trdi disk';
  SLO_DrvTypeStr4 = 'Omre瀗i disk';
  SLO_DrvTypeStr5 = 'CD-ROM';
  SLO_DrvTypeStr6 = 'RAM disk';
  //LsFileListview28Popup MenuItem Caption
  SLO_LvItemID_0  = '&Odpri';
  SLO_LvItemID_1  = '&Poglej';
  SLO_LvItemID_3  = 'Po�&lji na';
  SLO_LvItemID_5  = '&Re瀒';
  SLO_LvItemID_6  = '&Kopiraj';
  SLO_LvItemID_7  = 'Pr&ilepi';
  SLO_LvItemID_9  = 'Pr&eimenuj';
  SLO_LvItemID_10 = '&Bri歩';
  SLO_LvItemID_12 = '&Lastnosti';
  SLO_LvItemID_14 = '&Nova mapa...';
  SLO_LvItemID_30 = 'katerakoli mapa ...';
  SLO_LvItemID_31 = 'Odlagali氳e kot vsebina';
  SLO_LvItemID_32 = 'Odlagali氳e kot ime';
  SLO_LvItemID_33 = 'Namizje kot blji瀗ica';
  //LsDirTree21Popup MenuItem Caption
  SLO_TvItemID_0  = '&Nova mapa';
  SLO_TvItemID_1  = '&Preimenuj mapo';
  SLO_TvItemID_2  = '&Bri歩 mapo';
  SLO_TvItemID_4  = '&Re瀒';
  SLO_TvItemID_5  = '&Kopiraj';
  SLO_TvItemID_6  = 'Pr&ilepi';
  SLO_TvItemID_8  = 'Velikost &drevesa';
  SLO_TvItemID_9  = '&Vsebina mape';
  SLO_TvItemID_11 = 'Prikl&ju鑙 omre瀗i disk ...';
  SLO_TvItemID_12 = '&Odklju鑙 omre瀗i disk ...';
  SLO_TvItemID_14 = '&Lastnosti';
  //Error words
  SLO_ewDrive = 'Disk ';  //873
  SLO_ewFolder = 'mapa "';  //873
  SLO_ewError = 'NAPAKA - ';
  SLO_ewFile = ' datoteka ';
  SLO_ewFrom = 'Iz  : ';
  SLO_ewTo = 'Na     : ';
  SLO_ewCancel = 'Prekini';
  SLO_ewBrowse = 'Prebrskaj';
  SLO_ewReadOnly = 'SamoBranje';
  SLO_ewArchive = 'Arhiva';
  SLO_ewHidden = 'Skrito';
  SLO_ewSystem = 'Sistem';
  //Error strings
  SLO_esCannot = 'NAPAKA - Ne morem ';
  SLO_esSpecifyDir = 'Prosim dolo鑙te mapo';
  SLO_esInvalidDrvID = 'Nepravilen disk';
  SLO_esDrvNotReady = 'Ni diskete ali pa je disk nepripravljen';
  SLO_esExists = '瀍 obstoja !';
  SLO_esInvalidDirName = 'NAPAKA - napa鑞o ime';
  SLO_esConfirmRename = 'Ali 瀍lite preimenovati izbrano mapo?';
  SLO_esCannotAddDrv = 'Diskov ne morem dodati!';
  SLO_esNewFolder = 'Nova mapa';
  SLO_esInvalidChars = 'Ime vsebuje neveljavne znake';
  SLO_esNotFound = 'ne najdem';
  SLO_esFilesIn = 'Datoteke v ';
  SLO_esFileOpFailed = 'Operacija se ni izvedla';
  SLO_esReadOnly = 'Ozne鑕na je samo za branje';
  SLO_esNoFileSelected = 'Niste izbrali datotek';
  SLO_esSendToFolder = 'Po歭ji v katerokoli mapo';
  SLO_esSendToPath = 'Prosim dolo鑙te pot.';
  SLO_esPersistSaveError = 'NAPAKA - PersistFile.Save failed';
  SLO_esSetAttr = 'Postavi atributr';
  SLO_esTreeSize = 'Velikost drevesa';  //873
  SLO_esAllSubDir = 'in vseh podmapah ';  //873
  //>881
//------------------------------------------
//               Slovak
//------------------------------------------
  //876<
  //LsFileListview28 Column Caption
  SLOVAK_ColIdName   = 'N醶ov';
  SLOVAK_ColIdSize   = 'Ve緆os�';
  SLOVAK_ColIdType   = 'Typ';
  SLOVAK_ColIdDate   = 'Zmenen�';
  SLOVAK_ColIdAttr   = 'Atrib鷗y';
  SLOVAK_ColIdHdSize = 'Kapacita';
  SLOVAK_ColIdFSpace = 'Vo緉� miesto';
  //Drive Type
  SLOVAK_DrvTypeStr0 = 'Nezn醡y typ';
  SLOVAK_DrvTypeStr1 = 'Neexistuje';
  SLOVAK_DrvTypeStr2 = 'Vymenite緉� disk';
  SLOVAK_DrvTypeStr3 = 'Pevn� disk';
  SLOVAK_DrvTypeStr4 = 'Sie漮v� disk';
  SLOVAK_DrvTypeStr5 = 'CD-ROM';
  SLOVAK_DrvTypeStr6 = 'RAM disk';
  //LsFileListview28Popup MenuItem Caption
  SLOVAK_LvItemID_0  = '&Otvori�';
  SLOVAK_LvItemID_1  = '&Zobrazi�';
  SLOVAK_LvItemID_3  = 'Odos&la� kam';
  SLOVAK_LvItemID_5  = '&Vystrihn鷿';
  SLOVAK_LvItemID_6  = '&Kop韗ova�';
  SLOVAK_LvItemID_7  = '&Prilepi�';
  SLOVAK_LvItemID_9  = 'Pre&menova�';
  SLOVAK_LvItemID_10 = 'O&dstr醤i�';
  SLOVAK_LvItemID_12 = 'Vl&astnosti';
  SLOVAK_LvItemID_14 = '&Nov� prie鑙nok...';
  SLOVAK_LvItemID_30 = 'Prie鑙nok ...';
  SLOVAK_LvItemID_31 = 'Schr醤ka - obsah s鷅oru';
  SLOVAK_LvItemID_32 = 'Schr醤ka - n醶ov s鷅oru';
  SLOVAK_LvItemID_33 = 'Pracovn� plocha - vytvori� odkaz';
  //LsDirTree21Popup MenuItem Caption
  SLOVAK_TvItemID_0  = '&Nov� prie鑙nok';
  SLOVAK_TvItemID_1  = 'Pre&menova� prie鑙nok';
  SLOVAK_TvItemID_2  = 'O&dstr醤i� prie鑙nok';
  SLOVAK_TvItemID_4  = '&Vystrihn鷿';
  SLOVAK_TvItemID_5  = '&Kop韗ova�';
  SLOVAK_TvItemID_6  = '&Prilepi�';
  SLOVAK_TvItemID_8  = 'Ve緆os� pod&stromu';
  SLOVAK_TvItemID_9  = '&Obsah prie鑙nka';
  SLOVAK_TvItemID_11 = 'Pripo&ji� sie漮v� disk ...';
  SLOVAK_TvItemID_12 = 'Odpo&ji� sie漮v� disk';
  SLOVAK_TvItemID_14 = 'Vl&astnosti';
  //Error words
  SLOVAK_ewDrive = 'Jednotka ';  //873
  SLOVAK_ewFolder = 'Prie鑙nok "';  //873
  SLOVAK_ewError = 'CHYBA - ';
  SLOVAK_ewFile = ' s鷅or ';
  SLOVAK_ewFrom = 'Z  : ';
  SLOVAK_ewTo = 'Do     : ';
  SLOVAK_ewCancel = 'Zru歩�';
  SLOVAK_ewBrowse = 'Preh綼d醰a�';
  SLOVAK_ewReadOnly = 'Iba na 桧tanie';
  SLOVAK_ewArchive = 'Arch韛ny';
  SLOVAK_ewHidden = 'Skryt�';
  SLOVAK_ewSystem = 'Syst閙ov�';
  //Error strings
  SLOVAK_esCannot = 'CHYBA - Nie je mo瀗� ';
  SLOVAK_esSpecifyDir = 'Pros韒 upresnite adres醨';
  SLOVAK_esInvalidDrvID = 'ID jednotky nie je spr醰ne';
  SLOVAK_esDrvNotReady = 'Jednotka nie je pripraven�, alebo sa v nej nenach醖za disk';
  SLOVAK_esExists = 'u� existuje !';
  SLOVAK_esInvalidDirName = 'Chyba - nepovolen� n醶ov adres醨a';
  SLOVAK_esConfirmRename = '巈l醫e si premenova� vybran� adres醨';
  SLOVAK_esCannotAddDrv = 'Nie je mo瀗� prida� jednotky';
  SLOVAK_esNewFolder = 'Nov� prie鑙nok';
  SLOVAK_esInvalidChars = 'N醶ov prie鑙nka obsahuje nepovolen� znaky';
  SLOVAK_esNotFound = 'nebol n醞den�';
  SLOVAK_esFilesIn = 'S鷅ory v ';
  SLOVAK_esFileOpFailed = 'Oper醕ia so s鷅orom zlyhala';
  SLOVAK_esReadOnly = 'Je to iba na 桧tanie';
  SLOVAK_esNoFileSelected = 'Nebol vybran� 瀒adny s鷅or';
  SLOVAK_esSendToFolder = 'Odosla� do prie鑙nka';
  SLOVAK_esSendToPath = 'Pros韒 vlo瀟e cel� cestu k zvolen閙u prie鑙nku';
  SLOVAK_esPersistSaveError = 'Chyba - zlyhalo PersistFile.Save';
  SLOVAK_esSetAttr = 'Nastavenie atrib鷗ov';
  SLOVAK_esTreeSize = 'VE糑OS� PODSTROMU';  //873
  SLOVAK_esAllSubDir = 'a v歟tky jeho podadres醨e ';  //873
  //>876

//------------------------------------------
//               Spanish
//------------------------------------------
  //872<
  //LsFileListview28 Column Caption
  SPANISH_ColIdName   = 'Nombre';
  SPANISH_ColIdSize   = 'Tama駉';
  SPANISH_ColIdType   = 'Tipo';
  SPANISH_ColIdDate   = 'Modificado';
  SPANISH_ColIdAttr   = 'Attributos';
  SPANISH_ColIdHdSize = 'Tama駉 total';
  SPANISH_ColIdFSpace = 'Espacio libre';
  //Drive Type
  SPANISH_DrvTypeStr0 = 'Desconocido';
  SPANISH_DrvTypeStr1 = 'No existe';
  SPANISH_DrvTypeStr2 = 'Disco extraible';
  SPANISH_DrvTypeStr3 = 'Disco fijo';
  SPANISH_DrvTypeStr4 = 'Disco de red';
  SPANISH_DrvTypeStr5 = 'CD-ROM';
  SPANISH_DrvTypeStr6 = 'Disco RAM';
  //LsFileListview28Popup MenuItem Caption
  SPANISH_LvItemID_0   = '&Abrir';
  SPANISH_LvItemID_1   = '&Ver';
  SPANISH_LvItemID_3   = 'E&nviar a';
  SPANISH_LvItemID_5   = 'Cor&tar';
  SPANISH_LvItemID_6   = '&Copiar';
  SPANISH_LvItemID_7   = '&Pegar';
  SPANISH_LvItemID_9   = '&Renombrar';
  SPANISH_LvItemID_10  = '&Borrar';
  SPANISH_LvItemID_12  = '&Propiedades';
  SPANISH_LvItemID_14  = '&Nueva carpeta ...';
  SPANISH_LvItemID_30  = 'Una carpeta ...';
  SPANISH_LvItemID_31  = 'Copiar contenido al portapapeles';
  SPANISH_LvItemID_32  = 'Copiar nombre del fichero al portapapeles';
  SPANISH_LvItemID_33  = 'Acceso directo al escritorio';
  //LsDirTree21Popup MenuItem Caption
  SPANISH_TvItemID_0   = '&Nueva carpeta';
  SPANISH_TvItemID_1   = '&Renombrar carpeta';
  SPANISH_TvItemID_2   = '&Borrar carpeta';
  SPANISH_TvItemID_4   = 'Cor&tar';
  SPANISH_TvItemID_5   = '&Copiar';
  SPANISH_TvItemID_6   = '&Pegar';
  SPANISH_TvItemID_8   = 'Ta&ma駉 del 醨bol';
  SPANISH_TvItemID_9   = 'C&ontenido de la carpeta';
  SPANISH_TvItemID_11  = 'Con&ectar unidad de red';
  SPANISH_TvItemID_12  = 'De&sconectar unidad de red';
  SPANISH_TvItemID_14  = '&Propiedades';
  //Error words
  SPANISH_ewDrive = 'Unidad ';   //873
  SPANISH_ewFolder = 'Carpeta "';   //873
  SPANISH_ewError = 'ERROR - ';
  SPANISH_ewFile = ' el fichero  ';
  SPANISH_ewFrom = 'De  : ';
  SPANISH_ewTo = 'A     : ';
  SPANISH_ewCancel = 'Cancelar';
  SPANISH_ewBrowse = 'Explorar';
  SPANISH_ewReadOnly = 'S髄o lectura';
  SPANISH_ewArchive = 'Archivo';
  SPANISH_ewHidden = 'Oculto';
  SPANISH_ewSystem = 'Sistema';
  //Error strings
  SPANISH_esCannot = 'ERROR - No se puede ';
  SPANISH_esSpecifyDir = 'Por favor especifique un directorio';
  SPANISH_esInvalidDrvID = 'No es una letra de unidad v醠ida';
  SPANISH_esDrvNotReady = 'No hay disco en la unidad ' +
                          'o la unidad no est� preparada.';
  SPANISH_esExists = '" ya existe !';
  SPANISH_esInvalidDirName = 'Error - nombre de carpeta no v醠ido';
  SPANISH_esConfirmRename = 'Quiere renombrar la carpeta seleccionada';
  SPANISH_esCannotAddDrv = 'No se pueden a馻dir unidades';
  SPANISH_esNewFolder = 'Nueva carpeta';
  SPANISH_esInvalidChars = 'El nombre de la carpeta contiene caracteres inv醠idos.';
  SPANISH_esNotFound = 'no encontrado';
  SPANISH_esFilesIn = 'Ficheros en ';
  SPANISH_esFileOpFailed = 'La operaci髇 con el fichero ha fallado';
  SPANISH_esReadOnly = 'Es de s髄o lectura';
  SPANISH_esNoFileSelected = 'No hay fichero(s) seleccionado(s)';
  SPANISH_esSendToFolder = 'Enviar a carpeta';
  SPANISH_esSendToPath = 'Por favor intruduzca la carpeta donde enviar';
  SPANISH_esPersistSaveError = 'Error - PersistFile.Save fall�';
  SPANISH_esSetAttr = 'Poner atributos';
  SPANISH_esTreeSize = 'TAMA袿 DEL 罵BOL';  //873
  SPANISH_esAllSubDir = 'y todas sus subcarpetas ';  //873
  //>872

//------------------------------------------
//               Swedish
//------------------------------------------
  //882<
  //LsFileListview28 Column Caption
  SWEDISH_ColIdName   = 'Namn';
  SWEDISH_ColIdSize   = 'Storlek';
  SWEDISH_ColIdType   = 'Typ';
  SWEDISH_ColIdDate   = 'Modifierad';
  SWEDISH_ColIdAttr   = 'Attr';
  SWEDISH_ColIdHdSize = 'Disk Storlek';
  SWEDISH_ColIdFSpace = 'Fritt utrymma';
  //Drive Type
  SWEDISH_DrvTypeStr0 = 'Ok鋘d';
  SWEDISH_DrvTypeStr1 = 'Finns Ej';
  SWEDISH_DrvTypeStr2 = 'Flyttbar Disk';
  SWEDISH_DrvTypeStr3 = 'Fast Disk';
  SWEDISH_DrvTypeStr4 = 'N鋞verks Disk';
  SWEDISH_DrvTypeStr5 = 'CD-ROM Disk';
  SWEDISH_DrvTypeStr6 = 'RAM Disk';
  //LsFileListview28Popup MenuItem Caption
  SWEDISH_LvItemID_0  = '�&ppna';
  SWEDISH_LvItemID_1  = '&Visa';
  SWEDISH_LvItemID_3  = 'Sk&icka Till';
  SWEDISH_LvItemID_5  = 'Klipp U&t';
  SWEDISH_LvItemID_6  = '&Kopiera';
  SWEDISH_LvItemID_7  = 'K&listra In';
  SWEDISH_LvItemID_9  = '&Byt Namn';
  SWEDISH_LvItemID_10 = '&Radera';
  SWEDISH_LvItemID_12 = '&Egenskaper';
  SWEDISH_LvItemID_14 = '&Ny Katalog...';
  SWEDISH_LvItemID_30 = 'Valfri Katalog ...';
  SWEDISH_LvItemID_31 = 'Klipboard som Inneh錶l';
  SWEDISH_LvItemID_32 = 'Klippbord som FileNamn';
  SWEDISH_LvItemID_33 = 'Skrivbord som Genv鋑';
  //LsDirTree21Popup MenuItem Caption
  SWEDISH_TvItemID_0  = '&Ny Katalog';
  SWEDISH_TvItemID_1  = '&D鰌 om Katalog';
  SWEDISH_TvItemID_2  = '&Radera Katalog';
  SWEDISH_TvItemID_4  = 'Klip&p ut';
  SWEDISH_TvItemID_5  = '&Kopiera';
  SWEDISH_TvItemID_6  = '&Klistra IN';
  SWEDISH_TvItemID_8  = 'Tr鋎 &Storlek';
  SWEDISH_TvItemID_9  = '&Katalog Inneh錶l';
  SWEDISH_TvItemID_11 = '&Koppla N鋞verks Disk ...';
  SWEDISH_TvItemID_12 = 'Frig鰎 N鋞v&erksdisk';
  SWEDISH_TvItemID_14 = '&Egenskaper';
  //Error words
  SWEDISH_ewDrive = 'Enhet ';
  SWEDISH_ewFolder = 'Katalog "';
  SWEDISH_ewError = 'FEL - ';
  SWEDISH_ewFile = ' fil ';
  SWEDISH_ewFrom = 'Fr錸  : ';
  SWEDISH_ewTo = 'Till     : ';
  SWEDISH_ewCancel = 'Avbryt';
  SWEDISH_ewBrowse = 'S鰇';
  SWEDISH_ewReadOnly = 'Skrivskyddad';
  SWEDISH_ewArchive = 'Arkiv';
  SWEDISH_ewHidden = 'Dold';
  SWEDISH_ewSystem = 'System';
  //Error strings
  SWEDISH_esCannot = 'FEL - Kan Inte ';
  SWEDISH_esSpecifyDir = 'Ange en Katalog';
  SWEDISH_esInvalidDrvID = 'Inte ett Giltigt Enhets ID';
  SWEDISH_esDrvNotReady = 'Det finns ingen disk i enheten, eller s� 鋜 inte enheten klar';
  SWEDISH_esExists = 'finns redan !';
  SWEDISH_esInvalidDirName = 'Fel - Ogiltigt Katalog Namn';
  SWEDISH_esConfirmRename = 'Vill du byta namn p� den valda katalogen';
  SWEDISH_esCannotAddDrv = 'Kan inte l鋑ga till enheter';
  SWEDISH_esNewFolder = 'Ny Katalog';
  SWEDISH_esInvalidChars = 'Katalognamnet inneh錶ler ogiltiga tecken';
  SWEDISH_esNotFound = 'hittar inte';
  SWEDISH_esFilesIn = 'Filer i ';
  SWEDISH_esFileOpFailed = 'Fil錿g鋜d avbr鰐s';
  SWEDISH_esReadOnly = 'File 鋜 Skrivskyddad';
  SWEDISH_esNoFileSelected = 'Inga Fil(er) valda';
  SWEDISH_esSendToFolder = 'Skicka till valfri katalog';
  SWEDISH_esSendToPath = 'ANge s鰇v鋑en f鰎 Skicka Till';
  SWEDISH_esPersistSaveError = 'Fel - Best錯ndeFile.Spara kunde inte utf鰎as';
  SWEDISH_esSetAttr = 'S鋞t Attribut';
  SWEDISH_esTreeSize = 'TR腄 STORLEK';
  SWEDISH_esAllSubDir = 'och alla underkataloger ';
  //>882
//------------------------------------------
//               Turkish
//------------------------------------------
  //886<
  //LsFileListview28 Column Caption
  TURKISH_ColIdName   = '輘im';
  TURKISH_ColIdSize   = 'Boyut';
  TURKISH_ColIdType   = 'Tip';
  TURKISH_ColIdDate   = 'De餴i�';
  TURKISH_ColIdAttr   = 'Attr';
  TURKISH_ColIdHdSize = 'Disk Boyutu';
  TURKISH_ColIdFSpace = 'Bo� Alan';
  //Drive Type
  TURKISH_DrvTypeStr0 = 'Bilinmeyen';
  TURKISH_DrvTypeStr1 = 'Yok';
  TURKISH_DrvTypeStr2 = '驱kart齦abilir Disk';
  TURKISH_DrvTypeStr3 = 'Sabit Disk';
  TURKISH_DrvTypeStr4 = 'Network Disk';
  TURKISH_DrvTypeStr5 = 'CD-ROM Disk';
  TURKISH_DrvTypeStr6 = 'RAM Disk';
  //LsFileListview28Popup MenuItem Caption
  TURKISH_LvItemID_0  = '&A�';
  TURKISH_LvItemID_1  = '&Bak';
  TURKISH_LvItemID_3  = '&G鰊der';
  TURKISH_LvItemID_5  = 'K&es';
  TURKISH_LvItemID_6  = '&Kopyala';
  TURKISH_LvItemID_7  = '&Yapt齬';
  TURKISH_LvItemID_9  = 'Ad &De餴⺶ir';
  TURKISH_LvItemID_10 = '&Sil';
  TURKISH_LvItemID_12 = '&謟ellikler';
  TURKISH_LvItemID_14 = '&Yeni Dizin...';
  TURKISH_LvItemID_30 = 'Bir Dizine ...';
  TURKISH_LvItemID_31 = 'Not defteri i鏴ri餴';
  TURKISH_LvItemID_32 = 'Not defteri dosya ad�';
  TURKISH_LvItemID_33 = 'Masa黶t黱e K齭ayol';
  //LsDirTree21Popup MenuItem Caption
  TURKISH_TvItemID_0  = '&Yeni Dizin';
  TURKISH_TvItemID_1  = '&Dizin Ad齨� De餴⺶ir';
  TURKISH_TvItemID_2  = 'Dizin &Sil';
  TURKISH_TvItemID_4  = 'K&es';
  TURKISH_TvItemID_5  = '&Kopyala';
  TURKISH_TvItemID_6  = '&Yapt齬';
  TURKISH_TvItemID_8  = 'Aga� &Boyutu';
  TURKISH_TvItemID_9  = 'Dizin &葭eri餴';
  TURKISH_TvItemID_11 = '&A� S黵點黶黱e Ba餷an ...';
  TURKISH_TvItemID_12 = 'A� S&黵點黶� Ba餷ant齭齨� Kes';
  TURKISH_TvItemID_14 = '&謟ellikler';
  //Error words
  TURKISH_ewDrive = 'S黵點� ';  //873
  TURKISH_ewFolder = 'Dizin "';  //873
  TURKISH_ewError = 'HATA - ';
  TURKISH_ewFile = ' Dosra ';
  TURKISH_ewFrom = 'From  : ';
  TURKISH_ewTo = 'To     : ';
  TURKISH_ewCancel = 'Vazge�';
  TURKISH_ewBrowse = 'Listele';
  TURKISH_ewReadOnly = 'Salt Okunur';
  TURKISH_ewArchive = 'Ar㱮v';
  TURKISH_ewHidden = 'Gizli';
  TURKISH_ewSystem = 'Sistem';
  //Error strings
  TURKISH_esCannot = 'HATA - Yap齦amayan iem ';
  TURKISH_esSpecifyDir = 'L黷fen Dizin Belirtin';
  TURKISH_esInvalidDrvID = 'Ge鏴rli bir s黵點� harfi de餴l';
  TURKISH_esDrvNotReady = 'Disk veya s黵點� haz齬 de餴l';
  TURKISH_esExists = 'Zaten Var !';
  TURKISH_esInvalidDirName = 'Hata - Yanl dizin ad�';
  TURKISH_esConfirmRename = 'Se鏸li dizin ad齨� de餴⺶irmek istiyormusunuz';
  TURKISH_esCannotAddDrv = 'S黵點� eklenemedi';
  TURKISH_esNewFolder = 'Yeni dizin';
  TURKISH_esInvalidChars = 'Diizin ad� i鏴risinde yanl harf(ler) var';
  TURKISH_esNotFound = 'Bulunamad�';
  TURKISH_esFilesIn = 'Dosyalar i鏴risinde ';
  TURKISH_esFileOpFailed = 'Dosya iemi Hatal�';
  TURKISH_esReadOnly = 'Dosya Salt Okunur';
  TURKISH_esNoFileSelected = 'Dosya Se鏸lmedi';
  TURKISH_esSendToFolder = 'Bir dizin g鰊der';
  TURKISH_esSendToPath = 'L黷fen g鰊derilecek dizin ad齨� girin';
  TURKISH_esPersistSaveError = 'Hata - PersistFile. Kaydetme yap齦amad�';
  TURKISH_esSetAttr = 'Dosya niteliklerini ayarla';
  TURKISH_esTreeSize = 'A蠥� BOYUTU';
  TURKISH_esAllSubDir = 've b黷黱 alt dizinler ';
  //>886


implementation

end.

