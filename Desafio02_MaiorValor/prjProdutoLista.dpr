program prjProdutoLista;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uProduto in 'uProduto.pas',
  uProdutoDAO in 'uProdutoDAO.pas',
  uProdutoController in 'uProdutoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
