{
12 - Criar um Class Helper para a classe TStringList com as seguintes fun��es:
     * IsEmpty: Verifica se lista est� vazia;
     * HasDuplicate: Verifica se a lista cont�m valores duplicados;
     * ToJSON: Verifica se o conte�do da Lista est� no formato Nome=Valor.
       Caso esteja, transforme o conte�do conforme a nota��o JSON e
       retorne como string (n�o � necess�rio utilizar as classes nativas neste momento).
       Caso n�o esteja, lance uma exce��o informando que n�o foi poss�vel
       converter o conte�do.

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
      Writeln('� vazio');
    if oStringListHelper.HasDuplicate then
      Writeln('Tem duplicados');
    Writeln(oStringListHelper.ToJSON);
    Readln;
  finally
    FreeAndNil(oStringListHelper);
  end;
end.
