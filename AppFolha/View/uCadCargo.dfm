inherited FrmCargo: TFrmCargo
  Caption = 'Cadastro de Cargos'
  ClientHeight = 361
  ClientWidth = 664
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 680
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 579
    Height = 361
    inherited tbsLista: TTabSheet
      ExplicitWidth = 571
      ExplicitHeight = 333
      inherited pnlToolBar: TPanel
        Top = 292
        Width = 571
        inherited lblTotalRegistros: TLabel
          Left = 480
        end
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 571
        Height = 251
        OnDblClick = DBGrid1DblClick
      end
      inherited Panel1: TPanel
        Width = 571
        inherited btnBuscar: TButton
          OnClick = btnBuscarClick
        end
      end
    end
    inherited tbsDados: TTabSheet
      ExplicitWidth = 571
      ExplicitHeight = 333
      object SpeedButton1: TSpeedButton
        Left = 71
        Top = 32
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 16
        Top = 13
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 33
        Height = 13
        Caption = 'Cargo:'
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 32
        Width = 57
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object edtCargo: TEdit
        Left = 16
        Top = 83
        Width = 273
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
  end
  inherited Panel2: TPanel
    Left = 579
    Height = 361
    inherited btnNovo: TBitBtn
      OnClick = btnNovoClick
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
end
