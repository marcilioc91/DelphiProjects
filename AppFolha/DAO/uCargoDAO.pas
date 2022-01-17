unit uCargoDAO;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  Data.DB,

  uConexao, uCargo;

type
  TCargoDAO = class
    private
      FConexao: TConexao;
      FDQryCargo: TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Incluir(descricao: String);
      procedure Alterar(cargo: TCargo);
      procedure Excluir(codCargo: Integer);
      function Buscar(codCargo: Integer): String;
      function ListarTodosQry(descricao: String): TFDQuery;
  end;

implementation

{ TCargoDAO }

constructor TCargoDAO.Create;
begin
  FConexao := TConexao.Create;

  FDQryCargo := TFDQuery.Create(nil);
  FDQryCargo.Connection := FConexao.GetConexao;
end;

procedure TCargoDAO.Incluir(descricao: String);
begin
  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('INSERT INTO cargo (nome)');
    FDQryCargo.SQL.Add('  VALUES (:descCargoParam)');
    FDQryCargo.ParamByName('descCargoParam').AsString := descricao;
    FDQryCargo.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao incluir o cargo. ' + E.Message);
  end;
end;

procedure TCargoDAO.Alterar(cargo: TCargo);
begin
  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('UPDATE cargo ');
    FDQryCargo.SQL.Add('   SET nome = :descCargoParam');
    FDQryCargo.SQL.Add(' WHERE codigo    = :codigoCargo');
    FDQryCargo.ParamByName('codigoCargo').ASInteger   := cargo.codigo;
    FDQryCargo.ParamByName('descCargoParam').AsString := cargo.nome;
    FDQryCargo.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao alterar o cargo. ' + E.Message);
  end;
end;

procedure TCargoDAO.Excluir(codCargo: Integer);
begin
  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('DELETE FROM cargo ');
    FDQryCargo.SQL.Add(' WHERE codigo = :codigoCargo');
    FDQryCargo.ParamByName('codigoCargo').AsInteger := codCargo;
    FDQryCargo.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao excluir o cargo. ' + E.Message);
  end;
end;

function TCargoDAO.Buscar(codCargo: Integer): String;
begin
  Result := '';

  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('SELECT nome');
    FDQryCargo.SQL.Add('  FROM cargo');
    FDQryCargo.SQL.Add(' WHERE codigo = :codCargoParam');
    FDQryCargo.ParamByName('codCargoParam').AsInteger := codCargo;
    FDQryCargo.Open;

    Result := FDQryCargo.FieldByName('nome').AsString;
  finally
    FDQryCargo.Close;
  end;
end;

function TCargoDAO.ListarTodosQry(descricao: String): TFDQuery;
var
  codCargo: Integer;
begin
  Result := nil;

  try
    codCargo := StrToInt(descricao);
  except
    codCargo := 0;
  end;

  try
    FDQryCargo.Close;
    FDQryCargo.SQL.Clear;
    FDQryCargo.SQL.Add('SELECT codigo, nome');
    FDQryCargo.SQL.Add('  FROM cargo');
    if not (descricao.IsEmpty) then
    begin
      FDQryCargo.SQL.Add(' WHERE nome LIKE ' + QuotedStr('%'+descricao+'%'));
      FDQryCargo.SQL.Add('    OR codigo = ' + IntToStr(codCargo));
    end;
    FDQryCargo.SQL.Add(' ORDER BY codigo');
    FDQryCargo.Open;

    Result := FDQryCargo;
  finally
    FDQryCargo.Close;
  end;
end;

destructor TCargoDAO.Destroy;
begin
  inherited Destroy;
end;

end.
