{
07 - Escreva uma DLL que transcreva um dado n�mero por extenso.
     Construa um programa console que fa�a o carregamento est�tico da DLL.
     Neste programa, o usu�rio poder� entrar com um n�mero qualquer e,
     como sa�da, o programa dever� transcrever o n�mero por extenso em tela.

Autor: Eder Correia Lira
}

program Extenso;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Math;

function NumeroPorExtenso(const pValor: currency): string;
  external 'Extenso_dll.dll';

function LerValor: Extended;
var
  sValor: string;
begin
  repeat
    Write('Informe o n�mero v�lido entre 0,00 e 999,99: ');
    Readln(sValor);
    Result := StrToCurrDef(sValor, ZeroValue);
  until (result >= ZeroValue) and (result < 1000);
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  Writeln(NumeroPorExtenso(LerValor));

  readln;
end.
