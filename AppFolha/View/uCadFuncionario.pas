unit uCadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBasic, Data.DB, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, uConexao;

type
  TAcao = (Incluir, Alterar);

type
  TFrmFuncionario = class(TFrmBasic)
    edtNome: TEdit;
    mskContato: TMaskEdit;
    mskDtNasc: TMaskEdit;
    edtCodCargo: TEdit;
    edtEmail: TEdit;
    rdgAtivo: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TEdit;
    spbCodFuncionario: TSpeedButton;
    Label6: TLabel;
    spbCodCargo: TSpeedButton;
    edtCargo: TEdit;
    pgcSalario: TPageControl;
    tsSalario: TTabSheet;
    pnlGridSalario: TPanel;
    pnlBtnSalario: TPanel;
    btnNovoSal: TButton;
    btnEditarSal: TButton;
    btnSalvarSal: TButton;
    pnlEdtSalario: TPanel;
    mskDataSalario: TMaskEdit;
    edtSalario: TEdit;
    dbgSalario: TDBGrid;
    dbnSalario: TDBNavigator;
    procedure spbCodFuncionarioClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure spbCodCargoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoSalClick(Sender: TObject);
    procedure btnSalvarSalClick(Sender: TObject);
  private
    { Private declarations }
    acao: TAcao;
    FConexao: TConexao;

    FDQryFuncionario: TFDQuery;
    dsFuncionario: TDataSource;
    FDQrySalario: TFDQuery;
    dsSalario: TDataSource;
  public
    { Public declarations }
  end;

var
  FrmFuncionario: TFrmFuncionario;

implementation

{$R *.dfm}

uses uFuncionarioController, uFuncionario, uCargo, uCargoController, uHSalario,
  uHSalarioController;

procedure TFrmFuncionario.FormCreate(Sender: TObject);
begin
  inherited;

  FDQryFuncionario := TFDQuery.Create(nil);
  dsFuncionario    := TDataSource.Create(nil);

  dsFuncionario.DataSet   := FDQryFuncionario;
  DBGrid1.DataSource      := dsFuncionario;
  DBNavigator1.DataSource := dsFuncionario;

  FDQrySalario := TFDQuery.Create(nil);
  dsSalario    := TDataSource.Create(nil);

  dsSalario.DataSet     := FDQrySalario;
  dbgSalario.DataSource := dsSalario;
  dbnSalario.DataSource := dsSalario;
end;

procedure TFrmFuncionario.btnNovoClick(Sender: TObject);
begin
  inherited;

  acao := Incluir;

  PageControl1.ActivePage := tbsDados;
  pgcSalario.Enabled      := False;

  rdgAtivo.ItemIndex := 0;

  edtCodigo.SetFocus;
end;

procedure TFrmFuncionario.btnNovoSalClick(Sender: TObject);
begin
  inherited;

  mskDataSalario.Enabled := True;
  edtSalario.Enabled     := True;

  btnNovoSal.Enabled     := False;
  btnEditarSal.Enabled   := False;
  btnSalvarSal.Enabled   := True;

  mskDataSalario.SetFocus;
end;

procedure TFrmFuncionario.btnEditarClick(Sender: TObject);
begin
  inherited;

  HabilitarBotoes(FDQryFuncionario.RecordCount <= 0);
  HabilitarCampos(FDQryFuncionario.RecordCount > 0);

  if (FDQryFuncionario.RecordCount > 0) then
  begin
    acao := Alterar;

    pgcSalario.Enabled := True;

    edtCodigo.Enabled := False;
    edtNome.SetFocus;
  end;
end;

procedure TFrmFuncionario.btnExcluirClick(Sender: TObject);
var
  cFuncionario: TFuncionarioController;
