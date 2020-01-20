program XML_DB;

uses
  Vcl.Forms,
  uTelaPrincipal in 'uTelaPrincipal.pas' {frmTelaPrincipal},
  EXE_19_XML in 'EXE_19_XML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.Run;
end.
