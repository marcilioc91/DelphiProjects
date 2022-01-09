unit uCargo;

interface

type
  TCargo = Class
    private
      FCodigo: Integer;
      FNome: string;
    public
      constructor Create;
      destructor Destroy; override;

      property codigo: Integer read FCodigo write FCodigo; //PROPRIEDADE DOS CAMPOS DA CLASSE PRIVADA
      property nome: String read FNome write FNome;
  end;

implementation

{ TCargo }

constructor TCargo.Create;
begin
  inherited;
end;

destructor TCargo.Destroy;
begin
  inherited Destroy;
end;

end.
