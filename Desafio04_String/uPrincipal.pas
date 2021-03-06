unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.StrUtils,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtFrase: TEdit;
    Label1: TLabel;
    btnExibir: TButton;
    btnSair: TButton;
    edtResultado: TEdit;
    Label2: TLabel;
    procedure btnExibirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtFraseExit(Sender: TObject);
  private
    function Criptografar(const Texto: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
  Criar uma fun??o de criptografia com as seguintes regras:
- O texto precisa ter 12 ou mais caracteres
- Substituir espa?os no texto pelo caracter @
- O texto deve ser quebrado a cada 8 caracteres
- A ?ltima linha do texto deve ser completada com o caracter @ at? atingir 8 caracteres
- O algoritmo deve formar a nova string transformando colunas em novas linhas
- Ao final concatenar e devolver a string criptografada

Assinatura do metodo:
function Criptografar(const Texto: string): string;

Exemplo de entrada:
Texto de exemplo teste

Texto quebrado:
Texto@de
@exemplo
@teste@@

Criptografado:
T@@eetxxetesomt@pedl@eo@
}

procedure TForm1.btnExibirClick(Sender: TObject);
begin
  edtResultado.Text := Criptografar(edtFrase.Text);
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TForm1.Criptografar(const Texto: string): string;
var
  i, j, tam: Integer;
  textoComAt, stringAux: String;
  textoArray: array of String;
begin
  textoComAt := StringReplace(edtFrase.Text, ' ', '@', [rfReplaceAll, rfIgnoreCase]);

  if (Length(textoComAt) mod 8) = 0 then
    tam := Trunc(Length(textoComAt) / 8)
  else
    tam := Trunc(Length(textoComAt) / 8) + 1;

  SetLength(textoArray, tam);

  //quebrar o texto em linhas pro array
  i := 1; j := 0;
  while i < Length(textoComAt) do
  begin
    stringAux := Copy(textoComAt, i, 8);
    textoArray[j] := IfThen(Length(stringAux) = 8, stringAux, Copy(stringAux+StringOfChar('@', 8), 1, 8));
    i := i + 8;
    j := j + 1;
  end;

  //Criptografar o array em um texto
  Result := '';
  for i := 1 to 8 do
  begin
    for j := 0 to Length(textoArray) - 1 do
    begin
      stringAux := Copy(textoArray[j], i, 1);
      Result := Result + stringAux;
    end;
  end;
end;

procedure TForm1.edtFraseExit(Sender: TObject);
begin
  if (Length(edtFrase.Text) > 0) and (Length(edtFrase.Text) < 12) then
  begin
    ShowMessage('N?o ? permitido inserir menos que 12 caracteres.');
    edtResultado.Clear;
    edtFrase.SetFocus;
  end;
end;

end.
