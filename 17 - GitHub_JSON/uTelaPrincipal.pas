unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  REST.JSON, REST.Client, REST.Types, uRepositorio;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  oRESTClient: TRESTClient;
  oRESTRequest: TRESTRequest;
  oRESTResponse: TRESTResponse;
  oRepositorios: TRepositorios;
  oRepositorio: TRepositorio;
begin
  oRESTClient := TRESTClient.Create(EmptyStr);
  oRESTClient.BaseURL := 'https://api.github.com';

  oRESTResponse := TRESTResponse.Create(nil);

  oRESTRequest := TRESTRequest.Create(nil);
  oRESTRequest.Client := oRESTClient;
  oRESTRequest.Response := oRESTResponse;
  oRESTRequest.Method := rmGET;
  oRESTRequest.Resource := 'search';
  oRESTRequest.ResourceSuffix := 'repositories?q=mestre';

  oRESTRequest.Execute;

  oRepositorios := TJSON.JsonToObject<TRepositorios>(oRESTResponse.JSONValue.ToJSON);

  Memo1.Clear;

  for oRepositorio in oRepositorios.Repositorios do
  begin
    Memo1.Lines.Add(oRepositorio.Id.ToString);
    Memo1.Lines.Add(oRepositorio.Name);
    Memo1.Lines.Add(oRepositorio.Url);
    Memo1.Lines.Add(oRepositorio.Description);
    Memo1.Lines.Add(EmptyStr);
    Memo1.Lines.Add(EmptyStr);
  end;

  FreeAndNil(oRepositorios);
  FreeAndNil(oRESTRequest);
  FreeAndNil(oRESTResponse);
  FreeAndNil(oRESTClient);
end;

end.
