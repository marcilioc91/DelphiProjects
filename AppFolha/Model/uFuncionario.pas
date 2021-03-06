unit uFuncionario;

interface

uses uCargo, uHSalario;

type
  TFuncionario = Class
    private
      FCodigo: Integer;
      FNome: String;
      FDataNascimento: TDateTime;
      FCargo: TCargo;
      FContato: String;
      FEmail: String;
      FAtivo: Integer;
      FHSalario: THSalario;
    public
      constructor Create;
      destructor Destroy; override;

      property codigo: Integer read FCodigo write FCodigo;
      property nome: String read FNome write FNome;
      property dataNascimento: TDateTime read FDataNascimento write FDataNascimento;
      property cargo: TCargo read FCargo write FCargo;
      property contato: String read FContato write FContato;
      property email: String read FEmail write FEmail;
      property ativo: Integer read FAtivo write FAtivo;
      property hSalario: THSalario read FHSalario write FHSalario;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FCargo    := TCargo.Create;
  FHSalario := THSalario.Create;

  inherited;
end;

destructor TFuncionario.Destroy;
begin
  inherited Destroy;
end;

end.
