object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 436
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
    Left = 24
    Top = 56
    Width = 149
    Height = 13
    Caption = 'Informe a quantidade de itens:'
  end
  object Memo1: TMemo
    Left = 197
    Top = 8
    Width = 217
    Height = 283
    TabOrder = 2
  end
  object btnMedia: TButton
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Exibir m'#233'dia'
    TabOrder = 1
    OnClick = btnMediaClick
  end
  object edtMax: TSpinEdit
    Left = 56
    Top = 75
    Width = 75
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
end
