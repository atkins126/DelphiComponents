�
 TFORMMAIN 0~  TPF0	TFormMainFormMainLeft� Top[Width�Height�ActiveControlButton1Caption5Master Detail Demonstration    -- NO CODE REQUIRED --
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style PixelsPerInch`
TextHeight 	TGroupBox	GroupBox1Left TopfWidth�Height{CaptionMaster Data (Vendors.DB)
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  TBevelBevel1LeftTop0Width� HeightA  TLabelLabel1LeftTop4Width� Height<Caption�Use this DBLookupComboPlus to select a vendor. This is the master table. The vendor you select determines the list of parts avalible in the parts ComboList below.
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFontWordWrap	  TDBTextDBText1Left@TopWidthDHeight	DataFieldVendorNo
DataSourceDataSourceVendors
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText2Left@Top"WidthAHeight	DataField
VendorName
DataSourceDataSourceVendors
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText4Left@TopCWidthAHeight	DataFieldAddress2
DataSourceDataSourceVendors
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText5Left@TopQWidthAHeight	DataFieldCity
DataSourceDataSourceVendors
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText6Left@Top`WidthAHeight	DataFieldCountry
DataSourceDataSourceVendors
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel3LeftTopWidth1HeightCaption	Vendor ID
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel4Left� Top"Width:HeightCaptionVendor Info
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBLookupComboPlusDBLookupComboPlus1LeftTopWidth� HeightLookupSourceDataSourceVendorsLookupDisplay
VendorNameLookupFieldVendorNoLookupIndexbyVendorNameStylecsIncSearch
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 	ListColorclWindowListFont.ColorclBlackListFont.Height�ListFont.NameArialListFont.StylefsBold 
ListCursor	crDefaultButtonCursor	crDefault
ParentFontTabOrder    	TGroupBox	GroupBox2Left Top� Width�Height� AlignalBottomCaptionDetail Data (Parts.DB)
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder TBevelBevel2LeftTop,Width� HeightY  TLabelLabel2LeftTop/Width� HeightTCaption�Only the records for the parts supplied by the vendor selected above are listed in this DBLookupComboPlus.  This is all done simply by setting the Master information in the Parts Table.   ALL DONE WITHOUT WRITING ONE LINE OF CODE !
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFontWordWrap	  TDBTextDBText7Left@Top2WidtheHeight0	DataFieldDescription
DataSourceDataSourceParts
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel5LeftTopWidth4HeightCaption	Vendor ID
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText8Left@TopWidthDHeight	DataFieldVendorNo
DataSourceDataSourceParts
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel6LeftTop1Width+HeightCaption	Part Info
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText9Left@Top"WidthAHeight	DataFieldPartNo
DataSourceDataSourceParts
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBTextDBText12Left@Top`WidthAHeight	DataFieldCost
DataSourceDataSourceParts
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel7LeftTop"Width&HeightCaptionPart No
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBLookupComboPlusDBLookupComboPlus2LeftTopWidth� HeightLookupSourceDataSourcePartsLookupDisplayDescriptionLookupFieldPartNoLookupIndexbyVendorDescriptionStylecsIncSrchEdit
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 	ListColorclWindowListFont.ColorclBlackListFont.Height�ListFont.NameArialListFont.StylefsBold 
ListCursor	crDefaultButtonCursor	crDefault
ParentFontTabOrder    	TGroupBox	GroupBox3Left Top Width�HeightgAlignalTopCaptionIndex Setup
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder TBevelBevel3LeftfTopWidth?HeightU  TLabelLabel8LeftjTopWidth7Height6AutoSizeCaption�IMPORTANT - In order for this demo to work correctly additional indexes must be created for the Vendors.DB and Parts.DB file. Click the Make Index button to create the Indexes and activate the tables. Then play with the demo below. When done click the
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFontWordWrap	  TLabelLabel9LeftiTopCWidth:HeightAutoSizeCaptionJRemove Index button to remove the extra indexes and deactivate the tables.
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFontWordWrap	  TButtonButton1Left	TopWidthYHeightCaption
Make IndexTabOrder OnClickButton1Click  TButtonButton2Left	Top8WidthYHeightCaptionRemove IndexTabOrderOnClickButton2Click   TDataSourceDataSourceVendorsDataSetTableVendorsOnDataChangeDataSourceVendorsDataChangeLeftxTopr  TTableTableVendorsDatabaseNameDBDEMOS	TableName
VENDORS.DBLeftJTopt  TDataSourceDataSourcePartsDataSet
TablePartsLeft8Top�   TTable
TablePartsDatabaseNameDBDEMOSIndexFieldNamesVendorNoMasterFieldsVendorNoMasterSourceDataSourceVendors	TableNamePARTS.DBLeft
Top�    