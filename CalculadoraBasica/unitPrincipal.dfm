object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 415
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
    Top = 29
    Width = 33
    Height = 13
    Caption = 'Valor 1'
  end
  object Label2: TLabel
    Left = 48
    Top = 99
    Width = 33
    Height = 13
    Caption = 'Valor 2'
  end
  object Label3: TLabel
    Left = 48
    Top = 227
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object edtValor1: TEdit
    Left = 48
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtValor2: TEdit
    Left = 48
    Top = 118
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object rdgOp: TRadioGroup
    Left = 200
    Top = 48
    Width = 185
    Height = 211
    Caption = 'Informe a opera'#231#227'o'
    ItemIndex = 0
    Items.Strings = (
      '+ Somar'
      '- Subtrair'
      '/ Dividir'
      '* Multiplicar'
      '% Resto da divis'#227'o')
    TabOrder = 2
  end
  object edtResultado: TEdit
    Left = 48
    Top = 246
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object btnResultado: TButton
    Left = 48
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 4
    OnClick = btnResultadoClick
  end
end
