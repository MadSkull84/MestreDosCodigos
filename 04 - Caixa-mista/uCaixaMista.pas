unit uCaixaMista;

interface

uses System.SysUtils, System.StrUtils, System.Math;

type
  TCaixaMista = class
  private
    function EhPreposicao(const pValor: string): boolean;
    function AplicaPrimeiraMaiuscula(const pValor: string): string;
    function CaixaMista(const pValor: string): string;
  public
    function AplicarCaixaMista(const pValor: string): string;
  end;

implementation

{ TCaixaMista }

function TCaixaMista.EhPreposicao(const pValor: string): boolean;
begin
  result := MatchStr(pValor.ToLower, ['de','da','do','das','dos']);
end;

function TCaixaMista.AplicaPrimeiraMaiuscula(const pValor: string): string;
begin
  result :=  string(pValor[PositiveValue]).ToUpper + string(Copy(pValor,2)).ToLower;
end;

function TCaixaMista.CaixaMista(const pValor: string): string;
var
  sNomes: TArray<string>;
  nPosicao: integer;
begin
  result := EmptyStr;
  sNomes := SplitString(pValor, ' ');
  for nPosicao := ZeroValue to High(sNomes) do
  begin
    if EhPreposicao(sNomes[nPosicao])  then
      result := result + Trim(sNomes[nPosicao].ToLower) + ' '
    else
      result := result + Trim(AplicaPrimeiraMaiuscula(sNomes[nPosicao])) + ' ';
  end;
end;

function TCaixaMista.AplicarCaixaMista(const pValor: string): string;
var
  sListaNomes: TArray<string>;
  nPosicao: integer;
begin
  sListaNomes := SplitString(pValor, ';');
  for nPosicao := ZeroValue to High(sListaNomes) do
  begin
    if Trim(result) <> EmptyStr then
      result := result + #10#13;
    result := result + CaixaMista(sListaNomes[nPosicao]);
  end;
end;

end.
