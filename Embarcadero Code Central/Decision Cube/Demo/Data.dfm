�
 TDM 0�  TPF0TDMDMOldCreateOrderLeft�Top� Height� Width1 TDataSetProviderprvDictDataSetqryDictOptionspoAllowCommandText LeftTop8  TClientDataSetcust
Aggregates AutoCalcFieldsCommandText$select custno, company from customer	FieldDefsNameCUSTNO
Attributes
faRequired DataTypeftFloat NameCOMPANY
Attributes
faRequired DataTypeftStringSize  	IndexDefsName	custIndexFieldscustnoOptions	ixPrimaryixUnique   	IndexName	custIndexParams ProviderNameprvDict	StoreDefs	LeftToph  TDataSetProviderprvSaleDataSetqrySaleLeftHTop8  TClientDataSetvendor
Aggregates AutoCalcFieldsCommandText(select vendorno, vendorname from vendors	FieldDefsNameVENDORNO
Attributes
faRequired DataTypeftFloat Name
VENDORNAMEDataTypeftStringSize  	IndexDefsNamevendorIndexFieldsvendornoOptions	ixPrimaryixUnique   	IndexNamevendorIndexParams ProviderNameprvDict	StoreDefs	LeftHToph  TIBDatabaseDatabaseDatabaseName=C:\Program Files\Common Files\Borland Shared\Data\MASTSQL.GDBParams.Stringsuser_name=sysdbapassword=masterkey DefaultTransactionTransaction	IdleTimer 
SQLDialect
TraceFlags AllowStreamedConnectedAfterConnectDatabaseAfterConnectLeftTop  TIBTransactionTransactionActiveDefaultDatabaseDatabaseParams.Stringsconcurrencynowait AutoStopActionsaNoneLeftHTop  TIBQueryqryDictDatabaseDatabaseTransactionTransactionBufferChunks�CachedUpdatesSQL.Strings(select vendorno, vendorname from vendors UniDirectional	LeftxTop  TIBQueryqrySaleDatabaseDatabaseTransactionTransactionBufferChunks�CachedUpdatesSQL.Strings1select  o.saledate, o.custno, p.vendorno, c.city,B    count(*) countall, sum(i.qty) qty, sum(p.listprice*i.qty) subt  from orders o '    join items i on i.orderno=o.orderno%    join parts p on p.partno=i.partno(    join customer c on o.custno=c.custno0  group by o.saledate,o.custno,p.vendorno,c.city UniDirectional	Left� Top  TClientDataSetsale
Aggregates Params ProviderNameprvSaleLeftxToph TDateTimeFieldsaleSALEDATE	FieldNameSALEDATE  TFloatField
saleCUSTNO	FieldNameCUSTNO  TFloatFieldsaleVENDORNO	FieldNameVENDORNORequired	  TStringFieldsaleCITY	FieldNameCITYSize  TIntegerFieldsaleCOUNTALL	FieldNameCOUNTALLRequired	  TIntegerFieldsaleQTY	FieldNameQTY  TFloatFieldsaleSUBT	FieldNameSUBT   TFxCubeDecisionCubeDataSetsaleDimensionMap	AlignmenttaRightJustifyBinTypebinYearCaptionDate	FieldNameSALEDATENamedateParams 	StartDate      ��@
ValueCountOnTransform"DecisionCubeDimensionMap0Transform CaptionCustomer	FieldNameCUSTNOFormat,0	KeyFieldsCUSTNOKinddkLookupLookupDataSetcustLookupResultFieldCOMPANYNamecustParams Width
ValueCount6 CaptionVendor	FieldNameVENDORNOFormat,0	KeyFieldsVENDORNOKinddkLookupLookupDataSetvendorLookupResultField
VENDORNAMENamevendorParams Width
ValueCount	 CaptionCity	FieldNameCITYNamecityParams 
ValueCount. 	AlignmenttaRightJustifyCaptionQtyDimensionTypedimSum	FieldNameQTYFormat,0NameqtyParams 
ValueCount  	AlignmenttaRightJustifyCaptionSubtotalDimensionTypedimSum	FieldNameSUBTFormat,0.00NamesubtParams 
ValueCount  	AlignmenttaRightJustifyCaption	Avg(subt)DimensionType
dimAverage	FieldNameSUBTNameavg_subtParams 
ValueCount  	AlignmenttaRightJustifyCaptionCount(*)DimensionTypedimSum	FieldNameCOUNTALLName	count_allParams 
ValueCount  	AlignmenttaRightJustifyCaptionCount(Customer)DimensionTypedimCount	FieldNameCUSTNOFormat,0Name
count_custParams Width
ValueCount  	AlignmenttaRightJustifyCaptionMin(Qty)DimensionTypedimMin	FieldNameQTYNamemin_qtyParams 
ValueCount  	AlignmenttaRightJustifyCaption
Price. AvgDimensionType
dimDerivedSumExprsubt/qty	FieldNamepriceFormat,0.00NamepriceParams 
ValueCount  	AlignmenttaRightJustifyCaptionPi()*Sqr((Test(qty) div 2))DimensionType
dimDerivedSumExprPi()*Sqr((Test(qty) div 2))Format0.00NamefooParams 
ValueCount   Externals.StringsTest MaxCells�� ShowProgressDialog	AfterOpenDecisionCubeAfterOpenOnCallDecisionCubeCallLeftxTop8   