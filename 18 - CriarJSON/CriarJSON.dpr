program CriarJSON;

uses
  Vcl.Forms,
  uTelaPrincipal in 'uTelaPrincipal.pas' {frmTelaPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.Run;
end.
