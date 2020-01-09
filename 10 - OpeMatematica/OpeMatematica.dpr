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
    writeln('Informe uma op��o v�lida.');
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
    writeln('2 - Subtra��o');
    writeln('3 - Multiplica��o');
    writeln('4 - Divis�o');
    write('Informe a opera��o desejada: ');
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
