unit FMainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, uSimplesPhraseController, Vcl.ComCtrls, StrUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmMain = class(TForm)
    lbId: TLabel;
    lbPhrase: TLabel;
    DBGridList: TDBGrid;
    lbList: TLabel;
    btNew: TButton;
    btUpdate: TButton;
    btDelete: TButton;
    status_bar: TStatusBar;
    edId: TDBEdit;
    edPhrase: TDBEdit;
    procedure btNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridListCellClick(Column: TColumn);
    procedure btDeleteClick(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure DBGridListMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure DBGridListMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

  private
    PhraseController : TSimplesPhraseController;
    MemTableList: TFDMemTable;
    DataSourceList: TDataSource;

    procedure ConfigDataTable;
    procedure GetListPhrases;
    procedure LoadEdits;

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses FPhraseView, uEnumOperarion;

procedure TfrmMain.btDeleteClick(Sender: TObject);
begin
  if edId.Text = EmptyStr then
  begin
    ShowMessage('Warning => Select a Phrase ');
    Exit;
  end;

  if Application.MessageBox('Delete Phrase ?','Confirmation',mb_YesNo+mb_IconInformation) = mrYes then
  begin
    PhraseController.Phrase.Action := tpDelete;
    PhraseController.Phrase.Id := StrToInt(edId.Text);

    if PhraseController.Save then
      ShowMessage('Successfully Deleted');

    edId.Clear;
    edPhrase.Clear;
    GetListPhrases;
  end;
end;

procedure TfrmMain.btNewClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmPhraseData, frmPhraseData);
    if frmPhraseData.ShowModal = mrOk then
    begin
      PhraseController.Phrase.Action := tpInsert;
      PhraseController.Phrase.PhraseMessage := frmPhraseData.edPhrase.Text;

      if PhraseController.Save then
        ShowMessage('Successfully Inserted');

      GetListPhrases;
    end;
  finally
    frmPhraseData.Destroy;
  end;
end;

procedure TfrmMain.btUpdateClick(Sender: TObject);
begin
  if edId.Text = EmptyStr then
  begin
    ShowMessage('Warning => Select a Phrase ');
    Exit;
  end;

  try
    Application.CreateForm(TfrmPhraseData, frmPhraseData);
    frmPhraseData.edId.Text     := MemTableList.Fields[0].AsString;
    frmPhraseData.edPhrase.Text	:= MemTableList.Fields[1].AsString;

    if frmPhraseData.ShowModal = mrOk then
    begin
      PhraseController.Phrase.Action := tpUpdate;
      PhraseController.Phrase.Id := StrToint(frmPhraseData.edId.Text);
      PhraseController.Phrase.PhraseMessage := frmPhraseData.edPhrase.Text;

      if PhraseController.Save then
        ShowMessage('Successfully Updated');

      GetListPhrases;
    end;
  finally
    frmPhraseData.Destroy;
  end;
end;

procedure TfrmMain.ConfigDataTable;
var ColId, ColPhrase : TColumn;
begin
  MemTableList := TFDMemTable.Create(Self);
  MemTableList.FieldDefs.Add('ID', ftInteger, 0, true);
  MemTableList.FieldDefs.Add('PHRASE', ftString, 50, true);
  MemTableList.Data := PhraseController.List.Data;

  DataSourceList := TDataSource.Create(Self);
  DataSourceList.DataSet := MemTableList;

  ColId := DBGridList.Columns.Add;
  ColId.FieldName := 'Id';
  ColId.Title.Caption := 'Id';
  ColId.Title.Alignment := taCenter;
  ColId.Alignment := taCenter;

  ColPhrase := DBGridList.Columns.Add;
  ColPhrase.FieldName := 'Message';
  ColPhrase.Title.Caption := 'Phrase';
  ColPhrase.Title.Alignment := taLeftJustify;
  ColPhrase.Alignment := taLeftJustify;

  DBGridList.DataSource := DataSourceList;

  edId.DataSource := DataSourceList;
  edId.DataField := 'ID';

  edPhrase.DataSource := DataSourceList;
  edPhrase.DataField := 'MESSAGE';
end;

procedure TfrmMain.DBGridListCellClick(Column: TColumn);
begin
  LoadEdits;
end;

procedure TfrmMain.DBGridListMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  LoadEdits;
end;

procedure TfrmMain.DBGridListMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  LoadEdits;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  PhraseController := TSimplesPhraseController.Create;
  Self.ConfigDataTable;
  GetListPhrases;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(PhraseController);
  FreeAndNil(MemTableList);
  FreeAndNil(DataSourceList);
end;

procedure TfrmMain.GetListPhrases;
var
  vQry : TFDQuery;
begin
  MemTableList.Close;
  try
    vQry := PhraseController.List;
    vQry.FetchAll;
    MemTableList.Data := vQry.Data;
    MemTableList.Last;
  finally
    FreeAndNil(vQry);
  end;
end;

procedure TfrmMain.LoadEdits;
var id, phrase : string;
begin
  edId.Clear;
  edPhrase.Clear;

  id      := MemTableList.Fields[0].AsString;
  phrase  := MemTableList.Fields[1].AsString;

  edId.Text := id;
  edPhrase.Text := phrase;
end;

end.
