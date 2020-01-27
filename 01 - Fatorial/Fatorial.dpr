{
01 - Em uma aplica��o console, construa um programa que fa�a o c�lculo fatorial
     do n�mero informado pelo usu�rio.

Autor: Eder Correia Lira
}

program Fatorial;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Math,
  uFatorial in 'uFatorial.pas';

var
  sValor: string;
  nValor: integer;
  nFatorial: extended;
  oFatorial: TFatorial;


function ValorEhValido(const pValor: integer): boolean;
begin
  result := (pValor >= PositiveValue) and (pValor <= 15);
  if not result then
  begin
    writeln('Informe um valor v�lido.');
    writeln(EmptyStr);
  end
  else
    nValor := pValor;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  repeat
    write('Informe um valor maior que 0(zero) e menor ou igual a 15(quinze): ');
    readln(sValor);
  until ValorEhValido(StrToIntDef(sValor,ZeroValue));

  try
    oFatorial := TFatorial.Create;
    nFatorial := oFatorial.FatorialDe(nValor);
    writeln(Format('Fatorial de "%0d" � %0.0f',[nValor,nFatorial]));
    readln;
  finally
    FreeAndNil(oFatorial);
  end;
end.
