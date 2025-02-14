�
 TMAINFORM 0   TPF0	TMainFormMainFormLeft� Top8Width Height�CaptionTMSSCScript, TObjectProxy demoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TPageControlpcLeftTop� Width
Height
ActivePagetsVBAnchorsakLeftakTopakRightakBottom TabOrder  	TTabSheettsVBCaptionVBScript TMemomeVBLeft Top WidthHeight� AlignalClientFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Lines.Strings"Sub EnumItems(ListBox, Tab, Items)'  For I = 0 to Items.ComponentCount - 1#    Component = Items.Components(I);    ListBox.Items.Add(Tab & CStr(I) & " " & Component.Name),    EnumItems ListBox, Tab & "  ", Component  NextEnd Sub Sub ScriptClick(Sender)   If Sender.Font.Style = "" Then     Sender.Font.Style = "fsBold"  Else    Sender.Font.Style = ""  End IfE  MsgBox "Script handler in script code is invoked by " & Sender.NameEnd Sub 
Sub Main()
  Dim Form  Dim Label  Dim ListBox  Dim Panel  Dim Button  Dim Component /  Form = Self.Create("TForm", Null, "DemoForm")  With FormA    .Caption = "This form has been created by the script control"     .Position = "poScreenCenter",    .BorderIcons = "biSystemMenu,biMaximize"
  End With %  Label = Self.Create("TLabel", Form)  With Label    .Parent = FormJ    .Caption = "Script uses TObjectProxy functionality to enum components"    With .Font      .Style = "fsUnderline"    End With    .Align = "alTop"    .Alignment = "taCenter"    .Layout = "tlCenter"    .Height = 50
  End With +  Panel = Form.Create("TPanel", Form, "pn")  With Panel    .Parent = Form    .Align = "alClient"    .Caption = ""    .BevelOuter = "bvNone"
  End With /  ListBox = Self.Create("TListBox", Form, "lb")  With ListBox    .Parent = Panel    .Align = "alClient"    .Align = "alTop"    .Height = .Height - 100-    .Anchors = .Anchors & ",akRight,akBottom"    .Items.Add("Enum controls")    For Each Control In Self      I = I + 17      .Items.Add("    " & CStr(I) & " " & Control.Name)    Next     .Items.Add("")!    .Items.Add("Enum components")(    For I = 0 To Self.ComponentCount - 1$      Component = Self.Components(I)9      .Items.Add("    " & CStr(I) & " " & Component.Name)    Next     .Items.Add("")-    .Items.Add("Enum components recursively")#    EnumItems ListBox, "    ", Self
  End With  '  Button = Self.Create("TButton", Form)  With Button    .Parent = Panel    .Caption = "&OK"    .ModalResult = 1    .Default = True    .Cancel = True$    .Left = Panel.Width - .Width - 8%    .Top = Panel.Height - .Height - 8!    .Anchors = "akRight,akBottom"
  End With 9  Button = Self.Create("TButton", Form, "cmScriptMsgBox")  With Button    .Parent = Panel    .Caption = "&Message"    .Left = 8%    .Top = Panel.Height - .Height - 8     .Anchors = "akLeft,akBottom"-    .OnClick = Self("cmDelphiMsgBox").OnClick
  End With 7  Button = Self.Create("TButton", Form, "cmScriptFont")  With Button    .Parent = Panel    .Caption = "&Change font"A    .Left = 8 + .Owner.FindComponent("cmScriptMsgBox").Width + 16%    .Top = Panel.Height - .Height - 8     .Anchors = "akLeft,akBottom"    .OnClick = "ScriptClick"
  End With .  Self("cmDelphiFont").OnClick = "ScriptClick"   Form.ShowModal   Form.Free End Sub         
ParentFont
ScrollBarsssBothTabOrder WordWrap    	TGroupBox	GroupBox1Left� TopSWidthmHeight]AnchorsakLeftakTopakRight Caption Event &handling: TabOrder TLabelLabel1LeftTopWidth� HeightCaption4Script can get and set event handlers in Delphi codeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsUnderline 
ParentFont  TLabelLabel2LeftTop<WidthsHeightCaptionAnd to script proceduresFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsUnderline 
ParentFont  TButtoncmDelphiMsgBoxLeftTopWidthKHeightAnchorsakTopakRight Caption&MessageTabOrder OnClickcmDelphiMsgBoxClick  TButtoncmDelphiFontLeftTop4WidthKHeightAnchorsakTopakRight Caption&Change fontTabOrderOnClickcmDelphiFontClick   	TGroupBoxgbExecLeftTopTWidth� Height]Caption &Execution: TabOrder TButton	cmExecuteLeftTop"WidthKHeightCaption&ExecuteTabOrder OnClickcmExecuteClick   	TGroupBox	GroupBox2LeftTopWidth	HeightIAnchorsakLeftakTopakRight Caption Microsoft Script Control: TabOrder TvgLabelvgLabel1Left0Top0WidthkHeightCursorcrHandPointHint"http://www.microsoft.com/scriptingCaptionclick here to downloadFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsUnderline 
ParentFontParentShowHintShowHint	ExecParams.FileName"http://www.microsoft.com/scriptingExecParams.Operationopen  TLabelLabel3Left0TopWidth�HeightCaption�Microsoft Script Control ActiveX allows to execute scripts for VBScript and JavaScript languages. 
You should install it to use theTMSSCScript component.Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsUnderline 
ParentFont   TMSSCScriptscAllowUI	MethodsName	ShowModalClassNameSupportTFormDispID OnInvokeTFormShowModal  OnCreateObjectscCreateObjectLeftTop   