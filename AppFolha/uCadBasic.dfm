object FrmBasic: TFrmBasic
  Left = 0
  Top = 0
  Caption = 'FormBasic'
  ClientHeight = 353
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 601
    Height = 353
    ActivePage = tbsLista
    Align = alClient
    TabOrder = 0
    object tbsLista: TTabSheet
      Caption = 'Lista'
      object pnlToolBar: TPanel
        Left = 0
        Top = 284
        Width = 593
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 502
          Top = 2
          Width = 89
          Height = 37
          Align = alRight
          Alignment = taRightJustify
          Caption = 'Registro N de NNN'
          Layout = tlCenter
          ExplicitHeight = 13
        end
        object DBNavigator1: TDBNavigator
          Left = 2
          Top = 2
          Width = 176
          Height = 37
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alLeft
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 593
        Height = 284
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tbsDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
    end
  end
  object Panel2: TPanel
    Left = 601
    Top = 0
    Width = 85
    Height = 353
    Align = alRight
    TabOrder = 1
    object btnSair: TBitBtn
      Left = 5
      Top = 320
      Width = 75
      Height = 25
      Caption = '&Sair'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnNovo: TBitBtn
      Left = 5
      Top = 20
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 1
    end
    object btnEditar: TBitBtn
      Left = 5
      Top = 50
      Width = 75
      Height = 25
      Caption = '&Editar'
      TabOrder = 2
    end
    object btnExcluir: TBitBtn
      Left = 5
      Top = 80
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnCancelar: TBitBtn
      Left = 5
      Top = 140
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 4
    end
    object btnSalvar: TBitBtn
      Left = 5
      Top = 110
      Width = 75
      Height = 25
      Caption = '&Salvar'
      TabOrder = 5
    end
  end
end
