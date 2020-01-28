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
    btnUltimo: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnNovo: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnRecarregar: TSpeedButton;
    btnSalvarArquivo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSalvarArquivoClick(Sender: TObject);
    procedure btnRecarregarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FPosicaoAtual: integer;
    FoIXMLResponseType: IXMLResponseType;
    FNovoRegistro: boolean;
    function RetornaDataValida(const pData: string): TDate;
    function RetornaMaiorID: integer;
    function ExisteDados: boolean;
    procedure HabilitaBotoes;
    procedure LimparCampos;
    procedure CarregaDados;
    procedure CarregarArquivo;
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

uses
  System.Math, System.DateUtils, Xml.XMLIntf, Xml.XMLDoc;

{$R *.dfm}

procedure TfrmTelaPrincipal.btAnteriorClick(Sender: TObject);
begin
  FNovoRegistro := False;
  HabilitaBotoes;
  if FPosicaoAtual > ZeroValue then
    FPosicaoAtual := Pred(FPosicaoAtual);
  CarregaDados;
end;

procedure TfrmTelaPrincipal.btnExcluirClick(Sender: TObject);
begin
  if FPosicaoAtual >= ZeroValue then
  begin
    FoIXMLResponseType.Result.Delete(FPosicaoAtual);
    if FPosicaoAtual > Pred(FoIXMLResponseType.Result.Count) then
      FPosicaoAtual := Pred(FoIXMLResponseType.Result.Count)
    else if FoIXMLResponseType.Result.Count = ZeroValue then
      FPosicaoAtual := NegativeValue;

    CarregaDados;
  end;
end;

procedure TfrmTelaPrincipal.btnNovoClick(Sender: TObject);
begin
  FNovoRegistro := True;
  if FPosicaoAtual = NegativeValue then
    FPosicaoAtual := ZeroValue;
  LimparCampos;
  HabilitaBotoes;
end;

procedure TfrmTelaPrincipal.btnPrimeiroClick(Sender: TObject);
begin
  FNovoRegistro := False;
  if ExisteDados then
    FPosicaoAtual := ZeroValue;
  HabilitaBotoes;
  CarregaDados;
end;

procedure TfrmTelaPrincipal.btnRecarregarClick(Sender: TObject);
begin
  FNovoRegistro := False;
  HabilitaBotoes;
  CarregarArquivo;
end;

procedure TfrmTelaPrincipal.btnSalvarArquivoClick(Sender: TObject);
var
  oXMLDocument: IXMLDocument;
begin
  oXMLDocument := TXMLDocument.Create(nil);
  oXMLDocument.LoadFromXML(FoIXMLResponseType.XML);
  oXMLDocument.SaveToFile(ExtractFilePath(Application.ExeName) + 'EXE_19_XML.xml');
end;

procedure TfrmTelaPrincipal.btnSalvarClick(Sender: TObject);
var
  oItem: IXMLItemType;
  oRecurso: IXMLSelfType;
  oEditar: IXMLEditType;
  oAvatar: IXMLAvatarType;
begin
  if FPosicaoAtual = NegativeValue then
    Exit;

  if FNovoRegistro then
  begin
    oItem := FoIXMLResponseType.Result.Add;
    oItem.Id := StrToInt(edtID.Text);
    FPosicaoAtual := Pred(FoIXMLResponseType.Result.Count);
    FNovoRegistro := False;
  end
  else
    oItem := FoIXMLResponseType.Result.Item[FPosicaoAtual];

  oItem.First_name := edtNome.Text;
  oItem.Last_name  := edtSobreNome.Text;
  oItem.Gender     := cbGenero.Text;
  oItem.Dob        := FormatDateTime('yyyy-MM-dd', edtDataNascimento.Date);
  oItem.Email      := edtEmail.Text;
  oItem.Phone      := edtTelefone.Text;
  oItem.Website    := edtWebsite.Text;
  oItem.Address    := edtEndereco.Text;
  oItem.Status     := cbStatus.Text;

  oRecurso := oItem._links.Self;
  oEditar  := oItem._links.Edit;
  oAvatar  := oItem._links.Avatar;

  oRecurso.Href := edtRecurso.Text;
  oEditar.Href := edtEditar.Text;
  oAvatar.Href := edtAvatar.Text;

  HabilitaBotoes;
end;

procedure TfrmTelaPrincipal.btnUltimoClick(Sender: TObject);
begin
  FNovoRegistro := False;
  HabilitaBotoes;
  if ExisteDados then
    FPosicaoAtual := Pred(FoIXMLResponseType.Result.Count);
  CarregaDados;
