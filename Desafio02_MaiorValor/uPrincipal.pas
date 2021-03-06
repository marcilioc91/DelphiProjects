unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Math, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uProduto, uProdutoController,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
    edtCodigo: TEdit;
    edtQtd: TEdit;
    edtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAdicionar: TButton;
    btnListar: TButton;
    mmoAdicionar: TMemo;
    mmoListar: TMemo;
    btnSair: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ctrlProduto: TProdutoController;
    procedure AdicionarMemo(produto: TProduto);
    function ProdutosComMaiorValorVendido(lstProduto: TObjectList<TProduto>): String;
  public
    { Public declarations }

    {
    Desenvolva uma fun??o que receba uma lista de produtos vendidos e devolva uma string
    com o c?digo e a soma dos 3 produtos com maior valor vendido.


    Assinatura do m?todo:
    function ProdutosComMaiorValorVendido(Produtos: TObjectList<TProduto>): string;

    Propriedades da classe produto:
    Codigo, Qtde, Valor

    Exemplo de entrada (TObjectList<TProduto>):
    1001, 3, 12.00
    1002, 1, 150.00
    1001, 3, 12.50
    1001, 2, 14.00

    Retorno (string):
    1002:150.00;1001:101.50
    }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ctrlProduto := TProdutoController.Create;
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
var
  produto: TProduto;
begin

  try
    produto := TProduto.Create;
    produto.codigo := IfThen(edtCodigo.Text='', 0, StrToInt(edtCodigo.Text));
    produto.qtde   := IfThen(edtQtd.Text='', 0, StrTOInt(edtQtd.Text));
    produto.valor  := IfThen(edtValor.Text='', 0, StrToFloat(edtValor.Text));

    ctrlProduto.Adicionar(produto);

    AdicionarMemo(produto);
  except
    produto.Free;
    edtCodigo.SelectAll;
    edtCodigo.SetFocus;
  end;
end;

procedure TForm1.AdicionarMemo(produto: TProduto);
begin
  mmoAdicionar.Lines.Add(
    IntToStr(produto.codigo) + ', ' +
    IntToStr(produto.qtde) + ', ' +
    FormatFloat('#,##0.00', produto.valor)
  );
end;

procedure TForm1.btnListarClick(Sender: TObject);
begin
  mmoListar.Clear;
  mmoListar.Lines.Add(ProdutosComMaiorValorVendido(ctrlProduto.Listar));
end;

function TForm1.ProdutosComMaiorValorVendido(lstProduto: TObjectList<TProduto>): String;
var
  i: Integer;
  produto: TProduto;
begin
  Result := '';

  for i := 0 to lstProduto.Count - 1 do
  begin
    if produto.codigo = produto.codigo then
    Result := Result + IntToStr((lstProduto.Items[i] as TProduto).codigo) + '; ' + FormatFloat('###,##0.00', (lstProduto.Items[i] as TProduto).qtde * (lstProduto.Items[i] as TProduto).valor) + #13 + #10 + #13;
  end;

//  for produto in lstProduto do
//    Result := Result + IntToStr(produto.codigo) + ':' + FormatFloat('###,##0.00', produto.qtde * produto.valor) + #13 + #10 + #13;

end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  if Assigned(ctrlProduto) then
    ctrlProduto.DisposeOf;

  Close;
end;

end.
