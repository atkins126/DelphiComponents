�
 TFRMMAIN 0R  TPF0TfrmMainfrmMainLeft� TopTBorderIconsbiSystemMenu
biMinimize BorderStylebsDialogCaptionBDE Export To ASCIIClientHeight�ClientWidth�Color	clBtnFace
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TImageimgCheckLeft�Top{WidthHeightPicture.Data
�   TBitmap�   BM�       v   (                                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� UUUUUUUP UU  UU UUUPUUU UUUPVisible  	TGroupBox	grpSourceLeftTopWidth�Height� HelpContextCaption Source Table TabOrder  TLabelLabel1LeftTopWidthVHeightCaptionSource &Database:FocusControledtAliasName  TLabelLabel2Left� TopWidthCHeightCaptionSource &Table:FocusControledtTableName  TLabelLabel4LeftBTopWidthKHeightCaption&Fields to Export:FocusControl	lstFields  TListBox
lstAliasesLeftTop:Width� HeightaHelpContext
ItemHeightSorted	TabOrder
OnDblClicklstAliasesDblClick  TEditedtAliasNameLeftTopWidth� HeightHelpContextTabOrder OnChangeedtAliasNameChangeOnExitedtAliasNameExit
OnKeyPressedtAliasNameKeyPress  TEditedtTableNameLeft� TopWidth� HeightHelpContextTabOrderOnChangeedtTableNameChangeOnExitedtTableNameExit
OnKeyPressedtTableNameKeyPress  TListBox	lstTablesLeft� Top:Width� HeightaHelpContext
ItemHeightSorted	TabOrder
OnDblClicklstTablesDblClick  TListBox	lstFieldsLeftBTopWidth� Height~HelpContext
ItemHeightStylelbOwnerDrawFixedTabOrder
OnDblClicklstFieldsDblClick
OnDrawItemlstFieldsDrawItem   	TGroupBoxgrpDestinationLeftTop� Width�Height� HelpContextCaption Destination File TabOrder TLabelLabel3LeftTopWidthPHeightCaption&Output Filename:FocusControledtOutputFilename  TLabelLabel6Left� TopWidth5HeightCaptionDi&rectories:FocusControllstDirectories  TLabellblDirectoryLeft� Top$WidthPHeightCaptionI:\Dev\FF2\beta  TLabelLabel5LeftTop� WidthXHeightCaptionSave File as T&ype:FocusControl	cboFilter  TLabelLabel7Left� Top� Width!HeightCaptionDri&ves:FocusControl	cboDrives  TEditedtOutputFilenameLeftTop Width� HeightHelpContextTabOrder Text*.*  TFileListBoxlstFilesLeftTop:Width� HeightaHelpContextFileEditedtOutputFilename
ItemHeightTabOrder  TDirectoryListBoxlstDirectoriesLeft� Top:Width� HeightaHelpContextDirLabellblDirectoryFileListlstFiles
ItemHeightTabOrder  TFilterComboBox	cboFilterLeftTop� Width� HeightHelpContextFileListlstFilesFilterFAll files (*.*)|*.*|Text Files (*.TXT)|*.TXT|Fixed ASCII (*.ASC)|*.ASCTabOrder  TDriveComboBox	cboDrivesLeft� Top� Width� HeightHelpContextDirListlstDirectoriesTabOrder   	TCheckBoxchkSchemaOnlyLeftTop�WidthXHeightCaption&Schema OnlyTabOrderOnClickchkSchemaOnlyClick  TButtonButton1Left� Top�WidthKHeightCaption&ExportTabOrderOnClickbtnExportClick  TButtonbtnCloseLeft� Top�WidthKHeightCaption&CloseTabOrderOnClickbtnCloseClick  TButtonbtnHelpLeft Top�WidthKHeightCaption&HelpTabOrderOnClickbtnHelpClick  TTable	tblSourceDatabaseNameIBLOCAL	TableNameEMPLOYEELeftxTop�  TTabletblDestDatabaseNamed:\ff\dataconv\DumpAsc	TableNameemployee.asc	TableTypettASCIILeft�Top�  
TBatchMovebatBatchMoveDestinationtblDestModebatCopySource	tblSourceLeft�Top�   