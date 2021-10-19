unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edtL1: TEdit;
    edtL2: TEdit;
    edtL3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var
  lado1, lado2, lado3: Integer;
begin
  if (edtL1.Text = '') or (edtL2.Text = '') or (edtL3.Text = '') then
  begin
  ShowMessage('Todos os campos são obrigatórios!');
  end
  else
  begin
  lado1 := StrToInt(edtL1.Text);
  lado2 := StrToInt(edtL2.Text);
  lado3 := StrToInt(edtL3.Text);

  if (lado1 = lado2) and (lado1 = lado3) and (lado2 = lado3) then
  ShowMessage('Triângulo equilátero')
  else
  if (lado1 = lado2) or (lado1 = lado3) or (lado2 = lado3) then
  ShowMessage('Triângulo isósceles')
  else
  ShowMessage('Triângulo escaleno')

  end;

end;

end.
