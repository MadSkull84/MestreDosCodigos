program CacheFuncionario;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFuncionario in 'uFuncionario.pas',
  uCacheObjetos in 'uCacheObjetos.pas';

var
  oFuncionario1: TFuncionario;
  oFuncionario2: TFuncionario;
  oCacheObjetos: TCacheObjetos;

procedure ListaDados(const pFuncionario: TFuncionario);
begin
  Writeln(pFuncionario.Nome);
  Writeln(pFuncionario.Email);
  Writeln(pFuncionario.Telefone);
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  oCacheObjetos := TCacheObjetos.Create;
  try
    Writeln('Criando funcionario 1 e alimentando dados');
    oFuncionario1 := oCacheObjetos.PegarInstancia<TFuncionario>;
    oFuncionario1.Nome     := 'Eder';
    oFuncionario1.Email    := 'a@a.com';
    oFuncionario1.Telefone := '(88)88888-8888';
    ListaDados(oFuncionario1);

    Writeln('Criando funcionario 2');
    oFuncionario2 := oCacheObjetos.PegarInstancia<TFuncionario>;
    Readln;

    Writeln('Alterando dado do funcionario 2');
    oFuncionario2.Nome := 'Eder Lira';
    Writeln(oFuncionario2.Nome);
    Readln;

    Writeln('Dados funcionario 1:');
    ListaDados(oFuncionario1);

    Writeln('Dados funcionario 2:');
    ListaDados(oFuncionario2);
  finally
    oCacheObjetos.Free;
  end;
end.
