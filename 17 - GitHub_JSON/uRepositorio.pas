unit uRepositorio;

interface

uses
  REST.Json.Types;

type
  TRepositorio = class
  private
    [JSONName('id')]
    FId: Int64;
    [JSONName('name')]
    FName: string;
    [JSONName('html_url')]
    FUrl: string;
    [JSONName('description')]
    FDescription: string;
  public
    property Id: Int64 read FId;
    property Name: string read FName;
    property Url: string read FUrl;
    property Description: string read FDescription;
  end;

  TRepositorios = class
  private
    [JSONName('items')]
    FRepositorios: TArray<TRepositorio>;
  public
    Destructor Destroy; override;

    property Repositorios: TArray<TRepositorio> read FRepositorios;
  end;

implementation

{ TRepositories }

destructor TRepositorios.Destroy;
var
  oRepositorio: TRepositorio;
begin
  for oRepositorio in Self.FRepositorios do
    oRepositorio.Free;

  inherited;
end;

end.
