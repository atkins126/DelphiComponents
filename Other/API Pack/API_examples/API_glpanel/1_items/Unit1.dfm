object Form1: TForm1
  Left = 193
  Top = 106
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 292
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    520
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object API_glpanel1: TAPI_glpanel
    Left = 0
    Top = 0
    Width = 520
    Height = 233
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'API_GLPANEL'
    TabOrder = 0
    Background = clBlack
    WireFrame = False
    AutoAspect = True
    AxisLength = 0
    AxisColorZ = clBlack
    AxisColorX = clBlack
    AxisColorY = clBlack
    ThreadActive = False
    ThreadPriority = tpIdle
    ThreadDelay = 0
  end
  object API_grbutton1: TAPI_grbutton
    Left = 0
    Top = 264
    Width = 80
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'triangle'
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    VerticalAlignment = taVerticalCenter
    OnClick = API_grbutton1Click
    LedExists = False
    LedState = False
    LedChangeOnClick = False
    LedColorOn = clGreen
    LedStyle = lsellipse
    LedPosition = lpright
    LedColorOff = clRed
    ColorBorder = clBlack
    GradientEnd = clWhite
    FontMouseOver.Charset = DEFAULT_CHARSET
    FontMouseOver.Color = clWindowText
    FontMouseOver.Height = -11
    FontMouseOver.Name = 'Arial'
    FontMouseOver.Style = []
    ColorOver = clSilver
    ColorDown = clGray
    ShowCaption = True
    WordWrap = False
  end
  object API_grbutton2: TAPI_grbutton
    Left = 88
    Top = 264
    Width = 80
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'plane'
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    VerticalAlignment = taVerticalCenter
    OnClick = API_grbutton2Click
    LedExists = False
    LedState = False
    LedChangeOnClick = False
    LedColorOn = clGreen
    LedStyle = lsellipse
    LedPosition = lpright
    LedColorOff = clRed
    ColorBorder = clBlack
    GradientEnd = clWhite
    FontMouseOver.Charset = DEFAULT_CHARSET
    FontMouseOver.Color = clWindowText
    FontMouseOver.Height = -11
    FontMouseOver.Name = 'Arial'
    FontMouseOver.Style = []
    ColorOver = clSilver
    ColorDown = clGray
    ShowCaption = True
    WordWrap = False
  end
  object API_grbutton3: TAPI_grbutton
    Left = 176
    Top = 264
    Width = 80
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'cube'
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    VerticalAlignment = taVerticalCenter
    OnClick = API_grbutton3Click
    LedExists = False
    LedState = False
    LedChangeOnClick = False
    LedColorOn = clGreen
    LedStyle = lsellipse
    LedPosition = lpright
    LedColorOff = clRed
    ColorBorder = clBlack
    GradientEnd = clWhite
    FontMouseOver.Charset = DEFAULT_CHARSET
    FontMouseOver.Color = clWindowText
    FontMouseOver.Height = -11
    FontMouseOver.Name = 'Arial'
    FontMouseOver.Style = []
    ColorOver = clSilver
    ColorDown = clGray
    ShowCaption = True
    WordWrap = False
  end
  object API_grbutton4: TAPI_grbutton
    Left = 264
    Top = 264
    Width = 80
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'sphere'
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    VerticalAlignment = taVerticalCenter
    OnClick = API_grbutton4Click
    LedExists = False
    LedState = False
    LedChangeOnClick = False
    LedColorOn = clGreen
    LedStyle = lsellipse
    LedPosition = lpright
    LedColorOff = clRed
    ColorBorder = clBlack
    GradientEnd = clWhite
    FontMouseOver.Charset = DEFAULT_CHARSET
    FontMouseOver.Color = clWindowText
    FontMouseOver.Height = -11
    FontMouseOver.Name = 'Arial'
    FontMouseOver.Style = []
    ColorOver = clSilver
    ColorDown = clGray
    ShowCaption = True
    WordWrap = False
  end
  object API_grbutton5: TAPI_grbutton
    Left = 352
    Top = 264
    Width = 80
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'cylinder'
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    VerticalAlignment = taVerticalCenter
    OnClick = API_grbutton5Click
    LedExists = False
    LedState = False
    LedChangeOnClick = False
    LedColorOn = clGreen
    LedStyle = lsellipse
    LedPosition = lpright
    LedColorOff = clRed
    ColorBorder = clBlack
    GradientEnd = clWhite
    FontMouseOver.Charset = DEFAULT_CHARSET
    FontMouseOver.Color = clWindowText
    FontMouseOver.Height = -11
    FontMouseOver.Name = 'Arial'
    FontMouseOver.Style = []
    ColorOver = clSilver
    ColorDown = clGray
    ShowCaption = True
    WordWrap = False
  end
  object API_grbutton6: TAPI_grbutton
    Left = 440
    Top = 264
    Width = 80
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderWidth = 1
    Caption = 'exit'
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    VerticalAlignment = taVerticalCenter
    OnClick = API_grbutton6Click
    LedExists = False
    LedState = False
    LedChangeOnClick = False
    LedColorOn = clGreen
    LedStyle = lsellipse
    LedPosition = lpright
    LedColorOff = clRed
    ColorBorder = clBlack
    GradientEnd = clWhite
    FontMouseOver.Charset = DEFAULT_CHARSET
    FontMouseOver.Color = clWindowText
    FontMouseOver.Height = -11
    FontMouseOver.Name = 'Arial'
    FontMouseOver.Style = []
    ColorOver = clSilver
    ColorDown = clGray
    ShowCaption = True
    WordWrap = False
  end
  object ScrollBar1: TScrollBar
    Left = 0
    Top = 240
    Width = 521
    Height = 16
    Anchors = [akLeft, akBottom]
    Max = 360
    PageSize = 0
    TabOrder = 7
    OnScroll = ScrollBar1Scroll
  end
  object Timer1: TTimer
    Interval = 25
    OnTimer = Timer1Timer
    Left = 16
    Top = 16
  end
end