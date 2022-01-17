unit uHSalario;

interface
type
  THSalario = Class
    private
      FCodigo: Integer;
      FCodFuncionario: Integer;
      FData: TDate;
      FSalario: Currency;
    public
      constructor Create;
      destructor Destroy; override;

      property codigo: Integer read FCodigo write FCodigo; //PROPRIEDADE DOS CAMPOS DA CLASSE PRIVADA
      property codFuncionario: Integer read FCodFuncionario write FCodFuncionario;
      property data: TDate read FData write FData;
      property salario: Currency read FSalario write FSalario;
  end;

implementation

{ THSalario }

constructor THSalario.Create;
begin
  inherited;
end;

destructor THSalario.Destroy;
begin
  inherited Destroy;
end;

end.
