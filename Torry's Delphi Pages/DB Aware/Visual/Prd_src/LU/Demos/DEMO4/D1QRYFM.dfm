�
 TFORM1 0�  TPF0TForm1Form1Left� TopmWidthHeight� Caption Lookup DataSource is TQuery Demo
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style PixelsPerInch`
TextHeight TDBLookupComboPlusDBLookupComboPlus1Left=Top
Width� Height	DataFieldEmpNo
DataSourceDataSourceOrdsLookupSourceDataSourceEmpQryLookupDisplayLastNameLookupFieldEmpNoStylecsIncSearch	ListColorclWindowListFont.ColorclWindowTextListFont.Height�ListFont.NameSystemListFont.Style 
ListCursor	crDefaultButtonCursor	crDefaultTabOrder OnTranslateDBLookupComboPlus1TranslateOnSearchKeyPress DBLookupComboPlus1SearchKeyPress  TMemoMemo1LeftTop-Width� HeightyBorderStylebsNoneColor	clBtnFaceCtl3D
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold Lines.Strings%This project shows how you can use a )TQuery as the LookupDataSource in Delphi '1 by defining the OnSearchKeyPress and OnTranslate events.  *This implementation is only necessary for ,Delphi 1 since TQuery is directly supported $for Delphi 2, 3, 4, and C++ Builder. ParentCtl3D
ParentFontReadOnly	TabOrder  TTable	TableOrdsActive	DatabaseNameDBDEMOS	TableName	ORDERS.DBLeft� Top  TDataSourceDataSourceOrdsDataSet	TableOrdsLeft� Top  TQueryQueryEMPActive	DatabaseNameDBDEMOSSQL.StringsSELECT *FROM EMPLOYEEWHERE EMPNO > 0ORDER BY LASTNAME Top  TDataSourceDataSourceEmpQryDataSetQueryEMPLeftTop
   