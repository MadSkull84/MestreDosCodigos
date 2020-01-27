{
07 - Escreva uma DLL que transcreva um dado número por extenso.
     Construa um programa console que faça o carregamento estático da DLL.
     Neste programa, o usuário poderá entrar com um número qualquer e,
     como saída, o programa deverá transcrever o número por extenso em tela.

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
    Write('Informe o número válido entre 0,00 e 999,99: ');
    Readln(sValor);
    Result := StrToCurrDef(sValor, ZeroValue);
  until (result >= ZeroValue) and (result < 1000);
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  Writeln(NumeroPorExtenso(LerValor));

  readln;
end.
