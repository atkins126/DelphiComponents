�
 TFRMORDERENTRY 0A   TPF0TfrmOrderEntryfrmOrderEntryLeft� TopkWidthvHeight�Caption	New order
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnShowFormShowPixelsPerInch`
TextHeight TPanel
pnlTopLeftLeft Top Width1Height$AlignalLeft
BevelOuterbvNoneCaption
pnlTopLeftTabOrder  	TGroupBox	grpBillToLeft Top Width1Height� AlignalTopCaptionBill toTabOrder  TDBEditdbeBillToNameLeftTopWidth� HeightColor	clBtnFace	DataFieldCompany
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   TDBEditdbeBillToIDLeft� TopWidthYHeightColor	clBtnFace	DataFieldID
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditdbeBillToAddress1LeftTop(WidthHeightColor	clBtnFace	DataFieldAddress1
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditdbeBillToAddress2LeftTop@WidthHeightColor	clBtnFace	DataFieldAddress2
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditdbeBillToCityLeftTopXWidth� HeightColor	clBtnFace	DataFieldCity
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditdbeBillToStateLeftToppWidth� HeightColor	clBtnFace	DataFieldState
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditdbeBillToZipLeft� ToppWidthqHeightColor	clBtnFace	DataFieldZip
DataSourcedtmMythic.dtsCustomer
Font.Color	clBtnTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   	TGroupBox	grpShipToLeft Top� Width1Height� AlignalTopCaptionShip toTabOrder TDBEditdbeShipToContactLeftTopWidth� Height	DataFieldShipToContact
DataSourcedtmMythic.dtsCustomerOrdersTabOrder   TDBEditdbeShipToAddress1LeftTop(WidthHeight	DataFieldShipToAddr1
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbeShipToAddress2LeftTop@WidthHeight	DataFieldShipToAddr2
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbeShipToCityLeftTopXWidth� Height	DataField
ShipToCity
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbeShipToStateLeftToppWidth� Height	DataFieldShipToState
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbeShiptoZipLeft� ToppWidthqHeight	DataField	ShipToZip
DataSourcedtmMythic.dtsCustomerOrdersTabOrder    TPanelpnlTopRightLeft1Top Width=Height$AlignalClient
BevelOuterbvNoneTabOrder TPanelpnlTopRight_BottomLeft Top Width=Height$AlignalBottom
BevelOuterbvNoneTabOrder  TButtonbtnRemoveItemLeftxTopWidthKHeightCaptionRemove ItemTabOrder OnClickbtnRemoveItemClick   TDBGridgrdOrderItemsLeft Top)Width=Height� AlignalClient
DataSourcedtmMythic.dtsOrderItemsOptions	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit TabOrderTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style Columns	FieldNameQtyWidth. 	FieldNameOEMReadOnly	Widthx 	FieldNameNameReadOnly	    TPanelpnlItemSearchLeft Top Width=Height)AlignalTop
BevelOuterbvNoneTabOrder TLabellblOEMNumberLeftTopWidth"HeightCaptionOEM #  TEditedtOEMLeft8TopWidthyHeightTabOrder   TButton
btnAddItemLeft� TopWidthKHeightCaptionAdd ItemTabOrderOnClickbtnAddItemClick    	TGroupBoxgrpPaymentInformationLeft Top$WidthnHeight� AlignalBottomCaptionPayment InformationTabOrder TLabel	lblSoldByLeftTopWidth!HeightCaptionSoldBy  TLabellblTermsLeft� TopWidthHeightCaptionTerms  TLabellblPaymentMethodLeft� TopWidthPHeightCaptionPayment Method  TLabel
lblShipviaLeftTop<Width$HeightCaptionShipVia  TLabellblPOLefttTop<WidthHeightCaptionPO#  TLabellblSubtotalLeftJTopWidth'HeightCaptionSubtotal  TLabellblDueLeftYTopnWidthHeightCaptionDue
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabellblPaidLeft\TopXWidthHeightCaptionPaid  TLabel
lblFreightLeftQTop@Width HeightCaptionFreight  TLabellblTaxLeft\Top(WidthHeightCaptionTax   TBevel
bvlPaymentLeft0TopWidth	HeightqShape
bsLeftLine  TLabellblCCNumberLeftTopdWidth\HeightCaptionCredit Card Number  TLabellblCCExpMonthLeft� TopdWidth6HeightCaption
Exp. Month  TLabellblCCExpYearLeft� TopdWidth.HeightCaption	Exp. Year  TDBLookupComboBox	dbeSoldByLeftTop"WidthkHeight	DataFieldEmpNo
DataSourcedtmMythic.dtsCustomerOrdersKeyFieldID	ListFieldName
ListSourcedtsemployeesTabOrder   TDBComboBoxdbeTermsLeft� Top"WidthEHeight	DataFieldTerms
DataSourcedtmMythic.dtsCustomerOrders
ItemHeightItems.StringsPrepaidNet 30COD  TabOrder  TDBComboBoxdbePaymentMethodLeft� Top"WidthYHeight	DataFieldPaymentMethod
DataSourcedtmMythic.dtsCustomerOrders
ItemHeightItems.StringsCashCheckVisaMCAmExCredit TabOrder  TDBComboBox
dbeShipVIALeftTopJWidth]Height	DataFieldShipVIA
DataSourcedtmMythic.dtsCustomerOrders
ItemHeightItems.StringsUPSUS MailFed ExDHLEmery TabOrder  TDBEditdbePOLefttTopJWidthQHeight	DataFieldPO
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbePaidLeft}TopRWidthHeight	DataField
AmountPaid
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbeSubtotalLeft}TopWidthHeightTabStop	DataField
ItemsTotal
DataSourcedtmMythic.dtsCustomerOrdersReadOnly	TabOrder  TDBEditdbeTaxLeft�Top$WidthEHeightTabStop	DataFieldTaxTotal
DataSourcedtmMythic.dtsCustomerOrdersReadOnly	TabOrder  TDBEdit
dbeFreightLeft}Top;WidthHeight	DataFieldFreight
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBEditdbeDueLeft}TopiWidthHeight	DataField	AmountDue
DataSourcedtmMythic.dtsCustomerOrdersTabOrder	  TDBEdit
dbeTaxRateLeft}Top$Width8Height	DataFieldTaxRate
DataSourcedtmMythic.dtsCustomerOrdersTabOrder
  TButtonbtnLogOrderLeftTopWidthKHeightCaption	Log orderTabOrderOnClickbtnLogOrderClick  TButtonbtnCancelOrderLeftTop0WidthKHeightCancel	CaptionCancel OrderTabOrderOnClickbtnCancelOrderClick  TDBEditdbeCCNumberLeftToprWidth� Height	DataFieldCCNumber
DataSourcedtmMythic.dtsCustomerOrdersTabOrder  TDBComboBoxdbeCCExpMonthLeft� ToprWidthEHeight	DataField
CCExpMonth
DataSourcedtmMythic.dtsCustomerOrders
ItemHeightItems.Strings123456789101112 TabOrder  TDBComboBoxdbeCCExpYearLeft� ToprWidthEHeight	DataField	CCExpYear
DataSourcedtmMythic.dtsCustomerOrders
ItemHeightItems.Strings2000200120022003200420052006200720082009 TabOrder   TffTabletblEmployeesDatabaseNamedbMythic	Exclusive		FieldDefs SessionNamessMythic	TableNameEmployeeTimeout'Left(Top0  TDataSourcedtsemployeesDataSettblEmployeesLeft(TopP  TffTabletblProductsDatabaseNamedbMythic	FieldDefs FilterOptionsfoCaseInsensitive 	IndexNamebyNameSessionNamessMythic	TableNameProductTimeout'Left�Top8 TAutoIncFieldtblProductsID	FieldNameID  TStringFieldtblProductsName	FieldNameNameRequired	Size2  TStringFieldtblProductsUOM	FieldNameUOMRequired	Size  TStringFieldtblProductsOEM	FieldNameOEMRequired	Size  TCurrencyFieldtblProductsSalePrice	FieldName	SalePrice    