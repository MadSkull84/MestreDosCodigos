unit uLEArquivo;

interface

uses System.Classes, uLerArquivo, uSalvarArquivo;

type
  TLEArquivo = class(TInterfacedObject, ILerArquivo, ISalvarArquivo)
  private
    FArquivo: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LerDoArquivo;
    procedure SalvarParaArquivo;
  property Arquivo: TStringList read FArquivo write FArquivo;
  end;

implementation

uses System.SysUtils, Vcl.Forms;

{ TLEArquivo }

constructor TLEArquivo.Create;
begin
  Self.FArquivo := TStringList.Create;
end;

destructor TLEArquivo.Destroy;
begin
  FreeAndNil(FArquivo);
  inherited;
end;

procedure TLEArquivo.LerDoArquivo;
begin
  FArquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+'Arquivo.mad');
end;

procedure TLEArquivo.SalvarParaArquivo;
begin
  FArquivo.SaveToFile(ExtractFilePath(Application.ExeName)+'Arquivo.mad');
end;

end.
