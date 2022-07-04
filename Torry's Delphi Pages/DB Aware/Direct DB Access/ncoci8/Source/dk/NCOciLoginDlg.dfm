object NCOciLoginFrm: TNCOciLoginFrm
  Left = 469
  Top = 253
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Oracle8 Login'
  ClientHeight = 176
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 5
    Top = 104
    Width = 64
    Height = 13
    Caption = '&Nyt kodeord :'
  end
  object tbshtNewPassword: TPanel
    Left = 1
    Top = 2
    Width = 289
    Height = 143
    BevelOuter = bvNone
    TabOrder = 3
    object Label6: TLabel
      Left = 5
      Top = 48
      Width = 64
      Height = 13
      Caption = '&Nyt kodeord :'
      FocusControl = edtNewPassword
    end
    object Label8: TLabel
      Left = 9
      Top = 80
      Width = 59
      Height = 13
      Caption = '&Gentag det :'
      FocusControl = edtVerify
    end
    object edtNewPassword: TEdit
      Left = 85
      Top = 45
      Width = 193
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnChange = edtNewPasswordChange
    end
    object Memo1: TMemo
      Left = 5
      Top = 8
      Width = 276
      Height = 33
      TabStop = False
      BorderStyle = bsNone
      Color = clBtnFace
      Lines.Strings = (
        'Det kodeord er udl�bet og du skal derfor angive et nyt '
        'Efter det, skal du genskrive det for verifikations form�l.')
      ReadOnly = True
      TabOrder = 0
    end
    object edtVerify: TEdit
      Left = 85
      Top = 77
      Width = 193
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      OnChange = edtNewPasswordChange
    end
  end
  object btnCancel: TBitBtn
    Left = 212
    Top = 148
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object btnOk: TBitBtn
    Left = 132
    Top = 148
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object tbshtLogin: TPanel
    Left = 1
    Top = 1
    Width = 289
    Height = 143
    BevelOuter = bvNone
    Caption = 'Login'
    TabOrder = 0
    object pnlAuthMode: TPanel
      Left = 0
      Top = 83
      Width = 289
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label4: TLabel
        Left = 18
        Top = 3
        Width = 38
        Height = 13
        Caption = '&Modus :'
        FocusControl = cmbbxAuthMode
      end
      object cmbbxAuthMode: TComboBox
        Left = 61
        Top = 0
        Width = 193
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Default'
          'SysDBA'
          'SysOPER')
      end
    end
    object pnlProfile: TPanel
      Left = 0
      Top = 109
      Width = 289
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 289
        Height = 30
        Align = alClient
        Shape = bsTopLine
      end
      object Label5: TLabel
        Left = 27
        Top = 10
        Width = 29
        Height = 13
        Caption = 'P&rofil :'
        FocusControl = cmbbxProfile
      end
      object spdbttnDelProfile: TSpeedButton
        Left = 254
        Top = 7
        Width = 23
        Height = 21
        Caption = '-'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = spdbttnDelProfileClick
      end
      object cmbbxProfile: TComboBox
        Left = 61
        Top = 7
        Width = 193
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnClick = cmbbxProfileClick
      end
    end
    object pnlService: TPanel
      Left = 0
      Top = 56
      Width = 289
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label3: TLabel
        Left = 14
        Top = 4
        Width = 42
        Height = 13
        Caption = '&Service :'
        FocusControl = cmbbxService
      end
      object cmbbxService: TComboBox
        Left = 61
        Top = 0
        Width = 193
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object pnlStd: TPanel
      Left = 0
      Top = 0
      Width = 289
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 20
        Top = 6
        Width = 37
        Height = 13
        Caption = 'Br&uger :'
        FocusControl = edtUserName
      end
      object Label2: TLabel
        Left = 10
        Top = 32
        Width = 46
        Height = 13
        Caption = '&Kodeord :'
        FocusControl = edtPassword
      end
      object edtUserName: TEdit
        Left = 61
        Top = 3
        Width = 193
        Height = 21
        TabOrder = 0
      end
      object edtPassword: TEdit
        Left = 61
        Top = 29
        Width = 193
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
    end
  end
end
