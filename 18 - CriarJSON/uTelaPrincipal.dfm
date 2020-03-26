object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Criar JSON'
  ClientHeight = 297
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCriarJSON: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Cria JSON'
    TabOrder = 0
    OnClick = btnCriarJSONClick
  end
  object memJSON: TMemo
    Left = 8
    Top = 40
    Width = 329
    Height = 249
    TabOrder = 1
  end
end
