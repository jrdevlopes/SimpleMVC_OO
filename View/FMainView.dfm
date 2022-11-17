object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SimpleMVC Oriented Object'
  ClientHeight = 360
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lbId: TLabel
    Left = 15
    Top = 16
    Width = 11
    Height = 15
    Caption = 'ID'
  end
  object lbPhrase: TLabel
    Left = 78
    Top = 16
    Width = 38
    Height = 15
    Caption = 'Phrase:'
  end
  object lbList: TLabel
    Left = 15
    Top = 112
    Width = 38
    Height = 15
    Caption = 'Phrase:'
  end
  object DBGridList: TDBGrid
    Left = 15
    Top = 129
    Width = 403
    Height = 200
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGridListCellClick
    OnMouseWheelDown = DBGridListMouseWheelDown
    OnMouseWheelUp = DBGridListMouseWheelUp
  end
  object btNew: TButton
    Left = 15
    Top = 73
    Width = 90
    Height = 25
    Caption = 'New'
    TabOrder = 1
    OnClick = btNewClick
  end
  object btUpdate: TButton
    Left = 119
    Top = 73
    Width = 90
    Height = 25
    Caption = 'Update'
    TabOrder = 2
    OnClick = btUpdateClick
  end
  object btDelete: TButton
    Left = 223
    Top = 73
    Width = 90
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = btDeleteClick
  end
  object status_bar: TStatusBar
    Left = 0
    Top = 341
    Width = 430
    Height = 19
    Panels = <
      item
        Text = '@Joao Roberto - Simple MVC OO Example'
        Width = 50
      end>
  end
  object edId: TDBEdit
    Left = 15
    Top = 31
    Width = 50
    Height = 23
    BevelInner = bvNone
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 5
  end
  object edPhrase: TDBEdit
    Left = 78
    Top = 31
    Width = 340
    Height = 23
    BevelInner = bvNone
    BevelOuter = bvNone
    Enabled = False
    MaxLength = 50
    TabOrder = 6
  end
end
