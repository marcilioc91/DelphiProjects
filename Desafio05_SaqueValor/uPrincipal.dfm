object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 23
  object edtValor: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 31
    TabOrder = 0
    OnExit = edtValorExit
  end
  object btnConsultar: TButton
    Left = 168
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Sacar'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 72
    Width = 385
    Height = 209
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
