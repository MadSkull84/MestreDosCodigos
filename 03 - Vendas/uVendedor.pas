unit uVendedor;

interface

uses
  System.SysUtils;

Type
  TVendedor = class
  private
    FNome: string;
    FBaseSalario: Currency;
    FTotalVendas: Currency;
    function getSalario: Currency;

  public
  property Nome: string read FNome write FNome;
  property BaseSalario: Currency read FBaseSalario write FBaseSalario;
  property TotalVendas: Currency read FTotalVendas write FTotalVendas;
  property Salario: Currency read getSalario;
  end;

implementation

{ TVendedor }

function TVendedor.getSalario: Currency;
begin
  Result := Self.FBaseSalario + (Self.FTotalVendas * 0.15);
end;

end.
