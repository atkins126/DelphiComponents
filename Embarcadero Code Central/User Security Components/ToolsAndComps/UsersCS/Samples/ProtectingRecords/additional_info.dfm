�
 TFRMADDITIONALINFO 0�  TPF0TfrmAdditionalInfofrmAdditionalInfoLeft� ToplWidth HeightwCaptionfrmAdditionalInfoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	
OnActivateFormActivateOnDeactivateFormDeactivatePixelsPerInch`
TextHeight TPanelThePanelLeft Top WidthHeight\AlignalClient
BevelOuterbvNoneBorderWidthBorderStylebsSingleColorclGreenTabOrder  TLabelSrcLabelLeftTopWidth� HeightAutoSizeCaptionSource List:  TLabelDstLabelLeft� TopWidth� HeightAutoSizeCaptionDestination List:  TSpeedButton
IncludeBtnLeft� Top WidthHeightCaption>  TSpeedButton	IncAllBtnLeft� Top@WidthHeightCaption>>  TSpeedButton
ExcludeBtnLeft� Top`WidthHeightCaption<Enabled  TSpeedButtonExAllBtnLeft� Top� WidthHeightCaption<<Enabled  TPanelPanel2LeftTopWidthHeight!AlignalTopTabOrder  TDBText
dbUserNameLeft	TopWidthiHeightAutoSize		DataFieldUSERCS_NAME
DataSourcedtsUserFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   TPanelPanel3LeftTop$WidthHeight1AlignalClientCaptionPanel2TabOrder TLabelLabel1LeftTopWidthHeightAlignalTopCaption" Check companies the user can see:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TDBGridDBGrid1LeftTopWidthHeight� AlignalClient
DataSourcedtsCompaniesFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnCellClickDBGrid1CellClickColumnsExpanded	FieldNameCompany_NameTitle.CaptionCompany NameVisible	 	AlignmenttaCenterExpanded	FieldNameVisibleFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMarlett
Font.Style Title.CaptionVisible ???Visible	    TPanelPanel1LeftTopWidthHeight)AlignalBottomCaptionW This screen is part of the application and is embedded in the User Administration FormFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder    TQueryqryUserCachedUpdates	DatabaseNamedbUsersSQL.StringsVSELECT Ucs_users.USERCS_NAME, Ucs_userinfo.ADDITIONAL_INFO, Ucs_users.USER_ID, APP_KEYFROM Ucs_users, Ucs_userinfo.Where Ucs_users.USER_ID = Ucs_userinfo.USER_ID,            and Ucs_users.USER_ID = :USER_ID             /            and UCS_USERINFO.APP_KEY = :APP_KEY  UpdateObjectupdtUserLeft(Toph	ParamDataDataType	ftIntegerNameUSER_ID	ParamType	ptUnknown DataTypeftStringNameAPP_KEY	ParamType	ptUnknown   TStringFieldqryUserUSERCS_NAME	FieldNameUSERCS_NAMEOrigin%DBCONTACTS."Ucs_users.DB".USERCS_NAMESize
  TStringFieldqryUserADDITIONAL_INFO	FieldNameADDITIONAL_INFOOrigin,DBCONTACTS."ucs_userinfo.DB".additional_infoSize�   TFloatFieldqryUserUSER_ID	FieldNameUSER_IDOrigin!DBCONTACTS."Ucs_users.DB".USER_ID  TStringFieldqryUserAPP_KEY	FieldNameAPP_KEYOrigin$DBCONTACTS."Ucs_userinfo.DB".APP_KEY   TDataSourcedtsUserDataSetqryUserLeft(Top�   
TUpdateSQLupdtUserModifySQL.Stringsupdate Ucs_userinfoset$  additional_info = :additional_infowhere  APP_KEY = :OLD_APP_KEY and  USER_ID = :OLD_USER_ID InsertSQL.Stringsinsert into Ucs_userinfo  (additional_info)values  (:additional_info) DeleteSQL.Stringsdelete from Ucs_userinfowhere  APP_KEY = :OLD_APP_KEY and  USER_ID = :OLD_USER_ID Left(Top�   TQueryqryCompaniesCachedUpdates	DatabaseNamedbUsersRequestLive	SQL.Strings@SELECT Companies.Company_Name, Companies.Company_Id, '0' VisibleFROM Companies UpdateObject
UpdateSQL1Left� Topp TStringFieldqryCompaniesCompanyName	FieldNameCompany_Name  TIntegerFieldqryCompaniesCompanyId	FieldName
Company_Id  TStringFieldqryCompaniesVisible	FieldNameVisible	OnGetTextqryCompaniesVisibleGetTextSize   TDataSourcedtsCompaniesDataSetqryCompaniesLeft� Top�   
TUpdateSQL
UpdateSQL1ModifySQL.Stringsupdate "companies.DB"set  Company Name = :Company Name,  Company Id = :Company Id,  Visible = :Visiblewhere&  Company Name = :OLD_Company Name and"  Company Id = :OLD_Company Id and  Visible = :OLD_Visible InsertSQL.Stringsinsert into "companies.DB"%  (Company Name, Company Id, Visible)values(  (:Company Name, :Company Id, :Visible) DeleteSQL.Stringsdelete from "companies.DB"where&  Company Name = :OLD_Company Name and"  Company Id = :OLD_Company Id and  Visible = :OLD_Visible Left� Top�    