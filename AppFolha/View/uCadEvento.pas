unit uCadEvento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBasic, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uConexao;

type
  TAcao = (Incluir, Alterar);

type
  TFrmEvento = class(TFrmBasic)
    Label2: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    edtDescricao: TEdit;
    rdgTipo: TRadioGroup;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    acao: TAcao;
    FConexao: TConexao;
    FDQryEvento: TFDQuery;
    dsEvento: TDataSource;
  public
    { Public declarations }
  end;

var
  FrmEvento: TFrmEvento;

implementation

{$R *.dfm}

uses uEvento, uEventoController;

procedure TFrmEvento.btnCancelarClick(Sender: TObject);
begin
  inherited;

  edtCodigo.Text    := FDQryEvento.FieldByName('codigo').AsString;
  edtDescricao.Text := FDQryEvento.FieldByName('descricao').AsString;
  rdgTipo.ItemIndex := FDQryEvento.FieldByName('tipo').AsInteger;
end;

procedure TFrmEvento.btnEditarClick(Sender: TObject);
begin
  inherited;
  acao := Alterar;

  PageControl1.ActivePage := tbsDados;

  edtDescricao.SetFocus;
end;

procedure TFrmEvento.btnExcluirClick(Sender: TObject);
var
  cEvento: TEventoController;
begin
  inherited;

  try
    cEvento := TeventoController.Create;

    if MessageDlg('Deseja excluir o evento: ' + edtDescricao.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      cEvento.Excluir(StrToInt(edtCodigo.Text));
  finally
    cEvento.DisposeOf;
  end;
end;

procedure TFrmEvento.btnNovoClick(Sender: TObject);
begin
  inherited;
  acao := Incluir;

  PageControl1.ActivePage := tbsDados;

  edtCodigo.Clear;
  edtDescricao.Clear;
  rdgTipo.ItemIndex := 0;

  edtCodigo.SetFocus;
end;

procedure TFrmEvento.btnSalvarClick(Sender: TObject);
var
  evento:  TEvento;
  cEvento: TEventoController;
begin
  inherited;
  try
    evento := TEvento.Create;

    evento.codigo     := StrToInt(edtCodigo.Text);
    evento.descricao  := edtDescricao.Text;
    evento.tipo       := IntToStr(rdgTipo.ItemIndex);

    cEvento := TEventoController.Create;

    if acao = Incluir then
      cEvento.Incluir(evento)
    else
      cEvento.Alterar(evento);

    ShowMessage('Dados salvo com sucesso.');
  finally
    evento.DisposeOf;
    cEvento.DisposeOf;
  end;
end;

procedure TFrmEvento.FormCreate(Sender: TObject);
begin
  inherited;

  FDQryEvento := TFDQuery.Create(nil);
  dsEvento    := TDataSource.Create(nil);

  dsEvento.DataSet        := FDQryEvento;
  DBGrid1.DataSource      := dsEvento;
  DBNavigator1.DataSource := dsEvento;

end;

procedure TFrmEvento.SpeedButton1Click(Sender: TObject);
var
  evento:  TEvento;
  cEvento: TEventoController;
begin
  inherited;

  try
    evento  := TEvento.Create;
    cEvento := TEventoController.Create;

    evento := cEvento.Buscar(StrToInt(edtCodigo.Text));

    edtCodigo.Text    := IntToStr(evento.codigo);
    edtDescricao.Text := evento.descricao;
    rdgTipo.ItemIndex := StrToInt(evento.tipo);
  finally
    evento.DisposeOf;
    cEvento.DisposeOf;
  end;
end;

end.
