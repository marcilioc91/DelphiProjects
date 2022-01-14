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
    function Buscar(codCargo: Integer): String;
    function ListarTodos: TObjectList<TCargo>;
    function ListarTodosQry(descricao: String): TFDQuery;
  end;

implementation

{ TCargoController }

constructor TCargoController.Create;
begin
  FCargoDAO := TCargoDAO.Create;
end;

destructor TCargoController.Destroy;
begin
  inherited;
end;

procedure TCargoController.Incluir(descricao: String);
begin
  if descricao.IsEmpty then
    raise Exception.Create('Descri��o do cargo n�o pode ser vazia')
  else
    FCargoDAO.Incluir(descricao);
end;

function TCargoController.Buscar(codCargo: Integer): String;
begin
  if codCargo > 0 then
    Result := FCargoDAO.Buscar(codCargo)
  else
    raise Exception.Create('C�digo informado inv�lido!');
end;

function TCargoController.ListarTodos: TObjectList<TCargo>;
begin
  Result := FCargoDAO.ListarTodos;
end;

function TCargoController.ListarTodosQry(descricao: String): TFDQuery;
begin
  Result := FCargoDAO.ListarTodosQry(descricao);
end;

end.
