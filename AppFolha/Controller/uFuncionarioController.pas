unit uFuncionarioController;

interface

uses System.Generics.Collections, System.SysUtils,
     FireDAC.Comp.Client,

     uFuncionario, uFuncionarioDAO;

type
  TFuncionarioController = class
    private
      FFuncionarioDAO: TFuncionarioDAO;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Incluir(funcionario: TFuncionario);
      procedure Alterar(funcionario: TFuncionario);
      procedure Excluir(codFuncionario: Integer);
      function Buscar(codFuncionario: Integer): Tfuncionario;
      function ListarTodosQry(nome: String): TFDQuery;
  end;

implementation

{ TFuncionarioController }

constructor TFuncionarioController.Create;
begin
  FFuncionarioDAO := TFuncionarioDAO.Create;
end;

procedure TFuncionarioController.Incluir(funcionario: TFuncionario);
begin
  if funcionario.nome.IsEmpty then
    raise Exception.Create('Descri??o do funcionario n?o pode ser vazia')
  else
    FFuncionarioDAO.Incluir(funcionario);
end;

function TFuncionarioController.Buscar(codFuncionario: Integer): Tfuncionario;
begin
  if codFuncionario > 0 then
    Result := FFuncionarioDAO.Buscar(codFuncionario)
  else
    raise Exception.Create('C?digo informado inv?lido!');
end;

procedure TFuncionarioController.Alterar(funcionario: TFuncionario);
begin
  if (funcionario.codigo > 0) and (funcionario.nome <> '') then
    FfuncionarioDAO.Alterar(funcionario)
  else
    raise Exception.Create('C?digo informado inv?lido!');
end;

procedure TFuncionarioController.Excluir(codFuncionario: Integer);
begin
  if codFuncionario > 0 then
    FFuncionarioDAO.Excluir(codFuncionario)
  else
    raise Exception.Create('C?digo informado inv?lido!');
end;

function TFuncionarioController.ListarTodosQry(nome: String): TFDQuery;
begin
  Result := FFuncionarioDAO.ListarTodosQry(nome);
end;

destructor TFuncionarioController.Destroy;
begin

  inherited Destroy;
end;

end.
