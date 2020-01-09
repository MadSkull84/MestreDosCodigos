library Extenso_dll;

uses
  System.SysUtils,
  System.Classes,
  uExtenso in 'uExtenso.pas';

{$R *.res}

function NumeroPorExtenso(const pValor: currency): string;
var
  oExtenso: TExtenso;
begin
  oExtenso:= TExtenso.Create;
  try
    result := oExtenso.NumeroPorExtenso(pValor);
  finally
    oExtenso.Free;
  end;
end;

exports
  NumeroPorExtenso;

begin
end.
