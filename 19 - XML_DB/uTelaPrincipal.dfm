object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Carregar dados XML DB'
  ClientHeight = 300
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCarregar: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 0
    OnClick = btnCarregarClick
  end
  object memDados: TMemo
    Left = 8
    Top = 39
    Width = 401
    Height = 253
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
