unit uContinente;

interface

type
  TContinente = (cAfrica, cAntartida, cAmerica, cAsia , cEuropa, cOceania);

  TContinenteHelper = record helper for TContinente
    function AsLabel: string;
    function AsString: string;
    function AsByte: smallInt;
    function Parse(const pValor: smallInt): TContinente;
  end;

implementation

uses
  System.SysUtils;

{ TContinenteHelper }

function TContinenteHelper.AsLabel: string;
begin
  result := 'Continente indefinido';
  case Self of
    cAfrica: result := 'Africa';
    cAntartida: result :=  'Antártida';
    cAmerica: result := 'América';
    cAsia: result := 'Ásia';
    cEuropa: result := 'Europa';
    cOceania: result := 'Oceânia';
  end;
end;

function TContinenteHelper.AsString: string;
begin
  result := EmptyStr;
  case Self of
    cAfrica: result := 'cAfrica';
    cAntartida: result :=  'cAntartida';
    cAmerica: result := 'cAmerica';
    cAsia: result := 'cAsia';
    cEuropa: result := 'cEuropa';
    cOceania: result := 'cOceania';
  end;
end;

function TContinenteHelper.AsByte: smallInt;
begin
  result := smallint(Self);
end;

function TContinenteHelper.Parse(const pValor: smallint): TContinente;
begin
  result := TContinente(pValor);
end;

end.
