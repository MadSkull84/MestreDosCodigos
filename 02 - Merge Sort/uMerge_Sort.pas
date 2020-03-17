unit uMerge_Sort;

interface

uses
  System.SysUtils,
  System.Math,
  System.StrUtils;

type
  TMerge_Sort = class
  private
    function ConverterIntegerArray(const pValor: string): TArray<Integer>;
    procedure Ordenar(var aListaEsquerda, aListaDireita, aListaSaida: TArray<Integer>);
    function MergeSort_Internal(const pLista: TArray<Integer>): TArray<Integer>;
  public
    function MergeSort(const pLista: string): string;
  end;

implementation

{ TMerge_Sort }

function TMerge_Sort.ConverterIntegerArray(
  const pValor: string): TArray<Integer>;
var
  sLista: TArray<String>;
  nLista: TArray<Integer>;
  nPosicao: integer;
begin
  sLista := SplitString(pValor, ',');
  SetLength(nLista, Length(sLista));
  for nPosicao := ZeroValue to High(sLista) do
  begin
    nLista[nPosicao] := sLista[nPosicao].ToInteger;
  end;
  result := nLista;
end;

procedure TMerge_Sort.Ordenar(var aListaEsquerda, aListaDireita, aListaSaida: TArray<Integer>);
var
  nPosicao: integer;
  nEsquerda: integer;
  nDireita: integer;
begin
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
end;

function TMerge_Sort.MergeSort_Internal(const pLista: TArray<Integer>): TArray<Integer>;
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

  aListaEsquerda := MergeSort_Internal(aListaEsquerda);
  aListaDireita := MergeSort_Internal(aListaDireita);

  Ordenar(aListaEsquerda, aListaDireita, aListaSaida);

  result := aListaSaida;
end;

function TMerge_Sort.MergeSort(const pLista: string): string;
var
  aListaEntrada: TArray<Integer>;
  aListaSaida: TArray<Integer>;
  iNumero: Integer;
begin
  aListaEntrada := ConverterIntegerArray(pLista);
  aListaSaida := MergeSort_Internal(aListaEntrada);
  for iNumero in aListaSaida do
  begin
    if Trim(Result) <> EmptyStr then
      Result := Result + ',';
    Result := Result + iNumero.ToString;
  end;
end;

end.
