unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnMedia: TButton;
    edtMax: TSpinEdit;
    Label1: TLabel;
    procedure btnMediaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMediaClick(Sender: TObject);
var
  intArray: array of Integer;
  I, J, resultado : Integer;
  media: Double;

begin
  Memo1.Clear;
  media := 0;
  resultado := 0;
  SetLength(intArray, edtMax.Value);

  for I := Low(intArray) to High(intArray) do
  begin
    intArray[I] := Random(50);
    Memo1.Lines.Add('Valor ' + IntToStr(intArray[I]));
  end;

  for J in intArray do
  begin
    resultado := resultado + J;
  end;
  media := resultado / Length(intArray);

  Memo1.Lines.Add('M?dia = ' + FormatFloat('#0.00',media));

end;

end.
