�
 TSQLITEPASSFILTERDIALOG 0�  TPF0�TSqlitePassFilterDialogSqlitePassFilterDialogLeft�Top� CaptionFilter Records DialogOldCreateOrder	ExplicitWidthBExplicitHeight�PixelsPerInch`
TextHeight �TPageControlPageControl �	TTabSheettsCustomFiltersExplicitLeftExplicitTopExplicitWidth4ExplicitHeight( �TPanelPanelIndexesToolBarCaption     �TPanelPanelSetFilterText �TPanelPanelIndexMainCaption         	TTabSheettsSQLFiltersCaption&SQL Filter
ImageIndex TBevelBevel2LeftTopWidth+Height�   TLabelLabel1LeftTopWidthbHeightCaptionSQL Filter Text : Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TSpeedButtonSbClearSQLFilterLeft�TopWidthKHeightCaptionClearFlat	OnClickSbClearSQLFilterClick  TPanelPanel2LeftTopWidthHeight� 
BevelOuterbvNoneCaptionPanelIndexMainTabOrder  	TSplitter	Splitter2Left� Top Height�   TPanelPanel3Left Top Width� Height� AlignalLeftCaptionPanelAvailableFieldsTabOrder  TListBoxListBoxFieldsLeftTop!Width� Height� AlignalClientBorderStylebsNoneColor	cl3DLight
ItemHeightSorted	TabOrder 
OnDblClickListBoxFieldsDblClick  TPanelPanel9LeftTopWidth� Height AlignalTop
BevelOuterbvNoneCaptionAvailable fieldsColor  @ Font.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder TImageImage3LeftTopWidthHeightAutoSize	Center	Picture.Data
B  TBitmap6  BM6      6   (                                                                                                                                                                      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   ���������@@@�����������������������������@@@�������������   �   ���������\\\�����������������������������\\\�������������   �   ���������\\\�����������������������������\\\�������������   �   �����\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�@@@�   �   ���������\\\�����������������������������\\\�������������   �   ���������\\\�����������������������������\\\�������������   �   �����\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�\\\�@@@�   �   ���������\\\�����������������������������\\\�������������   �   ���������\\\�����������������������������\\\�������������   �   ���}�lN1�\\\�lN1�lN1�lN1�lN1�lN1�lN1�lN1�\\\�lN1�lN1�K6!�   �   �������m�������m���m���m���m���m���m���m�������m���m��r�   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                                                   TPanelPanel10LeftTop� Width� HeightAlignalBottom
BevelInner	bvLowered
BevelOuterbvNoneCaptionPanelUseQuotesTabOrder 	TCheckBoxCheckBoxUseQuotesLeftTopWidth� HeightCaption
Use quotesChecked	Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontState	cbCheckedTabOrder     TPanelPanel11Left� Top WidthIHeight� AlignalClientCaptionPanelSQLTabOrder TMemoMemoSQLFilterStmtLeftTop!WidthGHeight� AlignalClientBorderStylebsNoneColor��� 
ScrollBarsssBothTabOrder   TPanelPanel12LeftTopWidthGHeight AlignalTop
BevelOuterbvNoneCaptionPanel8Color  @ Font.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TLabelLabel2Left&Top
Width� HeightCaption Type in your filter statement  :Font.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TImageImage6LeftTop	WidthHeightAutoSize	Center	Picture.Data
B  TBitmap6  BM6      6   (                                                                                                                                                                                                                                   ���j�����������������������������������������������������������j����������������������������������������   �����������������������������   �   �������������   �   �   ���������   �   �   �   �����   �����   �   �����   �   �   �   �   �����   �   ���������������������   �   �����   �   �����   �   �����   �   �����������������   �   ���������   �   �����   �   �����   �   �������������   �   �������������   �   �����   �   �����   �   �������������   �   �����   �����   �   �����   �   �����   �   �����������������   �   �������������   �   �   ���������   �   ����������������������������������������������������������������������������j�����������������������������������������������������������j                                                                                                                                      	TTabSheettsRangeFiltersCaption&Range Filters
ImageIndex TBevelBevel4LeftTop	Width#Height  TLabelLabel3LeftTopWidth� HeightCaption Filter record  range limits : Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabelLowerLimitLeft(TopUWidthEHeightCaptionLower limit :Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelLabel4Left(Top� WidthBHeightCaptionUpper limit :Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TSpeedButtonSbClearFilterRangesLeft�TopWidthKHeightCaptionClearFlat	OnClickSbClearFilterRangesClick  TBevelBevel5LeftToprWidthHeight	Shape	bsTopLine  TEditEditLowerLimitLeftrTopQWidth1HeightTabOrder Text0  TEditEditUpperLimitLeftrTop� Width4HeightBiDiModebdLeftToRightParentBiDiModeTabOrderText0  TMemoMemo2LeftTopWidth�Height1BorderStylebsNoneColor��� Lines.Strings Lower limit of the range filter.D    If greater than 1, the -nth first records will not be retrieved.l    In other words, if FilterLowerLimit = 4, the fifth record will be the first one retrieved from the query ReadOnly	TabOrder  TMemoMemo3LeftTop|Width�HeightiBorderStylebsNoneColor��� Lines.Strings Upper limit of the range filter.@    If greater than 1, the -nth first records will be retrieved.J    In other words, if FilterUpperLimit = 4 and FilterLowerLimit = 0 then A    only the four first records will be retrieved from the query.>    If lesser than 0, the -nth last records will be retrieved.K    In other words, if FilterUpperLimit = -9 and FilterLowerLimit = 0 then @    only the nine last records will be retrieved from the query. ReadOnly	TabOrder     