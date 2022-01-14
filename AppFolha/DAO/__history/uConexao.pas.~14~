unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

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
    BDados = 'D:\Documentos\Estudos\ADS\Delphi\DelphiProjects\AppFolha\DB\Folha.fbd'; //caminho do BD

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FDConn.Params.Database := BDados;
  FDConn.Params.DriverID := 'FB';
  FDConn.Params.UserName := 'SYSDBA';
  FDConn.Params.Password := 'masterkey';
  FDConn.LoginPrompt := false;
end;

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

function TConexao.GetConexao: TFDConnection;
begin
  Result := FDConn;
end;

end.
