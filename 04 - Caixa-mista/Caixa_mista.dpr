{
04 - Escreva uma aplica��o console que receba uma lista de nomes completos
     (nome e sobrenome) informados pelo usu�rio. Estes nomes dever�o ser convertidos
     para caixa-mista, ou seja, as iniciais de cada nome devem ser mai�sculas.
     Leve em considera��o que as preposi��es (�de�, �do�, �dos�, �e�, etc.)
     devem ser convertidas para min�sculas.

Autor: Eder Correia Lira
}

program Caixa_mista;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uCaixaMista in 'uCaixaMista.pas';

var
  sListaNomesEntrada: string;
  oCaixaMista: TCaixaMista;

function ListaEhValida(const pValor: string): boolean;
begin
  result := Trim(pValor) <> EmptyStr;
  if not result then
  begin
    writeln('Informe uma lista v�lida.');
    writeln(EmptyStr);
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  repeat
    write('Informe uma lista de nomes separados por ";": ');
    readln(sListaNomesEntrada);
  until ListaEhValida(sListaNomesEntrada);

  oCaixaMista := TCaixaMista.Create;
  try
    writeln(oCaixaMista.AplicarCaixaMista(sListaNomesEntrada));
  finally
    readln;
    FreeAndNil(oCaixaMista);
  end;
end.
