inherited FrmEvento: TFrmEvento
  Caption = 'FrmEvento'
  ClientWidth = 680
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 595
    ActivePage = tbsDados
    ExplicitWidth = 595
    inherited tbsLista: TTabSheet
      ExplicitWidth = 587
      inherited pnlToolBar: TPanel
        Width = 587
        ExplicitWidth = 587
        inherited lblTotalRegistros: TLabel
          Left = 455
          ExplicitLeft = 496
        end
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 587
      end
      inherited Panel1: TPanel
        Width = 587
        ExplicitWidth = 587
      end
    end
    inherited tbsDados: TTabSheet
      ExplicitWidth = 587
      object Label2: TLabel
        Left = 15
        Top = 10
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object SpeedButton1: TSpeedButton
        Left = 70
        Top = 30
        Width = 23
        Height = 21
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object Label3: TLabel
        Left = 15
        Top = 65
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object edtCodigo: TEdit
        Left = 15
        Top = 30
        Width = 55
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 15
        Top = 85
        Width = 250
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object rdgTipo: TRadioGroup
        Left = 15
        Top = 120
        Width = 250
        Height = 45
        Caption = 'Tipo:'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Desconto'
          'Acr'#233'scimo')
        TabOrder = 2
      end
    end
  end
  inherited Panel2: TPanel
    Left = 595
    ExplicitLeft = 595
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
end
