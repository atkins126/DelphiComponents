�
 TFORM1 0�  TPF0TForm1Form1Left� Top� Width HeightwCaptionProtecting Menu ItemsColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle	fsMDIFormMenu	MainMenu1OldCreateOrder	PositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TMemoMemo1Left� Top WidthxHeightIAlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings8This is the most simple kind of protection you can use: #Restrict user access to menu items. 9Just Place a TUsersCSReg component in your main form and !register the relevant menu items. 9This sample also shows the component working with merged ;menus in MDI forms. Click in the menu option "Customer >>| <View orders" to and you will see the component applying the  security in the new merged menu. 
ParentFontTabOrder   	TMainMenu	MainMenu1Left(Top�  	TMenuItem	Customer1CaptionCustomer 	TMenuItemNewCustomer1CaptionNew Customer  	TMenuItemViewPrivateData1CaptionView Private Data  	TMenuItemN2Caption-  	TMenuItemViewOrders1CaptionView OrdersOnClickButton1Click  	TMenuItemN3Caption-  	TMenuItemExit1Caption&Exit   	TMenuItemUsers1CaptionUsers 	TMenuItemUserAdministration1CaptionUser AdministrationOnClickUserAdministrationExecute  	TMenuItemChangeUserPassword1CaptionChange User PasswordOnClickChangeUserPasswordExecute  	TMenuItemN1Caption-  	TMenuItemLogin1CaptionLoginOnClickLoginExecute    	TDatabasedbUsersDatabaseNamedbBDE
DriverNameSTANDARDLoginPromptParams.StringsPATH=DEFAULT DRIVER=PARADOXENABLE BCD=FALSE TransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft� Top�   TUsersCSUsersCS1	AutoLoginAppKeyProtectingMenuItemsFormList.Strings�  Form1=Protecting Menu Items|ActionList1=ActionList1
ActionList1Parent=Form1
MainMenu1=MainMenu1
MainMenu1Parent=Form1
ChangeUserPassword=Change User Password
ChangeUserPasswordParent=ActionList1
UserAdministration=User Administration
UserAdministrationParent=ActionList1
Login=Login
LoginParent=ActionList1
Customer1=Customer
Customer1Parent=MainMenu1
Users1=Users
Users1Parent=MainMenu1
Exit1=Exit
Exit1Parent=Customer1
 Version1.95 (21/May)DatabaseNamedbBDEFileNames83DOSLeft8TopP  TUsersCSRegUsersCSReg1FormNameForm1FormCaptionProtecting Menu ItemsComponentList.StringsActionList1=ActionList1ActionList1Parent=Form1MainMenu1=MainMenu1MainMenu1Parent=Form1'ChangeUserPassword=Change User Password$ChangeUserPasswordParent=ActionList1&UserAdministration=User Administration$UserAdministrationParent=ActionList1Login=LoginLoginParent=ActionList1Customer1=CustomerCustomer1Parent=MainMenu1Users1=UsersUsers1Parent=MainMenu1
Exit1=ExitExit1Parent=Customer1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	LeftxTop@   