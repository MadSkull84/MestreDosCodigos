unit uFuncionario;

interface

type
  TFuncionario = class
  private
    FNome: string;
    FEmail: string;
    FTelefone: string;
  public
  property Nome: string read FNome write FNome;
  property Email: string read FEmail write FEmail;
  property Telefone: string read FTelefone write FTelefone;
  end;

implementation

end.
