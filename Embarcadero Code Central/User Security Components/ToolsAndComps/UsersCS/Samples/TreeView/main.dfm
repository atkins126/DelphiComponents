�
 TFORM1 0  TPF0TForm1Form1Left� TopGWidth�Height�CaptionTreeViewColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterWindowStatewsMaximizedOnCreate
FormCreatePixelsPerInch`
TextHeight 	TTreeView	TreeView1Left Top WidthHeight�Hint(Double click item to execute menu optionAlignalLeftIndentParentShowHintReadOnly	ShowHint	TabOrder 
OnDblClickTreeView1DblClick
OnDeletionTreeView1Deletion  TMemoMemo1LeftTop Width�Height�AlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Pitch
fpVariable
Font.Style Lines.StringsGThis sample application shows how to simulate a menu using a TTreeview 
component. HThe application has a code that inserts all menu items in the treeview. LBefore inserting the menu item, the code verifies if the user is authorized )to used the menu item using the function GGetComponentInfo(TUsersCSReg). If the user is not authorized, the node %will not be inserted in the treeview. HAll the menu clicks are associated with the Data property of the Nodes. JThe OnItemClick event of the treeview has the code that triggers the menu /code that is associated with the treeview node. DAlso, alter a call to the Login method, there is a call to the code E(procedure MenuToTreeView) that updates the menu to the user that is (performing the login in the application.  
ParentFontTabOrder  	TDatabasedbUsersDatabaseNamedbUsers
DriverNameSTANDARDLoginPromptParams.Strings*PATH=C:\ToolsAndComps\UsersCS\Samples\DataENABLE BCD=FALSEDEFAULT DRIVER=PARADOX SessionNameDefaultTransIsolationtiDirtyReadLeft� Top  TUsersCSUsersCS1	AutoLoginAppKeyTreeViewFormList.Stringsf  Form1=TreeView|MainMenu1=MainMenu1
MainMenu1Parent=Form1
File1=File
File1Parent=MainMenu1
Edit1=Edit
Edit1Parent=MainMenu1
Security1=Security
Security1Parent=MainMenu1
New1=New
New1Parent=File1
NewApplication1=New Application
NewApplication1Parent=File1
NewForm1=New Form
NewForm1Parent=File1
NewFrame1=New Frame
NewFrame1Parent=File1
Open1=Open
Open1Parent=File1
OpenProject1=Open Project
OpenProject1Parent=File1
Clipboardfunctions1=Clipboard functions
Clipboardfunctions1Parent=Edit1
SearchOptions1=Search Options
SearchOptions1Parent=Edit1
MenuItem2=User Administration
MenuItem2Parent=Security1
ChangePassword1=Change User Password
ChangePassword1Parent=Security1
MenuItem3=Login
MenuItem3Parent=Security1
Copy1=Copy
Copy1Parent=Clipboardfunctions1
Cut1=Cut
Cut1Parent=Clipboardfunctions1
Paste1=Paste
Paste1Parent=Clipboardfunctions1
ViewClipboardContents1=View Clipboard Contents
ViewClipboardContents1Parent=Clipboardfunctions1
Find1=Find
Find1Parent=SearchOptions1
FindinFiles1=Find in Files
FindinFiles1Parent=SearchOptions1
Replace1=Replace
Replace1Parent=SearchOptions1
 BeforeLoginUsersCS1BeforeLoginVersion1.971 (11/Oct)DatabaseNamedbUsersFileNames83DOSLeft� Top�   TUsersCSRegUsersCSReg1FormNameForm1FormCaptionTreeViewComponentList.StringsMainMenu1=MainMenu1MainMenu1Parent=Form1
File1=FileFile1Parent=MainMenu1
Edit1=EditEdit1Parent=MainMenu1Security1=SecuritySecurity1Parent=MainMenu1New1=NewNew1Parent=File1NewApplication1=New ApplicationNewApplication1Parent=File1NewForm1=New FormNewForm1Parent=File1NewFrame1=New FrameNewFrame1Parent=File1
Open1=OpenOpen1Parent=File1OpenProject1=Open ProjectOpenProject1Parent=File1'Clipboardfunctions1=Clipboard functionsClipboardfunctions1Parent=Edit1SearchOptions1=Search OptionsSearchOptions1Parent=Edit1MenuItem2=User AdministrationMenuItem2Parent=Security1$ChangePassword1=Change User PasswordChangePassword1Parent=Security1MenuItem3=LoginMenuItem3Parent=Security1
Copy1=CopyCopy1Parent=Clipboardfunctions1Cut1=CutCut1Parent=Clipboardfunctions1Paste1=Paste Paste1Parent=Clipboardfunctions1.ViewClipboardContents1=View Clipboard Contents0ViewClipboardContents1Parent=Clipboardfunctions1
Find1=FindFind1Parent=SearchOptions1FindinFiles1=Find in Files!FindinFiles1Parent=SearchOptions1Replace1=ReplaceReplace1Parent=SearchOptions1 SecurityComponentUsersCS1IsRepositoryFormAutoApplySecurity	Left� Toph  	TMainMenu	MainMenu1Left� Top0 	TMenuItemFile1CaptionFile 	TMenuItemNew1CaptionNew ...OnClickOpenProject1Click  	TMenuItemNewApplication1CaptionNew Application ...OnClickOpenProject1Click  	TMenuItemNewForm1CaptionNew FormOnClickOpenProject1Click  	TMenuItem	NewFrame1Caption	New FrameOnClickOpenProject1Click  	TMenuItem	MenuItem1Caption-OnClickOpenProject1Click  	TMenuItemOpen1CaptionOpen ...OnClickOpenProject1Click  	TMenuItemOpenProject1CaptionOpen Project ...OnClickOpenProject1Click   	TMenuItemEdit1CaptionEdit 	TMenuItemClipboardfunctions1CaptionClipboard functions 	TMenuItemCopy1CaptionCopyOnClickOpenProject1Click  	TMenuItemCut1CaptionCutOnClickOpenProject1Click  	TMenuItemPaste1CaptionPasteOnClickOpenProject1Click  	TMenuItemN2Caption-OnClickOpenProject1Click  	TMenuItemViewClipboardContents1CaptionView Clipboard ContentsOnClickOpenProject1Click   	TMenuItemSearchOptions1CaptionSearch Options 	TMenuItemFind1CaptionFind ...OnClickOpenProject1Click  	TMenuItemFindinFiles1CaptionFind in Files ...OnClickOpenProject1Click  	TMenuItemReplace1CaptionReplace ...OnClickOpenProject1Click    	TMenuItem	Security1CaptionSecurity 	TMenuItem	MenuItem2CaptionUsers AdministrationOnClickUserAdministrationExecute  	TMenuItemChangePassword1CaptionChange PasswordOnClickChangeUserPasswordExecute  	TMenuItemN3Caption-  	TMenuItem	MenuItem3CaptionLoginOnClickLoginExecute     