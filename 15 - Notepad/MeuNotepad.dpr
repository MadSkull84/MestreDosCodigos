{
15 - Crie uma aplica��o console. Em uma unit, crie uma classe TNotepad,
     com o m�todo Executar. Este m�todo dever� abrir o bloco de notas para
     o usu�rio. Em outro arquivo, escreva a classe TCriadorMagico que,
     utilizando RTTI, construa uma inst�ncia de TNotepad de forma din�mica,
     apenas pelo seu QualifiedClassName, sem adicion�-la � se��o uses.
     Na unit do projeto, crie uma inst�ncia de TCriadorMagico para abrir o
     bloco de notas.

Autor: Eder Correia Lira
}

program MeuNotepad;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uNotePad in 'uNotePad.pas',
  uCriadorMagico in 'uCriadorMagico.pas';

var
  oCriadorMagico: TCriadorMagico;

begin
  ReportMemoryLeaksOnShutdown := True;
  oCriadorMagico := TCriadorMagico.Create;
  try
    writeln('Tecle "Enter" para abrir o Notepad');
    readln;
    oCriadorMagico.AbrirNotePad;
  finally
    FreeAndNil(oCriadorMagico);
  end;
end.
