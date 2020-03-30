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
  nPosicaoSaida: integer;
begin
  nPosicaoSaida := ZeroValue;

  while (Length(aListaEsquerda) > ZeroValue) and (Length(aListaDireita) > ZeroValue) do
  begin
    if aListaEsquerda[ZeroValue] <= aListaDireita[ZeroValue] then
    begin
      aListaSaida[nPosicaoSaida] := aListaEsquerda[ZeroValue];
      Inc(nPosicaoSaida);
      for nPosicao := Low(aListaEsquerda) to Pred(High(aListaEsquerda)) do
        aListaEsquerda[nPosicao] := aListaEsquerda[Succ(nPosicao)];
      SetLength(aListaEsquerda, Pred(Length(aListaEsquerda)));
    end
    else
    begin
      aListaSaida[nPosicaoSaida] := aListaDireita[ZeroValue];
      Inc(nPosicaoSaida);
      for nPosicao := Low(aListaDireita) to Pred(High(aListaDireita)) do
        aListaDireita[nPosicao] := aListaDireita[Succ(nPosicao)];
      SetLength(aListaDireita, Pred(Length(aListaDireita)));
    end;
  end;

  if Length(aListaEsquerda) > ZeroValue then
    for nPosicao := Low(aListaEsquerda) to High(aListaEsquerda) do
      aListaSaida[nPosicaoSaida + nPosicao] := aListaEsquerda[nPosicao];

  nPosicaoSaida := nPosicaoSaida + Length(aListaEsquerda);

  if Length(aListaDireita) > ZeroValue then
    for nPosicao := Low(aListaDireita) to High(aListaDireita) do
      aListaSaida[nPosicaoSaida + nPosicao] := aListaDireita[nPosicao];
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
