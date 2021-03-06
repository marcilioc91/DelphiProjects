unit uHSalarioController;

interface

uses System.Generics.Collections, System.SysUtils,
     FireDAC.Comp.Client,
     uHSalario, uHSalarioDAO;

type
  THSalarioController = class
  private
    FHSalarioDAO: THSalarioDAO;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Incluir(HSalario: THSalario);
    procedure Alterar(HSalario: THSalario);
    function ListarTodosQry: TFDQuery;
  end;

implementation

{ THSalarioController }

constructor THSalarioController.Create;
begin
  FHSalarioDAO := THSalarioDAO.Create;
end;

procedure THSalarioController.Incluir(HSalario: THSalario);
begin
  //if (HSalario.data = StrtoDateTime(' / / ')) or (HSalario.salario > 0) then
  if (HSalario.salario > 0) then
    FHSalarioDAO.Incluir(HSalario)
  else
    raise Exception.Create('Data vazia ou Salario n?o pode ser menor ou igual a zero');
end;

procedure THSalarioController.Alterar(HSalario: THSalario);
begin
  if (HSalario.data <> StrtoDateTime(' / / ')) or (HSalario.salario > 0) then
    FHSalarioDAO.Alterar(HSalario)
  else
    raise Exception.Create('Data vazia ou Salario n?o pode ser menor ou igual a zero');
end;

function THSalarioController.ListarTodosQry: TFDQuery;
begin
  Result := FHSalarioDAO.ListarTodosQry;
end;

destructor THSalarioController.Destroy;
begin
  inherited Destroy;
end;

end.
