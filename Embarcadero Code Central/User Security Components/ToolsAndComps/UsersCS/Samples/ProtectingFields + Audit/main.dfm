�
 TFORM1 0"  TPF0TForm1Form1Left� TopfWidth�Height�CaptionProtecting Fields + AuditColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TDBGridDBGrid1Left Top WidthYHeight/AlignalClient
DataSourceSampleData.dtsCompaniesTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCompany_NameWidth� Visible	 Expanded	FieldNameCompany_FAXWidthdVisible	 Expanded	FieldNameCompany_PhoneWidthdVisible	    TMemoMemo1LeftYTop Width@Height/AlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings-This sample application shows how to protect )dataset fields from unauthorized access.  2It can be done at TDataset level, registering the 6dataset fields for protection or also registering the 4data aware components the dataset fields are linked 5to. The first option gives you a centralized control over  field protection.  7Also in this application, there is a example of how to /use the audit function. We added a code to the 3AfterPost method of the dataset that use the Audit 4method to register every change made in the field ' -COMPANY_NAME' of the Companies' table. Set a 0user in Audit mode and change the value of that &field in order to see some Audit data. 
ParentFontTabOrder  TPanelPanel3Left Top/Width�Height)AlignalBottomTabOrder  	TMainMenu	MainMenu1LeftTop�  	TMenuItemUsers1CaptionUsers 	TMenuItemUserAdministration1CaptionUser AdministrationOnClickUserAdministrationExecute  	TMenuItemChangeUserPassword1CaptionChange User PasswordOnClickChangeUserPasswordExecute  	TMenuItemN1Caption-  	TMenuItemLogin1CaptionLoginOnClickLoginExecute    	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadLefthTop�   TUsersCSUsersCS1	AutoLoginAppKeyProtectingFieldsFormList.Stringsd  SampleData=SampleData|Companies=Companies
CompaniesParent=SampleData
CompaniesCompany_Name=Company Name
CompaniesCompany_NameParent=Companies
CompaniesCompany_Address=Address
CompaniesCompany_AddressParent=Companies
CompaniesCompany_Phone=Phone
CompaniesCompany_PhoneParent=Companies
CompaniesCompany_FAX=FAX
CompaniesCompany_FAXParent=Companies
�Form1=Protecting Fields + Audit|DBGrid1=DBGrid1
DBGrid1Parent=Form1
DBGrid1Col0=Company Name
DBGrid1Col0Parent=DBGrid1
DBGrid1Col1=FAX
DBGrid1Col1Parent=DBGrid1
DBGrid1Col2=Phone
DBGrid1Col2Parent=DBGrid1
 Version1.95 (21/May)DatabaseNamedbUsersFileNames83DOSLeft� Top�   TUsersCSRegUsersCSReg1FormNameForm1FormCaptionProtecting Fields + AuditComponentList.StringsDBGrid1=DBGrid1DBGrid1Parent=Form1DBGrid1Col0=Company NameDBGrid1Col0Parent=DBGrid1DBGrid1Col1=FAXDBGrid1Col1Parent=DBGrid1DBGrid1Col2=PhoneDBGrid1Col2Parent=DBGrid1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	Left`Top�    