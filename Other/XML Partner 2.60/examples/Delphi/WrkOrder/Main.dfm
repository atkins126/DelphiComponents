�
 TWORKORDERS 0   TPF0TWorkOrders
WorkOrdersLeft� Top� Width�HeightCaption
WorkOrdersColor	clBtnFace
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPageControlPagesLeft Top Width�Height�
ActivePageConfirmAlignalClientTabOrder  	TTabSheetQueryCaptionQuery TPanelPanel1Left Top Width�HeightYAlignalTopCaptionPanel1TabOrder  TRadioGrouprgSearchTypeLeftTopWidth� HeightWAlignalLeftCaption	Search By	ItemIndex Items.StringsCategoryDate
Technician TabOrder OnClickrgSearchTypeClick  	TGroupBox
gbCriteriaLeft� TopWidthDHeightWAlignalClientCaptionSearch CriteriaTabOrder TPanel
pnlCatCritLeftTopWidth@HeightFAlignalClient
BevelOuterbvNoneTabOrder Visible TRadioButtonrbLev1LeftTopWidth� HeightCaption1 - TechniciansChecked	TabOrder TabStop	OnClickrbLev1Click  TRadioButtonrbLev3LeftTop/Width� HeightCaption3 - Network ArchitectsTabOrderOnClickrbLev1Click  TRadioButtonrbLev2LeftTopWidth� HeightCaption2 - Network AdministratorsTabOrderOnClickrbLev1Click     
TStatusBar	statusBarLeft Top�Width�HeightPanelsTextStatusWidth�  Text0 nodes foundWidth�  TextSearch TimeWidth�   SimplePanel  	TComboBoxcmbTechsLeft� Top(Width� Height
ItemHeightTabOrderOnChangecmbTechsChangeItems.Strings<none>Bill Dundee	Joe NettyBecky Newman	Drew PitsDink RedrumPete Sommers   TMemomemWorkOrderLeft� TopyWidth�Height'AlignalClient
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	
ScrollBarsssBothTabOrderWordWrap  TPanelPanel2Left TopYWidth�Height AlignalTopCaptionPanel2TabOrder TEditedtExpressionLeftTopWidthHeight
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder   TButton
btnExecuteLeft TopWidthKHeightCaption&ExecuteDefault	TabOrderOnClickbtnExecuteClick   TDateTimePickerDateEditLeft� Top(Width� HeightCalAlignmentdtaLeftDate���K2��@Time���K2��@
DateFormatdfShortDateMode
dmComboBoxKinddtkDate
ParseInputTabOrderOnChangeDateEditChange  	TListViewlbNodesLeft TopyWidth� Height'AlignalLeftColumnsAutoSize	CaptionElements found  HideSelectionReadOnly		RowSelect	TabOrder	ViewStylevsReportOnSelectItemlbNodesSelectItem  TPanelPanel3Left Top�Width�HeightAlignalBottom
BevelOuterbvNoneTabOrder TButton
btnConfirmLeft�TopWidthKHeightCaption&ConfirmTabOrder OnClickbtnConfirmClick    	TTabSheetConfirmCaptionConfirm - Text && Print
ImageIndex 	TSplitter	Splitter1LeftTop WidthHeight�CursorcrHSplit  TPanelPanel4Left Top WidthHeight�AlignalLeftCaptionPanel4TabOrder  TPanelPanel6LeftTopWidthHeightAlignalTop
BevelOuterbvNoneCaptionEmail confirmation bodyTabOrder   TMemo
memConfirmLeftTopWidthHeight�AlignalClient
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontReadOnly	
ScrollBars
ssVerticalTabOrder   TPanelPanel5LeftTop Width�Height�AlignalClientCaptionPanel5TabOrder TPanelPanel7LeftTopWidth�HeightAlignalTop
BevelOuterbvNoneCaptionHardcopy PrintoutTabOrder  TButtonbtnPrintLeftxTopWidthAHeightHintPrint the work orderAnchorsakLeftakTopakRight Caption&PrintTabOrder OnClickbtnPrintClick   TXpFilterPrintPrintFilterLeftTopWidth�Height�Passwordxmlpartner@turbopower.comUserName	anonymousAlignalClient
BevelInnerbvNone
BevelOuterbvNoneHSlidePosition PageCurrentVSlidePosition   TXpFilterText
TextFilterLeft� Top WidthHeightPasswordxmlpartner@turbopower.comUserName	anonymous    	TTabSheetStatusCaptionStatus - HTML
ImageIndex TWebBrowser
webBrowserLeft Top)Width�Height�AlignalClientTabOrder ControlData
�   L   �M  q,                          L              ��W s5��i +.b       L        �      F�                                                            TPanelPanel8Left Top Width�Height)AlignalTopTabOrder TLabellblStatusOrderByLeftTopWidth(HeightCaption	&Order byFocusControlcmbStatusOrderBy  TButton
btnRefreshLeft0TopWidthKHeightCaption&RefreshTabOrder OnClickbtnRefreshClick  	TComboBoxcmbStatusOrderByLeft8Top
Width� Height
ItemHeightTabOrderItems.StringsCategory	WorkOrder
AssignedTo   	TCheckBoxcbStatusAscendingLeft� TopWidthQHeightCaption
&AscendingChecked	State	cbCheckedTabOrder   TXpFilterHTML
HTMLFilterLeft�Top@WidthHeightPasswordxmlpartner@turbopower.comUserName	anonymous
OutputModexphomBodyOnly   	TTabSheetReportCaptionReport - RTF
ImageIndex 	TRichEditrtfMemoLeft Top!Width�Height�AlignalClientTabOrder   TPanelPanel9Left Top Width�Height!AlignalTopTabOrder TButton	pbRefreshLeftTopWidthKHeightCaption&RefreshTabOrder OnClickpbRefreshClick  TButtonbtnOpenLeftXTopWidthKHeightHintEOpen the status report using the application registered for RTF filesCaption&OpenTabOrderOnClickbtnOpenClick   TXpFilterRTF	RTFFilterLeft�Top@WidthHeightPasswordxmlpartner@turbopower.comUserName	anonymous    TXpObjModelDOM
BufferSize  FormattedOutput	IdAttributeidPasswordxmlpartner@turbopower.comUserName	anonymousLeft�Top8  TXpXSLProcessorXSLProcessor
IgnoreCaseLeft�Top8  TXpObjModelwrkDOM
BufferSize  IdAttributeidPasswordxmlpartner@turbopower.comUserName	anonymousLeft�Top8   