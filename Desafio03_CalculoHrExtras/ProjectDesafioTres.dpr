program ProjectDesafioTres;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uHorasExtras in 'uHorasExtras.pas',
  HoraExtraLista in 'HoraExtraLista.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
