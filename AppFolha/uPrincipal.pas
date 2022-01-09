unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

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
    Sair1: TMenuItem;
    Processos1: TMenuItem;
    MudancaDeSalario1: TMenuItem;
    Lancareventoparafuncionarios1: TMenuItem;
    FolhadePagamento1: TMenuItem;
    Relatorios1: TMenuItem;
    Folhadepagamento2: TMenuItem;
    Folhadepagamento3: TMenuItem;
    Sair2: TMenuItem;
    procedure Cargos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uCadCargos;

procedure TFrmPrincipal.Cargos1Click(Sender: TObject);
begin
  FrmCargos := TFrmCargos.Create(Self);
  FrmCargos.ShowModal;
  FreeAndNil(FrmCargos);
end;

end.