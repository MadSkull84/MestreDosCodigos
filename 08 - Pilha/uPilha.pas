unit uPilha;

interface

uses
  System.SysUtils, System.Generics.Collections;

type

  TPilha<T> = Class
  private
    FLista: TList<T>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Push(const pItem: T);
    function Pop: T;
    function Size: integer;
    function IsEmpty: boolean;
  end;

implementation

uses
  System.Math;

{ TPilha<T> }

constructor TPilha<T>.Create;
begin
  FLista := TList<T>.Create;
end;

destructor TPilha<T>.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TPilha<T>.Push(const pItem: T);
begin
  FLista.Insert(ZeroValue,pItem);
end;

function TPilha<T>.Pop: T;
begin
  result := FLista[ZeroValue];
  FLista.Delete(ZeroValue);
end;

function TPilha<T>.Size: Integer;
begin
  result := FLista.Count;
end;

function TPilha<T>.IsEmpty: Boolean;
begin
  result := FLista.Count = ZeroValue;
end;

end.
