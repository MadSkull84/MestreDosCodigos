unit uListaPropMet;

interface

uses
  System.Classes;

type
  TListaPropMet = class
  private
    FClass: TClass;
    function EncontraClasse(const pClasse: string): TClass;
    function ValidaClasse(const pClasse: TClass; var pResultado: TStringList): boolean;
  public
    constructor Create(const pClasse: string);
    function ListaPropriedades: TStringList;
    function ListaMetodos: TStringList;
  end;

implementation

uses
  System.RTTI, System.StrUtils;

const
  sClasseNaoEncontrada = 'Classe não encontrada.';

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
  try
    aListaTipos := RttiContext.GetTypes;
    for RttiInstanceType in aListaTipos do
    begin
      if RttiInstanceType.IsInstance and (EndsText(pClasse, RttiInstanceType.Name)) then
      begin
        Result := RttiInstanceType.AsInstance.MetaClassType;
        break;
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

function TListaPropMet.ListaPropriedades: TStringList;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  Result:= TStringList.Create;

  if not ValidaClasse(FClass, Result) then
    Exit;

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

function TListaPropMet.ValidaClasse(const pClasse: TClass;
  var pResultado: TStringList): boolean;
begin
  Result := pClasse <> nil;
  if not Result then
    pResultado.Add(sClasseNaoEncontrada);
end;

function TListaPropMet.ListaMetodos: TStringList;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiType;
  RttiMethod: TRttiMethod;
begin
  Result:= TStringList.Create;

  if not ValidaClasse(FClass, Result) then
    Exit;

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
