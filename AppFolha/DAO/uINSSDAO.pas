unit uInssDAO;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  Data.DB,

  uConexao, uINSS;

type
  TInssDAO = class
    private
      FConexao: TConexao;
      FDQryINSS: TFDQuery;
    public
      procedure Incluir(inss: TINSS);
      procedure Alterar(inss: TINSS);
      procedure Excluir(data: TDateTime);
      function Buscar(salario: Double): TINSS;
      function ListarTodosQry(data: String): TFDQuery;
      function Calc(salario: Currency): Currency;
    end;

implementation

{ TINSS }

function TInssDAO.Calc(salario: Currency): Currency;
begin
  Result := 0;

  if salario <= 0 then
    raise Exception.Create('Sal?rio deve ser maior que zero.');

  Buscar(salario);

  FDQryINSS.First;
  while not FDQryINSS.Eof do
  begin
    if salario <= FDQryINSS.FieldByName('maximo').AsCurrency then
    begin
      Result := Salario * 0.075;
      Break;
    end
    else if salario <= FDQryINSS.FieldByName('maximo').AsCurrency then
    begin
      Result := salario * 0.09;
      Break;
    end
    else if salario <= FDQryINSS.FieldByName('maximo').AsCurrency then
    begin
      Result := salario * 0.12;
      Break;
    end
    else if salario <= FDQryINSS.FieldByName('maximo').AsCurrency then
    begin
      Result := salario * 0.14;
      Break;
    end
    else
    begin
      Result := FDQryINSS.FieldByName('maximo').AsCurrency * 0.14;
      Break;
    end;
    FDQryINSS.Next;
  end;
end;

procedure TInssDAO.Incluir(inss: TINSS);
begin
  try
    FDQryINSS.Close;
    FDQryINSS.SQL.Clear;
    FDQryINSS.SQL.Add('INSERT INTO inss (data, aliquota, minimo, maximo)');
    FDQryINSS.SQL.Add('  VALUES (:data, :aliquota, :minimo, :maximo)');
    FDQryINSS.ParamByName('data').AsDate         := inss.data;
    FDQryINSS.ParamByName('aliquota').AsCurrency := inss.aliquota;
    FDQryINSS.ParamByName('minimo').AsCurrency   := inss.minimo;
    FDQryINSS.ParamByName('maximo').AsCurrency   := inss.maximo;
    FDQryINSS.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao incluir o INSS. ' + E.Message);
  end;
end;

procedure TInssDAO.Alterar(inss: TINSS);
begin
  //TODO: Fazer altera??o do INSS
end;

function TInssDAO.Buscar(salario: Double): TINSS;
begin
  Result := nil;

  try
    FDQryINSS.Close;
    FDQryINSS.SQL.Clear;
    FDQryINSS.SQL.Add('SELECT i.data, i.aliquota, i.minimo, i.maximo');
    FDQryINSS.SQL.Add('  FROM INSS i');
    FDQryINSS.SQL.Add(' WHERE i.data = (SELECT MAX(data) AS data FROM iNSS');
    {
    if (salario > 0) then
    begin
      FDQryINSS.SQL.Add('   AND :salario BETWEEN i.minino AND i.maximo');
      FDQryINSS.ParamByName('salario').AsCurrency := salario;
    end;
    }
    FDQryINSS.SQL.Add(' ORDER BY i.aliquota');
    FDQryINSS.Open;

    Result.data     := FDQryINSS.FieldByName('nome').AsDateTime;
    Result.aliquota := FDQryINSS.FieldByName('aliquota').AsCurrency;
    Result.minimo   := FDQryINSS.FieldByName('minimo').AsCurrency;
    Result.maximo   := FDQryINSS.FieldByName('maximo').AsCurrency;
  finally
    FDQryINSS.Close;
  end;
end;

procedure TInssDAO.Excluir(data: TDateTime);
begin
  //TODO: Fazer exclus?o do INSS
end;

function TInssDAO.ListarTodosQry(data: String): TFDQuery;
begin
  //TODO: Fazer listagem de todos os INSS
end;

end.
