object RecvMsgForm: TRecvMsgForm
  Left = 309
  Top = 268
  Width = 435
  Height = 208
  Caption = 'RecvMsgForm'
  Color = clBtnFace
  Constraints.MinHeight = 150
  Constraints.MinWidth = 300
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000040010000000000000000000000010000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000909
    0900121212001F1F1F002C2C2C003939390045454500525252005F5F5F006C6C
    6C007878780085858500929292009F9F9F00ABABAB00B8B8B800C5C5C500D2D2
    D200DEDEDE00EBEBEB00F8F8F800F0FBFF00A4A0A000C0DCC000F0CAA6000000
    3E0000005D0000007C0000009B000000BA000000D9000000F0002424FF004848
    FF006C6CFF009090FF00B4B4FF0000143E00001E5D0000287C0000329B00003C
    BA000046D9000055F000246DFF004885FF006C9DFF0090B5FF00B4CDFF00002A
    3E00003F5D0000547C0000699B00007EBA000093D90000AAF00024B6FF0048C2
    FF006CCEFF0090DAFF00B4E6FF00003E3E00005D5D00007C7C00009B9B0000BA
    BA0000D9D90000F0F00024FFFF0048FFFF006CFFFF0090FFFF00B4FFFF00003E
    2A00005D3F00007C5400009B690000BA7E0000D9930000F0AA0024FFB60048FF
    C2006CFFCE0090FFDA00B4FFE600003E1400005D1E00007C2800009B320000BA
    3C0000D9460000F0550024FF6D0048FF85006CFF9D0090FFB500B4FFCD00003E
    0000005D0000007C0000009B000000BA000000D9000000F0000024FF240048FF
    48006CFF6C0090FF9000B4FFB400143E00001E5D0000287C0000329B00003CBA
    000046D9000055F000006DFF240085FF48009DFF6C00B5FF9000CDFFB4002A3E
    00003F5D0000547C0000699B00007EBA000093D90000AAF00000B6FF2400C2FF
    4800CEFF6C00DAFF9000E6FFB4003E3E00005D5D00007C7C00009B9B0000BABA
    0000D9D90000F0F00000FFFF2400FFFF4800FFFF6C00FFFF9000FFFFB4003E2A
    00005D3F00007C5400009B690000BA7E0000D9930000F0AA0000FFB62400FFC2
    4800FFCE6C00FFDA9000FFE6B4003E1400005D1E00007C2800009B320000BA3C
    0000D9460000F0550000FF6D2400FF854800FF9D6C00FFB59000FFCDB4003E00
    00005D0000007C0000009B000000BA000000D9000000F0000000FF242400FF48
    4800FF6C6C00FF909000FFB4B4003E0014005D001E007C0028009B003200BA00
    3C00D9004600F0005500FF246D00FF488500FF6C9D00FF90B500FFB4CD003E00
    2A005D003F007C0054009B006900BA007E00D9009300F000AA00FF24B600FF48
    C200FF6CCE00FF90DA00FFB4E6003E003E005D005D007C007C009B009B00BA00
    BA00D900D900F000F000FF24FF00FF48FF00FF6CFF00FF90FF00FFB4FF002A00
    3E003F005D0054007C0069009B007E00BA009300D900AA00F000B624FF00C248
    FF00CE6CFF00DA90FF00E6B4FF0014003E001E005D0028007C0032009B003C00
    BA004600D9005500F0006D24FF008548FF009D6CFF00B590FF00CDB4FF000000
    000000000000000000000000000000000000CE1E1E1E1E1E1E1E1E1E1E1EB8B8
    B8B8B8B8B8B8B8B8B8B8B8B8B81E0055484F4F4F4F4F4F4F4F4F034D001E0056
    55494848484848484848504D001E005700000000000054000000484E001E0057
    56565555555554545454484E001E005700000055550000000000484E001E0057
    5756564A555656555554484E001D105757574A1C001010565555484E00D9D057
    57574B1B00B61056555554030000DD245757574A10ACB857565655480000DDDD
    D010101010B6B810000011DCDD0000000000000000B611CE0000000000000000
    00000000B8C4D20000000000000000000000000000000000000000000000FFFF
    FFFFF000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
    FFFF0000FFFF0001FFFF0001FFFF0001FFFFFC3FFFFFFC7FFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    427
    179)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDateTime: TLabel
    Left = 224
    Top = 8
    Width = 192
    Height = 13
    Alignment = taRightJustify
    Caption = 'Received at: Tue Mar 09 08:32:06 2004'
  end
  object lblUIN: TLabel
    Left = 32
    Top = 8
    Width = 18
    Height = 13
    Caption = 'UIN'
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 16
    Height = 16
    Center = True
    Stretch = True
  end
  object btnReply: TButton
    Left = 120
    Top = 152
    Width = 84
    Height = 23
    Anchors = [akBottom]
    Caption = '&Reply'
    TabOrder = 0
    OnClick = btnReplyClick
  end
  object btnClose: TButton
    Left = 218
    Top = 152
    Width = 87
    Height = 23
    Anchors = [akBottom]
    Caption = '&Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 32
    Width = 409
    Height = 113
    Anchors = [akLeft, akTop, akRight, akBottom]
    HideScrollBars = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
end