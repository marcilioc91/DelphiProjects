unit uFuncionario;

interface

type
  TFuncionario = Class
    private
      FCodigo: Integer;
      FNome: String;
      FDataNascimento: TDateTime;
      FCargo: String;
      FContato: String;
      FEmail: String;
      FAtivo: Boolean;
    public
      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  inherited;
end;

destructor TFuncionario.Destroy;
begin

  inherited Destroy;
end;

end.
