unit uEventoDAO;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  Data.DB,

  uConexao, uEvento;

type
  TEventoDAO = class
    private
      FConexao: TConexao;
      FDQryEvento: TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Incluir(evento: TEvento);
      procedure Alterar(evento: TEvento);
      procedure Excluir(codEvento: Integer);
      function Buscar(codEvento: Integer): TEvento;
      function ListarTodosQry(descricao: String): TFDQuery;
  end;

implementation

{ TEventoDAO }

constructor TEventoDAO.Create;
begin
  FConexao := TConexao.Create;

  FDQryEvento := TFDQuery.Create(nil);
  FDQryEvento.Connection := FConexao.GetConexao;
end;

procedure TEventoDAO.Incluir(evento: TEvento);
begin
  try
    FDQryEvento.Close;
    FDQryEvento.SQL.Clear;
    FDQryEvento.SQL.Add('INSERT INTO Evento (descricao, tipo)');
    FDQryEvento.SQL.Add('  VALUES (:descEventoParam, :tipoEventoParam)');
    FDQryEvento.ParamByName('descEventoParam').AsString := evento.descricao;
    FDQryEvento.ParamByName('tipoEventoParam').AsString := evento.tipo;
    FDQryEvento.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao incluir o Evento. ' + E.Message);
  end;
end;

procedure TEventoDAO.Alterar(evento: TEvento);
begin
  try
    FDQryEvento.Close;
    FDQryEvento.SQL.Clear;
    FDQryEvento.SQL.Add('UPDATE Evento ');
    FDQryEvento.SQL.Add('   SET descricao = :descEventoParam');
    FDQryEvento.SQL.Add('       tipo      = :tipoEventoParam');
    FDQryEvento.SQL.Add(' WHERE codigo    = :codigoEvento');
    FDQryEvento.ParamByName('codigoEvento').ASInteger   := Evento.codigo;
    FDQryEvento.ParamByName('descEventoParam').AsString := Evento.descricao;
    FDQryEvento.ParamByName('tipoEventoParam').AsString := Evento.tipo;
    FDQryEvento.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao alterar o Evento. ' + E.Message);
  end;
end;

procedure TEventoDAO.Excluir(codEvento: Integer);
begin
  try
    FDQryEvento.Close;
    FDQryEvento.SQL.Clear;
    FDQryEvento.SQL.Add('DELETE FROM Evento ');
    FDQryEvento.SQL.Add(' WHERE codigo = :codigoEvento');
    FDQryEvento.ParamByName('codigoEvento').AsInteger := codEvento;
    FDQryEvento.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao excluir o Evento. ' + E.Message);
  end;
end;

function TEventoDAO.Buscar(codEvento: Integer): TEvento;
begin
  Result := nil;

  try
    FDQryEvento.Close;
    FDQryEvento.SQL.Clear;
    FDQryEvento.SQL.Add('SELECT descricao, tipo');
    FDQryEvento.SQL.Add('  FROM evento');
    FDQryEvento.SQL.Add(' WHERE codigo = :codEventoParam');
    FDQryEvento.ParamByName('codEventoParam').AsInteger := codEvento;
    FDQryEvento.Open;

    Result.descricao := FDQryEvento.FieldByName('nome').AsString;
    Result.tipo      := FDQryEvento.FieldByName('tipo').AsString;
  finally
    FDQryEvento.Close;
  end;
end;

function TEventoDAO.ListarTodosQry(descricao: String): TFDQuery;
var
  codEvento: Integer;
begin
  Result := nil;

  try
    codEvento := StrToInt(descricao);
  except
    codEvento := 0;
  end;

  try
    FDQryEvento.Close;
    FDQryEvento.SQL.Clear;
    FDQryEvento.SQL.Add('SELECT codigo, descricao, tipo');
    FDQryEvento.SQL.Add('  FROM Evento');
    if not (descricao.IsEmpty) then
    begin
      FDQryEvento.SQL.Add(' WHERE descricao LIKE ' + QuotedStr('%'+descricao+'%'));
      FDQryEvento.SQL.Add('    OR codigo = ' + IntToStr(codEvento));
    end;
    FDQryEvento.SQL.Add(' ORDER BY codigo');
    FDQryEvento.Open;

    Result := FDQryEvento;
  finally
    FDQryEvento.Close;
  end;
end;

destructor TEventoDAO.Destroy;
begin
  inherited Destroy;
end;

end.
