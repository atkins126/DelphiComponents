�
 TMULTIPARTFTPDOWNLOADFORM 0�  TPF0TMultipartFtpDownloadFormMultipartFtpDownloadFormLeftoTop"Caption:   Multipart FTP Downloader - ICS - (c) 2007 François PIETTEClientHeight�ClientWidth$Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanel
ToolsPanelLeft Top Width$Height� AlignalTopTabOrder  TLabelLabel1LeftTopWidth6HeightCaption
FTP Server  TLabelLabel2Left� TopWidth%HeightCaptionFtp Port  TLabelLabel3Left&TopBWidth$HeightCaptionFTP Dir  TLabelLabel4LeftToprWidthFHeightCaptionLocal File Path  TLabelLabel5LeftTop*WidthEHeightCaptionFTP Usercode  TLabelLabel6Left� Top*WidthEHeightCaptionFTP Password  TLabelLabel7LeftTopZWidthFHeightCaptionFTP File Name  TLabelPartCountLabelLeft� Top� Width1HeightCaption
Part count  TLabelLabel8LeftTop� Width@HeightCaptionAssumed size  TEditFtpServerEditLeftPTopWidthyHeightTabOrder TextFtpServerEdit  TEditFtpPortEditLeft TopWidthyHeightTabOrderTextFtpPortEdit  TEdit
FtpDirEditLeftPTop@WidthIHeightTabOrderText
FtpDirEdit  TEditLocalFilePathEditLeftPToppWidthIHeightTabOrderTextLocalFilePathEdit  TEditFtpUserEditLeftPTop(WidthyHeightTabOrderTextFtpUserEdit  TEditFtpPassEditLeft Top(WidthyHeightTabOrderTextFtpPassEdit  	TCheckBoxPassiveCheckBoxLeftTop� WidthVHeight	AlignmenttaLeftJustifyCaptionPassive modeTabOrder  	TCheckBoxBinaryCheckBoxLeftzTop� WidthPHeight	AlignmenttaLeftJustifyCaptionBinary modeTabOrder  TEditFtpFileNameEditLeftPTopXWidthIHeightTabOrderTextFtpFileNameEdit  TEditPartCountEditLeft(Top� WidthHeightTabOrder	TextPartCountEdit  TButtonAbortButtonLeft�Top*WidthKHeightCaption&AbortTabOrder
OnClickAbortButtonClick  TButtonDownloadButtonLeft�TopWidthKHeightCaption	&DownloadTabOrderOnClickDownloadButtonClick  TButtonResumeButtonLeft�TopXWidthKHeightCaption&ResumeTabOrderOnClickResumeButtonClick  TButtonPauseButtonLeft�TopqWidthKHeightCaption&PauseTabOrderOnClickPauseButtonClick  TButtonClearButtonLeft�Top� WidthKHeightCaption&Clear displayTabOrderOnClickClearButtonClick  TEditAssumedSizeEditLeftPTop� WidthyHeightTabOrderTextAssumedSizeEdit  TButton
TestButtonLeftTop� WidthKHeightCaptionTestTabOrderOnClickTestButtonClick   TMemoDisplayMemoLeft Top� Width$Height� AlignalClientFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Lines.StringsDisplayMemo 
ParentFont
ScrollBarsssBothTabOrder  TPanelBottomPanelLeft Top�Width$Height)AlignalBottomTabOrder TLabel
CountLabelLeftTopWidth6HeightCaption
CountLabel  TMultiProgressBarMPBarLeftTopWidth"HeightAlignalBottom   TMultipartFtpDownloaderMPFtpPassiveBinary	PartCount TimeoutValue0u	OnDisplayMPFtpDisplayOnRequestDoneMPFtpRequestDoneOnProgressAddSegmentMPFtpProgressAddSegmentOnProgressSetPositionMPFtpProgressSetPositionOnShowStatsMPFtpShowStatsLeftxTop�   
TFtpClient
FtpClient1TimeoutMultiThreadedPortftpDataPortRangeStart DataPortRangeEnd 	LocalAddr0.0.0.0DisplayFileFlagBinary		ShareModeftpShareExclusiveOptionsftpAcceptLF ConnectionType	ftpDirect	OnDisplayFtpClient1DisplayBandwidthLimit'BandwidthSampling�Left� Top�    