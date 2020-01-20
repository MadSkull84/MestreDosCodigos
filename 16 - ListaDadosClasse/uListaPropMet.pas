unit uListaPropMet;

interface

uses
  System.Classes;

type
  TListaPropMet = class
  private
    FClass: TClass;
    function EncontraClasse(const pClasse: string): TClass;
  public
    constructor Create(const pClasse: string);
    function ListaPropriedades: TStringList;
    function ListaMetodos: TStringList;
  end;

implementation

uses
  System.RTTI, System.StrUtils;

{ TListaPropMet }

constructor TListaPropMet.Create(const pClasse: string);
begin
  FClass := EncontraClasse(pClasse);
end;

function TListaPropMet.EncontraClasse(const pClasse: string): TClass;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiType;
  aListaTipos: TArray<TRttiType>;
begin
  Result := nil;
  RttiContext := TRttiContext.Create;
  aListaTipos := RttiContext.GetTypes;
  for RttiInstanceType in aListaTipos do
  begin
    if RttiInstanceType.IsInstance and (EndsText(pClasse, RttiInstanceType.Name)) then
    begin
      Result := RttiInstanceType.AsInstance.MetaClassType;
      break;
    end;
  end;
  RttiContext.Free;
end;

function TListaPropMet.ListaPropriedades: TStringList;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  Result:= TStringList.Create;

  if FClass = nil then
  begin
    Result.Add('Classe não encontrada');
    Exit;
  end;

  RttiContext := TRttiContext.Create;
  try
    RttiInstanceType := RttiContext.GetType(FClass);

    for RttiProperty in RttiInstanceType.GetProperties do
    begin
      Result.Add(RttiProperty.Name);
    end;
  finally
    RttiContext.Free;
  end;
end;

function TListaPropMet.ListaMetodos: TStringList;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiType;
  RttiMethod: TRttiMethod;
begin
  Result:= TStringList.Create;

  if FClass = nil then
  begin
    Result.Add('Classe não encontrada');
    Exit;
  end;

  RttiContext := TRttiContext.Create;
  try
    RttiInstanceType := RttiContext.GetType(FClass);

    for RttiMethod in RttiInstanceType.GetMethods do
    begin
      Result.Add(RttiMethod.Name);
    end;
  finally
    RttiContext.Free;
  end;
end;

end.
