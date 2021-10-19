unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    memParcelas: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    edtValor: TEdit;
    btnCalcular: TButton;
    cbxParcelas: TComboBox;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  valorTotal: Currency;
  x, numParcelas: Integer;
begin
  memParcelas.Clear;
  numParcelas := cbxParcelas.ItemIndex + 1;

  for x := 1 to numParcelas do
  begin
    valorTotal := StrToInt(edtValor.Text);
    valorTotal := valorTotal / x;
    memParcelas.Lines.Add(IntToStr(x) + 'x de R$ '+ FormatFloat('###,###,##0.00', valorTotal));
  end;

end;

end.
