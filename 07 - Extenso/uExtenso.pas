unit uExtenso;

interface

type
  TExtenso = class
  private
    function EhDez(const pValor: currency): boolean;
    function RetornaExtenso(const pValor: currency; const pCasa: integer): string;
  public
    function NumeroPorExtenso(const pValor: currency): string;
  end;

implementation

uses
 System.SysUtils,
 System.Math;

const
  cE       = 'e';
  cEspaco  = ' ';
  cReal    = 'real(ais)';
  cCentavo = 'centavo(s)';

{ TExtenso }

function TExtenso.EhDez(const pValor: currency): boolean;
begin
  result := (pValor >= 11) and (pValor <= 19);
end;

function TExtenso.RetornaExtenso(const pValor: currency; const pCasa: integer): string;
const
  Unidades: TArray<string> = ['um', 'dois', 'três','quatro','cinco',
  'seis', 'sete', 'oito','nove'];
  Dez     : TArray<string> = ['onze', 'doze', 'treze', 'quatorze',
  'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove'];
  Dezenas : TArray<string> = ['dez', 'vinte', 'trinta',
  'quarenta', 'cinqüenta', 'sessenta', 'setenta', 'oitenta', 'noventa'];
  Centenas: TArray<string> = ['cento', 'duzentos', 'trezentos',
  'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos',
  'novecentos'];
var
  nPosicao: integer;
  nCasas: integer;
  nValor: extended;
begin
  if (pValor <= ZeroValue) then
    exit(EmptyStr);

  nPosicao := StrToInt(Copy(FloatToStr(pValor),ZeroValue,1));
  nCasas := Length(FloatToStr(pValor));

  if nCasas = 1 then
    result := Unidades[Pred(nPosicao)]
  else if nCasas = 2 then
  begin
    if EhDez(pValor) then
      result := Dez[Trunc(pValor) - 11]
    else
      result := Dezenas[Pred(nPosicao)]
  end
  else
   result := Centenas[Pred(nPosicao)];

  if not EhDez(pValor) then
    nValor:= pValor - (nPosicao * Power(10, Pred(nCasas)))
  else
    nValor := ZeroValue;

  result := result + cEspaco + cE + cEspaco + RetornaExtenso(nValor, Pred(nCasas));

  if (nValor <= ZeroValue) then
    result := Copy(result, ZeroValue, Length(result) - 3);
end;

function TExtenso.NumeroPorExtenso(const pValor: currency): string;
var
  nInteiro: integer;
  nCentavo: integer;
  sExtensoInteiro: string;
  sExtensoCentavo: string;
  sExtenso: string;
begin
  sExtensoInteiro := EmptyStr;
  sExtensoCentavo := EmptyStr;

  nInteiro := Trunc(pValor);
  nCentavo := Trunc((pValor - nInteiro) * 100);

  if nInteiro > ZeroValue then
    sExtensoInteiro := RetornaExtenso(nInteiro, Length(FloatToStr(pValor))) + cEspaco + cReal;

  if nCentavo > ZeroValue then
    sExtensoCentavo := RetornaExtenso(nCentavo, Length(FloatToStr(pValor))) + cEspaco + cCentavo;

  sExtenso := sExtensoInteiro;
  if sExtensoCentavo <> EmptyStr then
  begin
    if sExtenso <> EmptyStr then
      sExtenso := sExtenso + cEspaco + cE + cEspaco;
    sExtenso := sExtenso + sExtensoCentavo;
  end;

  if sExtenso = EmptyStr then
    sExtenso := 'zero' + cEspaco + cReal;

  Result := sExtenso;
end;

end.
