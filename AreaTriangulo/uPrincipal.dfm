object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #193'rea Triangulo'
  ClientHeight = 335
  ClientWidth = 520
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
    Left = 32
    Top = 40
    Width = 227
    Height = 16
    Caption = 'Insira os lados do tri'#226'ngulo abaixo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 100
    Width = 38
    Height = 16
    Caption = 'Lado 1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 194
    Top = 98
    Width = 38
    Height = 16
    Caption = 'Lado 2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 368
    Top = 98
    Width = 38
    Height = 16
    Caption = 'Lado 3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 208
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Verificar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtL1: TEdit
    Left = 32
    Top = 120
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtL2: TEdit
    Left = 194
    Top = 120
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object edtL3: TEdit
    Left = 368
    Top = 120
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
end
