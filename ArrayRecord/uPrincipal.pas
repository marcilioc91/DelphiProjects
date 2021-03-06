unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAlunos = Record
    nome : string;
    nota : double;
  End;

  TArrAluno = array[0..9] of TAlunos;

  TForm1 = class(TForm)
    Memo1: TMemo;
    btnRec: TButton;
    Label1: TLabel;
    procedure btnRecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnRecClick(Sender: TObject);
var
  i, m, n: Integer;
  maior, menor, media: Double;
  nome, nota: String;
  arrAluno: TArrAluno;
begin
  media := 0;

  for i := 0 to 9 do
  begin
    arrAluno[i].nome := InputBox('Aluno #' + IntToStr(i+1), 'Nome' , nome);

    while True do
    begin
      arrAluno[i].nota := StrToFloat(InputBox('Aluno #' + IntToStr(i+1), 'Nota:', nota));

      if (arrAluno[i].nota >= 0) and (arrAluno[i].nota <= 10) then
        Break;
    end;
    Memo1.Lines.Add(IntToStr(i+1) + '. ' + arrAluno[i].nome + ' = ' + FormatFloat('#0.0',arrAluno[i].nota));
    media := media + arrAluno[i].nota;
  end;

  maior := 0;
  menor := 9999;

  for i := 0 to 9 do
  begin
    if arrAluno[i].Nota > maior then
    begin
      m := i;
      maior := arrAluno[i].Nota;
    end;

    if arrAluno[i].Nota < menor then
    begin
      n := i;
      menor := arrAluno[i].Nota;
    end;
  end;

  Memo1.Lines.Add('----------------------------');
  Memo1.Lines.Add('M?dia da Turma: '+ FloatToStr(media/10));
  Memo1.Lines.Add('----------------------------');
  Memo1.Lines.Add('Aluno com a maior nota');
  Memo1.Lines.Add('Nome: ' + arrAluno[m].nome);
  Memo1.Lines.Add('Nota: ' + FloatToStr(arrAluno[m].nota));
  Memo1.Lines.Add('----------------------------');
  Memo1.Lines.Add('Aluno com a menor nota');
  Memo1.Lines.Add('Nome: ' + arrAluno[n].nome);
  Memo1.Lines.Add('Nota: ' + FloatToStr(arrAluno[n].nota));
  Memo1.Lines.Add('----------------------------');
end;

end.
