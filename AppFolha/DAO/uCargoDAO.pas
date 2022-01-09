unit uCargoDAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  System.Generics.Collections,

  uConexao, uCargo;

type
  TCargoDAO = Class
    private
      FConexao: TConexao;
      FDQryCargo: TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      function Buscar(codCargo: Integer): String;
      function ListarTodos: TObjectList<TCargo>;
  end;

implementation

{ TCargoDAO }

constructor TCargoDAO.Create;
begin
  FConexao := TConexao.Create;
end;

function TCargoDAO.Buscar(codCargo: Integer): String;
begin
  Result := '';

  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('SELECT nome');
    FDQryCargo.SQL.Add('  FROM cargo');
    FDQryCargo.SQL.Add(' WHERE codigo = :codigo');
    FDQryCargo.ParamByName('codigo').AsInteger := codCargo;
    FDQryCargo.Open;

    Result := FDQryCargo.FieldByName('nome').AsString;
  finally
    FDQryCargo.Close;
  end;
end;

function TCargoDAO.ListarTodos: TObjectList<TCargo>;
var
  cargo: TCargo;
begin
  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('SELECT codigo, nome');
    FDQryCargo.SQL.Add('  FROM cargo');
    FDQryCargo.SQL.Add(' ORDER BY nome');
    FDQryCargo.Open;

    if (FDQryCargo.RecordCount > 0) then
    begin
      FDQryCargo.First;

      while not FDQryCargo.Eof do
      begin
        cargo := TCargo.Create;

        cargo.codigo := FDQryCargo.FieldByName('codigo').AsInteger;
        cargo.nome   := FDQryCargo.FieldByName('nome').AsString;

        Result.Add(cargo);

        cargo.DisposeOf;

        FDQryCargo.Next;
      end;
    end;
  finally
    if Assigned(cargo) then //se o objeto está instanciado na memória
      cargo.DisposeOf;

    FDQryCargo.Close;
  end;
end;

destructor TCargoDAO.Destroy;
begin
  inherited Destroy;
end;

end.
