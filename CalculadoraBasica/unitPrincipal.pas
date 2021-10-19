unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edtValor1: TEdit;
    edtValor2: TEdit;
    rdgOp: TRadioGroup;
    edtResultado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnResultado: TButton;
    procedure btnResultadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnResultadoClick(Sender: TObject);
var
  val1, val2: Integer;
  res: Double;
  obj: TObject;
begin
  if (edtValor1.Text = '') or (edtValor2.Text = '') then
    ShowMessage('Valores em branco. Favor informar os valores')
  else
  begin
    try
      val1 := StrToInt(edtValor1.Text);
      val2 := StrToInt(edtValor2.Text);
    except on error: exception do
      begin
        ShowMessage('Valor invalido! ' + error.Message);
        Exit;
      end;
    end;

    if rdgOp.ItemIndex = 0 then // SOMAR
    begin
      res := val1 + val2;
      edtResultado.Text := FloatToStr(res);
    end
    else if rdgOp.ItemIndex = 1 then // SUBTRAIR
    begin
      res := val1 - val2;
      edtResultado.Text := FloatToStr(res);
    end
    else if rdgOp.ItemIndex = 2 then // DIVIDIR
    begin
      if (val2 = 0) then
      begin
        ShowMessage('Divisão por zero, favor informar uma valor maior que zero');
        Exit;
      end;
      res := val1 / val2;
      edtResultado.Text := FloatToStr(res);
    end
    else if rdgOp.ItemIndex = 3 then // MULTIPLICAR
    begin
      res := val1 * val2;
      edtResultado.Text := FloatToStr(res);
    end
    else if rdgOp.ItemIndex = 4 then // RESTO DA DIVISÃO
    begin
      res := val1 mod val2;
      edtResultado.Text := FloatToStr(res);
    end;
  end;
end;

end.
