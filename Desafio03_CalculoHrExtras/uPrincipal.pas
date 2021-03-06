unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask,
  TimeSpan,
  System.Generics.Collections,
  uHorasExtras, HoraExtraLista;

type
  TFrmPrincipal = class(TForm)
    edtCodFunc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rdgDomingoFeriado: TRadioGroup;
    btnCalcular: TButton;
    btnAdd: TButton;
    mmResultado: TMemo;
    Label4: TLabel;
    mskData: TMaskEdit;
    mskHoras: TMaskEdit;
    btnSair: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  HoraExtra: THorasExtras;
  ListaHora: TDictionary<Integer, THoraExtraList>;
  TimeSpan: TTimeSpan;

implementation

{
  A empresa Abc precisa de um programa para calcular as horas extras dos seus funcion?rios.

  Desenvolva uma aplica??o que registre o c?digo do funcion?rio, o dia/m?s (25/02),
  se o dia ? feriado ou domingo e o total de horas extras no dia.

  Se o dia ? feriado ou domingo, o valor da hora de trabalho deve ser acrescida em 100%, caso contr?rio ? acrescido em 50%.

  A aplica??o deve imprimir o c?digo do funcion?rio, o total e o valor das horas extras 50%,
  o total e o valor das horas extras 100% e o valor total a ser pago. O Valor da hora de trabalho
  ? de 20.00 para todos os funcion?rios.
}

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  ListaHora := TDictionary<Integer, THoraExtraList>.Create;
end;

procedure TFrmPrincipal.btnAddClick(Sender: TObject);
var
  codFunc: Integer;
  data: String;
  domingoFeriado: Integer;
  HoraEmMinutos: Double;
  ListaHoraExtra: THoraExtraList;
begin
  ListaHoraExtra := THoraExtraList.Create;
  codFunc        := StrToInt(edtCodFunc.Text);
  data           := mskData.Text;
  domingoFeriado := rdgDomingoFeriado.ItemIndex;
  TimeSpan       := System.TimeSpan.TTimeSpan.Parse(mskHoras.Text);
  HoraEmMinutos  := (TimeSpan.TotalSeconds/60);
  try
    HoraExtra := THorasExtras.Create(codFunc, data, HoraEmMinutos, domingoFeriado);
    if not (ListaHora.ContainsKey(codFunc)) then
      ListaHora.Add(codFunc, ListaHoraExtra);

    ListaHora.Items[codFunc].Add(HoraExtra);

    ShowMessage('Hora adicionada com sucesso.');
  except
    HoraExtra.Free;
    ListaHoraExtra.Free;
  end;
end;

procedure TFrmPrincipal.btnCalcularClick(Sender: TObject); // BOT?O DE CALCULAR
var
  codFunc: Integer;
  HorasExtras: THorasExtras;
begin
  mmResultado.Clear;
  for codFunc in ListaHora.Keys do
  begin
    ListaHora.Items[codFunc].ListarValor;

    mmResultado.Lines.Add('Cod. Funcion?rio: ' + codFunc.ToString);
    mmResultado.Lines.Add(' Horas com 50% : ' + FormatFloat('#00hs', ListaHora.Items[codFunc].HorasExtra50PorCento));
    mmResultado.Lines.Add(' Horas com 100%: ' + FormatFloat('#00hs', ListaHora.Items[codFunc].HorasExtra100PorCento));
    for HorasExtras in ListaHora.Items[codFunc] do
      begin
        mmResultado.Lines.Add(' ' + IfThen(HorasExtras.domingoFeriado = 1, 50, 100).ToString + '% do Valor: ' + FormatFloat('R$ #,##0.00', HorasExtras.HorasPagar));
      end;
    mmResultado.Lines.Add(' Total geral a pagar: ' + FormatFloat('R$ #,##0.00', ListaHora.Items[codFunc].TotalPagar));
    mmResultado.Lines.Add(#13);
  end;

end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
