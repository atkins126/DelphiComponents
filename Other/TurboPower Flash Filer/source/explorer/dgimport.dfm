�
 TDLGIMPORT 0�	  TPF0
TdlgImport	dlgImportLeftTop� BorderStylebsDialogCaptionImport DataClientHeightdClientWidth
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style PositionpoScreenCenterOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TBitBtn	btnImportLeftaTopEWidthQHeightCaption&ImportTabOrderOnClickbtnImportClick	NumGlyphs  TBitBtn	btnCancelLeft�TopEWidthQHeightCancel	CaptionCancelModalResultTabOrderOnClickbtnCancelClick	NumGlyphs  	TGroupBoxgrpImportFileLeftTop_WidthHeight� Caption Import from File TabOrder TLabellblFilenameLeft	TopWidth-HeightCaption
&Filename:FocusControledtImportFilename  TLabellblDirLeftTopWidth7HeightCaption&Directories:FocusControllstDirectories  TLabellblDirectoryLeftTop'WidthjHeightCaptionD:\dev\TP\ff2\Explorer  TLabellblFileFilterLeft	Top� Width^HeightCaption&Show files by type:FocusControl	cboFilter  TLabel	lblDrivesLeftTop� Width"HeightCaptionDri&ves:FocusControl	cboDrives  TEditedtImportFilenameLeft	Top"Width� HeightTabOrder Text*.*
OnKeyPressedtImportFilenameKeyPress  TFileListBoxlstFilesLeft	Top@Width� HeighthFileEditedtImportFilename
ItemHeightTabOrder
OnDblClicklstFilesClick  TDirectoryListBoxlstDirectoriesLeftTop>Width� HeightiDirLabellblDirectoryFileListlstFiles
ItemHeightTabOrder  TFilterComboBox	cboFilterLeft	Top� Width� HeightFileListlstFilesFilterAll files (*.*)|*.*|Text Files (*.TXT)|*.TXT|Fixed ASCII (*.ASC)|*.ASC|Delimited ASCII (*.CSV)|*.CSV|Schema Files (*.SCH)|*.SCHTabOrder  TDriveComboBox	cboDrivesLeftTop� Width� HeightDirListlstDirectoriesTabOrder   	TGroupBoxgrpTableLeftTop	WidthHeightTCaption Import into Table TabOrder  TLabel
lblTblNameLeftTopWidth:HeightCaption&Table name:FocusControlcboTableName  TLabellblRecsPerTranLeft� Top6WidthxHeightCaption&Records per transaction:FocusControledtBlockInserts  	TComboBoxcboTableNameLeftPTopWidthHeight
ItemHeight	MaxLengthSorted	TabOrder   TRadioGroupgrpExistingDataLeft�Top	Width]HeightBCaption Existing Data 	ItemIndex Items.Strings&Append
&Overwrite TabOrder  TEditedtBlockInsertsLeft6Top2Width"HeightTabOrderText0  TUpDownUpDown1LeftXTop2WidthHeight	AssociateedtBlockInsertsMin Position TabOrderWrap    