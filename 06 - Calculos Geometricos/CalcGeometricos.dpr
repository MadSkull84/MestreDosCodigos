{
06 - Escreva uma DLL que execute os seguintes cálculos geométricos:
     área de um triângulo, área do círculo e área do retângulo/quadrado.
     Construa um programa console que carregue a DLL de forma dinâmica.
     Neste programa, o usuário deve entrar com o tipo de cálculo que deseja
     executar e os valores referentes ao cálculo.
     No final da execução, o resultado deve ser apresentado em tela.

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
    writeln('Informe uma opção válida.');
    writeln(EmptyStr);
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  repeat
    writeln('1 - Área Triângulo');
    writeln('2 - Área Círculo');
    writeln('3 - Área Quadrado\Retângulo');
    write('Informe a operação desejada: ');
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
