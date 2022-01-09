unit uHorasExtras;

interface

type

  THorasExtras = class // INÍCIO DA CLASSE
  private
    FCodFuncionario : Integer;
    FData           : String;
    FHoraEmMinutos  : Double;
    FDomingoFeriado : Integer;
  public
    property codigoFuncionario: Integer read FCodFuncionario write FCodFuncionario;
    property data: String read FData write FData;
    property horaEmMinutos: Double read FHoraEmMinutos write FHoraEmMinutos;
    property domingoFeriado: Integer read FDomingoFeriado write FDomingoFeriado;

    constructor Create(codigoFuncionario: Integer; data: String; horaEmMinutos: Double; domingoFeriado: Integer);
    destructor Destroy; override;

    function HorasPagar: Currency;
  end; // FINAL DA CLASSE

implementation

{ THorasExtras }

constructor THorasExtras.Create(codigoFuncionario: Integer; data: String;
  HoraEmMinutos: Double; domingoFeriado: Integer);
begin
  Self.codigoFuncionario := codigoFuncionario;
  Self.data              := data;
  Self.HoraEmMinutos     := HoraEmMinutos;
  Self.domingoFeriado    := domingoFeriado;
end;

destructor THorasExtras.Destroy;
begin
  inherited;
end;

function THorasExtras.HorasPagar: Currency;
begin
  if domingoFeriado = 1 then
    Result := ((HoraEmMinutos/60) * 1.5) * 20
  else
    Result := ((HoraEmMinutos/60) * 2) * 20;
end;

end.
