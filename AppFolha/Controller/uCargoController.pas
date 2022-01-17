unit uCargoController;

interface

uses System.Generics.Collections, System.SysUtils,
     FireDAC.Comp.Client,
     uCargo, uCargoDAO;

type
  TCargoController = class
  private
    FCargoDAO: TCargoDAO;
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

{ TCargoController }

constructor TCargoController.Create;
begin
  FCargoDAO := TCargoDAO.Create;
end;

procedure TCargoController.Incluir(descricao: String);
begin
  if descricao.IsEmpty then
    raise Exception.Create('Descrição do cargo não pode ser vazia')
  else
    FCargoDAO.Incluir(descricao);
end;

procedure TCargoController.Alterar(cargo: TCargo);
begin
  if (cargo.codigo > 0) and (cargo.nome <> '') then
    FCargoDAO.Alterar(cargo)
  else
    raise Exception.Create('Código informado inválido!');
end;

procedure TCargoController.Excluir(codCargo: Integer);
begin
  if codCargo > 0 then
    FCargoDAO.Excluir(codCargo)
  else
    raise Exception.Create('Código informado inválido!');
end;

function TCargoController.Buscar(codCargo: Integer): String;
begin
  if codCargo > 0 then
    Result := FCargoDAO.Buscar(codCargo)
  else
    raise Exception.Create('Código informado inválido!');
end;


function TCargoController.ListarTodosQry(descricao: String): TFDQuery;
begin
  Result := FCargoDAO.ListarTodosQry(descricao);
end;

destructor TCargoController.Destroy;
begin
  inherited Destroy;
end;

end.
