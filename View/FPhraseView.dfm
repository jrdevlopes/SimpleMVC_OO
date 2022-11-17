object frmPhraseData: TfrmPhraseData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Simples Phrase'
  ClientHeight = 168
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lbPhrase: TLabel
    Left = 16
    Top = 59
    Width = 38
    Height = 15
    Caption = 'Phrase:'
  end
  object Label1: TLabel
    Left = 16
    Top = 10
    Width = 13
    Height = 15
    Caption = 'Id:'
  end
  object lbChars: TLabel
    Left = 272
    Top = 60
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = '50 characters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btConfirm: TButton
    Left = 56
    Top = 118
    Width = 113
    Height = 25
    Caption = 'Confirm'
    ModalResult = 1
    TabOrder = 0
    OnClick = btConfirmClick
  end
  object btCancel: TButton
    Left = 192
    Top = 118
    Width = 113
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object edId: TEdit
    Left = 16
    Top = 24
    Width = 57
    Height = 23
    Enabled = False
    TabOrder = 2
  end
  object edPhrase: TEdit
    Left = 16
    Top = 74
    Width = 340
    Height = 23
    MaxLength = 50
    TabOrder = 3
    OnChange = edPhraseChange
  end
end
