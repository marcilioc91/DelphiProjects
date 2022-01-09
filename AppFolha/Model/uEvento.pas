unit uEvento;

interface

type
  TTipo = (Desconto, Acrescimo);

  TEvento = Class
    private
      FCodigo: Integer;
      FDescricao: String;
      FTipo: TTipo;

    public
      constructor Create;
      destructor Destroy; override;

      property codigo: Integer read FCodigo write FCodigo;
      property descricao: String read FDescricao write FDescricao;
      property tipo: TTipo read FTipo write FTipo;
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
