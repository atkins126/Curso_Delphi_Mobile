object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Firebase Authentication Demo'
  ClientHeight = 505
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 7
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label2: TLabel
    Left = 9
    Top = 47
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 9
    Top = 219
    Width = 29
    Height = 13
    Caption = 'Token'
  end
  object Label4: TLabel
    Left = 8
    Top = 349
    Width = 47
    Height = 13
    Caption = 'Response'
  end
  object Label5: TLabel
    Left = 8
    Top = 87
    Width = 25
    Height = 13
    Caption = 'Node'
  end
  object Label6: TLabel
    Left = 8
    Top = 131
    Width = 62
    Height = 13
    Caption = 'Firebase Key'
  end
  object Label7: TLabel
    Left = 8
    Top = 173
    Width = 79
    Height = 13
    Caption = 'Firebase Domain'
  end
  object edtEmail: TEdit
    Left = 8
    Top = 20
    Width = 289
    Height = 21
    TabOrder = 1
    Text = 'heber2@99coders.com.br'
  end
  object edtPassword: TEdit
    Left = 8
    Top = 63
    Width = 289
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = '123456'
  end
  object Button1: TButton
    Left = 320
    Top = 21
    Width = 143
    Height = 25
    Caption = 'Login'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 61
    Width = 143
    Height = 25
    Caption = 'Buscar Dados'
    TabOrder = 2
    OnClick = Button2Click
  end
  object memoResp: TMemo
    Left = 8
    Top = 365
    Width = 454
    Height = 132
    Lines.Strings = (
      '')
    TabOrder = 8
  end
  object edtNode: TEdit
    Left = 8
    Top = 103
    Width = 289
    Height = 21
    TabOrder = 5
    Text = '/produtos'
  end
  object edtKey: TEdit
    Left = 8
    Top = 147
    Width = 289
    Height = 21
    TabOrder = 6
    Text = 'AIzaSyC0Q61fqKq6jD60GZxKrVTdfghdfghdfghfg'
  end
  object Button3: TButton
    Left = 320
    Top = 101
    Width = 143
    Height = 25
    Caption = 'Enviar'
    TabOrder = 4
    OnClick = Button3Click
  end
  object edtDomain: TEdit
    Left = 8
    Top = 189
    Width = 289
    Height = 21
    TabOrder = 7
    Text = 'https://meu-app-default-rtdb.firebaseio.com/'
  end
  object edtToken: TEdit
    Left = 9
    Top = 234
    Width = 289
    Height = 21
    TabOrder = 9
  end
end
