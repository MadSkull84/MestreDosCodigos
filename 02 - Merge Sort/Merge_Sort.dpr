{
02 - Em uma aplicação console, construa um programa que leia uma lista de números
     informada pelo usuário. Em seguida, através do algoritmo merge-sort, faça a
     ordenação da lista e apresente o resultado.
Autor: Eder Correia Lira
}

program Merge_Sort;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Math, System.StrUtils;

var
  sListaEntrada: string;

function ConverterListaEmArray(const pLista: string): TArray<Integer>;
var
  sLista: TArray<String>;
  nLista: TArray<Integer>;
  nPosicao: integer;
begin
  sLista := SplitString(pLista, ',');
  SetLength(nLista, Length(sLista));
  for nPosicao := ZeroValue to High(sLista) do
  begin
    nLista[nPosicao] := sLista[nPosicao].ToInteger;
  end;
  result := nLista;
end;

function ConverterArrayEmLista(const pLista: TArray<Integer>): string;
var
  nPosicao: integer;
begin
  for nPosicao := ZeroValue to High(pLista) do
  begin
    if nPosicao > ZeroValue then
      Result := Result + ',';
    Result := Result + pLista[nPosicao].ToString;
  end;
end;

function MergeSort(const pLista: TArray<Integer>): TArray<Integer>;
var
  nMeio: integer;
  nPosicao: integer;
  nEsquerda: integer;
  nDireita: integer;
  aListaEsquerda: TArray<Integer>;
  aListaDireita: TArray<Integer>;
  aListaSaida: TArray<Integer>;
begin
  if (Length(pLista) <= 1) then
    Exit(pLista);

  nMeio := Ceil(Length(pLista)/2);

  SetLength(aListaSaida,Length(pLista));
  SetLength(aListaEsquerda,nMeio);
  SetLength(aListaDireita,(Length(pLista)-nMeio));

  for nPosicao := ZeroValue to Pred(nMeio) do
    aListaEsquerda[nPosicao] := pLista[nPosicao];

  for nPosicao := nMeio  to Pred(Length(pLista)) do
    aListaDireita[(nPosicao-nMeio)] := pLista[nPosicao];

  aListaEsquerda := MergeSort(aListaEsquerda);
  aListaDireita := MergeSort(aListaDireita);

  nPosicao := ZeroValue;
  nEsquerda := ZeroValue;
  nDireita := ZeroValue;

  while (Length(aListaEsquerda) <> nEsquerda) and (Length(aListaDireita) <> nDireita) do
  begin
    if (aListaEsquerda[nEsquerda] <= aListaDireita[nDireita]) then
    begin
      aListaSaida[nPosicao] := aListaEsquerda[nEsquerda];
      Inc(nEsquerda);
    end
    else
    begin
      aListaSaida[nPosicao] := aListaDireita[nDireita];
      Inc(nDireita);
    end;
    Inc(nPosicao);
  end;

  while (Length(aListaEsquerda) <> nEsquerda) do
  begin
    aListaSaida[nPosicao] := aListaEsquerda[nEsquerda];
    Inc(nEsquerda);
    Inc(nPosicao);
  end;

  while (Length(aListaDireita) <> nDireita) do
  begin
    aListaSaida[nPosicao] := aListaDireita[nDireita];
    Inc(nDireita);
    Inc(nPosicao);
  end;

  result := aListaSaida;
end;

begin
  repeat
    write('Informe uma lista de números inteiros separados por vírgula(,): ');
    readln(sListaEntrada);
  until Trim(sListaEntrada) <> EmptyStr;

  Writeln(ConverterArrayEmLista(MergeSort(ConverterListaEmArray(sListaEntrada))));
  Readln(sListaEntrada);
end.
