�
 TFORM1 0  TPF0TForm1Form1Left�Top�Width(Height`Caption+Protecting records from unauthorized accessColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterWindowStatewsMaximizedOnCreate
FormCreatePixelsPerInch`
TextHeight TDBGridDBGrid1Left Top Width�Height	AlignalClient
DataSourceSampleData.dtsCompaniesTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCompany_NameWidth� Visible	 Expanded	FieldNameCompany_FAXWidthJVisible	 Expanded	FieldNameCompany_PhoneWidthPVisible	    TMemoMemo1Left�Top WidthpHeight	AlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings5This sample application shows how to protect dataset !records from unauthorized access. 7The component has a event called OnShowAdditionalInfo, :where you can embed a form inside the User Administration #Module and to do whatever you want. ?In this sample, we use this event to show a form that builds a >filter expression that will be used to filter the COMPANIES's 7table. This way, we can prevent user access to certain ranges of data. .We use the field ADDITIONAL_INFO in the table ;UCS_USERINFO to store the filter information. The contents ;of this field is available at runtime through the property 3AdditionalInfo (UsersCS1.ActualUser.AdditionalInfo) 8Although it demands a small code, that is quite easy of doing. 
ParentFontTabOrder  TPanelPanel3Left Top	Width Height)AlignalBottomTabOrder  	TMainMenu	MainMenu1Left� Top�  	TMenuItemUsers1CaptionUsers 	TMenuItemUserAdministration1CaptionUser AdministrationOnClickUserAdministrationExecute  	TMenuItemChangeUserPassword1CaptionChange User PasswordOnClickChangeUserPasswordExecute  	TMenuItemN1Caption-  	TMenuItemLogin1CaptionLoginOnClickLoginExecute    TUsersCSUsersCS1OnShowAdditionalInfoUsersCS1ShowAdditionalInfo	AutoLoginAppKeyProtectingRecordsFormList.Stringsd  SampleData=SampleData|Companies=Companies
CompaniesParent=SampleData
CompaniesCompany_Name=Company Name
CompaniesCompany_NameParent=Companies
CompaniesCompany_Address=Address
CompaniesCompany_AddressParent=Companies
CompaniesCompany_Phone=Phone
CompaniesCompany_PhoneParent=Companies
CompaniesCompany_FAX=FAX
CompaniesCompany_FAXParent=Companies
�  Form1=Protecting records from unauthorized access|DBGrid1=DBGrid1
DBGrid1Parent=Form1
ActionList1=Available Actions
ActionList1Parent=Form1
DBGrid1Col0=Company Name
DBGrid1Col0Parent=DBGrid1
DBGrid1Col1=FAX
DBGrid1Col1Parent=DBGrid1
DBGrid1Col2=Phone
DBGrid1Col2Parent=DBGrid1
ChangeUserPassword=Change User Password
ChangeUserPasswordParent=ActionList1
UserAdministration=User Administration
UserAdministrationParent=ActionList1
Login=Login
LoginParent=ActionList1
 Version1.90 (27/Dez)DatabaseNamedbUsersFileNames83DOSLeft� Top�   TUsersCSRegUsersCSReg1FormNameForm1FormCaption+Protecting records from unauthorized accessComponentList.StringsDBGrid1=DBGrid1DBGrid1Parent=Form1ActionList1=Available ActionsActionList1Parent=Form1DBGrid1Col0=Company NameDBGrid1Col0Parent=DBGrid1DBGrid1Col1=FAXDBGrid1Col1Parent=DBGrid1DBGrid1Col2=PhoneDBGrid1Col2Parent=DBGrid1'ChangeUserPassword=Change User Password$ChangeUserPasswordParent=ActionList1&UserAdministration=User Administration$UserAdministrationParent=ActionList1Login=LoginLoginParent=ActionList1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	Left`Top�   	TDatabasedbUsers	Connected	DatabaseNamedbUsers
DriverNameSTANDARDParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft� Top@   