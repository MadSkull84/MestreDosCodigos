(*
18 - Utilizando classes nativas do Delphi (System.JSON), crie um conteúdo JSON
     que contenha campos do tipo texto, numérico, condicional e lista.
     O resultado do JSON deve ser igual ao abaixo:
    {
        "player": "Mystery",
        "active": true,
        "territories": [
            {
                "territory": "Delphi",
                "level": "Squire",
                "experience": 17,
                "dateLastMission": "2019-08-20"
            },
            {
                "territory": "SQL",
                "level": null,
                "experience": 0,
                "dateLastMission": null
            },
            {
                "territory": "Software Architecture",
                "level": "Knight",
                "experience": 34,
                "dateLastMission": "2019-07-01"
            }
        ]
    }

Autor: Eder Correia Lira
*)

unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON;

type
  TfrmTelaPrincipal = class(TForm)
    btnCriarJSON: TButton;
    memJSON: TMemo;
    procedure btnCriarJSONClick(Sender: TObject);
  private
    function RetornaValorJSONValido(const pValor: string): TJSONValue;
    function AdicionarItemJSON(const pTerritorio, pLevel, pExperiencia,
      pDataUltimaMissao: string): TJSONObject;
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

uses
  System.Math;

{$R *.dfm}

function TfrmTelaPrincipal.RetornaValorJSONValido(const pValor: string): TJSONValue;
var
  jValor: TJSONValue;
begin
  if pValor.ToLower = 'null' then
    jValor := TJSONNull.Create
  else if pValor.ToLower = 'true' then
    jValor := TJSONTrue.Create
  else if pValor.ToLower = 'false' then
    jValor := TJSONFalse.Create
  else if StrToFloatDef(pValor, NegativeValue) > NegativeValue then
    jValor := TJSONNumber.Create(StrToFloat(pValor))
  else
    jValor := TJSONString.Create(pValor);
  result := jValor;
end;

function TfrmTelaPrincipal.AdicionarItemJSON(const pTerritorio, pLevel,
  pExperiencia, pDataUltimaMissao: string): TJSONObject;
var
  oJSON: TJSONObject;
begin
  oJSON := TJSONObject.Create;
  oJSON.AddPair('territory', RetornaValorJSONValido(pTerritorio));
  oJSON.AddPair('level', RetornaValorJSONValido(pLevel));
  oJSON.AddPair('experience', RetornaValorJSONValido(pExperiencia));
  oJSON.AddPair('dateLastMission', RetornaValorJSONValido(pDataUltimaMissao));
  result := oJSON;
end;

procedure TfrmTelaPrincipal.btnCriarJSONClick(Sender: TObject);
var
  oJSON: TJSONObject;
  oJSONFilhos: TJSONArray;
begin
  oJSON := TJSONObject.Create;
  try
    oJSON.AddPair('player', RetornaValorJSONValido('Mystery'));
    oJSON.AddPair('active', RetornaValorJSONValido('true'));
    oJSON.AddPair('territories', RetornaValorJSONValido('null'));
    oJSONFilhos := TJSONArray.Create;
    oJSONFilhos.AddElement(AdicionarItemJSON('Delphi','Squire','17','2019-08-20'));
    oJSONFilhos.AddElement(AdicionarItemJSON('SQL','null','0','null'));
    oJSONFilhos.AddElement(AdicionarItemJSON('Software Architecture','Knight','34','2019-07-01'));
    oJSON.AddPair('territories',oJSONFilhos);
    memJSON.Lines.Text := oJSON.ToString;
  finally
    FreeAndNil(oJSON);
  end;
end;

end.
