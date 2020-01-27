{
04 - Escreva uma aplicação console que receba uma lista de nomes completos
     (nome e sobrenome) informados pelo usuário. Estes nomes deverão ser convertidos
     para caixa-mista, ou seja, as iniciais de cada nome devem ser maiúsculas.
     Leve em consideração que as preposições (“de”, “do”, “dos”, ”e”, etc.)
     devem ser convertidas para minúsculas.

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
    writeln('Informe uma lista válida.');
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
