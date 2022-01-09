unit uProdutoDAO;

interface

uses System.Generics.Collections, uProduto;

type
  TProdutoDAO = class
    private
      produtoList: TObjectList<TProduto>;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Adicionar(produto: TProduto);
      function Listar: TObjectList<TProduto>;
  end;

implementation

{ TProdutoDAO }

constructor TProdutoDAO.Create;
begin
  inherited;
  produtoList := TObjectList<TProduto>.Create;
end;

procedure TProdutoDAO.Adicionar(produto: TProduto);
begin
  produtoList.Add(produto);
end;

destructor TProdutoDAO.Destroy;
begin
  produtoList.Free;
  inherited Destroy;
end;

function TProdutoDAO.Listar: TObjectList<TProduto>;
begin
  Result := produtoList;
end;

end.
