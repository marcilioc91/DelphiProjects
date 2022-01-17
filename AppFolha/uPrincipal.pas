unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uCadEvento, System.Actions,
  Vcl.ActnList, uCadFuncionario;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cargos1: TMenuItem;
    Funcionarios1: TMenuItem;
    Eventos1: TMenuItem;
    Eventos2: TMenuItem;
    TabeladeINSS1: TMenuItem;
    TabeladeIRRF1: TMenuItem;
    N1: TMenuItem;
    Processos1: TMenuItem;
    MudancaDeSalario1: TMenuItem;
    Lancareventoparafuncionarios1: TMenuItem;
    FolhadePagamento1: TMenuItem;
    Relatorios1: TMenuItem;
    Folhadepagamento2: TMenuItem;
    Folhadepagamento3: TMenuItem;
    Sair2: TMenuItem;
    procedure Cargos1Click(Sender: TObject);
    procedure Eventos1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uCadCargo;

{
  Requisitos: Criar um sistema para calcular a folha de pagamentos de uma empresa.
	- Cadastro de cargos: c�digo e nome.
	- Cadastro de eventos: c�digo, descri��o, tipo (desconto/acr�scimo).
	- Tabela de INSS.
	- Tabela de IRRF.
	- Cadastro de funcion�rios: c�digo, nome, data de nascimento, cargo, contato, e-mail, ativo.
	  * O cadastro de funcion�rios deve manter o hist�rico de sal�rios do empregado.
	- Registrar mudan�a de sal�rio
	- Lan�ar evento para funcion�rio(s)
	- Tela de processamento de folha: calcular/recalcular folha de pagamentos para um m�s informado.
		* Consultar dados dos funcion�rios ativos
		* Calcular INSS
		* Calcular IRRF
		* Verificar Eventos para o m�s
	- Relat�rio de folha de pagamento.
	- Relat�rio de empregados.
}

procedure TFrmPrincipal.Cargos1Click(Sender: TObject);
begin
  FrmCargo := TFrmCargo.Create(Self);
  FrmCargo.ShowModal;
  FreeAndNil(FrmCargo);
end;

procedure TFrmPrincipal.Eventos1Click(Sender: TObject);
begin
 FrmEvento := TFrmEvento.Create(Self);
 FrmEvento.ShowModal;
 FreeAndNil(FrmEvento);
end;

procedure TFrmPrincipal.Funcionarios1Click(Sender: TObject);
begin
  FrmFuncionario := TFrmFuncionario.Create(Self);
  FrmFuncionario.ShowModal;
  FreeAndNil(FrmFuncionario);
end;

procedure TFrmPrincipal.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;

  if Application.MessageBox('Deseja sair do sistema?', 'Aviso do Sistema',
    MB_ICONWARNING + MB_YESNO) = ID_YES then
    CanClose := True;
end;

end.
