object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Consultar GutHub'
  ClientHeight = 300
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbFiltro: TLabel
    Left = 16
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Filtro'
  end
  object lblResultado: TLabel
    Left = 16
    Top = 48
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object btnFiltrar: TButton
    Left = 336
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 0
    OnClick = btnFiltrarClick
  end
  object memResultado: TMemo
    Left = 16
    Top = 64
    Width = 393
    Height = 217
    TabOrder = 1
  end
  object edtFiltro: TEdit
    Left = 16
    Top = 24
    Width = 312
    Height = 21
    TabOrder = 2
  end
end
