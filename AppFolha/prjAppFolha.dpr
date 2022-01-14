program prjAppFolha;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uCargo in 'Model\uCargo.pas',
  uEvento in 'Model\uEvento.pas',
  uFuncionario in 'Model\uFuncionario.pas',
  uConexao in 'DAO\uConexao.pas',
  uCargoDAO in 'DAO\uCargoDAO.pas',
  uCargoController in 'Controller\uCargoController.pas',
  uCadCargo in 'View\uCadCargo.pas' {FrmCargo},
  uCadBasic in 'View\uCadBasic.pas' {FrmBasic},
  uDM in 'View\uDM.pas' {DM: TDataModule},
  uCadEvento in 'View\uCadEvento.pas' {FrmEvento},
  uEventoController in 'Controller\uEventoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
