object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 504
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
  object btnCalcular: TButton
    Left = 104
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 0
    OnClick = btnCalcularClick
  end
  object edtSalario: TEdit
    Left = 104
    Top = 140
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object memResultado: TMemo
    Left = 272
    Top = 8
    Width = 185
    Height = 283
    TabOrder = 2
  end
end
