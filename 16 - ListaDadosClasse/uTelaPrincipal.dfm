object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Listar Propriedades e M'#233'todos'
  ClientHeight = 267
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblClasse: TLabel
    Left = 16
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Classe'
  end
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 63
    Height = 13
    Caption = 'Propriedades'
  end
  object Label2: TLabel
    Left = 208
    Top = 56
    Width = 41
    Height = 13
    Caption = 'M'#233'todos'
  end
  object edtClasse: TEdit
    Left = 16
    Top = 32
    Width = 295
    Height = 21
    TabOrder = 0
    Text = 'TEdit'
  end
  object btnListar: TButton
    Left = 317
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 1
    OnClick = btnListarClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 72
    Width = 185
    Height = 177
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 207
    Top = 72
    Width = 185
    Height = 177
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
