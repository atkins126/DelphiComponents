�
 TFORM1 0%  TPF0TForm1Form1Left6Top{Width�Height�CaptionTCompLHA DemonstrationColorclGreen
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���                                                                                                   �����������    wwwwwwwwww�    p  pwppwwp�    pwwpwpww�    pwwpwpw  �    pwwp  ww�    pwwpwpwppw�    pwwpwpwppw�    pwwpwpwww�    wwwwwwwwww�    wwwwwwwwww�    ppppppppp�    p        �    p    �   �    p   ��   �    www	���www�    www  � www�    www  � www�    www  � www�    www  � www�    www    www�    ����������p                                                                  ���������������������  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  ������������PositionpoScreenCenterScaledShowHint	
OnActivateFormActivateOnCreate
FormCreatePixelsPerInchx
TextHeight 	TGroupBoxArchiveGroupLeftDTop Width� Height�Hint*Drag the entire archive too if you wish...AlignalClientCaptionArchived FilesColor	clBtnFaceDragModedmAutomatic
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ParentColor
ParentFontParentShowHintShowHint	TabOrder 
OnDragDroparchivefileDragDrop
OnDragOverarchivefileDragOver TListBoxListBox1LeftTopYWidth� Height
Hint/Click filename for file compression informationAlignalClientDragModedmAutomatic
ItemHeightMultiSelect	ParentShowHintShowHint	TabOrder OnClickListBox1Click
OnDragDroparchivefileDragDrop
OnDragOverarchivefileDragOver  TMemoMemo4LeftTopcWidth� Height!CursorcrArrowTabStopAlignalBottom	AlignmenttaCenterBorderStylebsNoneColor	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style Lines.StringsDrag these files to thefile list or trashcan. 
ParentFontReadOnly	TabOrder  TPanelPanel2LeftTopWidth� HeightGAlignalTop
BevelOuterbvNoneTabOrderOnClickFLClickOnResizePanel2Resize TLabelArchiveLabelLeftTopWidth.HeightCaptionArchive:DragModedmAutomatic  TLabelLabel2LeftTop6Width7HeightCaption	Contains:  TEditarchivefileLeftTopWidth� HeightHintEdit archive name as requiredParentShowHintShowHint	TabOrder Textc:\LHADemo.LZHOnChangearchivefileChangeOnClickFLClick
OnDragDroparchivefileDragDrop
OnDragOverarchivefileDragOver  	TComboBoxMaskLeftmTop/Width7HeightHintArchive display mask
ItemHeightItems.Strings*.**.txt*.htm*.pas*.exe*.bmp TabOrderText*.*OnChange
MaskChangeOnClickFLClick    TPanelStatusLeft Top�Width�HeightAlignalBottomTabOrder  	TGroupBox	GroupBox2Left Top Width� Height�AlignalLeftCaption
Disk FilesColor	clBtnFaceParentColorTabOrder TDirectoryListBoxDLLeftTop*Width� HeightOAlignalTopFileListFL
ItemHeightTabOrder OnClickFLClick
OnDragDrop
DLDragDrop
OnDragOver
DLDragOver  TFileListBoxFLLeftTopyWidth� Height� AlignalClientDragModedmAutomatic
ItemHeightMultiSelect	
ShowGlyphs	TabOrderOnClickFLClick
OnDragDrop
DLDragDrop
OnDragOver
DLDragOver  TPanelPanel3LeftTopWidth� HeightAlignalTop
BevelOuterbvNoneCaptionPanel3TabOrder TDriveComboBoxDCBLeft TopWidth� HeightDirListDLTabOrder 
OnDragDrop
DLDragDrop
OnDragOver
DLDragOver   TMemoMemo3LeftTopcWidth� Height!CursorcrArrowTabStopAlignalBottom	AlignmenttaCenterBorderStylebsNoneColor	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style Lines.StringsDrag these files to thearchive or trashcan 
ParentFontReadOnly	TabOrder   TPanelPanel1Left� Top Width� Height�AlignalLeft
BevelOuterbvNoneTabOrderOnClickFLClick TPanelPanel4Left Top� Width� HeightyAlignalTop
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder OnClickFLClick TBevelBevel1LeftTopSWidthHeightParentShowHintShowHint  TLabelTimeLeftTop8WidthyHeight	AlignmenttaCenterAutoSizeColor	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ParentColor
ParentFont  TLabel
PercentageLeft/TopWidthDHeight	AlignmenttaCenterAutoSizeColor	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ParentColor
ParentFont  TLabel	TimeLabelLeftTop(WidthiHeight	AlignmenttaCenterAutoSizeCaptionTime:
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel7Left&TopWidthYHeight	AlignmenttaCenterCaption% Compressed
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFont  TImageTrashcanLeftTopTWidthHeightHintDrag files here to delete themDragModedmAutomaticParentShowHintPicture.Data
�  TBitmapv  BMv      v   (                                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ���         ��� ���         ��� ��� ������� ��� ��� ������� ��� ��� � w w � ��� ��� � w w � ��� ��� � w � � ��� ��� � w � � ��� ��� � w w � ��� ��� � w w � ��� ��� � w � � ��� ��� � w � � ��� ��� � w w � ��� ��� � w w � ��� � � � w � � � � � � � w � � � � ��  � w w �  �� ��  � w w �  �� ��� � w � � ��� ��� � w � � ��� ��� � � � � ��� ��� � � � � ��� ��           �� ��           �� �� �www����� �� �� �www����� �� ��           �� ��           �� ����� ��� ����� ����� ��� ����� �����     ����� �����     ����� ShowHint	Stretch	
OnDragDropTrashcanDragDrop
OnDragOverTrashcanDragOver  TSpeedButtonAbortButtonLeftwTopTWidthHeightHintCancel current operation
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333333���33339��33333�ww��339����3337w�w�33�3ps��33w�7?7�9�� 9�37ww3w�99�ps3�37�w7337��3��339�w�w�37�39�339�w�77�37�33ps39�w�37�7�3339�w�3w�7�33 	�9�w�3ws�s9�3 	�937?�wsw��9�3 ��37s�www33��ps9�33w?���s339����3337w37w33339��333337ww333	NumGlyphsOnClickAbortButtonClick  TImageKeyLeftGTopHWidthHeightCenter	Picture.Data
Z  TBitmapN  BMN      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwwww   wwwwwww    wwwwwww   wwwwww    wwwwww;   wwwww �w   wwwwp;w   wwwwp��ww   w� p ;ww   x� ��www   p���;www   p����wwww   p� ;��www   x� ;�www   w�;�www   wp����www   ww� wwww   wwwwwwwww   Visible  TEditEdit1Left8TopYWidth1HeightHint"Encryption keyword (none if blank)TabOrder OnChangeEdit1ChangeOnClickFLClick   TRadioGroupCMethodLeft Top Width� HeightIHint%Select the desired compression methodAlignalTopCaptionCompressionColor	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	ItemIndexItems.StringsNonecolh1colh5 ParentColor
ParentFontParentShowHintShowHint	TabOrderOnClickCMethodClickOnEnterCMethodEnter  	TCheckBoxSaveFullPathLeft
TopWidthqHeightHint!The full path of a file is storedCaptionSave Full Path
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrderOnClickSaveFullPathClick  	TCheckBoxConfirmOperationsLeft
TopWidthqHeightHint3Confirmation is requested before archive operationsCaptionConfirmation
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrderOnClickConfirmOperationsClick  TRadioGroupArchiveHeaderLeft TopIWidth� Height7Hint!Select the desired archive headerAlignalTopCaptionArchive HeaderColor	clBtnFace
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	ItemIndexItems.StringsLHArcLHA ParentColor
ParentFontParentShowHintShowHint	TabOrderOnClickArchiveHeaderClickOnEnterCMethodEnter  	TCheckBoxAllowDuplicatesLeft
Top.Width� HeightHint0Duplicate filenames are permitted in the archiveCaptionAllow Duplicates
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrderOnClickAllowDuplicatesClick  	TCheckBoxVerifyExpandsLeft
TopFWidth� HeightHint/Expands are tested only -- into temporary filesCaptionVerify Only
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder  TButton
HelpButtonLeftTopcWidth)HeightHintHelp for this demonstrationCaptionHelpTabOrderOnClickHelpButtonClick  TButtonAboutButtonLeftlTopcWidth)HeightHintAbout this demonstrationCaptionAboutTabOrderOnClickAboutButtonClick  TButtonRegistrationButtonLeft<TopcWidth)HeightHint!TCompLHA registration informationCaptionReg'nTabOrder	OnClickRegistrationButtonClick   TCompLHACompLHA1	RegNumber OnCheckFileCompLHA1CheckFileOnAfterProcessedCompLHA1AfterProcessedOnShowProgressCompLHA1ShowProgressMakeDirectoriesSafeMode
VerifyModeArchiveTypecaLHAAllowDuplicates	StorePathForceUpperCaseExceptionOnFileError	CompressionMethodcolh5ConfirmMessages.StringsPlease confirmCompress %s as %s?Expand %s to %s?Delete %s from the archive?Verify archive integrity of %s? ConfirmTempArchivePathc:\temp\CheckSpaceBeforeExpandLeft@Top�    