unit uEventoController;

interface

uses System.Generics.Collections, System.SysUtils,
     FireDAC.Comp.Client,
     uEvento, uEventoDAO;

type
  TEventoController = class
  private
    FEventoDAO: TEventoDAO;
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

{ TEventoController }

{ TEventoController }

constructor TEventoController.Create;
begin
  FEventoDAO := TEventoDAO.Create;
end;

procedure TEventoController.Incluir(evento: TEvento);
begin
  if evento.descricao.IsEmpty then
    raise Exception.Create('Descri??o do evento n?o pode ser vazia')
  else
    FEventoDAO.Incluir(evento);
end;

procedure TEventoController.Alterar(evento: TEvento);
begin
  if (evento.codigo > 0) and (evento.descricao <> '') then
    FeventoDAO.Alterar(evento)
  else
    raise Exception.Create('C?digo informado inv?lido!');
end;

procedure TEventoController.Excluir(codEvento: Integer);
begin
  if codEvento > 0 then
    FEventoDAO.Excluir(codEvento)
  else
    raise Exception.Create('C?digo informado inv?lido!');
end;

function TEventoController.Buscar(codEvento: Integer): TEvento;
begin
  if codEvento > 0 then
    Result := FEventoDAO.Buscar(codEvento)
  else
    raise Exception.Create('C?digo informado inv?lido!');
end;

function TEventoController.ListarTodosQry(descricao: String): TFDQuery;
begin
  Result := FEventoDAO.ListarTodosQry(descricao);
end;

destructor TEventoController.Destroy;
begin
  inherited Destroy;
end;

end.
