object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ABC Enterprise LTDA'
  ClientHeight = 471
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 29
    Top = 75
    Width = 236
    Height = 19
    Caption = 'Informe o C'#243'digo do Funcion'#225'rio'
  end
  object Label2: TLabel
    Left = 29
    Top = 159
    Width = 227
    Height = 19
    Caption = 'Informe o dia e o m'#234's (DD/MM)'
  end
  object Label3: TLabel
    Left = 29
    Top = 253
    Width = 259
    Height = 19
    Caption = 'Informe o total de horas trabalhadas'
  end
  object Label4: TLabel
    Left = 85
    Top = 8
    Width = 472
    Height = 35
    Caption = 'CALCULO DE HORAS - EMPRESA "ABC"'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object edtCodFunc: TEdit
    Left = 29
    Top = 100
    Width = 156
    Height = 27
    TabOrder = 0
  end
  object rdgDomingoFeriado: TRadioGroup
    Left = 29
    Top = 319
    Width = 168
    Height = 58
    Caption = 'Domingo ou Feriado?'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 3
  end
  object btnCalcular: TButton
    Left = 126
    Top = 400
    Width = 102
    Height = 49
    Caption = 'Calcular'
    TabOrder = 5
    OnClick = btnCalcularClick
  end
  object btnAdd: TButton
    Left = 16
    Top = 400
    Width = 100
    Height = 49
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object mmResultado: TMemo
    Left = 344
    Top = 49
    Width = 305
    Height = 328
    ReadOnly = True
    TabOrder = 7
  end
  object mskData: TMaskEdit
    Left = 29
    Top = 184
    Width = 65
    Height = 27
    EditMask = '!99/99;1;_'
    MaxLength = 5
    TabOrder = 1
    Text = '  /  '
  end
  object mskHoras: TMaskEdit
    Left = 29
    Top = 278
    Width = 65
    Height = 27
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 2
    Text = '  :  '
  end
  object btnSair: TButton
    Left = 234
    Top = 400
    Width = 102
    Height = 49
    Caption = 'Sair'
    TabOrder = 6
    OnClick = btnSairClick
  end
end
