object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'DecoProgressBarPlus Demo'
  ClientHeight = 348
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DecoProgressBar1: TDecoProgressBarPlus
    Left = 16
    Top = 166
    Width = 250
    Height = 88
    Color = clAppWorkSpace
    Position = 60.000000000000000000
    BevelKind = bkFlat
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    TabOrder = 0
    TabStop = True
    Level1Color = 2411147
    Level2Percent = 70
    Level3Color = 3422169
    Level3Percent = 90
    Level3TextColor = clWhite
    RoundCorners = 12
    BarSize = 32
    BarMargin = 8
  end
  object DecoProgressBar2: TDecoProgressBarPlus
    Left = 16
    Top = 16
    Width = 250
    Height = 45
    ParentColor = True
    Alignment = taLeftJustify
    Caption = 'Current position: '
    DoubleBuffered = True
    MaxValue = 50.000000000000000000
    ParentDoubleBuffered = False
    ShowFocusRect = False
    TabOrder = 1
    ShowValueInBar = ibvValue
    FrameColor = clBtnShadow
    Level1Color = 14454388
    Level2Percent = 101
    Level3Color = 3422169
    Level3Percent = 101
    Level3TextColor = clWhite
    RoundCorners = 12
    Rounded = False
    BarSize = 20
    BarMargin = 8
  end
  object DecoProgressBar3: TDecoProgressBarPlus
    Left = 16
    Top = 67
    Width = 250
    Height = 45
    ParentColor = True
    Position = 60.000000000000000000
    Alignment = taRightJustify
    Caption = 'Current percent: '
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    ShowFocusRect = False
    TabOrder = 2
    Gradient = pggLightMirror
    FrameColor = clSilver
    Level1Color = 2411147
    Level2Percent = 50
    Level3Color = 3422169
    Level3Percent = 101
    Level3TextColor = clWhite
    RoundCorners = 12
    Rounded = False
    BarSize = 20
    BarMargin = 8
  end
  object DecoProgressBar4: TDecoProgressBarPlus
    Left = 16
    Top = 115
    Width = 250
    Height = 45
    ParentColor = True
    Position = 60.000000000000000000
    DoubleBuffered = True
    MaxValue = 1000.000000000000000000
    ParentDoubleBuffered = False
    ShowFocusRect = False
    TabOrder = 3
    FrameColor = clAppWorkSpace
    Level1Color = 2411147
    Level2Percent = 101
    Level3Color = 3422169
    Level3Percent = 101
    Level3TextColor = clWhite
    BarSize = 20
    BarMargin = 8
  end
  object DecoProgressBar5: TDecoProgressBarPlus
    Tag = 1
    Left = 296
    Top = 16
    Width = 250
    Height = 45
    ParentColor = True
    Position = 120.000000000000000000
    Caption = 'Over max. indicator: '
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    TabOrder = 5
    TabStop = True
    FrameColor = clMaroon
    Level1Color = 2411147
    Level2Percent = 101
    Level3Color = 3422169
    Level3Percent = 101
    Level3TextColor = clWhite
    RoundCorners = 8
    BarSize = 20
    BarMargin = 8
    ShowOverMaxIndicator = True
  end
  object DecoProgressBar6: TDecoProgressBarPlus
    Tag = 1
    Left = 296
    Top = 67
    Width = 250
    Height = 45
    ParentColor = True
    Position = -10.000000000000000000
    Caption = 'Under min. indicator: '
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    TabOrder = 4
    TabStop = True
    Gradient = pggMirror
    BackColor = 51914
    FrameColor = clAppWorkSpace
    Level1Color = clSilver
    Level2Percent = 101
    Level3Color = clSilver
    Level3Percent = 101
    Level3TextColor = clWhite
    RoundCorners = 9
    BarSize = 20
    BarMargin = 8
    ShowOverMaxIndicator = True
  end
  object DecoProgressBar7: TDecoProgressBarPlus
    Left = 296
    Top = 115
    Width = 250
    Height = 45
    ParentColor = True
    Position = 60.000000000000000000
    Caption = 'Frame progress'
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    ShowFocusRect = False
    TabOrder = 6
    Gradient = pggVertical
    ShowValueInBar = ibvNone
    FrameColor = clBtnShadow
    FrameProgress = True
    Level1Color = 13070295
    Level2Percent = 101
    Level3Color = 49151
    Level3Percent = 101
    Level3TextColor = clWhite
    RoundCorners = 12
    Rounded = False
    BarSize = 20
    BarMargin = 8
  end
  object DecoProgressBar8: TDecoProgressBarPlus
    Left = 296
    Top = 162
    Width = 250
    Height = 45
    ParentColor = True
    Position = 60.000000000000000000
    Caption = 'Frame width'
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    ShowFocusRect = False
    TabOrder = 7
    Gradient = pggVertical
    ShowValueInBar = ibvNone
    FrameColor = clNone
    FrameProgress = True
    FrameWidth = 3
    Level1Color = 49151
    Level2Percent = 101
    Level3Color = 49151
    Level3Percent = 101
    Level3TextColor = clWhite
    RoundCorners = 12
    Rounded = False
    BarSize = 20
    BarMargin = 8
  end
  object DecoProgressBar9: TDecoProgressBarPlus
    Left = 296
    Top = 209
    Width = 250
    Height = 45
    ParentColor = True
    Position = 60.000000000000000000
    DoubleBuffered = True
    MaxValue = 100.000000000000000000
    ParentDoubleBuffered = False
    ShowFocusRect = False
    TabOrder = 8
    Gradient = pggVertical
    ShowValueInBar = ibvValue
    FrameColor = clNone
    FrameProgress = True
    Level1Color = 49151
    Level2Percent = 101
    Level3Color = 49151
    Level3Percent = 101
    Level3TextColor = clWhite
    BarSize = 13
    BarMargin = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 168
    Top = 268
  end
end
