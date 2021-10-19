unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtValor: TEdit;
    Button1: TButton;
    memMultiplos: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblM3: TLabel;
    lblM5: TLabel;
    lblM35: TLabel;
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
  valor, n, contT, contF, contTF: Integer;
begin
  contT := 0;
  contF := 0;
  contTF := 0;

  if edtValor.Text = '' then
  begin
    ShowMessage('Insira um valor');
  end
  else
  begin
    memMultiplos.Clear;

    valor := StrToInt(edtValor.Text);
    for n := 1 to valor do
    begin
      if ((n mod 3) = 0) and ((n mod 5) = 0) then
      begin
        memMultiplos.Lines.Add(IntToStr(n) + ' - FIZZBUZZ');
        Inc(contTF,1);
      end
      else if ((n mod 3) = 0) then
      begin
        memMultiplos.Lines.Add(IntToStr(n) + ' - FIZZ');
        Inc(contT,1);
      end
      else if ((n mod 5) = 0) then
      begin
        memMultiplos.Lines.Add(IntToStr(n) + ' - BUZZ');
        Inc(contF,1);
      end;
    end;

    lblM3.Caption := contT.ToString();
    lblM5.Caption := contF.ToString();
    lblM35.Caption := contTF.ToString();
  end;

end;

end.
