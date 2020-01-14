unit uImpressora;

interface

uses uDispositivo, uMultifuncional;

type
  TImpressora = class(TDispositivo)
  private
    FMultifuncional: TMultifuncional;
  public
    constructor Create;
  property Multifuncional: TMultifuncional read FMultifuncional write FMultifuncional;
  end;

implementation

{ TImpressora }

constructor TImpressora.Create;
begin
  FMultifuncional := TMultifuncional.Create;
end;

end.
