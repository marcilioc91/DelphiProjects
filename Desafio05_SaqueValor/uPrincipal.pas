unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtValor: TEdit;
    btnConsultar: TButton;
    Memo1: TMemo;
    procedure btnConsultarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    { Private declarations }
    function Sacar(Valor: Integer): string;
    function ValidarValor(valor: String): Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{
  Desenvolva uma fun��o que receba um valor para saque e devolva as notas.
  Notas dispon�veis: 2, 5, 10, 20, 50 e 100.
  O valor deve ser maior que 2 e diferente de 3.
  Assinatura do m�todo:
  function Sacar(Valor: Integer): string;
  Entrada:
  257.00
  Sa�da:
  100,100,50,5,2
}

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnConsultarClick(Sender: TObject);
var
  valor: Integer;
begin
  if ValidarValor(edtValor.Text) then
  begin
    valor := StrToInt(edtValor.Text);

    Memo1.Clear;
    Memo1.Lines.Add(Copy(Sacar(valor), 1, Length(Sacar(valor))-1));
  end;
end;

procedure TForm1.edtValorExit(Sender: TObject);
begin
  if not ValidarValor(edtValor.Text) then
  begin
    edtValor.Clear;
    edtValor.SetFocus;
  end;
end;

function TForm1.Sacar(valor: Integer): String;
const
  notas: array[0..5] of Integer = (100, 50, 20, 10, 5, 2);
var
  i, nota: Integer;
begin
  i      := 0;
  Result := '';

  for nota in notas do
  begin
    while nota <= valor do
    begin

      if ( ((valor - nota) >= 2) or ((valor - nota) = 0) )then
      begin
        Result := Result + IntToStr(notas[i]) + ',';
        valor  := valor - nota;
      end
      else
        Break;
    end;
    i := i + 1;
  end;
end;

function TForm1.ValidarValor(valor: String): Boolean;
var
  buffer: Integer;
begin
  Result := False;

  if TryStrToInt(valor, buffer) then
    if (buffer = 3) or (buffer < 2) then
      Result := False
    else
      Result := True;
end;

end.
