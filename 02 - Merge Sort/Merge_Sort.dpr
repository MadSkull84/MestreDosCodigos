{
02 - Em uma aplica��o console, construa um programa que leia uma lista de n�meros
     informada pelo usu�rio. Em seguida, atrav�s do algoritmo merge-sort, fa�a a
     ordena��o da lista e apresente o resultado.

Autor: Eder Correia Lira
}

program Merge_Sort;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  System.StrUtils,
  uMerge_Sort in 'uMerge_Sort.pas';

var
  sListaEntrada: string;
  oMerge_Sort: TMerge_Sort;

begin
  ReportMemoryLeaksOnShutdown := True;

  repeat
    write('Informe uma lista de n�meros inteiros separados por v�rgula(,): ');
    readln(sListaEntrada);
  until Trim(sListaEntrada) <> EmptyStr;

  oMerge_Sort := TMerge_Sort.Create;
  try
    Writeln(oMerge_Sort.MergeSort(sListaEntrada));
    Readln;
  finally
    FreeAndNil(oMerge_Sort);
  end;
end.
