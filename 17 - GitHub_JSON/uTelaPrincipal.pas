{
17 - A partir de uma sentença digitada pelo usuário, execute a pesquisa na API
     do GitHub (https://api.github.com/search/repositories?q="busca"),
     substituindo o texto "busca" pela entrada do usuário.
     Carregue a resposta da API em um objeto com os seguintes
     campos: id, name, html_url e description.
     Por fim, liste todas as ocorrências encontradas para o usuário.
     A aplicação pode ser console ou VCL.

Autor: Eder Correia Lira
}

unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, REST.JSON, REST.Client, REST.Types, uRepositorio;

type
  TfrmTelaPrincipal = class(TForm)
    btnFiltrar: TButton;
    memResultado: TMemo;
    edtFiltro: TEdit;
    lbFiltro: TLabel;
    lblResultado: TLabel;
    procedure btnFiltrarClick(Sender: TObject);
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRepositorios: TRepositorios;
    procedure InicializarObjetos(var oRESTClient: TRESTClient; var oRESTResponse: TRESTResponse; var oRESTRequest: TRESTRequest);
    procedure FinalizarObjetos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

{$R *.dfm}

procedure TfrmTelaPrincipal.btnFiltrarClick(Sender: TObject);
var
  oRepositorio: TRepositorio;
begin
  InicializarObjetos(FRESTClient, FRESTResponse, FRESTRequest);
  try
    fRESTRequest.ResourceSuffix := 'repositories?q=' + edtFiltro.Text;
    FRESTRequest.Execute;

    FRepositorios := TJSON.JsonToObject<TRepositorios>(FRESTResponse.JSONValue.ToJSON);

    memResultado.Clear;
    for oRepositorio in FRepositorios.Repositorios do
    begin
      memResultado.Lines.Add(oRepositorio.Id.ToString);
      memResultado.Lines.Add(oRepositorio.Name);
      memResultado.Lines.Add(oRepositorio.Html_Url);
      memResultado.Lines.Add(oRepositorio.Description);
      memResultado.Lines.Add(EmptyStr);
      memResultado.Lines.Add(EmptyStr);
    end;
  finally
    FinalizarObjetos;
  end;
end;

procedure TfrmTelaPrincipal.InicializarObjetos;
begin
  FRESTClient := TRESTClient.Create(EmptyStr);
  FRESTClient.BaseURL := 'https://api.github.com';

  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest := TRESTRequest.Create(nil);
  FRESTRequest.Client := oRESTClient;
  FRESTRequest.Response := oRESTResponse;
  FRESTRequest.Method := rmGET;
  FRESTRequest.Resource := 'search';
end;

procedure TfrmTelaPrincipal.FinalizarObjetos;
begin
  FreeAndNil(FRepositorios);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  FreeAndNil(FRESTClient);
end;

end.
