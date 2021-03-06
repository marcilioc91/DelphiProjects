unit uProdutoController;

interface

uses System.Generics.Collections, uProduto, uProdutoDAO;

type
  TProdutoController = class
    private
      FProdutoDAO: TProdutoDAO;
    public
      constructor Create;
      destructor Destroy;

      procedure Adicionar(produto: TProduto);
      function Listar: TObjectList<TProduto>;
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create;
begin
  FProdutoDAO := TProdutoDAO.Create;

  inherited;
end;

procedure TProdutoController.Adicionar(produto: TProduto);
begin
  FProdutoDAO.Adicionar(produto);
end;

function TProdutoController.Listar: TObjectList<TProduto>;
begin
  Result := FProdutoDAO.Listar;
end;

destructor TProdutoController.Destroy;
begin
  inherited Destroy;
end;

end.
