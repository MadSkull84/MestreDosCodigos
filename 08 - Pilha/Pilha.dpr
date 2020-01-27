{
08 - Em uma aplicação console, escreva uma classe que implemente o algoritmo
     de pilha. Esta classe deverá utilizar Generics para poder armazenar
     qualquer tipo de conteúdo e conter os métodos Push, Pop, Size e IsEmpty.
     Após a implementação da classe, faça:
      * Construa dois objetos. Um deve armazenar strings e outro deve armazenar
        inteiros;
      * Adicione três strings aleatórias e 15 números aleatórios
        (podem ser entradas do usuário);
      * Imprima o retorno da função Size dos dois objetos;
      * Execute o método Pop da pilha de strings, mostrando no console a string
        sendo retirada, até que a pilha esteja vazia;
      * Faça o mesmo procedimento com a pilha de inteiros;
      * Imprima o retorno da função Size dos dois objetos;

Autor: Eder Correia Lira
}

program Pilha;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uPilha in 'uPilha.pas';

const
  sFim = 'fim';

var
  oPilhaString: TPilha<string>;
  oPilhaInteiro: TPilha<Integer>;

procedure LerListaString;
var
  sValor: string;
begin
  Writeln('Informe uma lista de strings, digite "' + sFim + '" para encerrar:');
  repeat
    Readln(sValor);
    if sValor.ToLower <> sFim then
      oPilhaString.Push(sValor);
  until sValor.ToLower = sFim;
end;

procedure LerListaInteiro;
var
  sValor: string;
begin
  Writeln('Informe uma lista de inteiros, digite "' + sFim + '" para encerrar:');
  repeat
    Readln(sValor);
    if (sValor.ToLower <> sFim) and
       (StrToIntDef(sValor, NegativeValue) >= ZeroValue) then
      oPilhaInteiro.Push(sValor.ToInteger);
  until sValor.ToLower = sFim;
end;

begin
  ReportMemoryLeaksOnShutdown := True;

  oPilhaString := TPilha<string>.Create;
  oPilhaInteiro := TPilha<integer>.Create;

  try
    LerListaString;
    LerListaInteiro;

    Writeln('Total pilha String antes Pop: ' + IntToStr(oPilhaString.Size));
    Readln;
    Writeln('Total pilha Inteiro antes Pop: ' + IntToStr(oPilhaInteiro.Size));
    Readln;

    while not oPilhaString.IsEmpty do
      Writeln(oPilhaString.Pop);
    Readln;

    while not oPilhaInteiro.IsEmpty do
      Writeln(oPilhaInteiro.Pop.ToString);
    Readln;

    Writeln('Total pilha String após Pop: ' + IntToStr(oPilhaString.Size));
    Readln;
    Writeln('Total pilha Inteiro após Pop: ' + IntToStr(oPilhaInteiro.Size));
    Readln;
  finally
    FreeAndNil(oPilhaString);
    FreeAndNil(oPilhaInteiro);
  end;
end.
