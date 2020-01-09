{
05 - Em uma aplica��o console, construa um programa que leia uma lista de frases.
     Apresente ao usu�rio apenas as frases que formam um pal�ndromo.
Autor: Eder Correia Lira
}

program Palindromo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.StrUtils, System.Math;

var
  sListaFrasesEntrada: string;
  sListaFrasesSaida: TArray<string>;
  sFrase: string;

function ListaEhValida(const pValor: string): boolean;
begin
  result := Trim(pValor) <> EmptyStr;
  if not result then
  begin
    writeln('Informe uma lista v�lida.');
    writeln(EmptyStr);
  end;
end;

function PreparaFrase(const pFrase: string): string;
type
  USAscii20127 = type AnsiString(20127);
var
  sFrase: string;
  sRemover: TArray<string>;
  nPosicao: integer;
begin
  sFrase := pFrase;
  sRemover := [' ',',',':','-','"'];
  //remover caracteres
  for nPosicao := ZeroValue to High(sRemover) do
    sFrase := ReplaceStr(sFrase,sRemover[nPosicao],EmptyStr);
  //remover acentos
  result := string(USAscii20127(sFrase));
end;

function RetornaPalindromo(const pListaFrases: TArray<string>): TArray<string>;
var
  nPosicao: integer;
  sFrase: string;
  sFraseSemAcento: string;
begin
  for sFrase in pListaFrases do
  begin
    sFraseSemAcento := PreparaFrase(sFrase);
    if sFraseSemAcento = ReverseString(sFraseSemAcento) then
    begin
      SetLength(result, Succ(Length(result)));
      result[Pred(Length(result))] := sFrase;
    end;
  end;
end;

begin
  repeat
    write('Informe uma lista de frases separadas por ";": ');
    readln(sListaFrasesEntrada);
  until ListaEhValida(sListaFrasesEntrada);

  sListaFrasesSaida := RetornaPalindromo(SplitString(sListaFrasesEntrada,';'));

  if Length(sListaFrasesSaida) > ZeroValue then
    Writeln('As frases abaixo s�o palindromos:');

  for sFrase in sListaFrasesSaida do
    Writeln(sFrase);

  Readln;
end.
