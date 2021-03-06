unit HoraExtraLista;

interface
uses System.SysUtils, Generics.Collections, uHorasExtras;

type
  THoraExtraList = class(TObjectList<THorasExtras>)
    private
      FHorasExtra100PorCento: Double;
      FHorasExtra50PorCento: Double;
      FTotalPagar: Currency;
    public
      property HorasExtra100PorCento: Double read FHorasExtra100PorCento write FHorasExtra100PorCento;
      property HorasExtra50PorCento: Double read FHorasExtra50PorCento write FHorasExtra50PorCento;
      property TotalPagar: Currency read FTotalPagar write FTotalPagar;

      constructor Create;
      destructor Destroy; override;

      procedure ListarValor;
  end;

implementation

{ THoraExtraList }

constructor THoraExtraList.Create;
begin
  inherited;
end;

destructor THoraExtraList.Destroy;
begin
  inherited Destroy;
end;

procedure THoraExtraList.ListarValor;
var
  HorasExtras: THorasExtras;
  TotalPagar: Currency;
  Valor50PorCento: Double;
  Valor100PorCento: Double;
begin
  TotalPagar       := 0.0;
  Valor50PorCento  := 0.0;
  Valor100PorCento := 0.0;

  for HorasExtras in Self do
  begin
    if (HorasExtras.domingoFeriado = 1) then
      Valor50PorCento  := Valor50PorCento  + HorasExtras.horaEmMinutos
    else
      Valor100PorCento := Valor100PorCento + HorasExtras.horaEmMinutos;

    TotalPagar := TotalPagar + HorasExtras.HorasPagar;
  end;

  Self.HorasExtra100PorCento := (Valor100PorCento / 60);
  Self.HorasExtra50PorCento  := (Valor50PorCento  / 60);
  Self.TotalPagar            := TotalPagar;
end;

end.

