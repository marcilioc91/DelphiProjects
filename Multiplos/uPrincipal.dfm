object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Multiplos'
  ClientHeight = 299
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 77
    Width = 159
    Height = 13
    Caption = 'Insira um valor no campo abaixo:'
  end
  object Label2: TLabel
    Left = 64
    Top = 192
    Width = 69
    Height = 13
    Caption = 'M'#250'ltiplos de 3:'
  end
  object Label3: TLabel
    Left = 64
    Top = 211
    Width = 69
    Height = 13
    Caption = 'M'#250'ltiplos de 5:'
  end
  object Label4: TLabel
    Left = 64
    Top = 230
    Width = 87
    Height = 13
    Caption = 'M'#250'ltiplos de 3 e 5:'
  end
  object lblM3: TLabel
    Left = 135
    Top = 192
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblM5: TLabel
    Left = 135
    Top = 211
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblM35: TLabel
    Left = 155
    Top = 230
    Width = 2
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor: TEdit
    Left = 64
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 64
    Top = 136
    Width = 89
    Height = 25
    Caption = 'Exibir m'#250'ltiplos'
    TabOrder = 1
    OnClick = Button1Click
  end
  object memMultiplos: TMemo
    Left = 352
    Top = 37
    Width = 249
    Height = 254
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
