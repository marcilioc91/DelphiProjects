unit uEvento;

interface

type
  TEvento = Class
    private
      FCodigo: Integer;
      FDescricao: String;
      FTipo: String;

    public
      constructor Create;
      destructor Destroy; override;

      property codigo: Integer read FCodigo write FCodigo;
      property descricao: String read FDescricao write FDescricao;
      property tipo: String read FTipo write FTipo;
  end;

implementation

{ TEvento }

constructor TEvento.Create;
begin
  inherited;
end;

destructor TEvento.Destroy;
begin
  inherited Destroy;
end;

end.
