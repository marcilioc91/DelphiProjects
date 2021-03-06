unit uHSalarioDAO;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  Data.DB,

  uConexao, uHSalario;

type
  THSalarioDAO = class
    private
      FConexao: TConexao;
      FDQryHSalario: TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Incluir(HSalario: THSalario);
      procedure Alterar(HSalario: THSalario);
      function ListarTodosQry: TFDQuery;
  end;

implementation

{ THSalarioDAO }

constructor THSalarioDAO.Create;
begin
  FConexao := TConexao.Create;

  FDQryHSalario := TFDQuery.Create(nil);
  FDQryHSalario.Connection := FConexao.GetConexao;
end;

procedure THSalarioDAO.Incluir(HSalario: THSalario);
begin
  try
    FDQryHSalario.Close;
    FDQryHSalario.SQL.Clear;
    FDQryHSalario.SQL.Add('INSERT INTO H_Salario (data, salario, funcionario)');
    FDQryHSalario.SQL.Add('  VALUES (:data, :salario, :codFunc)');
    FDQryHSalario.ParamByName('data').AsDate     := HSalario.data;
    FDQryHSalario.ParamByName('salario').AsCurrency := HSalario.salario;
    FDQryHSalario.ParamByName('codFunc').AsInteger  := HSalario.codFuncionario;
    FDQryHSalario.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao incluir o Salario. ' + E.Message);
  end;
end;

procedure THSalarioDAO.Alterar(HSalario: THSalario);
begin
  try
    FDQryHSalario.Close;
    FDQryHSalario.SQL.Clear;
    FDQryHSalario.SQL.Add('UPDATE H_Salario ');
    FDQryHSalario.SQL.Add('   SET data        = :dataSal, ');
    FDQryHSalario.SQL.Add('       funcionario = :codFunc, ');
    FDQryHSalario.SQL.Add('       salario     = :salario');
    FDQryHSalario.SQL.Add(' WHERE codigo    = :codigoHSalario');
    FDQryHSalario.ParamByName('dataSal').AsDate           := HSalario.data;
    FDQryHSalario.ParamByName('codFunc').AsInteger        := HSalario.codFuncionario;
    FDQryHSalario.ParamByName('salario').AsCurrency       := HSalario.salario;
    FDQryHSalario.ParamByName('codigoHSalario').AsInteger := HSalario.codigo;
    FDQryHSalario.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao alterar o HSalario. ' + E.Message);
  end;
end;

function THSalarioDAO.ListarTodosQry: TFDQuery;
var
  codHSalario: Integer;
begin
  Result := nil;

  try
    FDQryHSalario.Close;
    FDQryHSalario.SQL.Clear;
    FDQryHSalario.SQL.Add('SELECT data, salario, codigo');
    FDQryHSalario.SQL.Add('  FROM H_Salario');
    FDQryHSalario.SQL.Add(' ORDER BY data DESC');
    FDQryHSalario.Open;

    Result := FDQryHSalario;
  finally
    FDQryHSalario.Close;
  end;
end;

destructor THSalarioDAO.Destroy;
begin
  inherited Destroy;
end;

end.
