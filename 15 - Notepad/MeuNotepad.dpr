{
15 - Crie uma aplicação console. Em uma unit, crie uma classe TNotepad,
     com o método Executar. Este método deverá abrir o bloco de notas para
     o usuário. Em outro arquivo, escreva a classe TCriadorMagico que,
     utilizando RTTI, construa uma instância de TNotepad de forma dinâmica,
     apenas pelo seu QualifiedClassName, sem adicioná-la à seção uses.
     Na unit do projeto, crie uma instância de TCriadorMagico para abrir o
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
