object frmChild: TfrmChild
  Left = 0
  Top = 0
  Caption = 'frmChild'
  ClientHeight = 213
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbTest: TLabel
    Left = 24
    Top = 24
    Width = 29
    Height = 13
    Caption = 'lbTest'
  end
  object sbClose: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'sbClose'
    TabOrder = 0
    OnClick = sbCloseClick
  end
  object plsController1: TplsController
    Left = 156
    Top = 124
  end
end
