object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmPrincipal'
  ClientHeight = 341
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 72
    Top = 56
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object Cargos1: TMenuItem
        Caption = '&Cargos'
        OnClick = Cargos1Click
      end
      object Eventos1: TMenuItem
        Caption = '&Eventos'
        OnClick = Eventos1Click
      end
      object Funcionarios1: TMenuItem
        Caption = '&Funcion'#225'rios'
        OnClick = Funcionarios1Click
      end
      object Eventos2: TMenuItem
        Caption = '-'
      end
      object TabeladeINSS1: TMenuItem
        Caption = 'Tabela de &INSS'
      end
      object TabeladeIRRF1: TMenuItem
        Caption = 'Tabela de I&RRF'
      end
      object N1: TMenuItem
        Caption = '-'
      end
    end
    object Processos1: TMenuItem
      Caption = '&Processos'
      object MudancaDeSalario1: TMenuItem
        Caption = '&Mudan'#231'a de sal'#225'rio(s)'
      end
      object Lancareventoparafuncionarios1: TMenuItem
        Caption = '&Lan'#231'ar evento para funcion'#225'rio(s)'
      end
      object FolhadePagamento1: TMenuItem
        Caption = '&Folha de Pagamento'
      end
    end
    object Relatorios1: TMenuItem
      Caption = '&Relat'#243'rios'
      object Folhadepagamento2: TMenuItem
        Caption = '&Folha de pagamento'
      end
      object Folhadepagamento3: TMenuItem
        Caption = '&Funcion'#225'rios'
      end
    end
    object Sair2: TMenuItem
      Caption = '&Sair'
      OnClick = Sair2Click
    end
  end
end
