unit uCadCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBasic, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uConexao;

type
  TFrmCargo = class(TFrmBasic)
    edtCodigo: TEdit;
    edtCargo: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    FConexao: TConexao;
    FDQryCargo: TFDQuery;
    dsCargo: TDataSource;
  public
    { Public declarations }
  end;

var
  FrmCargo: TFrmCargo;

implementation

{$R *.dfm}

uses uCargoController;

procedure TFrmCargo.btnBuscarClick(Sender: TObject);
var
  cCargo: TCargoController;
begin
  inherited;

  cCargo := TCargoController.Create;

  FDQryCargo.Close;
  FDQryCargo := cCargo.ListarTodosQry(edtBuscar.Text);
  FDQryCargo.Open;

  dsCargo.DataSet := FDQryCargo;

  lblTotalRegistros.Caption := 'Total de registros: ' + IntToStr(FDQryCargo.RecordCount) + '  ';
end;

procedure TFrmCargo.btnNovoClick(Sender: TObject);
begin
  inherited;

  edtCodigo.Clear;
  edtCargo.Clear;

  edtCodigo.SetFocus;
end;

procedure TFrmCargo.btnSalvarClick(Sender: TObject);
var
  cCargo: TCargoController;
begin
  inherited;
  try
    cCargo := TCargoController.Create;
    cCargo.Incluir(edtCargo.Text);
    ShowMessage('Dados salvo com sucesso.');
  finally
    cCargo.DisposeOf;
  end;
end;

procedure TFrmCargo.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  if not FDQryCargo.IsEmpty then
  begin
    edtCodigo.Text := FDQryCargo.FieldByName('codigo').AsString;
    edtCargo.Text  := FDQryCargo.FieldByName('nome').AsString;

    PageControl1.ActivePage := tbsDados;
  end;
end;

procedure TFrmCargo.FormCreate(Sender: TObject);
begin
  inherited;
  FDQryCargo := TFDQuery.Create(nil);
  dsCargo    := TDataSource.Create(nil);

  dsCargo.DataSet := FDQryCargo;
  DBGrid1.DataSource := dsCargo;
end;

procedure TFrmCargo.FormDestroy(Sender: TObject);
begin
  inherited;
  FDQryCargo.DisposeOf;
  dsCargo.DisposeOf;
end;

procedure TFrmCargo.SpeedButton1Click(Sender: TObject);
var
  cCargo: TCargoController;
begin
  inherited;
  cCargo := TCargoController.Create;
  edtCargo.Text := cCargo.Buscar(StrToInt(edtCodigo.Text));
  cCargo.DisposeOf;
end;

end.

