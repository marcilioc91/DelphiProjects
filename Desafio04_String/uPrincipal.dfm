object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 204
  ClientWidth = 511
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
  object Label1: TLabel
    Left = 15
    Top = 7
    Width = 159
    Height = 19
    Caption = 'Insira uma palavra:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 89
    Width = 88
    Height = 19
    Caption = 'Resultado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtFrase: TEdit
    Left = 15
    Top = 32
    Width = 482
    Height = 31
    TabOrder = 0
    OnExit = edtFraseExit
  end
  object btnExibir: TButton
    Left = 286
    Top = 151
    Width = 100
    Height = 35
    Caption = 'Exibir'
    TabOrder = 1
    OnClick = btnExibirClick
  end
  object btnSair: TButton
    Left = 400
    Top = 151
    Width = 100
    Height = 35
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object edtResultado: TEdit
    Left = 15
    Top = 114
    Width = 482
    Height = 31
    TabOrder = 3
  end
end
