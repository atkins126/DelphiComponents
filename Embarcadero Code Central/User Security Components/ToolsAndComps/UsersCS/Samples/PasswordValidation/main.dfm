�
 TFORM1 0�  TPF0TForm1Form1Left� TopiWidth�HeightwCaptionPassword ValidationColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrderPositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1LeftTop WidthHeightECaptionT o o l s     &&    C o m p sFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFontWordWrap	  TMemoMemo2LeftETop WidthxHeightIAlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings>This sample shows how you can write code to validate the user #password with a specific algorithm. <The component has a event called OnValidatePassword that is >triggered after a user password is provided when the Security =Administrator is adding a new user and when the user changes it's password. ;The code we added to the OnValidatePassword in this sample =forces the presence of at least one numeric character in the 	password. @You can, for example, write code to verify if the user is using 6as password his birth date or his registration number. 
ParentFontTabOrder   TActionListActionList1LefthTop TActionChangeUserPasswordCaptionChange User Password	OnExecuteChangeUserPasswordExecute  TActionUserAdministrationCaptionUser Administration	OnExecuteUserAdministrationExecute  TActionLoginCaptionLogin	OnExecuteLoginExecute   	TMainMenu	MainMenu1Left(Top�  	TMenuItemUsers1CaptionUsers 	TMenuItemUserAdministration1ActionUserAdministration  	TMenuItemChangeUserPassword1ActionChangeUserPassword  	TMenuItemN1Caption-  	TMenuItemLogin1ActionLogin    TUsersCSUsersCS1OnValidatePasswordUsersCS1ValidatePassword	AutoLoginAppKeyPasswordValidationFormList.Strings�  Form1=Password Validation|ActionList1=Available Actions
ActionList1Parent=Form1
ShowUserName=Show User Name
ShowUserNameParent=ActionList1
ShowUserPassword=Show User Password
ShowUserPasswordParent=ActionList1
ChangeUserPassword=Change User Password
ChangeUserPasswordParent=ActionList1
UserAdministration=User Administration
UserAdministrationParent=ActionList1
Login=Login
LoginParent=ActionList1
 Version1.94 (10/April)DatabaseNamedbUsersFileNames83DOSLefthTop�   TUsersCSRegUsersCSReg1FormNameForm1FormCaptionPassword ValidationComponentList.StringsActionList1=Available ActionsActionList1Parent=Form1ShowUserName=Show User NameShowUserNameParent=ActionList1#ShowUserPassword=Show User Password"ShowUserPasswordParent=ActionList1'ChangeUserPassword=Change User Password$ChangeUserPasswordParent=ActionList1&UserAdministration=User Administration$UserAdministrationParent=ActionList1Login=LoginLoginParent=ActionList1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	LeftTop�   	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft8Top   