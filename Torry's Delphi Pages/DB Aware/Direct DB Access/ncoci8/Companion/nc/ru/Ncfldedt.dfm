object NCFieldsEditFrm: TNCFieldsEditFrm
  Left = 325
  Top = 211
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = '����� �����'
  ClientHeight = 312
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lbFields: TNCDblListBox
    Left = 0
    Top = 0
    Width = 445
    Height = 270
    DestCaption = '��������� ����:'
    SrcCaption = '��������� &����:'
    DestListHint = '������ ��������� �����'
    SrcListHint = '������ ��������� �����'
    IncHint = '�������� ����'
    IncAllHint = '�������� ��� ����'
    ExHint = '��������� ����'
    ExAllHint = '��������� ��� ����'
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 360
    Top = 280
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkHelp
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 280
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 200
    Top = 280
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
end
