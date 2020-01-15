unit uNotePad;

interface

type
  TNotePad = class
  public
    procedure Executar;
  end;

implementation

uses WinAPI.Windows, WinAPI.ShellAPI;

{ TNotePad }

procedure TNotePad.Executar;
begin
  ShellExecute(0, 'open', 'Notepad.exe', nil, nil, SW_SHOWNORMAL);
end;

initialization
  TNotePad.ClassName;

end.
