program GitHubJSON;

uses
  Vcl.Forms,
  uTelaPrincipal in 'uTelaPrincipal.pas' {Form2},
  uRepositorio in 'uRepositorio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