end;

procedure TfrmTelaPrincipal.btProximoClick(Sender: TObject);
begin
  FNovoRegistro := False;
  HabilitaBotoes;
  if (ExisteDados) and
     (FPosicaoAtual < Pred(FoIXMLResponseType.Result.Count)) then
    FPosicaoAtual := Succ(FPosicaoAtual);
  CarregaDados;
end;

procedure TfrmTelaPrincipal.CarregaDados;
var
  oItem: IXMLItemType;
begin
  if FPosicaoAtual = NegativeValue then
  begin
    LimparCampos;
    Exit;
  end;

  oItem := FoIXMLResponseType.Result.Item[FPosicaoAtual];
  edtID.Text             := oItem.Id.ToString;
  edtNome.Text           := oItem.First_name;
  edtSobreNome.Text      := oItem.Last_name;
  edtDataNascimento.Date := RetornaDataValida(oItem.Dob);
  edtEmail.Text          := oItem.Email;
  edtTelefone.Text       := oItem.Phone;
  edtWebsite.Text        := oItem.Website;
  edtEndereco.Text       := oItem.Address;

  if oItem.Gender.ToLower = 'male' then
    cbGenero.ItemIndex := ZeroValue
  else
    cbGenero.ItemIndex := PositiveValue;

  if oItem.Status.ToLower = 'active' then
    cbStatus.ItemIndex := ZeroValue
  else
    cbStatus.ItemIndex := PositiveValue;

  edtRecurso.Text := oItem._links.Self.Href;
  edtEditar.Text  := oItem._links.Edit.Href;
  edtAvatar.Text  := oItem._links.Avatar.Href;
end;

procedure TfrmTelaPrincipal.CarregarArquivo;
begin
  FoIXMLResponseType := Loadresponse(ExtractFilePath(Application.ExeName) + 'EXE_19_XML.xml');
  if ExisteDados then
    FPosicaoAtual    := ZeroValue
  else
    FPosicaoAtual    := NegativeValue;
  FNovoRegistro      := False;
  HabilitaBotoes;
  CarregaDados;
end;

function TfrmTelaPrincipal.ExisteDados: boolean;
begin
  result := FoIXMLResponseType.Result.Count > ZeroValue;
end;

procedure TfrmTelaPrincipal.FormCreate(Sender: TObject);
begin
  FNovoRegistro := False;
  HabilitaBotoes;
  CarregarArquivo;
end;

procedure TfrmTelaPrincipal.HabilitaBotoes;
begin
  btnExcluir.Enabled       := not FNovoRegistro;
  btnSalvarArquivo.Enabled := not FNovoRegistro;
end;

procedure TfrmTelaPrincipal.LimparCampos;
begin
  if FNovoRegistro then
    edtID.Text := IntToStr(RetornaMaiorID)
  else
    edtID.Clear;
  edtNome.Clear;
  edtSobreNome.Clear;
  edtDataNascimento.Date := Date;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtWebsite.Clear;
  edtEndereco.Clear;
  edtRecurso.Clear;
  edtEditar.Clear;
  edtAvatar.Clear;

  cbGenero.ItemIndex := ZeroValue;
  cbStatus.ItemIndex := ZeroValue;
end;

function TfrmTelaPrincipal.RetornaDataValida(const pData: string): TDate;
var
  iAno: Word;
  iMes: Word;
  iDia: Word;
  nData: TDate;
begin
  iAno  := StrToIntDef(Copy(pData, ZeroValue, 4), ZeroValue);
  iMes  := StrToIntDef(Copy(pData, 6, 2), ZeroValue);
  iDia  := StrToIntDef(Copy(pData, 9, 2), ZeroValue);
  nData := EncodeDate(iAno, iMes, iDia);
  if nData = ZeroValue then
    nData := Date;
  result := nData;
end;

function TfrmTelaPrincipal.RetornaMaiorID: integer;
var
  nPosicao: integer;
  iMaior: integer;
begin
  iMaior := ZeroValue;
  for nPosicao := ZeroValue to Pred(FoIXMLResponseType.Result.Count) do
  begin
    if FoIXMLResponseType.Result.Item[nPosicao].Id > iMaior then
      iMaior := FoIXMLResponseType.Result.Item[nPosicao].Id;
  end;
  result := Succ(iMaior);
end;

end.
