{
10 - Em uma aplicação console, crie uma classe que executará operações
     matemáticas, chamada TClasseMatematica.
     Ela terá duas propriedades do tipo double, chamadas Esquerda e Direita,
     e também uma propriedade que receberá um método anônimo que referencie
     uma function, com retorno do tipo double
     (crie o tipo com o nome TOperacaoMatematica).
     A aplicação solicitará ao usuário qual operação deve ser executada
     (+ - * /) e os números da operação (Esquerda e Direita).
     De acordo com a entrada do usuário, a operação matemática correta será
     executada através de um método anônimo, presente na propriedade do tipo
     TOperacaoMatematica.

Autor: Eder Correia Lira
}

program OpeMatematica;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uClasseMatematica in 'uClasseMatematica.pas';

var
  oClasseMatematica: TClasseMatematica;
  sOpcao: string;

function OpcaoEhValida(const pValor: string): boolean;
begin
  result := (StrToIntDef(pValor, ZeroValue) > ZeroValue);
  if not result then
  begin
    writeln('Informe uma opção válida.');
    writeln(EmptyStr);
  end;
end;

function LerValor(const pDescricao: string): double;
var
  sValor: string;
  nValor: double;
begin
  repeat
    Write(pDescricao + ': ');
    Readln(sValor);
    nValor := StrToFloatDef(sValor, ZeroValue);
  until nValor <> ZeroValue;
  result := nValor;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  repeat
    writeln('1 - Soma');
    writeln('2 - Subtração');
    writeln('3 - Multiplicação');
    writeln('4 - Divisão');
    write('Informe a operação desejada: ');
    readln(sOpcao);
  until OpcaoEhValida(sOpcao);

  oClasseMatematica := TClasseMatematica.Create;
  try
    oClasseMatematica.Esquerda := LerValor('Esquerda');
    oClasseMatematica.Direita := LerValor('Direita');
    case sOpcao.ToInteger of
      1 : oClasseMatematica.OperacaoMatematica := function: double begin result := oClasseMatematica.Esquerda + oClasseMatematica.Direita end;
      2 : oClasseMatematica.OperacaoMatematica := function: double begin result := oClasseMatematica.Esquerda - oClasseMatematica.Direita end;
      3 : oClasseMatematica.OperacaoMatematica := function: double begin result := oClasseMatematica.Esquerda * oClasseMatematica.Direita end;
      4 : oClasseMatematica.OperacaoMatematica := function: double begin result := oClasseMatematica.Esquerda / oClasseMatematica.Direita end;
    end;
    Writeln('Resultado: ' + oClasseMatematica.OperacaoMatematica.ToString);
    readln;
  finally
    FreeAndNil(oClasseMatematica);
  end;
end.
