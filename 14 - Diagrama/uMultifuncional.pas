unit uMultifuncional;

interface

uses uIScanner, uIFax, uICopiadora, uIPrinter;

type
  TMultifuncional = class(TInterfacedObject, IScanner, IFax, ICopiadora, IPrinter)
  end;

implementation

end.
