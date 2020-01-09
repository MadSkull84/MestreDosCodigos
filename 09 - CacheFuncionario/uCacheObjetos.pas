unit uCacheObjetos;

interface

uses
  System.Generics.Collections;

type
  TCacheObjetos = class
  private
    FLista: TObjectDictionary<string,TObject>;
  public
    constructor Create;
    destructor Destroy; override;

    function PegarInstancia<T: class, constructor>: T;
  end;

implementation

uses
  Rtti, TypInfo;

{ TCacheObjetos }

constructor TCacheObjetos.Create;
begin
  FLista := TObjectDictionary<string,TObject>.Create;
end;

destructor TCacheObjetos.Destroy;
var
  oObjeto: TObject;
begin
  for oObjeto in FLista.Values do
    oObjeto.Free;

  FLista.Free;

  inherited;
end;

function TCacheObjetos.PegarInstancia<T>: T;
var
  sClassName: string;
begin
  sClassName := GetTypeData(PTypeInfo(TypeInfo(T)))^.ClassType.ClassName;
  if (FLista.ContainsKey(sClassName)) then
    Exit(FLista.Items[sClassName] as T);

  Result := T.Create;
  FLista.Add(sClassName, TObject(Result));
end;

end.
