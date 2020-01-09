program OpeMatematica;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uClasseMatematica in 'uClasseMatematica.pas';

var
  oClasseMatematica: TClasseMatematica;
  nResultado: double;

begin
  oClasseMatematica := TClasseMatematica.Create;
  try
    oClasseMatematica.Esquerda := 2;
    oClasseMatematica.Direita := 2;
    oClasseMatematica.OperacaoMatematica := function: double begin result := oClasseMatematica.Esquerda * oClasseMatematica.Direita end;
    Writeln(oClasseMatematica.OperacaoMatematica.ToString);
    readln;
  finally
    FreeAndNil(oClasseMatematica);
  end;
end.
