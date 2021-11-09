object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 534
  ClientWidth = 590
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
    Left = 48
    Top = 160
    Width = 210
    Height = 13
    Caption = 'Comece a inserir os dados no bot'#227'o abaixo:'
  end
  object Memo1: TMemo
    Left = 304
    Top = 48
    Width = 278
    Height = 417
    TabOrder = 0
  end
  object btnRec: TButton
    Left = 120
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 1
    OnClick = btnRecClick
  end
end
