program ListaDadosClasse;

uses
  Vcl.Forms,
  uTelaPrincipal in 'uTelaPrincipal.pas' {frmTelaPrincipal},
  uListaPropMet in 'uListaPropMet.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.Run;
end.
