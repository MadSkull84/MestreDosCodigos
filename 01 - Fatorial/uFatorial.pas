unit uFatorial;

interface

uses System.Math;

type
  TFatorial = class
  private
    function CalcularFatorial(const pValor: integer): extended;
  public
    function FatorialDe(const pValor: integer): extended;
  end;

implementation

{ TFatorial }

function TFatorial.CalcularFatorial(const pValor: integer): extended;
begin
  if Pred(pValor) = ZeroValue then
  Exit(pValor);

  result := pValor * CalcularFatorial(Pred(pValor));
end;

function TFatorial.FatorialDe(const pValor: integer): extended;
begin
  result := CalcularFatorial(pValor);
end;

end.
