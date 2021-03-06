unit uFuncionarioDAO;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  Data.DB,

  uConexao, uFuncionario;

type
  TFuncionarioDAO = class
  private
    FConexao: TConexao;
    FDQryFuncionario: TFDQuery;
    FDQrySalario: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Incluir(funcionario: TFuncionario);
    procedure Alterar(funcionario: TFuncionario);
    procedure Excluir(codFuncionario: Integer);
    function Buscar(codFuncionario: Integer): TFuncionario;
    function ListarTodosQry(nome: String): TFDQuery;

  end;

implementation


{ TFuncionarioDAO }

constructor TFuncionarioDAO.Create;
begin
  FConexao := TConexao.Create;

  FDQryFuncionario := TFDQuery.Create(nil);
  FDQryFuncionario.Connection := FConexao.GetConexao;

  FDQrySalario := TFDQuery.Create(nil);
  FDQrySalario.Connection := FConexao.GetConexao;
end;

procedure TFuncionarioDAO.Incluir(funcionario: TFuncionario);
begin
  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('INSERT INTO funcionario (nome, dataNascimento, cargo, contato, email, ativo)');
    FDQryFuncionario.SQL.Add('  VALUES (:nome, :dtnascimento, :cargo, :contato, :email, :ativo)');
    FDQryFuncionario.ParamByName('nome').AsString           := funcionario.nome;
    FDQryFuncionario.ParamByName('dtnascimento').AsDateTime := funcionario.dataNascimento;
    FDQryFuncionario.ParamByName('cargo').AsInteger         := funcionario.cargo.codigo;
    FDQryFuncionario.ParamByName('contato').AsString        := funcionario.contato;
    FDQryFuncionario.ParamByName('email').AsString          := funcionario.email;
    FDQryFuncionario.ParamByName('ativo').AsInteger         := funcionario.ativo;
    FDQryFuncionario.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao incluir o funcionario. ' + E.Message);
  end;
end;


procedure TFuncionarioDAO.Alterar(funcionario: TFuncionario);
begin
  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('UPDATE funcionario ');
    FDQryFuncionario.SQL.Add('   SET nome           = :nome,');
    FDQryFuncionario.SQL.Add('       dataNascimento = :dtNascimento,');
    FDQryFuncionario.SQL.Add('       cargo          = :cargo,');
    FDQryFuncionario.SQL.Add('       contato        = :contato,');
    FDQryFuncionario.SQL.Add('       email          = :email,');
    FDQryFuncionario.SQL.Add('       ativo          = :ativo');
    FDQryFuncionario.SQL.Add(' WHERE codigo = :codigo');
    FDQryFuncionario.ParamByName('codigo').AsInteger        := funcionario.codigo;
    FDQryFuncionario.ParamByName('nome').AsString           := funcionario.nome;
    FDQryFuncionario.ParamByName('dtNascimento').AsDateTime := funcionario.dataNascimento;
    FDQryFuncionario.ParamByName('cargo').AsInteger         := funcionario.cargo.codigo;
    FDQryFuncionario.ParamByName('contato').AsString        := funcionario.contato;
    FDQryFuncionario.ParamByName('email').AsString          := funcionario.email;
    FDQryFuncionario.ParamByName('ativo').AsInteger         := funcionario.ativo;
    FDQryFuncionario.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao alterar o funcionario. ' + E.Message);
  end;
end;

procedure TFuncionarioDAO.Excluir(codFuncionario: Integer);
begin
  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('DELETE FROM fucionario ');
    FDQryFuncionario.SQL.Add(' WHERE codigo = :codFunc');
    FDQryFuncionario.ParamByName('codFunc').AsInteger := codFuncionario;
    FDQryFuncionario.ExecSQL;
  except on E: Exception do
    raise exception ('Erro ao excluir o Funcionario. ' + E.Message);
  end;
end;

function TFuncionarioDAO.Buscar(codFuncionario: Integer): TFuncionario;
begin
  Result := nil;

  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;

    FDQryFuncionario.SQL.Add('SELECT f.codigo, f.nome, f.dataNascimento, f.contato, f.email, f.ativo,');
    FDQryFuncionario.SQL.Add('       c.codigo AS codCargo, c.nome AS cargo');
    FDQryFuncionario.SQL.Add('  FROM funcionario f');
    FDQryFuncionario.SQL.Add(' LEFT JOIN cargo c ON c.codigo = f.cargo');
    FDQryFuncionario.SQL.Add(' WHERE f.codigo = :codFunc');
    FDQryFuncionario.ParamByName('codFunc').AsInteger := codFuncionario;
    FDQryFuncionario.Open;

    Result.codigo            := FDQryFuncionario.FieldByName('codigo').AsInteger;
    Result.nome              := FDQryFuncionario.FieldByName('nome').AsString;
    Result.dataNascimento    := FDQryFuncionario.FieldByName('dtNascimento').AsDateTime;
    Result.cargo.codigo      := FDQryFuncionario.FieldByName('codCargo').AsInteger;
    Result.cargo.nome        := FDQryFuncionario.FieldByName('cargo').AsString;
    Result.contato           := FDQryFuncionario.FieldByName('contato').AsString;
    Result.email             := FDQryFuncionario.FieldByName('email').AsString;
    Result.ativo             := FDQryFuncionario.FieldByName('ativo').AsInteger;
  finally
    FDQryFuncionario.Close;
  end;
end;

function TFuncionarioDAO.ListarTodosQry(nome: String): TFDQuery;
var
  codFuncionario: Integer;
begin
  Result := nil;

  try
    codFuncionario := StrToInt(nome);
  except
    codfuncionario := 0;
  end;

  try
    FDQryfuncionario.Close;
    FDQryfuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('SELECT f.codigo, f.nome, f.dataNascimento, f.contato, f.email, f.ativo,');
    FDQryFuncionario.SQL.Add('       c.codigo AS codCargo, c.nome AS cargo');
    FDQryFuncionario.SQL.Add('  FROM funcionario f');
    FDQryFuncionario.SQL.Add(' LEFT JOIN cargo c ON c.codigo = f.cargo');
    if not (nome.IsEmpty) then
    begin
      FDQryfuncionario.SQL.Add(' WHERE nome LIKE ' + QuotedStr('%'+nome+'%'));
      FDQryfuncionario.SQL.Add('    OR codigo = ' + IntToStr(codfuncionario));
    end;
    FDQryfuncionario.SQL.Add(' ORDER BY f.codigo');
    FDQryfuncionario.Open;

    Result := FDQryfuncionario;
  finally
    FDQryfuncionario.Close;
  end;
end;

destructor TFuncionarioDAO.Destroy;
begin
  inherited Destroy;
end;

end.
