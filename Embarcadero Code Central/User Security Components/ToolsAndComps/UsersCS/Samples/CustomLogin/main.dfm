�
 TFORM1 0�  TPF0TForm1Form1Left� Top+Width�Height�CaptionCustom LoginColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterPixelsPerInch`
TextHeight TMemoMemo1LeftpTop WidthQHeight�AlignalRightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Lines.StringseThis sample application shows how to write and execute your own login dialog, overriding the default login dialog of the component. ^Designing your custom login dialog, you can insert your company's logo in the dialog and even Urequest a third parameter to your users, as his register number or anything you want. ]For convenience, you can, for example, write code to store the last user name in the Windows bregistry and retrieve this user name when your application loads again, so the user just needs to type his password. MAll this is possible througth the event OnLogin. See the piece of code below: >procedure TForm1.UsersCS1Login(var UserName, Password: String;!  var ModalResult: TModalResult);begin.  frmCustomLogin:=TfrmCustomLogin.Create(NIL);  try    frmCustomLogin.ShowModal;*    UserName:=frmCustomLogin.Usuario.Text;(    Password:=frmCustomLogin.Senha.Text;+    ModalResult:=frmCustomLogin.ModalResult	  finally    frmCustomLogin.Free;  end;end;  
ParentFontTabOrder   TButtonButton1LeftTopWidthKHeightCaptionLoginTabOrderOnClickButton1Click  TUsersCSUsersCS1OnLoginUsersCS1LoginAppKeyCustomLoginFormList.Strings�  Form1=Custom Login|ActionList1=Available Actions
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
 Version1.90 (27/Dez)DatabaseNamedbUsersFileNames83DOSLeft0Topp  TUsersCSRegUsersCSReg1FormNameForm1FormCaptionCustom LoginComponentList.StringsActionList1=Available ActionsActionList1Parent=Form1ShowUserName=Show User NameShowUserNameParent=ActionList1#ShowUserPassword=Show User Password"ShowUserPasswordParent=ActionList1'ChangeUserPassword=Change User Password$ChangeUserPasswordParent=ActionList1&UserAdministration=User Administration$UserAdministrationParent=ActionList1Login=LoginLoginParent=ActionList1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	Left0Top�   	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadBeforeConnectdbUsersBeforeConnectLeft0Top�    