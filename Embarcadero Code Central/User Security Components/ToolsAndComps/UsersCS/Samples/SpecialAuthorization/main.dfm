�
 TFORM1 0�  TPF0TForm1Form1Left� TopqWidthVHeight�CaptionSpecial AuthorizationColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterOnCreate
FormCreateOnKeyUp	FormKeyUpPixelsPerInch`
TextHeight TMemoMemo1Left� Top Width�Height�AlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings<Some kinds of functions in your application may need a extra9authorization to be executed by a user, as for example a <special discount for a special customer in a Point of Sales program. 7We introduced a new method called GetUserComponentInfo Athat can retrieve security information about a specific user and <a specific component. This new method accepts as parameters ;a user  name and a component name. The interesting in this 6new method is that the user name can be any user name Bdifferent to the user that is the current user, so you can verify >the user's permissions for a particular component without the 9need to process the entire user login in the application. ?Note that the user name must be valid in the security database 4as also the component name. You can verify the user *autenticity with the method VerifyUser.    @We also used the Audit function to register in the Audit module the discount authorization. A*****************************************************************,DO NOT FORGET TO SET THE USER IN AUDIT MODE.A***************************************************************** 
ParentFontTabOrder   TPanelPanel1Left Top Width� Height�AlignalClientTabOrder TLabelLabel1LeftTopWidth;HeightCaptionSales (Total)  TLabelLabel2LeftTop Width HeightCaptionLabel2  TLabelLabel3LeftTop@Width� HeightCaption Discount (Press F1 for Discount)  TLabelLabel4LeftToppWidthxHeightCaptionTotal (including Discount)  TEditedtTotalLeftTop!WidthyHeightEnabledTabOrder Text100  TEditedtDiscountLeftTopQWidthyHeightEnabledTabOrderText0  TEditedtTotalAndDiscountLeftTop� WidthyHeightEnabledTabOrderText0  TButtonButton1LeftTop� Width� HeightCaptionClick here to &Finish the SaleTabOrderOnClickButton1Click   	TMainMenu	MainMenu1LefthTop@ 	TMenuItemUsers1CaptionUsers 	TMenuItemUserAdministration1CaptionUser AdministrationOnClickUserAdministrationExecute  	TMenuItemChangeUserPassword1CaptionChange User PasswordOnClickChangeUserPasswordExecute  	TMenuItemN1Caption-  	TMenuItemLogin1CaptionLoginOnClickLoginExecute    TUsersCSUsersCS1	AutoLoginAppKeyGetUserComponentInfoFormList.Strings�  Form1=Special Authorization|MainMenu1=Menu
MainMenu1Parent=Form1
ActionList1=ActionList1
ActionList1Parent=Form1
Users1=Users
Users1Parent=MainMenu1
actnDiscont=Special Discount
actnDiscontParent=ActionList1
UserAdministration1=User Administration
UserAdministration1Parent=Users1
ChangeUserPassword1=Change User Password
ChangeUserPassword1Parent=Users1
Login1=Login
Login1Parent=Users1
 Version1.90 (27/Dez)DatabaseNamedbUsersFileNames83DOSLefthTop�   TUsersCSRegUsersCSReg1FormNameForm1FormCaptionSpecial AuthorizationComponentList.StringsMainMenu1=MenuMainMenu1Parent=Form1ActionList1=ActionList1ActionList1Parent=Form1Users1=UsersUsers1Parent=MainMenu1actnDiscont=Special DiscountactnDiscontParent=ActionList1'UserAdministration1=User Administration UserAdministration1Parent=Users1(ChangeUserPassword1=Change User Password ChangeUserPassword1Parent=Users1Login1=LoginLogin1Parent=Users1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	LeftTop�   	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft8Top  TActionListActionList1Left� Top�  TActionactnDiscontCaptionSpecial Discount    