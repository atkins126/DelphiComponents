�
 TFORM1 0i  TPF0TForm1Form1Left� TopdWidth Height�CaptionAction ListsColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrderPositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TButtonButton1LeftTopWidth� HeightActionShowUserNameTabOrder   TButtonButton2LeftTop8Width� HeightActionShowUserPasswordTabOrder  TButtonButton3LeftTop`Width� HeightActionUserAdministrationTabOrder  TButtonButton4LeftTop� Width� HeightActionChangeUserPasswordTabOrder  TButtonButton5LeftTop� Width� HeightActionLoginTabOrder  TMemoMemo1Left� Top WidthxHeight�AlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.Strings>Action Lists are very interesting components that can be used =for a better organization of your source code. If you have a 4same piece of code that will be attached to several 9components, write your code in the Action Item OnExecute 8event and then link your components to this Action Item. >This sample application shows how to protect several callings ;to the same piece of code in only one place. The menus and <buttons are connected to Action Items and only these Action $Items are registered for protection. ;When the security component apply the user restrictions to the ;Action Items, all the components that are connected to the /Action Items will receive the same restriction.  
ParentFontTabOrder  TActionListActionList1Left� Top TActionShowUserNameCaptionShow User Name	OnExecuteShowUserNameExecute  TActionShowUserPasswordCaptionShow User Password	OnExecuteShowUserPasswordExecute  TActionChangeUserPasswordCaptionChange User Password	OnExecuteChangeUserPasswordExecute  TActionUserAdministrationCaptionUser Administration	OnExecuteUserAdministrationExecute  TActionLoginCaptionLogin	OnExecuteLoginExecute   	TMainMenu	MainMenu1Left(Top�  	TMenuItemUsers1CaptionUsers 	TMenuItemUserAdministration1ActionUserAdministration  	TMenuItemChangeUserPassword1ActionChangeUserPassword  	TMenuItemN1Caption-  	TMenuItemLogin1ActionLogin  	TMenuItemN2Caption-  	TMenuItemShowUserName1ActionShowUserName  	TMenuItemShowUserPassword1ActionShowUserPassword    	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDLoginPromptParams.Strings9SERVER NAME=C:\ToolsAndComps\UsersCS\Samples\USERS_DB.GDBUSER NAME=SYSDBAOPEN MODE=READ/WRITESCHEMA CACHE SIZE=8LANGDRIVER=SQLQRYMODE="SQLPASSTHRU MODE=SHARED AUTOCOMMITSCHEMA CACHE TIME=-1MAX ROWS=-1BATCH COUNT=200ENABLE SCHEMA CACHE=FALSESCHEMA CACHE DIR=ENABLE BCD=FALSEBLOBS TO CACHE=64BLOB SIZE=32WAIT ON LOCKS=FALSECOMMIT RETAIN=FALSE
ROLE NAME=PASSWORD=masterkey SessionNameDefaultTransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft8Top  TUsersCSUsersCS1	AutoLoginAppKeyActionListsFormList.Strings�  Form1=Action Lists|ActionList1=ActionList1
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
 MaxCurrentUsersHaltOnReachMaxCurrentUsers	Version1.971 (18/Nov)DatabaseNamedbUsersFileNames83DOSLeft8Top�   TUsersCSRegUsersCSReg1FormNameForm1FormCaptionAction ListsComponentList.StringsActionList1=ActionList1ActionList1Parent=Form1ShowUserName=Show User NameShowUserNameParent=ActionList1#ShowUserPassword=Show User Password"ShowUserPasswordParent=ActionList1'ChangeUserPassword=Change User Password$ChangeUserPasswordParent=ActionList1&UserAdministration=User Administration$UserAdministrationParent=ActionList1Login=LoginLoginParent=ActionList1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	Left� Top�    