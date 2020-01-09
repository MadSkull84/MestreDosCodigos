unit uCalcularArea;

interface

uses
  System.SysUtils, System.Math;

type
  TAreaTrianguloDLL = function(pBase, pAltura: Extended): Extended;
  TAreaQuadrilateroDLL = function(pLadoA, pLadoB: Extended): Extended;
  TAreaCirculoDLL = function(pRaio: Extended): Extended;

  TCalcularArea = class
  private
    function LerValor(const pDescricao: string): Extended;
  public
    procedure CalcularAreaTriangulo;
    procedure CalcularAreaQuadrilatero;
    procedure CalcularAreaCirculo;
  end;

implementation

uses
  Winapi.Windows;

const
  sNomeDll = 'CalcGeometricos_dll.dll';

{ TCalcularArea }

function TCalcularArea.LerValor(const pDescricao: string): Extended;
var
  sValor: string;
begin
  repeat
    Write(pDescricao + ': ');
    Readln(sValor);
    Result := StrToFloatDef(sValor, ZeroValue);
  until Result > ZeroValue;
end;

procedure TCalcularArea.CalcularAreaTriangulo;
var
  nBase: Extended;
  nAltura: Extended;
  nArea: Extended;
  oHandle: THandle;
  oAreaTrianguloDLL: TAreaTrianguloDLL;
begin
  nBase := LerValor('Base');
  nAltura := LerValor('Altura');

  oHandle := LoadLibrary(sNomeDll);
  try
    if (oHandle <> 0) then
    begin
      oAreaTrianguloDLL := GetProcAddress(oHandle, pWideChar('AreaTriangulo'));
      nArea := oAreaTrianguloDLL(nBase, nAltura);
      Writeln(Format('A área do triângulo é: %0.2f',[nArea]));
    end
    else
      Writeln('Dll não encontrada!');
    Readln;
  finally
    FreeLibrary(oHandle);
  end;
end;

procedure TCalcularArea.CalcularAreaQuadrilatero;
var
  nLadoA: Extended;
  nLadoB: Extended;
  nArea: Extended;
  oHandle: THandle;
  oAreaQuadrilateroDLL: TAreaQuadrilateroDLL;
begin
  nLadoA := LerValor('Lado A');
  nLadoB := LerValor('Lado B');

  oHandle := LoadLibrary(sNomeDll);
  try
    if (oHandle <> 0) then
    begin
      oAreaQuadrilateroDLL := GetProcAddress(oHandle, pWideChar('AreaQuadrilatero'));
      nArea := oAreaQuadrilateroDLL(nLadoA, nLadoB);
      Writeln(Format('A área do quadrado/retângulo é: %0.2f',[nArea]));
    end
    else
      Writeln('Dll não encontrada!');
    Readln;
  finally
    FreeLibrary(oHandle);
  end;
end;

procedure TCalcularArea.CalcularAreaCirculo;
var
  nRaio: Extended;
  nArea: Extended;
  oHandle: THandle;
  oAreaCirculoDLL: TAreaCirculoDLL;
begin
  nRaio := LerValor('Raio');

  oHandle := LoadLibrary(sNomeDll);
  try
    if (oHandle <> 0) then
    begin
      oAreaCirculoDLL := GetProcAddress(oHandle, pWideChar('AreaCirculo'));
      nArea := oAreaCirculoDLL(nRaio);
      Writeln(Format('A área do círculo é: %0.2f',[nArea]));
    end
    else
      Writeln('Dll não encontrada!');
    Readln;
  finally
    FreeLibrary(oHandle);
  end;
end;

end.
