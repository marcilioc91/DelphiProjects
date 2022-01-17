unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB;

type
  TConexao = Class
  private
    FDConn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;

    procedure ConfigurarConexao;

  public
    constructor Create;
    destructor Destroy; override;

    function GetConexao: TFDConnection;
  end;

  const
    BDados = 'D:\Documentos\Estudos\ADS\Delphi\DelphiProjects\AppFolha\DB\dados.fdb'; //caminho do BD

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FDConn := TFDConnection.Create(nil);

  ConfigurarConexao;

  inherited;
end;

destructor TConexao.Destroy;
begin
  inherited Destroy;
end;

procedure TConexao.ConfigurarConexao;
begin
  FDConn.Params.Database := BDados;
  FDConn.Params.DriverID := 'FB';
  FDConn.Params.UserName := 'SYSDBA';
  FDConn.Params.Password := 'masterkey';
  FDConn.LoginPrompt     := False;
end;

function TConexao.GetConexao: TFDConnection;
begin
  Result := FDConn;
end;

end.

