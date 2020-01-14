{
13 - Crie uma Interface com um m�todo de leitura de arquivos (LerDoArquivo) e
     outra Interface com um m�todo de escrita de arquivos (SalvarParaArquivo).
     Escreva uma classe que implemente essas duas Interfaces, cujos m�todos
     devem carregar e salvar o conte�do dessa classe.
     Dica: O conte�do pode ser uma TStringList.

Autor: Eder Correia Lira
}

program InterfaceLEArquivo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uLerArquivo in 'uLerArquivo.pas',
  uSalvarArquivo in 'uSalvarArquivo.pas',
  uLEArquivo in 'uLEArquivo.pas';

var
  oLEArquivo: TLEArquivo;

begin
  ReportMemoryLeaksOnShutdown := True;
  oLEArquivo :=  TLEArquivo.Create;
  try
    Writeln('Alimentado dados no arquivo');
    oLEArquivo.Arquivo.Add('Teste de leitura e escrita em arquivo');
    Writeln('Salvando arquivo');
    Readln;
    oLEArquivo.SalvarParaArquivo;
    Writeln('Carregando arquivo');
    Readln;
    oLEArquivo.LerDoArquivo;
    Writeln('Conte�do do arquivo:');
    Writeln(oLEArquivo.Arquivo.Text);
    Readln;
  finally
    FreeAndNil(oLEArquivo);
  end;
end.
