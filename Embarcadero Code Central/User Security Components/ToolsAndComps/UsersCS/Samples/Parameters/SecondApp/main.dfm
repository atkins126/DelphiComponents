�
 TFORM1 0�  TPF0TForm1Form1Left� ToplWidth HeightwCaptionForm1Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrder	OnCreate
FormCreatePixelsPerInch`
TextHeight TMemoMemo1Left� TopWidthyHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Lines.Strings'How to use the parameters UserName and 	Password: 0* Change the property MaxBadLogins to 1 (In the BeforeLogin method)* Change AutoLogin to False/* Write a OnLogin Event and get the parameters using the ParamStr function,0  passing then to the parameters of the function 
ParentFontTabOrder   TUsersCSUsersCS1OnLoginUsersCS1LoginAppKey	SecondAppFormList.Strings�Form1=Form1|MainMenu1=MainMenu1
MainMenu1Parent=Form1
Users1=Users
Users1Parent=MainMenu1
Admin1=Admin
Admin1Parent=Users1
 BeforeLoginUsersCS1BeforeLoginVersion1.90 (27/Dez)DatabaseNamedbUsersFileNames83DOSLeft(TopX  TUsersCSRegUsersCSReg1FormNameForm1FormCaptionForm1ComponentList.StringsMainMenu1=MainMenu1MainMenu1Parent=Form1Users1=UsersUsers1Parent=MainMenu1Admin1=AdminAdmin1Parent=Users1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	Left8Top�   	TMainMenu	MainMenu1Left8Top 	TMenuItemUsers1CaptionUsers 	TMenuItemAdmin1CaptionAdminOnClickAdmin1Click    	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft� Top�    