�
 TMPEGFILEINFOFORM 0*  TPF0TMPEGFileInfoFormMPEGFileInfoFormLeft�Top� BorderStylebsDialogCaption#MPEG file info box + ID3 tag editorClientHeight�ClientWidth:Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoDesktopCenterOnCreate
FormCreate	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel19LeftTopWidth6HeightCaption
File/URL :Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel	fFileNameLeftGTopWidth�HeightAutoSizeCaption	fFileNameFont.CharsetANSI_CHARSET
Font.ColorclPurpleFont.Height�	Font.NameArial
Font.Style 
ParentFont  	TGroupBox	GroupBox1LeftTop#Width� Height� Caption ID3v1 TabOrder  TLabelLabel1Left� TopWidth&HeightCaptionTrack #  TLabelLabel2Left"Top)WidthHeightCaptionTitle  TLabelLabel3LeftTop@WidthHeightCaptionArtist  TLabelLabel4LeftTopWWidthHeightCaptionAlbum  TLabelLabel5LeftTopnWidthHeightCaptionYear  TLabelLabel6Left
Top� Width,HeightCaptionComment  TLabelGenreLeftpTopnWidthHeightCaptionGenre  	TCheckBox
cbID3v1TagLeft<TopWidthKHeightCaption
ID3v&1 TagTabOrder OnClickcbID3v1TagClick  TEditTag1_TrackNoLeft� TopWidthHeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEdit
Tag1_TitleLeft<Top$Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEditTag1_ArtistLeft<Top<Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEdit
Tag1_AlbumLeft<TopSWidth� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEdit	Tag1_YearLeft<TopkWidth*HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  	TComboBox
Tag1_GenreLeft� TopkWidth_HeightImeName�ѱ��� �Է� �ý��� (IME 2000)
ItemHeightSorted	TabOrder
OnKeyPressTag1_GenreKeyPress  TEditTag1_CommentLeft<Top� Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder   	TGroupBox	GroupBox2LeftTop#Width/HeighteCaption ID3v2 TabOrder TLabelLabel7Left� TopWidth&HeightCaptionTrack #  TLabelLabel8Left,Top)WidthHeightCaptionTitle  TLabelLabel9Left'Top@WidthHeightCaptionArtist  TLabelLabel10Left$TopWWidthHeightCaptionAlbum  TLabelLabel11Left)TopnWidthHeightCaptionYear  TLabelLabel12Left}TopnWidthHeightCaptionGenre  TLabelLabel13LeftTop� Width,HeightCaptionComment  TLabelLabel14LeftTop� Width/HeightCaptionComposer  TLabelLabel15LeftTop� Width0HeightCaptionOrig. Artist  TLabelLabel16LeftTop� Width,HeightCaption	Copyright  TLabelLabel17Left'Top
WidthHeightCaptionURL  TLabelLabel18LeftTopWidth9HeightCaption
Encoded by  	TCheckBox
cbID3v2TagLeftETopWidthKHeightCaption
ID3v&2 TagTabOrder OnClickcbID3v2TagClick  TEditTag2_TrackNoLeftTopWidthHeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEdit
Tag2_TitleLeftETop$Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEditTag2_ArtistLeftETop<Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEdit
Tag2_AlbumLeftETopSWidth� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEdit	Tag2_YearLeftETopkWidth*HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  	TComboBox
Tag2_GenreLeft� TopkWidth� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)
ItemHeightSorted	TabOrder  TMemoTag2_CommentLeftETop� Width� Height5ImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEditTag2_ComposerLeftETop� Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEditTag2_OrigArtistLeftETop� Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder	  TEditTag2_CopyrightLeftETop� Width� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder
  TEditTag2_URLLeftETopWidth� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TEditTag2_EncodedbyLeftETopWidth� HeightImeName�ѱ��� �Է� �ý��� (IME 2000)TabOrder  TButton	btnCopyToLeftTopEWidthXHeightCaptionCopy &to ID3v1TabOrderOnClickbtnCopyToClick  TButtonbtnCopyFromLeftmTopEWidthXHeightCaptionCopy &from ID3v1TabOrderOnClickbtnCopyFromClick   	TGroupBox	GroupBox3LeftTop� Width� Height� Caption MPEG info TabOrder TLabellbSizeLeftTopWidthHeightCaptionlbSize  TLabellbHeaderPosLeftTopWidth=HeightCaptionlbHeaderPos  TLabellbLengthLeftTop*Width)HeightCaptionlbLength  TLabellbTypeLeftTop8Width HeightCaptionlbType  TLabel
lbBitFrameLeftTopFWidth1HeightCaption
lbBitFrame  TLabellbFreq_ChannelsLeftTopSWidthOHeightCaptionlbFreq_Channels  TLabellbCRCLeftTopaWidthHeightCaptionlbCRC  TLabellbCopyrightedLeftTopoWidth@HeightCaptionlbCopyrighted  TLabel
lbOriginalLeftTop|Width+HeightCaption
lbOriginal  TLabel
lbEmphasisLeftTop� Width5HeightCaption
lbEmphasis   TButton	btnUpdateLeftTopkWidthAHeightCaption&UpdateTabOrderOnClickbtnUpdateClick  TButton	btnCancelLeftSTopkWidthAHeightCaption&CancelTabOrderOnClickbtnCancelClick  TButtonbtnUndoLeft� TopkWidthTHeightCaptionUndo ChangesTabOrderOnClickbtnUndoClick   