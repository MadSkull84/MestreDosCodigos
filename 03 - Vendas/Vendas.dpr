{
03 - Em uma aplicação console, escreva um programa que leia os seguintes dados:
     nome do vendedor, salário fixo e total de vendas.
     Considerando que o salário fixo tem um acréscimo de 15% com base no total vendido,
     apresente na tela: o nome do usuário, o salário fixo e o valor a receber.
     Obs: Utilize um objeto para armazenar essas informações do vendedor.

Autor: Eder Correia Lira
}

program Vendas;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Math,
  uVendedor in 'uVendedor.pas';

var
  oVendedor: TVendedor;

function ValidaValorMoeda(const pValor: string): string;
begin
  result := EmptyStr;
  if StrToFloatDef(pValor, ZeroValue) > ZeroValue then
    result := pValor;
end;

function LerValor(const pDescricao: string; const pEhMoeda: boolean = false): string;
var
  sValor: string;
begin
  repeat
    Write(pDescricao + ': ');
    Readln(sValor);
    if pEhMoeda then
      sValor := ValidaValorMoeda(sValor);
  until sValor <> EmptyStr;
  result := sValor;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  oVendedor := TVendedor.Create;
  try
    Writeln('Informe os dados do vendedor');
    oVendedor.Nome := LerValor('Nome');
    oVendedor.BaseSalario := StrToFloatDef(LerValor('Salario Base', True), ZeroValue);
    oVendedor.TotalVendas := StrToFloatDef(LerValor('Total Vendas', True), ZeroValue);
    Writeln;
    Writeln;
    Writeln('Nome: ' + oVendedor.Nome);
    Writeln('Salario Base: ' + FormatFloat('#,###,##0.00', oVendedor.BaseSalario));
    Writeln('Total Vendas: ' + FormatFloat('#,###,##0.00', oVendedor.TotalVendas));
    Writeln('Salario: ' + FormatFloat('#,###,##0.00', oVendedor.Salario));
    Readln;
  finally
    FreeAndNil(oVendedor);
  end;
end.