begin
  inherited;

  try
    cFuncionario := TFuncionarioController.Create;

    if MessageDlg('Deseja excluir o funcionario: ' + edtNome.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      cFuncionario.Excluir(StrToInt(edtCodigo.Text));
  finally
    cfuncionario.DisposeOf;
  end;
end;

procedure TFrmFuncionario.btnSalvarClick(Sender: TObject);
var
  funcionario:  TFuncionario;
  cFuncionario: TFuncionarioController;
begin
  inherited;
  try
    funcionario := TFuncionario.Create;

    if acao = Alterar then
      funcionario.codigo       := StrToInt(edtCodigo.Text);

    funcionario.nome           := edtNome.Text;
    funcionario.cargo.codigo   := StrToInt(edtCodCargo.Text);
    funcionario.email          := edtEmail.Text;
    funcionario.dataNascimento := StrToDate(mskDtNasc.Text);
    funcionario.contato        := mskContato.Text;
    funcionario.ativo          := rdgAtivo.ItemIndex;

    cFuncionario := TFuncionarioController.Create;

    if acao = Incluir then
      cFuncionario.Incluir(funcionario)
    else
      cFuncionario.Alterar(funcionario);

    ShowMessage('Dados salvo com sucesso.');
    btnBuscarClick(Self);
  finally
    funcionario.DisposeOf;
    cfuncionario.DisposeOf;
  end;
end;

procedure TFrmFuncionario.btnSalvarSalClick(Sender: TObject);
var
  hSal: THSalario;
  cSal: THSalarioController;
begin
  inherited;

  mskDataSalario.Enabled := False;
  edtSalario.Enabled     := False;

  btnNovoSal.Enabled     := True;
  btnEditarSal.Enabled   := (FDQrySalario.RecordCount > 0);
  btnSalvarSal.Enabled   := False;

  if ( (mskDataSalario.Text <> '  /  /    ') and (edtSalario.Text <> '') )then
  begin
    try
      hSal := THSalario.Create;
      cSal := THSalarioController.Create;

      hSal.codFuncionario := StrToInt(edtCodigo.Text);
      hSal.data           := StrToDate(mskDataSalario.Text);
      hSal.salario        := StrToCurr(edtSalario.Text);

      cSal.Incluir(hSal);
    finally
      hSal.DisposeOf;
      cSal.DisposeOf;
    end;

    FDQrySalario.Close;
    FDQrySalario := cSal.ListarTodosQry;
    FDQrySalario.Open;
  end;
end;

procedure TFrmFuncionario.DBGrid1DblClick(Sender: TObject);
var
  hSal: THSalario;
  cSal: THSalarioController;
begin
  inherited;

  if (FDQryFuncionario.RecordCount > 0) then
  begin
    edtCodigo.Text     := FDQryFuncionario.FieldByName('codigo').AsString;
    edtNome.Text       := FDQryFuncionario.FieldByName('nome').AsString;
    edtCodCargo.Text   := FDQryFuncionario.FieldByName('codCargo').AsString;
    edtCargo.Text      := FDQryFuncionario.FieldByName('cargo').AsString;
    edtEmail.Text      := FDQryFuncionario.FieldByName('eMail').AsString;
    mskDtNasc.Text     := FormatDateTime('dd/mm/yyyy', FDQryFuncionario.FieldByName('dataNascimento').AsDateTime);
    mskContato.Text    := FDQryFuncionario.FieldByName('contato').AsString;
    rdgAtivo.ItemIndex := FDQryFuncionario.FieldByName('ativo').AsInteger;

    PageControl1.ActivePage := tbsDados;

    try
      hSal := THSalario.Create;
      cSal := THSalarioController.Create;

      FDQrySalario.Close;
      FDQrySalario := cSal.ListarTodosQry;
      FDQrySalario.Open;
      dsSalario.DataSet := FDQrySalario;
    finally
      hSal.DisposeOf;
      cSal.DisposeOf;
    end;

    btnNovoSal.Enabled   := True;
    btnEditarSal.Enabled := (FDQrySalario.RecordCount > 0);
    btnSalvarSal.Enabled := False;
  end;
end;

procedure TFrmFuncionario.btnBuscarClick(Sender: TObject);
var
  cFuncionario: TFuncionarioController;
begin
  inherited;

  cFuncionario := TFuncionarioController.Create;

  FDQryFuncionario.Close;
  FDQryFuncionario := cFuncionario.ListarTodosQry(edtBuscar.Text);
  FDQryFuncionario.Open;

  dsFuncionario.DataSet := FDQryFuncionario;

  lblTotalRegistros.Caption := 'Total de registros: ' + IntToStr(FDQryFuncionario.RecordCount) + '  ';
end;

procedure TFrmFuncionario.btnCancelarClick(Sender: TObject);
begin
  inherited;

  if Assigned(FDQryFuncionario) then
  begin
    if (FDQryFuncionario.RecordCount > 0) then
    begin
      edtCodigo.Text     := FDQryFuncionario.FieldByName('codigo').AsString;
      edtNome.Text       := FDQryFuncionario.FieldByName('nome').AsString;
      edtCodCargo.Text   := FDQryFuncionario.FieldByName('codCargo').AsString;
      edtCargo.Text      := FDQryFuncionario.FieldByName('cargo').AsString;
      edtEmail.Text      := FDQryFuncionario.FieldByName('email').AsString;
      mskDtNasc.Text     := FormatDateTime('dd/mm/yyyy', FDQryFuncionario.FieldByName('dataNascimento').AsDateTime);
      mskContato.Text    := FDQryFuncionario.FieldByName('contato').AsString;
      rdgAtivo.ItemIndex := FDQryFuncionario.FieldByName('ativo').AsInteger;
    end;
  end;
end;

procedure TFrmFuncionario.spbCodFuncionarioClick(Sender: TObject);
var
  funcionario:  TFuncionario;
  cFuncionario: TFuncionarioController;
begin
  inherited;

  try
    funcionario  := Tfuncionario.Create;
    cFuncionario := TfuncionarioController.Create;

    funcionario := cFuncionario.Buscar(StrToInt(edtCodigo.Text));

    edtCodigo.Text     := IntToStr(funcionario.codigo);
    edtNome.Text       := funcionario.nome;
    rdgAtivo.ItemIndex := funcionario.ativo;
  finally
    funcionario.DisposeOf;
    cFuncionario.DisposeOf;
  end;
end;

procedure TFrmFuncionario.spbCodCargoClick(Sender: TObject);
var
  cargo:  TCargo;
  cCargo: TCargoController;
begin
  inherited;

  try
    cargo  := TCargo.Create;
    cCargo := TCargoController.Create;

    edtCargo.Text := cCargo.Buscar(StrToInt(edtCodCargo.Text));
  finally
    cargo.DisposeOf;
    cCargo.DisposeOf;
  end;
end;

end.
