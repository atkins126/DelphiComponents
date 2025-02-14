object FrmHunspellAddictConfig: TFrmHunspellAddictConfig
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Spell Config'
  ClientHeight = 440
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 120
  TextHeight = 16
  object lbDictsFound: TLabel
    Left = 16
    Top = 15
    Width = 169
    Height = 16
    Caption = 'Spelling Dictionaries found in '
    WordWrap = True
  end
  object Label1: TLabel
    Left = 16
    Top = 53
    Width = 261
    Height = 16
    Caption = 'To activate the dictionaries, tick one or more:'
  end
  object lbDictInfo: TLabel
    Left = 16
    Top = 359
    Width = 363
    Height = 73
    AutoSize = False
    Caption = 'Dictionary information'
    WordWrap = True
  end
  object lbSpellDicts: TCheckListBox
    Left = 16
    Top = 75
    Width = 537
    Height = 270
    OnClickCheck = lbSpellDictsClick
    TabOrder = 0
    OnClick = lbSpellDictsClick
  end
  object btnOK: TButton
    Left = 385
    Top = 391
    Width = 81
    Height = 31
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 472
    Top = 391
    Width = 81
    Height = 31
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
