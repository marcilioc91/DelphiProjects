inherited FrmEvento: TFrmEvento
  Caption = 'FrmEvento'
  ClientWidth = 680
  Position = poScreenCenter
  ExplicitWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 595
    inherited tbsLista: TTabSheet
      ExplicitWidth = 587
      inherited pnlToolBar: TPanel
        Width = 587
        inherited lblTotalRegistros: TLabel
          Left = 496
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
      end
    end
    inherited tbsDados: TTabSheet
      ExplicitWidth = 587
    end
  end
  inherited Panel2: TPanel
    Left = 595
  end
end
