unit uStringListHelper;

interface

uses
  System.Classes, System.JSON;

type
  TStringListHelper = class helper for TStringList
  private
    function FormatoValidoParaJSON: boolean;
    function RetornaValorJSONValido(const pValor: string): TJSONValue;
  public
    function IsEmpty: boolean;
    function HasDuplicate: boolean;
    function ToJSON: string;
  end;

implementation

uses
  System.SysUtils, System.Math;

{ TStringListHelper }

function TStringListHelper.FormatoValidoParaJSON: boolean;
var
  nPosicao: integer;
begin
  result := false;
  for nPosicao := ZeroValue to Pred(Self.Count) do
  begin
    result := Self.Names[nPosicao] <> EmptyStr;
    if not result then
      Break;
  end;
end;

function TStringListHelper.RetornaValorJSONValido(const pValor: string): TJSONValue;
var
  jValor: TJSONValue;
begin
  if pValor.ToLower = 'null' then
    jValor := TJSONNull.Create
  else if pValor.ToLower = 'true' then
    jValor := TJSONTrue.Create
  else if pValor.ToLower = 'false' then
    jValor := TJSONFalse.Create
  else if StrToFloatDef(pValor,NegativeValue) > NegativeValue then
    jValor := TJSONNumber.Create(StrToFloat(pValor))
  else
    jValor := TJSONString.Create(pValor);
  result := jValor;
end;

function TStringListHelper.IsEmpty: boolean;
begin
  result := Self.Count = ZeroValue;
end;

function TStringListHelper.HasDuplicate: boolean;
var
  oListaAuxiliar: TStringList;
begin
  oListaAuxiliar := TStringList.Create;
  try
    oListaAuxiliar.Sorted := True;
    oListaAuxiliar.Duplicates := dupIgnore;
    oListaAuxiliar.Text := Self.Text;
    result := Self.Count <> oListaAuxiliar.Count;
  finally
    FreeAndNil(oListaAuxiliar);
  end;
end;

function TStringListHelper.ToJSON: string;
var
  oJSON: TJSONObject;
  nPosicao: integer;
begin
  if FormatoValidoParaJSON then
  begin
    oJSON := TJSONObject.Create;
    try
      for nPosicao := ZeroValue to Pred(Self.Count) do
      begin
        oJSON.AddPair(Self.Names[nPosicao], RetornaValorJSONValido(Self.ValueFromIndex[nPosicao]));
      end;
      result := oJSON.ToString;
    finally
      FreeAndNil(oJSON);
    end;
  end
  else
    result := 'Formato inválido para conversão em JSON';
end;

end.
