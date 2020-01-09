library CalcGeometricos_dll;

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

function AreaTriangulo(const pBase, pAltura: Extended): Extended;
begin
  Result := (pBase * pAltura) / 2;
end;

function AreaQuadrilatero(const pLadoA, pLadoB: Extended): Extended;
begin
  Result := pLadoA * pLadoB;
end;

function AreaCirculo(const pRaio: Extended): Extended;
begin
  Result := System.Pi * (pRaio * pRaio);
end;

exports
  AreaTriangulo,
  AreaQuadrilatero,
  AreaCirculo;

begin
end.
