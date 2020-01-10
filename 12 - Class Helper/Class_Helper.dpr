{
12 - Criar um Class Helper para a classe TStringList com as seguintes funções:
     * IsEmpty: Verifica se lista está vazia;
     * HasDuplicate: Verifica se a lista contém valores duplicados;
     * ToJSON: Verifica se o conteúdo da Lista está no formato Nome=Valor.
       Caso esteja, transforme o conteúdo conforme a notação JSON e
       retorne como string (não é necessário utilizar as classes nativas neste momento).
       Caso não esteja, lance uma exceção informando que não foi possível
       converter o conteúdo.

Autor: Eder Correia Lira
}

program Class_Helper;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Classes,
  uStringListHelper in 'uStringListHelper.pas';

var
  oStringListHelper: TStringList;

begin
  ReportMemoryLeaksOnShutdown := True;

  oStringListHelper := TStringList.Create;
  try
    oStringListHelper.Add('Nome=Eder');
    oStringListHelper.Add('Nome=Eder');
    oStringListHelper.Add('SobreNome=Lira');
    oStringListHelper.Add('Idade=35');
    if oStringListHelper.IsEmpty then
      Writeln('É vazio');
    if oStringListHelper.HasDuplicate then
      Writeln('Tem duplicados');
    Writeln(oStringListHelper.ToJSON);
    Readln;
  finally
    FreeAndNil(oStringListHelper);
  end;
end.
