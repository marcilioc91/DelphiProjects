unit uProduto;

interface

type
  TProduto = class
    private
      FCodigo: Integer;
      FQtde: Integer;
      FValor: Currency;
    public
      constructor Create;
      destructor Destroy; override;

      property codigo: Integer read FCodigo write FCodigo;
      property qtde: Integer read FQtde write FQtde;
      property valor: Currency read FValor write FValor;
  end;

implementation

{ TProduto }

{ TProduto }

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

  inherited;
end;

end.
