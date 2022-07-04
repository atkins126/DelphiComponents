{*******************************************************}
{File:      NCOciBuff.PAS                               }
{Revision:  0.03.05 / 17.08.2000                        }
{Comment:   NC OCI8 VCL: string resources               }
{Copyright: (c) 1999-2000, Dmitry Arefiev               }
{Author:    Dmitry Arefiev, darefiev@da-soft.com        }
{Translation: Philippe Bonnefoy Cudraz                  }
{             pbonnefoy@caramail.com                    }
{*******************************************************}
{$I NCOciDef.inc}

unit NCOciMsg;

interface

resourcestring
    // NCOciWrapper
    msgOCINotInstalled = 'NOE1/INIT - OCI n''est pas install� correctement.';
    msgOCIBadVersion = 'NOE2/INIT - Mauvaise version OCI [%s]. Version minimale 8.0.3';
    msgOCINotLoaded = 'NOE3/INIT - Erreur au chargement de la dll OCI. %s';
    msgOCIOutOfCount = 'NOE4/VAR - D�bordement d''index';
    msgOCIBadValueSize = 'NOE5/VAR - Mauvaise taille';
    msgOCIBadArrayLen = 'NOE6/VAR - Mauvaise longueur';
    msgOCIBadValueType = 'NOE7/VAR - Mauvaise variable [%s] valeur de type %d';
    msgOCIUnsupValueType = 'NOE8/VAR - Type de variable non support�';
    // NOE9/VAR
    msgOCIDataToLarge = 'NOE10/VAR - Donn�es trop grandes pour la variable';
    msgOCIVarWithoutStmt = 'NOE11/VAR - La variable n�cessite un ordre compil�';
    msgOCIBadVarType = 'NOE12/VAR - Anomalie sur le type du param�tre';
    msgOCIUndefPWVar = 'NOE13/STMT - Piece wiese operation for unknown variable';
    msgOCIBadTypePWVar = 'NOE14/STMT - Piece wiese operation for invalid variable';
    msgOCIFuncNotFound = 'NOE15/INIT - Point d''entr�e [%s] inconnu dans la dll OCI';
    msgOCINumInvVarArray = 'NOE16/NUM - Taille VARARRAY incorrecte. Valeur inaccessible depuis un variant';
    msgOCINumInvVar = 'NOE17/NUM - Type de variant incorrect. Valeur inaccessible depuis un variant';
    msgOCITooLongGTRID = 'NOE18/TX - D�bordement de longueur (%d) pour GTRID - %d';
    msgOCITooLongBQUAL = 'NOE19/TX - D�bordement de longueur (%d) pour BQUAL - %d';
    msgOCITooLongTXName = 'NOE20/TX - D�passement de la longueur (%d) du nom de transaction - %d';

    // NCOciBuff
    msgOCIBuffMBOpen = 'NOE50/CRS - Le curseur OCI doit �tre ouvert';
    msgOCIBuffMBClose = 'NOE51/CRS - Le curseur OCI doit �tre ferm�';
    msgOCIBadDT4CU = 'NOE52/CRS - Mise � jour bufferis�e impossible d''un curseur OCI contenant des BLOB';
    msgOCIInvalidVarIndex = 'NOE53/CRS - Position incorrecte de la variable';
    msgOCIInvalidRNO = 'NOE60/DEADCRS - Num�ro d''enregistrement invalide';
    msgOCIModifyNotDelphiBuff = 'NOE61/DEADCRS - Action sur un buffer TOCIDataSet avec un buffer non [rsDelphiBuff]';
    msgOCICantModifyBuff = 'NOE62/DEADCRS - Suppression/Modification impossible d''un buffer [rsEmpty, rsNew*Applyed, rsDelphiBuff]';
    msgOCIInvalidBmk = 'NOE63/DEADCRS - Bookmark invalide';
    msgOCIApplyFailed = 'NOE64/DEADCRS - Anomalie lors de la validation des donn�es bufferis�es';
    msgOCIRecurseApply = 'NOE65/DEADCRS - Validation r�cursive de donn�es bufferis�es interdite';
    msgOCINoApplyCallback = 'NOE66/DEADCRS - Callback indispensable pour la mise � jour';
    msgOCIMustBeBidir = 'NOE67/DEADCRS - Le curseur OCI doit �tre bidirectionel';

    // NCOciParams
    msgOCIBadParamVal = 'NOE80/PAR - Valeur inapplicable au param�tre';
    msgOCIComplexType = 'NOE81/PAR - Pour des types complexes de param�tres, utilisez des m�thodes sp�cifiques';
    msgOCIMacroNotFound = 'NOE82/PAR - Macro [%s] inconnue';
    msgOCICantAssignByRef = 'NOE83/PAR - Param�tres par r�f�rence invariables';
    msgOCIParamIsNotHandle = 'NOE84/PAR - Le param�tre n''est pas un handle';

    // NCOciDB
    msgOCIDBmbActive = 'NOE100/DB - La base doit �tre active';
    msgOCIDBmbInactive = 'NOE101/DB - La base doit �tre inactive';
    msgOCIDBLoginRetries = 'NOE102/DB - Connexion � ORACLE impossible apr�s %d tentatives';
    msgOCIDBUnknown = 'NOE103/DB - Base de donn�es [%s] inconnue';
    msgOCIStmtCantDescribe = 'NOE104/Q - Pas de select list pour un ordre ne retournant pas des donn�es';
{*} msgOCIDBTNManyClBraces = 'NOE105/DB - Too many close braces in names file after alias [%s]';
    msgInvFetchPar = 'NOE107/FP - Param�tre pour lecture [%s] invalide';
{*} msgStmtExecFailed = 'NOE108/SDS - Statement execution failed';
    msgDataSetNotEditing = 'NOE110/DS - Le dataset n''est pas en mode Edition';
    msgOCICachUpdMBAct = 'NOE111/DS - les mises � jour bufferis�es doivent �tre actives';
    msgOCIExpNotFnd = 'NOE112/DS - Ordre non compil�. Ouvrez � nouveau le dataset';
    msgOCIRecConstCompFail = 'NOE113/DS - Rejet lors de la compilation de la contrainte "enregistrement". %s';
    msgOCIFieldConstCompFail = 'NOE114/DS - Rejet lors de la compilation de la contrainte "champs". %s';
    msgOCIFieldDefCompFail = 'NOE115/DS - Rejet lors de la compilation de la valeur par d�faut. %s';
    msgOCIRecConstFail = 'NOE116/DS - Rejet sur une contrainte au niveau Enregistrement. %s';
    msgOCIFieldConstFail = 'NOE117/DS - Rejet sur une contrainte au niveau champs. %s';
    msgOCIFieldDefFail = 'NOE118/DS - Rejet sur la valeur par d�faut du champs. %s';
    msgOCICantExecOper = 'NOE119/DS - Op�ration %s d�sactiv�e.';
    msgOCIBlobReadOnly = 'NOE120/BLOB - Le champs BLOB [%s] est en lecture seule';
    msgOCILongStreamInvalid = 'NOE121/BLOB - TOCILongStream ne peut s''utiliser avec le champs [%s]';
    msgOCILOBStreamInvalid = 'NOE122/BLOB - TOCILobStream ne peut s''utiliser avec le champs [%s]';
    msgOCIFieldIsNotBLOB = 'NOE123/BLOB - Ce champs n''est pas de type BLOB';
    msgOCIStmtCantOpen = 'NOE127/Q - OPEN invalide en absence d''ensemble de donn�es';
    msgOCIStmtCantExec = 'NOE128/Q - ExecSQL invalide en pr�sence d''un ensemble de donn�es';
    msgOCIKeyFieldsEmpty = 'NOE129/Q - impossible d''ex�cuter l''ordre SQL, cl� non d�finie';
    msgOCINotPLSQLObj = 'NOE130/SP - [%s] n''est pas un objet PL/SQL utilisable';
    msgOCIPLSQLObjNameEmpty = 'NOE131/SP - Objet PL/SQL sans nom';
    msgOCIPLSQLNotRemote = 'NOE132/SP - Objet PL/SQL d�port� non g�r�s (utilisez TOCIQuery)';
    msgOCIPLSQLNameError = 'NOE133/SP - Analyse du nom de l''objet PL/SQL impossible';
    msgOCINotPackageProc = 'NOE134/SP - [%s] n''est pas un module du paquet [%s]';
    msgOCIBadTableType = 'NOE135/SP - Param�tre de type TABLE OF BOOLEAN/RECORD non g�r� (utilisez TOCIQuery)';
    msgOCITransMBInAct = 'NOE136/TX - La transaction doit �tre inactive. ';
    msgOCIDBNameMismatch = 'NOE137/TX - Erreur sur le nom de la base de donn�es - [%s] et [%s]';
    msgOCITransMBStarted = 'NOE138/TX - Les transactions suspendues doit �tre d�marr�es explicitement';
    msgOCICannotChangeTM = 'NOE139/TX - Connexion d''une autre TM interdite car celle en cours poss�de une transaction active';
    msgOCICantChProp = 'NOE140/UPD - Propri�t� inalt�rable en cours de modification';
    msgOCIParentDSRequired = 'NOE141/NDS - Fournir une info valide sur le dataset parent. ';
{*} msgOCIUnNamedRecParam = 'NOE142/SP - Parameter with type RECORD must be of named type (use TOCIQuery)';
{*} SOCIOperations = 'Lock;Unlock;Update;Insert;Delete;Refresh';

    // NCOciFilter
    msgOCIFilterNotFound = 'NOE150/FLT - Filtre [%s] inconnu';
{$IFNDEF OCI_D4}
    SExprNoLParen = '''('' attendue mais %s trouv�';
    SExprNoRParenOrComma = ''')'' ou '','' attendues mais %s trouv�';
    SExprTypeMis = 'Type invalide dans l''expression';
    SExprBadScope = 'M�lange d''agr�gat et de d�tail interdit';
    SExprNoArith = 'Filtres utilisant des expressions arithm�tiques non support�s';
    SExprNotAgg = 'L''expression n''est pas de type Agr�gat';
    SExprNoAggFilter = 'Les agr�gats sont indisponibles dans les filtres';
    SExprEmptyInList = 'IN fourni sans valeur';
    SInvalidKeywordUse = 'Mot cl� invalide';
{$ENDIF}

    // NCOciReg
    SOCILoginCategoryName = 'OCI Login';
    SOCILoginCategoryDesc = 'OCI Login propri�t� et/ou �v�nement';
    SOCIResourceCategoryName = 'OCI Ressource';
    SOCIResourceCategoryDesc = 'OCI Ressource propri�t� et/ou �v�nement';
    SOCITransactCategoryName = 'OCI Transaction';
    SOCITransactCategoryDesc = 'OCI Transaction propri�t� et/ou �v�nement';

    // NCOciUpdateSQL
    msgOCICantGenQuery = 'NOE170/UPS - Commande %s interdite sur le data set';
    msgOCIRecordDeleted = 'NOE171/UPS - L''enregistrement a �t� supprim� par un autre utilisateur';
    msgOCIRecordChanged = 'NOE172/UPS - L''enregistrement a �t� modifi� par un autre utilisateur';
    msgOCIRecordLocked = 'NOE173/UPS - Enregistrement bloqu� par un autre utilisateur';
    msgOCICantUseSQL4Refresh = 'NOE174/UPS - Ordre SQL inad�quate pour un raffra�chissement';

    // NCOciMove
    msgOCIDPColumnAccessError = '';
    msgOCIDPColumnNotFound = '';
    msgOCIDPTabNameError = '';
    msgOCIDPNotRemote = '';
    msgOCIDPMustBeUnprepared = '';

    // NCOciBDE
{*} msgOCIBDEMBInActive = 'NOE180/BDE BDE connection must be inactive';

    // NCOciCompNamer
{*} SCNBadPropName = 'Invalid property name [%s]';
{*} SCNBadStripPref = 'Error in StripPrefixs. Missing [}]';
{*} SCNEnterText = 'Enter text:';
{*} SCNBadVFormat = 'Missing argument for [V] format in [%s]';
{*} SCNUnknownCommand = 'Encountered unknown format item in [%s]';
{*} SCNNilComp = 'Undefined component';
{*} SCNUnknownFormat = 'For class [%s] format is missed';
{*} SCNCallExpertNow = '<Call expert now ...>';
{*} SCNUseExpertForRename = 'Use expert to rename multiple components';

implementation

end.
