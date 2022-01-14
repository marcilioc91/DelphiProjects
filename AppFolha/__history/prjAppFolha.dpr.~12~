program prjAppFolha;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uCadBasic in 'uCadBasic.pas' {FrmBasic},
  uCadCargos in 'uCadCargos.pas' {FrmCargos},
  uDM in 'uDM.pas' {DM: TDataModule},
  uCargo in 'Model\uCargo.pas',
  uEvento in 'Model\uEvento.pas',
  uFuncionario in 'Model\uFuncionario.pas',
  uConexao in 'DAO\uConexao.pas',
  uCargoDAO in 'DAO\uCargoDAO.pas',
  uCargoController in 'Controller\uCargoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
