{
19 - Faça o download do XML. Crie um projeto VCL no Delphi.
     Utilizando o assistante XML Data Binding, faça a leitura do XML previamente
     baixado. Leia o conteúdo do XML nas classes geradas e o apresente em um
     componente TMemo no seguinte formato:

    ID: 3
    Nome: Tanyahbbhvvg
    Sobrenome: Koch
    Gênero: female
    Data de Nascimento: 22/09/1976
    E-mail: clangosh@example.com
    Telefone: 1-440-621-2581 x967
    Website: http://www.halvorson.com/rerum-soluta-dolores-delectus-inventore-rem-architecto
    Endereço: 812 Terry Wall Alvahchester, ID 41791-2432
    Status: active
    Link (HATEOAS):
    |_ Recurso: https://gorest.co.in/public-api/users/3
    |_ Editar: https://gorest.co.in/public-api/users/3
    |_ Avatar: https://lorempixel.com/250/250/people/?23168

Autor: Eder Correia Lira
}

unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTelaPrincipal = class(TForm)
    btnCarregar: TButton;
    memDados: TMemo;
    procedure btnCarregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

{$R *.dfm}

uses EXE_19_XML;

procedure TfrmTelaPrincipal.btnCarregarClick(Sender: TObject);
var
  oIXMLResponseType: IXMLResponseType;
  nPosicao: integer;
begin
  oIXMLResponseType := Loadresponse(ExtractFilePath(Application.ExeName) + 'EXE_19_XML.xml');
  memDados.Clear;
  for nPosicao := 0 to oIXMLResponseType.Result.Count - 1 do
  begin
    memDados.Lines.Add('ID: ' + oIXMLResponseType.Result.Item[nPosicao].Id.ToString);
    memDados.Lines.Add('Nome: ' + oIXMLResponseType.Result.Item[nPosicao].First_name);
    memDados.Lines.Add('Sobrenome: ' + oIXMLResponseType.Result.Item[nPosicao].Last_name);
    memDados.Lines.Add('Gênero: ' + oIXMLResponseType.Result.Item[nPosicao].Gender);
    memDados.Lines.Add('Data de Nascimento: ' + oIXMLResponseType.Result.Item[nPosicao].Dob);
    memDados.Lines.Add('E-mail: ' + oIXMLResponseType.Result.Item[nPosicao].Email);
    memDados.Lines.Add('Telefone: ' + oIXMLResponseType.Result.Item[nPosicao].Phone);
    memDados.Lines.Add('Website: ' + oIXMLResponseType.Result.Item[nPosicao].Website);
    memDados.Lines.Add('Endereço:' + oIXMLResponseType.Result.Item[nPosicao].Address);
    memDados.Lines.Add('Status: ' + oIXMLResponseType.Result.Item[nPosicao].Status);
    memDados.Lines.Add('Link (HATEOAS):');
    memDados.Lines.Add('|_ Recurso: ' + oIXMLResponseType.Result.Item[nPosicao]._links.Self.Href);
    memDados.Lines.Add('|_ Editar: ' + oIXMLResponseType.Result.Item[nPosicao]._links.Edit.Href);
    memDados.Lines.Add('|_ Avatar: ' + oIXMLResponseType.Result.Item[nPosicao]._links.Edit.Href);
    memDados.Lines.Add(EmptyStr);
  end;
end;

end.
