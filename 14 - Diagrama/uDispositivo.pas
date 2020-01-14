unit uDispositivo;

interface

type
  TDispositivo = class
  private
    FMarca: string;
    FModelo: string;
    FCor: string;
    FNumeroSerie: string;
    FDataCompra: TDate;
    FDataCadastro: TDate;
    FAtivo: boolean;
    FTipoDispositivo: string;
  public
  property Marca: string read FMarca write FMarca;
  property Modelo: string read FModelo write FModelo;
  property Cor: string read FCor write FCor;
  property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
  property DataCompra: TDate read FDataCompra write FDataCompra;
  property DataCadastro: TDate read FDataCadastro write FDataCadastro;
  property Ativo: boolean read FAtivo write FAtivo;
  property TipoDispositivo: string read FTipoDispositivo write FTipoDispositivo;
  end;

implementation

end.
