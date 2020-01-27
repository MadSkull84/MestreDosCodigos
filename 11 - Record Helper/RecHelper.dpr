{
11 - Em uma aplicação console, crie um tipo enumerado que represente os continentes.
     Construa um Record Helper para este tipo com os seguintes métodos:
     * AsLabel: com uma descrição amigável ao usuário;
     * AsString: com o nome do Enum;
     * AsByte: com a representação numérica do Enum;
     * Parse: que transforme um Byte no Enum.

Autor: Eder Correia Lira
}

program RecHelper;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uContinente in 'uContinente.pas';

var
  eContinente: TContinente;

begin
  ReportMemoryLeaksOnShutdown := True;

  eContinente := cAmerica;
  writeln('Label: ' + eContinente.AsLabel);
  writeln('String: ' + eContinente.AsString);
  writeln('Byte: ' + eContinente.AsByte.ToString);
  writeln('Parse: ' + eContinente.Parse(cEuropa.AsByte).AsLabel);
  Readln;
end.
