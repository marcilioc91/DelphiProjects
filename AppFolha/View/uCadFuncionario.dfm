inherited FrmFuncionario: TFrmFuncionario
  Caption = 'FrmFuncionario'
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbsLista: TTabSheet
      inherited pnlToolBar: TPanel
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
      inherited DBGrid1: TDBGrid
        OnDblClick = DBGrid1DblClick
      end
      inherited Panel1: TPanel
        inherited btnBuscar: TButton
          OnClick = btnBuscarClick
        end
      end
    end
    inherited tbsDados: TTabSheet
      object Label1: TLabel
        Left = 15
        Top = 54
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label2: TLabel
        Left = 15
        Top = 102
        Width = 33
        Height = 13
        Caption = 'Cargo:'
      end
      object Label3: TLabel
        Left = 15
        Top = 149
        Width = 32
        Height = 13
        Caption = 'E-mail:'
      end
      object Label4: TLabel
        Left = 176
        Top = 196
        Width = 43
        Height = 13
        Caption = 'Contato:'
      end
      object Label5: TLabel
        Left = 15
        Top = 197
        Width = 100
        Height = 13
        Caption = 'Data de Nascimento:'
      end
      object spbCodFuncionario: TSpeedButton
        Left = 70
        Top = 25
        Width = 23
        Height = 21
        Caption = '...'
        OnClick = spbCodFuncionarioClick
      end
      object Label6: TLabel
        Left = 15
        Top = 10
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object spbCodCargo: TSpeedButton
        Left = 70
        Top = 117
        Width = 23
        Height = 21
        Caption = '...'
        OnClick = spbCodCargoClick
      end
      object edtNome: TEdit
        Left = 15
        Top = 69
        Width = 250
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object mskContato: TMaskEdit
        Left = 176
        Top = 211
        Width = 89
        Height = 21
        EditMask = '!\(99\)00000-0000;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '(  )     -    '
      end
      object mskDtNasc: TMaskEdit
        Left = 15
        Top = 212
        Width = 89
        Height = 21
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 5
        Text = '  /  /    '
      end
      object edtCodCargo: TEdit
        Left = 15
        Top = 117
        Width = 55
        Height = 21
        TabOrder = 2
      end
      object edtEmail: TEdit
        Left = 15
        Top = 164
        Width = 250
        Height = 21
        CharCase = ecLowerCase
        TabOrder = 4
      end
      object rdgAtivo: TRadioGroup
        Left = 15
        Top = 245
        Width = 169
        Height = 50
        Caption = 'Situa'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Inativo'
          'Ativo')
        TabOrder = 7
      end
      object edtCodigo: TEdit
        Left = 15
        Top = 25
        Width = 55
        Height = 21
        TabOrder = 0
      end
      object edtCargo: TEdit
        Left = 99
        Top = 117
        Width = 166
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 3
      end
      object pgcSalario: TPageControl
        Left = 285
        Top = 10
        Width = 305
        Height = 312
        ActivePage = tsSalario
        TabOrder = 8
        object tsSalario: TTabSheet
          Caption = 'Salario'
          object pnlGridSalario: TPanel
            Left = 0
            Top = 0
            Width = 216
            Height = 284
            Align = alClient
            BevelKind = bkSoft
            TabOrder = 0
            object pnlEdtSalario: TPanel
              Left = 1
              Top = 1
              Width = 210
              Height = 35
              Align = alTop
              BevelKind = bkSoft
              TabOrder = 0
              object mskDataSalario: TMaskEdit
                Left = 5
                Top = 5
                Width = 85
                Height = 21
                EditMask = '!99/99/0000;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                TabOrder = 0
                Text = '  /  /    '
              end
              object edtSalario: TEdit
                Left = 100
                Top = 5
                Width = 100
                Height = 21
                TabOrder = 1
              end
            end
            object dbgSalario: TDBGrid
              Left = 1
              Top = 36
              Width = 210
              Height = 218
              Align = alClient
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object dbnSalario: TDBNavigator
              Left = 1
              Top = 254
              Width = 210
              Height = 25
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Align = alBottom
              TabOrder = 2
            end
          end
          object pnlBtnSalario: TPanel
            Left = 216
            Top = 0
            Width = 81
            Height = 284
            Align = alRight
            BevelKind = bkSoft
            TabOrder = 1
            object btnNovoSal: TButton
              Left = 5
              Top = 4
              Width = 65
              Height = 25
              Caption = 'Novo'
              Enabled = False
              TabOrder = 0
              OnClick = btnNovoSalClick
            end
            object btnEditarSal: TButton
              Left = 5
              Top = 35
              Width = 65
              Height = 25
              Caption = 'Editar'
              Enabled = False
              TabOrder = 1
              OnClick = btnNovoSalClick
            end
            object btnSalvarSal: TButton
              Left = 5
              Top = 66
              Width = 65
              Height = 25
              Caption = 'Salvar'
              Enabled = False
              TabOrder = 2
              OnClick = btnSalvarSalClick
            end
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    inherited btnNovo: TBitBtn
      OnClick = btnNovoClick
    end
    inherited btnEditar: TBitBtn
      OnClick = btnEditarClick
    end
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
    inherited btnCancelar: TBitBtn
      OnClick = btnCancelarClick
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
end
