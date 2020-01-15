unit uCriadorMagico;

interface

type
  TCriadorMagico = class
  public
    procedure AbrirNotePad;
  end;

implementation

uses System.Classes, System.RTTI;

{ TCriadorMagico }

procedure TCriadorMagico.AbrirNotePad;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  RttiMethod: TRttiMethod;
  Instance: TValue;
begin
  RttiContext := TRttiContext.Create;
  RttiInstanceType := RttiContext.FindType('uNotePad.TNotePad').AsInstance;
  RttiMethod := RttiInstanceType.GetMethod('Create');
  Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType,[]);
  try
    RttiMethod := RttiInstanceType.GetMethod('Executar');
    RttiMethod.Invoke(Instance, []);
  finally
    Instance.AsObject.Free;
  end;
end;

end.
