unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses System.RTTI;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiType;
  RttiProperty: TRttiProperty;
  RttiMethod: TRttiMethod;
  cClass: TClass;
begin
  RttiContext := TRttiContext.Create;
  RttiInstanceType := RttiContext.GetType(TEdit);
  try
    Memo1.Clear;
    for RttiProperty in RttiInstanceType.GetProperties do
    begin
      Memo1.Lines.Add(RttiProperty.Name);
    end;

    Memo2.Clear;
    for RttiMethod in RttiInstanceType.GetMethods do
    begin
      Memo2.Lines.Add(RttiMethod.Name);
    end;
  finally
    RttiContext.Free;
  end;

end;

end.
