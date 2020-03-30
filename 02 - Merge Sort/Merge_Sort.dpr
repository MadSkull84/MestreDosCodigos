{
02 - Em uma aplicação console, construa um programa que leia uma lista de números
     informada pelo usuário. Em seguida, através do algoritmo merge-sort, faça a
     ordenação da lista e apresente o resultado.

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
    write('Informe uma lista de números inteiros separados por vírgula(,): ');
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
