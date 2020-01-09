{
06 - Escreva uma DLL que execute os seguintes c�lculos geom�tricos:
     �rea de um tri�ngulo, �rea do c�rculo e �rea do ret�ngulo/quadrado.
     Construa um programa console que carregue a DLL de forma din�mica.
     Neste programa, o usu�rio deve entrar com o tipo de c�lculo que deseja
     executar e os valores referentes ao c�lculo.
     No final da execu��o, o resultado deve ser apresentado em tela.

Autor: Eder Correia Lira
}

program CalcGeometricos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uCalcularArea in 'uCalcularArea.pas';

var
  sOpcao: string;
  oCalcularArea: TCalcularArea;

function OpcaoEhValida(const pValor: string): boolean;
begin
  result := (StrToIntDef(pValor, ZeroValue) > ZeroValue);
  if not result then
  begin
    writeln('Informe uma op��o v�lida.');
    writeln(EmptyStr);
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  repeat
    writeln('1 - �rea Tri�ngulo');
    writeln('2 - �rea C�rculo');
    writeln('3 - �rea Quadrado\Ret�ngulo');
    write('Informe a opera��o desejada: ');
    readln(sOpcao);
  until OpcaoEhValida(sOpcao);

  writeln;

  oCalcularArea := TCalcularArea.Create;
  try
    case StrToInt(sOpcao) of
      1 : oCalcularArea.CalcularAreaTriangulo;
      2 : oCalcularArea.CalcularAreaCirculo;
      3 : oCalcularArea.CalcularAreaQuadrilatero;
    end;
  finally
    FreeAndNil(oCalcularArea);
  end;
end.
