{*******************************************************}
{File:      NCOciBuff.PAS                               }
{Revision:  0.03.03 / 17.11.1999                        }
{Comment:   NC OCI8 VCL: string resources               }
{Copyright: (c) 1999, Dmitry Arefiev                    }
{Author:    Dmitry Arefiev, darefiev@da-soft.com        }
{*******************************************************}
{$I NCOciDef.inc}

unit NCOciMsgUA;

interface

resourcestring
    // NCOciWrapper
    msgOCINotInstalled = 'NOE1/INIT - OCI ����������� ������';
    msgOCIBadVersion = 'NOE2/INIT - ���������� ����� OCI [%s]. NCOCI8 ��������� ����� �� ����� �� 8.0.3';
    msgOCINotLoaded = 'NOE3/INIT - ������� ��� ���������� OCI dll. %s';
    msgOCIOutOfCount = 'NOE4/VAR - ������ ����������� �� ������ �������� ������';
    msgOCIBadValueSize = 'NOE5/VAR - ����������� ��� ������������ ����� �������� ������';
    msgOCIBadArrayLen = 'NOE6/VAR - ����������� ��� ������������ ����� ���� �������';
    msgOCIBadValueType = 'NOE7/VAR - ����������� ��� ����������� ����� [%s] ��� �������� %d';
    msgOCIUnsupValueType = 'NOE8/VAR - ��������������� ��� �����';
    // NOE9/VAR
    msgOCIDataToLarge = 'NOE10/VAR - �������� ���� ������ ��� ������';
    msgOCIVarWithoutStmt = 'NOE11/VAR - ����� ������� ��������� �� ��������';
    msgOCIBadVarType = 'NOE12/VAR - ����������� ��� ������������ ��� ���������';
    msgOCIUndefPWVar = 'NOE13/STMT - Piece wiese operation for unknown variable';
    msgOCIBadTypePWVar = 'NOE14/STMT - Piece wiese operation for invalid variable';
    msgOCIFuncNotFound = 'NOE15/INIT - ������ ����� [%s] �� �������� � OCI DLL';
    msgOCINumInvVarArray = 'NOE16/NUM - ������� VARARRAY �����. ��������� �������� ����� �� ��������';
    msgOCINumInvVar = 'NOE17/NUM - ������� ���������� ���. ��������� �������� ����� �� ��������';
    msgOCITooLongGTRID = 'NOE18/TX - ����������� ���� (%d) GTRID �������� - %d';
    msgOCITooLongBQUAL = 'NOE19/TX - ����������� ���� (%d) BQUAL �������� - %d';
    msgOCITooLongTXName = 'NOE20/TX - ����������� ���� (%d) ���� ���������� �������� - %d';

    // NCOciBuff
    msgOCIBuffMBOpen = 'NOE50/CRS - OCI ������ ������� ���� ��������';
    msgOCIBuffMBClose = 'NOE51/CRS - OCI ������ ������� ���� ������';
{*} msgOCIBadDT4CU = 'NOE52/CRS - Cannot use cached updates for OCI cursor with BLOB define variables';
    msgOCIInvalidVarIndex = 'NOE53/CRS - ���i��� ��������� ����������� ��i����';
    msgOCIInvalidRNO = 'NOE60/DEADCRS - ������� ����� ������';
    msgOCIModifyNotDelphiBuff = 'NOE61/DEADCRS - TOCIDataSet ������� �������� � �� [rsDelphiBuff] �������';
    msgOCICantModifyBuff = 'NOE62/DEADCRS - ��������� ��������/������ [rsEmpty, rsNew*Applyed, rsDelphiBuff] �����';
    msgOCIInvalidBmk = 'NOE63/DEADCRS - ������ ��������';
    msgOCIApplyFailed = 'NOE64/DEADCRS - ������� ���������� ������������ ����������� ���';
    msgOCIRecurseApply = 'NOE65/DEADCRS - ��������� �������� ������������ ����������� ���';
    msgOCINoApplyCallback = 'NOE66/DEADCRS - ������������ ��� ������� �������� ������';
    msgOCIMustBeBidir = 'NOE67/DEADCRS - OCI ������ ������� ���� ��������������';

    // NCOciParams
    msgOCIBadParamVal = 'NOE80/PAR - ��������� ���������� �������� ���������';
    msgOCIComplexType = 'NOE81/PAR - ��� ��������� ���� ��������� �������������� ������� ������';
    msgOCIMacroNotFound = 'NOE82/PAR - ������ [%s] �� ��������';
{*}    msgOCICantAssignByRef = 'NOE83/PAR - Can''t assign value to parameter by reference';
{*}    msgOCIParamIsNotHandle = 'NOE84/PAR - Param is not of handle type';

    // NCOciDB
    msgOCIDBmbActive = 'NOE100/DB - ���� ������ ������� ���� ��������';
    msgOCIDBmbInactive = 'NOE101/DB - ���� ������ ������� ���� ����������';
    msgOCIDBLoginRetries = 'NOE102/DB - ��������� ����������� �� ORACLE ���� %d �����';
    msgOCIDBUnknown = 'NOE103/DB - ���� ������ [%s] �����������';
    msgOCIStmtCantDescribe = 'NOE104/Q - Can not describe select list for a statement without rowset';
{*} msgOCIDBTNManyClBraces = 'NOE105/DB - Too many close braces in names file after alias [%s]';
    msgInvFetchPar = 'NOE107/FP - ������ �������� fetch ��������� [%s]';
{*} msgStmtExecFailed = 'NOE108/SDS - Statement execution failed';
    msgDataSetNotEditing = 'NOE110/DS - DataSet �� � � ����� �������';
    msgOCICachUpdMBAct = 'NOE111/DS - ��������� ���� ������ ���� ���������';
{*} msgOCIExpNotFnd = 'NOE112/DS - Found uncompiled expression. Reopen dataset';
{*} msgOCIRecConstCompFail = 'NOE113/DS - Compilation of record constraint failed. %s';
{*} msgOCIFieldConstCompFail = 'NOE114/DS - Compilation of field constraint failed. %s';
{*} msgOCIFieldDefCompFail = 'NOE115/DS - Compilation of field default value failed. %s';
{*} msgOCIRecConstFail = 'NOE116/DS - Record constraint failed. %s';
{*} msgOCIFieldConstFail = 'NOE117/DS - Field constraint failed. %s';
{*} msgOCIFieldDefFail = 'NOE118/DS - Field default value failed. %s';
{*} msgOCICantExecOper = 'NOE119/DS - Can not %s. It is disabled';
    msgOCIBlobReadOnly = 'NOE120/BLOB - BLOB ���� [%s] ����� ��� �������';
    msgOCILongStreamInvalid = 'NOE121/BLOB - TOCILongStream �� ���� ���� ����������� ��� ���� [%s]';
    msgOCILOBStreamInvalid = 'NOE122/BLOB - TOCILobStream �� ���� ���� ����������� ��� ���� [%s]';
    msgOCIFieldIsNotBLOB = 'NOE123/BLOB - ���� �� � BLOB field';
    msgOCIStmtCantOpen = 'NOE127/Q - �� ����� ������� ����� Open ��� ��"��� ��� rowset';
    msgOCIStmtCantExec = 'NOE128/Q - �� ����� ������� ����� ExecSQL ��� ��"��� � rowset';
    msgOCIKeyFieldsEmpty = 'NOE129/Q - ��������� �������� rowset, ����������� ������ ����';
    msgOCINotPLSQLObj = 'NOE130/SP - [%s] �� � ���������� PL/SQL ��"�����';
    msgOCIPLSQLObjNameEmpty = 'NOE131/SP - ��"� PL/SQL ��"���� �� ���������';
    msgOCIPLSQLNotRemote = 'NOE132/SP - ������� PL/SQL ��"���� �� ������������ (�������������� TOCIQuery)';
    msgOCIPLSQLNameError = 'NOE133/SP - Cannot parse PL/SQL objects name';
    msgOCINotPackageProc = 'NOE134/SP - [%s] �� � ���������� ������ [%s]';
    msgOCIBadTableType = 'NOE135/SP - �������� � ����� TABLE OF BOOLEAN/RECORD �� ����������� (�������������� TOCIQuery)';
    msgOCITransMBInAct = 'NOE136/TX - ���������� ������� ���� ����������';
    msgOCIDBNameMismatch = 'NOE137/TX - DatabaseName ��������� - [%s] �� [%s]';
    msgOCITransMBStarted = 'NOE138/TX - ��� ������� Suspend ���������� ������� ���� �������� ����';
    msgOCICannotChangeTM = 'NOE139/TX - ��������� ��������� ����� TM ����, �� � ������� ������� ����������';
{*}    msgOCICantChProp = 'NOE140/UPD - Can not change property, when updates pending';
{*}    msgOCIParentDSRequired = 'NOE141/NDS - Parent data set valid info required';
{*} msgOCIUnNamedRecParam = 'NOE142/SP - Parameter with type RECORD must be of named type (use TOCIQuery)';
{*} SOCIOperations = 'Lock;Unlock;Update;Insert;Delete;Refresh';

    // NCOciFilter
    msgOCIFilterNotFound = 'NOE150/FLT - Գ���� [%s] �� ��������';
{$IFNDEF OCI_D4}
    SExprNoLParen = '''('' expected but %s found';
    SExprNoRParenOrComma = ''')'' or '','' expected but %s found';
    SExprTypeMis = 'Type mismatch in expression';
    SExprBadScope = 'Operation cannot mix aggregate value with record-varying value';
    SExprNoArith = 'Arithmetic in filter expressions not supported';
    SExprNotAgg = 'Expression is not an aggregate expression';
    SExprNoAggFilter = 'Aggregate expressions not allowed in filters';
    SExprEmptyInList = 'IN predicate list may not be empty';
    SInvalidKeywordUse = 'Invalid use of keyword';
{$ENDIF}    

    // NCOciReg
    SOCILoginCategoryName = 'OCI ����';
    SOCILoginCategoryDesc = 'OCI ���� �������� ��/��� ������';
    SOCIResourceCategoryName = 'OCI ������';
    SOCIResourceCategoryDesc = 'OCI ������ �������� ��/��� ������';
    SOCITransactCategoryName = 'OCI ����������';
    SOCITransactCategoryDesc = 'OCI ���������� �������� ��/��� ������';

    // NCOciUpdateSQL
    msgOCICantGenQuery = 'NOE170/UPS - ��������� ����������� ������� %s ��� ������ �����';
    msgOCIRecordDeleted = 'NOE171/UPS - ����� ���� �������� ������ ������������';
    msgOCIRecordChanged = 'NOE172/UPS - ����� ���� ������ ������ ������������';
    msgOCIRecordLocked = 'NOE173/UPS - ����� ����������� ������ ������������';
    msgOCICantUseSQL4Refresh = 'NOE174/UPS - ��������� ��������������� ����������� SQL ��� ��������� �������';

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

