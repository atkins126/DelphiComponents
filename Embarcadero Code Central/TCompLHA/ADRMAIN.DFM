�
 TMAINFORM 0�  TPF0	TMainFormMainFormLeft� TopmWidth�HeightEActiveControlCanBtnCaptionAddress Book
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style MenuMainMenuPositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInchx
TextHeight 	TGroupBox	GroupBox1Left
TopWidth�Height� CaptionName/Address InformationTabOrder  TLabelLabel1Left"Top"Width(HeightCaptionName:
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2LeftTop;Width6HeightCaptionAddress:
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel3Left1TopTWidthHeightCaptionCity:
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel4Left ToplWidth*HeightCaptionPhone:
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TSpeedButtonNextBtnLeftlTopWidthHeightHintNext record
Glyph.Data
�   �   BM�       v   (               h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwp wwwwwp www wwp wwwwp w  `wp wfffp wfff`p wfffp w  `wp wwwwp www wwp wwwwwp wwwwwwp ParentShowHintShowHint	OnClickNextBtnClick  TSpeedButtonPrevBtnLeftLTopWidthHeightHintPrevious record
Glyph.Data
�   �   BM�       v   (               h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwp wwwwwp wwpwwp wwwwp wpf  p wfffp pffffp wfffp wpf  p wwwwp wwpwwp wwwwwp wwwwwwp ParentShowHintShowHint	OnClickPrevBtnClick  TLabelLabel5Left"Top� Width)HeightCaptionE-Mail:
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBEditENameLeftQTop Width� Height	DataFieldName
DataSource
DataSource	MaxLength TabOrder 
OnKeyPress
DoKeyPress  TDBEditEAddressLeftQTop9Width� Height	DataFieldAddress
DataSource
DataSource	MaxLength TabOrder
OnKeyPress
DoKeyPress  TDBEditECityLeftQTopQWidth� Height	DataFieldCity
DataSource
DataSource	MaxLength TabOrder
OnKeyPress
DoKeyPress  TDBEditEPhoneLeftQTopjWidth� Height	DataFieldPhone
DataSource
DataSource	MaxLength TabOrder
OnKeyPress
DoKeyPress  TDBEditEEMailLeftQTop� Width� Height	DataFieldEMail
DataSource
DataSource	MaxLength TabOrder
OnKeyPress
DoKeyPress   TBitBtnCanBtnLeft� Top� WidthRHeightTabOrderOnClickCanBtnClickKindbkCancel  TBitBtnSaveBtnLeft*Top� WidthRHeightCaptionSaveModalResultTabOrderOnClickSaveBtnClick
Glyph.Data
�  �  BM�      6  (   $            �                      �  �   �� �   � � ��  ��� ��� �ʦ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ��� ��� ���   �  �   �� �   � � ��  ��� �����������������������������������������������������������������������������	NumGlyphs  TPanelMsgPanelLeft Top� Width�HeightAlignalBottom	AlignmenttaLeftJustify
BevelOuter	bvLoweredTabOrder  	TMainMenuMainMenuLeft0Top�  	TMenuItemMFileCaption&FileShortCut  	TMenuItemMBackCaption&BackupShortCut OnClick
MBackClick  	TMenuItemMRestCaption&RestoreShortCut OnClick
MRestClick  	TMenuItemN1Caption-ShortCut   	TMenuItemMExitCaptionE&xitShortCut OnClick
MExitClick   	TMenuItemMEditCaption&EditShortCut  	TMenuItemMNewCaption&NewShortCut OnClick	MNewClick  	TMenuItemMChangeCaption&ChangeShortCut OnClickMChangeClick  	TMenuItemMDeleteCaption&DeleteShortCut OnClickMDeleteClick   	TMenuItemMSearchCaption&SearchShortCut  	TMenuItemMFindCaption&FindShortCut OnClick
MFindClick  	TMenuItemMFirstCaption&FirstShortCut OnClickMFirstClick  	TMenuItemMNextCaption&NextShortCut OnClick
MNextClick  	TMenuItemMPrevCaption	&PreviousShortCut OnClick
MPrevClick  	TMenuItemMLastCaption&LastShortCut OnClick
MLastClick   	TMenuItemMDataCaption&DataShortCut  	TMenuItemMPurgeCaption&Purge DatabaseShortCut OnClickMPurgeClick    TDataSource
DataSourceDataSetAdrTableLeftTop@  TTableAdrTableDatabaseNameDEMO32	TableName
address.dbLeft0Top@ TStringFieldAdrTableName	FieldNameNameSize(  TStringFieldAdrTableAddress	FieldNameAddressSize(  TStringFieldAdrTableCity	FieldNameCitySize(  TStringFieldAdrTablePhone	FieldNamePhoneSize  TStringFieldAdrTableEMail	FieldNameEMailSize(   TQueryTheQuery
DataSource
DataSourceSQL.StringsCREATE TABLE "Address.db" (Name CHARACTER(40),Address CHARACTER(40),City CHARACTER(40),Phone CHARACTER(14),EMail CHARACTER(40),PRIMARY KEY(Name) ) Left2Top^  TSegLHASegLHA	RegNumber OnCheckFileSegLHACheckFileMakeDirectoriesSafeMode
VerifyModeArchiveTypecaLHARCAllowDuplicates	StorePathForceUpperCaseExceptionOnFileErrorCompressionMethodcolh5ConfirmMessages.StringsPlease confirmCompress %s as %s?Expand %s to %s?Delete %s from the archive?Verify archive integrity of %s? ConfirmTempArchivePathc:\temp\CheckSpaceBeforeExpandSegBaseNameSegDataSegDira:\SegMessages.StringsSegment change: Segment directory:Not enough Free space availableOperation cancelled Unable to open selected segment.Unable to open scan file.Unable to open archive file.'Unable to locate selected segment file.(Correct and press OK or Cancel to Abort.Segment ID Header invalidSegment Set Header invalidSegment Scan Header invalidSegment Archive Header invalid SegSize � LeftTop�    