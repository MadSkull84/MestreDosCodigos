{
20 - Construa uma aplicação VCL e carregue o XML do exercício anterior.
     Sem alterar a estrutura base do XML, construa uma tela onde seja possível:
     * Navegar entre os registros;
     * Adicionar, remover e alterar os valores de cada campo;
     * Salvar as modificações em arquivo, mantendo a estrutura original.

Autor: Eder Correia Lira
}

unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, EXE_19_XML,
  Vcl.ComCtrls;

type
  TfrmTelaPrincipal = class(TForm)
    pnlTop: TPanel;
    pnlClient: TPanel;
    pnlBotton: TPanel;
    edtID: TEdit;
    lblID: TLabel;
    edtNome: TEdit;
    lblNome: TLabel;
    edtSobreNome: TEdit;
    lblSobreNome: TLabel;
    btAnterior: TSpeedButton;
    btProximo: TSpeedButton;
    edtDataNascimento: TDateTimePicker;
    lblDataNascimento: TLabel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    edtWebsite: TEdit;
    lblWebsite: TLabel;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    cbGenero: TComboBox;
    lblGenero: TLabel;
    cbStatus: TComboBox;
    lblStatus: TLabel;
    GroupBox1: TGroupBox;
    lblRecurso: TLabel;
    edtRecurso: TEdit;
    lblEditar: TLabel;
    edtEditar: TEdit;
    lblAvatar: TLabel;
    edtAvatar: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
  private
    { Private declarations }
    FPosicaoAtual: integer;
    FoIXMLResponseType: IXMLResponseType;
    procedure CarregaDados(const nPosicao: integer);
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

uses
  System.Math;

{$R *.dfm}

procedure TfrmTelaPrincipal.btAnteriorClick(Sender: TObject);
begin
  if FPosicaoAtual > ZeroValue then
    FPosicaoAtual := Pred(FPosicaoAtual);
  CarregaDados(FPosicaoAtual);
end;

procedure TfrmTelaPrincipal.btProximoClick(Sender: TObject);
begin
  if FPosicaoAtual < Pred(FoIXMLResponseType.Result.Count) then
    FPosicaoAtual := Succ(FPosicaoAtual);
  CarregaDados(FPosicaoAtual);
end;

procedure TfrmTelaPrincipal.CarregaDados(const nPosicao: integer);
begin
  edtID.Text := FoIXMLResponseType.Result.Item[nPosicao].Id.ToString;
  edtNome.Text := FoIXMLResponseType.Result.Item[nPosicao].First_name;
  edtSobreNome.Text := FoIXMLResponseType.Result.Item[nPosicao].Last_name;
  if FoIXMLResponseType.Result.Item[nPosicao].Gender.ToLower = 'male' then
    cbGenero.ItemIndex := ZeroValue
  else
    cbGenero.ItemIndex := PositiveValue;
  edtDataNascimento.Date := StrToDateDef(FoIXMLResponseType.Result.Item[nPosicao].Dob, Date);
  edtEmail.Text := FoIXMLResponseType.Result.Item[nPosicao].Email;
  edtTelefone.Text := FoIXMLResponseType.Result.Item[nPosicao].Phone;
  edtWebsite.Text := FoIXMLResponseType.Result.Item[nPosicao].Website;
  edtEndereco.Text := FoIXMLResponseType.Result.Item[nPosicao].Address;
  if FoIXMLResponseType.Result.Item[nPosicao].Status.ToLower = 'active' then
    cbGenero.ItemIndex := ZeroValue
  else
    cbGenero.ItemIndex := PositiveValue;
  edtRecurso.Text := FoIXMLResponseType.Result.Item[nPosicao]._links.Self.Href;
  edtEditar.Text := FoIXMLResponseType.Result.Item[nPosicao]._links.Edit.Href;
  edtAvatar.Text := FoIXMLResponseType.Result.Item[nPosicao]._links.Avatar.Href;
end;

procedure TfrmTelaPrincipal.FormCreate(Sender: TObject);
begin
  FoIXMLResponseType := Loadresponse(ExtractFilePath(Application.ExeName) + 'EXE_19_XML.xml');
  FPosicaoAtual := ZeroValue;
  CarregaDados(FPosicaoAtual);
end;

end.
