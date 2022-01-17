unit uINSS;

interface
type
  TINSS = class
    private
      FData: TDate;
      FAliquota: Double;
      FMinimo: Double;
      FMaximo: Double;
    public
      constructor Create;
      destructor Destroy; override;

      property data: TDate read FData write FData;
      property aliquota: Double read FAliquota write FAliquota;
      property minimo: Double read FMinimo write FMinimo;
      property maximo: Double read FMaximo write FMaximo;
  end;

implementation

{ TINSS }

constructor TINSS.Create;
begin
  inherited;
end;

destructor TINSS.Destroy;
begin
  inherited Destroy;
end;

end.
