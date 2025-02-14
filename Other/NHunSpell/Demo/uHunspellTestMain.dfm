object FrmHunspellTestMain: TFrmHunspellTestMain
  Left = 367
  Top = 115
  Caption = 'NHunspell Test'
  ClientHeight = 397
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 7
    Width = 180
    Height = 16
    Caption = 'Dictionary / Dictionaries Folder:'
  end
  object Label2: TLabel
    Left = 536
    Top = 3
    Width = 72
    Height = 16
    Caption = 'Check word:'
  end
  object Label3: TLabel
    Left = 16
    Top = 103
    Width = 115
    Height = 16
    Caption = 'Spelling Dictionaries'
  end
  object Label4: TLabel
    Left = 16
    Top = 267
    Width = 140
    Height = 16
    Caption = 'Hyphenation Dictionaries'
  end
  object edDict: TEdit
    Left = 16
    Top = 26
    Width = 409
    Height = 24
    TabOrder = 0
  end
  object btnDict: TButton
    Left = 424
    Top = 25
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = btnDictClick
  end
  object btnReadOXT: TButton
    Left = 16
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Read OXT'
    TabOrder = 2
    OnClick = btnReadOXTClick
  end
  object EdCheckWord: TEdit
    Left = 536
    Top = 25
    Width = 225
    Height = 24
    TabOrder = 3
    Text = 'Test'
  end
  object btnSpell: TButton
    Left = 767
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Spell'
    Enabled = False
    TabOrder = 4
    OnClick = btnSpellClick
  end
  object MemOutput: TMemo
    Left = 536
    Top = 56
    Width = 225
    Height = 333
    ScrollBars = ssBoth
    TabOrder = 5
    WordWrap = False
  end
  object btnStem: TButton
    Left = 767
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Stem'
    Enabled = False
    TabOrder = 6
    OnClick = btnStemClick
  end
  object btnAnalyze: TButton
    Left = 767
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Analyze'
    Enabled = False
    TabOrder = 7
    OnClick = btnAnalyzeClick
  end
  object btnHyphenate: TButton
    Left = 767
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Hyphenate'
    Enabled = False
    TabOrder = 8
    OnClick = btnHyphenateClick
  end
  object btnReadFolder: TButton
    Left = 125
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Read Folder'
    TabOrder = 9
    OnClick = btnReadFolderClick
  end
  object btnClear: TButton
    Left = 234
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Clear Dicts'
    TabOrder = 10
    OnClick = btnClearClick
  end
  object lbSpellDicts: TCheckListBox
    Left = 16
    Top = 123
    Width = 433
    Height = 135
    OnClickCheck = lbSpellDictsClickCheck
    TabOrder = 11
    OnClick = lbSpellDictsClickCheck
  end
  object lbHyphenDicts: TCheckListBox
    Left = 16
    Top = 289
    Width = 433
    Height = 100
    OnClickCheck = lbHyphenDictsClickCheck
    TabOrder = 12
    OnClick = lbHyphenDictsClickCheck
  end
  object btnDownload: TButton
    Left = 344
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Download...'
    TabOrder = 13
    OnClick = btnDownloadClick
  end
  object dlgLoadDictionary: TOpenDialog
    DefaultExt = 'aff'
    Filter = 'OpenOffice Dictionaries (*.oxt)|*.oxt'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Load Hunspell Dictionary'
    Left = 464
    Top = 24
  end
end
