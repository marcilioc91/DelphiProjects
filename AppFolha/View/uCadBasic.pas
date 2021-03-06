unit uCadBasic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask;

type
  TFrmBasic = class(TForm)
    PageControl1: TPageControl;
    tbsLista: TTabSheet;
    tbsDados: TTabSheet;
    pnlToolBar: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    DBGrid1: TDBGrid;
    lblTotalRegistros: TLabel;
    Panel1: TPanel;
    edtBuscar: TEdit;
    btnBuscar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);

    procedure HabilitarBotoes(estado: Boolean);
    procedure HabilitarCampos(estado: Boolean);
    procedure LimparCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBasic: TFrmBasic;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmBasic.HabilitarBotoes(estado: Boolean);
begin
  btnNovo.Enabled     := estado;
  btnEditar.Enabled   := estado;
  btnExcluir.Enabled  := estado;
  btnCancelar.Enabled := not estado;
  btnSalvar.Enabled   := not estado;
  btnSair.Enabled     := estado;
end;

procedure TFrmBasic.HabilitarCampos(estado: Boolean);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ( (Components[i] is TEdit)       or
         (Components[i] is TMemo)       or
         (Components[i] is TMaskEdit)   or
         (Components[i] is TRadioGroup) or
         (Components[i] is TCheckBox)   or
         (Components[i] is TListBox)  ) then
      TWinControl(Components[i]).Enabled := estado;
  end;
end;

procedure TFrmBasic.LimparCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit)     then TEdit(Components[i]).Clear;
    if (Components[i] is TMemo)     then TMemo(Components[i]).Clear;
    if (Components[i] is TMaskEdit) then TMaskEdit(Components[i]).Clear;
    if (Components[i] is TListBox)  then TListBox(Components[i]).Items.Clear;
  end;
end;

procedure TFrmBasic.FormShow(Sender: TObject);
begin
  HabilitarCampos(False);
end;

procedure TFrmBasic.btnNovoClick(Sender: TObject);
begin
  HabilitarBotoes(False);
  LimparCampos;
  HabilitarCampos(True);
end;

procedure TFrmBasic.btnEditarClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbsDados;

  HabilitarBotoes(False);
end;

procedure TFrmBasic.btnCancelarClick(Sender: TObject);
begin
  HabilitarBotoes(True);
  HabilitarCampos(False);

  edtBuscar.Enabled := True;
end;

end.
