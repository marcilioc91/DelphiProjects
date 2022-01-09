unit uCadBasic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmBasic = class(TForm)
    PageControl1: TPageControl;
    tbsLista: TTabSheet;
    tbsDados: TTabSheet;
    pnlToolBar: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBasic: TFrmBasic;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmBasic.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    ShowMessage('botão YES pressionado');
end;

end.
