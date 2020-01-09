{
08 - Em uma aplica��o console, escreva uma classe que implemente o algoritmo
     de pilha. Esta classe dever� utilizar Generics para poder armazenar
     qualquer tipo de conte�do e conter os m�todos Push, Pop, Size e IsEmpty.
     Ap�s a implementa��o da classe, fa�a:
      * Construa dois objetos. Um deve armazenar strings e outro deve armazenar
        inteiros;
      * Adicione tr�s strings aleat�rias e 15 n�meros aleat�rios
        (podem ser entradas do usu�rio);
      * Imprima o retorno da fun��o Size dos dois objetos;
      * Execute o m�todo Pop da pilha de strings, mostrando no console a string
        sendo retirada, at� que a pilha esteja vazia;
      * Fa�a o mesmo procedimento com a pilha de inteiros;
      * Imprima o retorno da fun��o Size dos dois objetos;

}

program Pilha;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uPilha in 'uPilha.pas';

var
  oPilhaString: TPilha<string>;
  oPilhaInteiro: TPilha<Integer>;

procedure LerListaString;
var
  sValor: string;
begin
  Writeln('Informe uma lista de strings, digite "fim" para encerrar:');
  repeat
    Readln(sValor);
    if sValor.ToLower <> 'fim' then
      oPilhaString.Push(sValor);
  until sValor.ToLower = 'fim';
end;

procedure LerListaInteiro;
var
  sValor: string;
begin
  Writeln('Informe uma lista de inteiros, digite "0" para encerrar:');
  repeat
    Readln(sValor);
    if StrToIntDef(sValor, NegativeValue) > ZeroValue then
      oPilhaInteiro.Push(sValor.ToInteger);
  until StrToIntDef(sValor, NegativeValue) = ZeroValue;
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

    Writeln('Total pilha String ap�s Pop: ' + IntToStr(oPilhaString.Size));
    Readln;
    Writeln('Total pilha Inteiro ap�s Pop: ' + IntToStr(oPilhaInteiro.Size));
    Readln;
  finally
    FreeAndNil(oPilhaString);
    FreeAndNil(oPilhaInteiro);
  end;
end.
