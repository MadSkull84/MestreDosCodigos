object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 297
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
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 295
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 317
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 104
    Width = 185
    Height = 177
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 207
    Top = 104
    Width = 185
    Height = 177
    Lines.Strings = (
      'Memo2')
    TabOrder = 3
  end
end