�
 TFRMMAINFORM 0�  TPF0�TfrmMainFormfrmMainFormLeftTopWidth�HeightCaption	Main FormOnCreate
FormCreatePixelsPerInch`
TextHeight � TMemoMemo1Left Top Width�Height�AlignalClientFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings+How to use the components in template FormsH------------------------------------------------------------------------ ]You can use TUsersCS and TUsersCSReg in template forms and add these forms to the Repository. lTo use TUsersCS in template forms, just add a copy of the component to your form. You can set the component properties as usual.  <To use TUsersCSReg in template forms, more steps are needed: !1. Add the component to your form n2. Set the property IsRepositoryForm in the TUsersCSReg component as TRUE, in order to indicate the component now is part of a template. n3. You can choose to link the TUsersCSReg component to the TUsersCS component, if needed, but from now if you nset the property IsRepositoryForm as True you don't need to connect the TUsersCSReg to a TUsersCS in order to !select components for protection. s4. Open the component registration form and select the components you want to protect in your templates (they will )appear selected in your inherited forms). mNote that when you set IsRepositoryForm as True, the component will not store its references in the TUsersCS Fcomponent and will prompt you with a message to confirm the operation. qVERY IMPORTANT: When you inherits a form from your templates, do not forget to set the property IsRepositoryForm Xas FALSE again, to inform the component the form is not a template, but a normal form.       
ParentFontTabOrder   �	TMainMenu	MainMenu1Left�Top 	TMenuItemInheritedForms1CaptionInherited Forms 	TMenuItemForm011CaptionForm 01OnClickForm011Click  	TMenuItemForm021CaptionForm 02OnClickForm021Click    �TUsersCSRegUsersCSReg1FormNamefrmMainFormFormCaption	Main FormComponentList.StringsMainMenu1=Main MenuMainMenu1Parent=frmMainFormSecurity1=SecuritySecurity1Parent=MainMenu1
Data1=DataData1Parent=MainMenu1&UserAdministraion1=User Administration"UserAdministraion1Parent=Security1ChangePassword1=Change PasswordChangePassword1Parent=Security1Login1=LoginLogin1Parent=Security1Customer1=CustomerCustomer1Parent=Data1Product1=ProductProduct1Parent=Data1Dealer1=DealerDealer1Parent=Data1Employers1=EmployersEmployers1Parent=Data1 Left�Top�   �TUsersCSUsersCS1AppKeyRepository SampleFormList.Strings  frm02=Form 2|PageControl1=PageControl1
PageControl1Parent=frm02
Panel1=Panel
Panel1Parent=frm02
TabSheet1=TabSheet1
TabSheet1Parent=PageControl1
TabSheet2=TabSheet2
TabSheet2Parent=PageControl1
TabSheet3=TabSheet3
TabSheet3Parent=PageControl1
DBNavigator1=DBNavigator1
DBNavigator1Parent=Panel1
Edit1=Edit1
Edit1Parent=TabSheet1
Edit2=Edit2
Edit2Parent=TabSheet1
CheckBox1=CheckBox1
CheckBox1Parent=TabSheet2
CheckBox2=CheckBox2
CheckBox2Parent=TabSheet2
RadioGroup1=RadioGroup1
RadioGroup1Parent=TabSheet3
DBNavigator1Btn4=Insert
DBNavigator1Btn4Parent=DBNavigator1
DBNavigator1Btn5=Delete
DBNavigator1Btn5Parent=DBNavigator1
DBNavigator1Btn6=Edit
DBNavigator1Btn6Parent=DBNavigator1
DBNavigator1Btn7=Post
DBNavigator1Btn7Parent=DBNavigator1
�  frmMainForm=Main Form|MainMenu1=Main Menu
MainMenu1Parent=frmMainForm
Security1=Security
Security1Parent=MainMenu1
Data1=Data
Data1Parent=MainMenu1
UserAdministraion1=User Administration
UserAdministraion1Parent=Security1
ChangePassword1=Change Password
ChangePassword1Parent=Security1
Login1=Login
Login1Parent=Security1
Customer1=Customer
Customer1Parent=Data1
Product1=Product
Product1Parent=Data1
Dealer1=Dealer
Dealer1Parent=Data1
Employers1=Employers
Employers1Parent=Data1
�  frm01=Form 01|PageControl1=PageControl1
PageControl1Parent=frmBasico_Rep3
Panel1=Panel
Panel1Parent=frmBasico_Rep3
TabSheet1=TabSheet1
TabSheet1Parent=PageControl1
TabSheet2=TabSheet2
TabSheet2Parent=PageControl1
TabSheet3=TabSheet3
TabSheet3Parent=PageControl1
DBNavigator1=DBNavigator1
DBNavigator1Parent=Panel1
Memo1=Memo1
Memo1Parent=TabSheet1
Button1=Button1
Button1Parent=TabSheet1
ListBox1=ListBox1
ListBox1Parent=TabSheet2
ComboBox1=ComboBox1
ComboBox1Parent=TabSheet2
ComboBox2=ComboBox2
ComboBox2Parent=TabSheet2
SpeedButton1=SpeedButton1
SpeedButton1Parent=TabSheet3
BitBtn1=BitBtn1
BitBtn1Parent=TabSheet3
BitBtn2=BitBtn2
BitBtn2Parent=TabSheet3
DBNavigator1Btn4=Insert
DBNavigator1Btn4Parent=DBNavigator1
DBNavigator1Btn5=Delete
DBNavigator1Btn5Parent=DBNavigator1
DBNavigator1Btn6=Edit
DBNavigator1Btn6Parent=DBNavigator1
DBNavigator1Btn7=Post
DBNavigator1Btn7Parent=DBNavigator1
 DatabaseNamedbIntLeft Top�   	TDatabase	Database1	AliasNameUsersCS ParadoxDatabaseNamedbIntSessionNameDefaultTransIsolationtiDirtyReadLeft Top   