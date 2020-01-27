object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de dados do XML'
  ClientHeight = 363
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 88
    ExplicitTop = 32
    ExplicitWidth = 185
    object btAnterior: TSpeedButton
      Left = 8
      Top = 8
      Width = 23
      Height = 22
      Caption = '<'
      OnClick = btAnteriorClick
    end
    object btProximo: TSpeedButton
      Left = 32
      Top = 8
      Width = 23
      Height = 22
      Caption = '>'
      OnClick = btProximoClick
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 41
    Width = 482
    Height = 281
    Align = alClient
    TabOrder = 1
    ExplicitTop = 47
    ExplicitWidth = 635
    ExplicitHeight = 218
    object lblID: TLabel
      Left = 8
      Top = 8
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object lblNome: TLabel
      Left = 56
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblSobreNome: TLabel
      Left = 152
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Sobrenome'
    end
    object lblDataNascimento: TLabel
      Left = 376
      Top = 8
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object lblEmail: TLabel
      Left = 8
      Top = 48
      Width = 28
      Height = 13
      Caption = 'e-mail'
    end
    object lblTelefone: TLabel
      Left = 152
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object lblWebsite: TLabel
      Left = 295
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Website'
    end
    object lblEndereco: TLabel
      Left = 8
      Top = 88
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblGenero: TLabel
      Left = 296
      Top = 8
      Width = 35
      Height = 13
      Caption = 'G'#234'nero'
    end
    object lblStatus: TLabel
      Left = 376
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object edtID: TEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 56
      Top = 24
      Width = 90
      Height = 21
      TabOrder = 1
    end
    object edtSobreNome: TEdit
      Left = 152
      Top = 24
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object edtDataNascimento: TDateTimePicker
      Left = 376
      Top = 24
      Width = 96
      Height = 21
      Date = 43856.000000000000000000
      Format = 'dd/MM/yyyy'
      Time = 0.925733946758555300
      DateFormat = dfLong
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 8
      Top = 64
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object edtTelefone: TEdit
      Left = 152
      Top = 64
      Width = 137
      Height = 21
      TabOrder = 5
    end
    object edtWebsite: TEdit
      Left = 295
      Top = 64
      Width = 177
      Height = 21
      TabOrder = 6
    end
    object edtEndereco: TEdit
      Left = 8
      Top = 104
      Width = 362
      Height = 21
      TabOrder = 7
    end
    object cbGenero: TComboBox
      Left = 296
      Top = 24
      Width = 74
      Height = 21
      Style = csDropDownList
      TabOrder = 8
      Items.Strings = (
        'male'
        'female')
    end
    object cbStatus: TComboBox
      Left = 376
      Top = 104
      Width = 96
      Height = 21
      Style = csDropDownList
      TabOrder = 9
      Items.Strings = (
        'active'
        'inactive')
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 128
      Width = 464
      Height = 145
      Caption = 'Links (HATEOAS): '
      TabOrder = 10
      object lblRecurso: TLabel
        Left = 8
        Top = 16
        Width = 39
        Height = 13
        Caption = 'Recurso'
      end
      object lblEditar: TLabel
        Left = 9
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Editar'
      end
      object lblAvatar: TLabel
        Left = 9
        Top = 96
        Width = 33
        Height = 13
        Caption = 'Avatar'
      end
      object edtRecurso: TEdit
        Left = 8
        Top = 32
        Width = 441
        Height = 21
        TabOrder = 0
      end
      object edtEditar: TEdit
        Left = 9
        Top = 72
        Width = 440
        Height = 21
        TabOrder = 1
      end
      object edtAvatar: TEdit
        Left = 9
        Top = 112
        Width = 440
        Height = 21
        TabOrder = 2
      end
    end
  end
  object pnlBotton: TPanel
    Left = 0
    Top = 322
    Width = 482
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 232
    ExplicitTop = 231
    ExplicitWidth = 185
  end
end
