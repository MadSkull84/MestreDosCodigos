{
16 - Construa uma aplica��o VCL. Esta aplica��o dever� conter uma classe que,
     utilizando RTTI, fa�a a listagem das propriedades e m�todos de qualquer
     classe passada por par�metro. A apresenta��o da listagem fica por sua conta.

Autor: Eder Correia Lira
}

unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTelaPrincipal = class(TForm)
    edtClasse: TEdit;
    btnListar: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    lblClasse: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

uses
  uListaPropMet;

{$R *.dfm}

procedure TfrmTelaPrincipal.btnListarClick(Sender: TObject);
var
  oListaPropMet: TListaPropMet;
begin
  oListaPropMet := TListaPropMet.Create(edtClasse.Text);
  try
    Memo1.Clear;
    Memo1.Lines.Text := oListaPropMet.ListaPropriedades.Text;

    Memo2.Clear;
    Memo2.Lines.Text := oListaPropMet.ListaMetodos.Text;
  finally
    FreeAndNil(oListaPropMet);
  end;
end;

end.
