unit FPhraseView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TfrmPhraseData = class(TForm)
    lbPhrase: TLabel;
    Label1: TLabel;
    btConfirm: TButton;
    btCancel: TButton;
    edId: TEdit;
    edPhrase: TEdit;
    lbChars: TLabel;
    procedure btConfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPhraseChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    maxChars : integer;

  public
    
  end;

var
  frmPhraseData: TfrmPhraseData;

implementation

{$R *.dfm}

{ TfrmPhrase }
procedure TfrmPhraseData.btConfirmClick(Sender: TObject);
begin
  if edPhrase.Text = EmptyStr then
  begin
    ShowMessage('Warning => Empty Phrase ');
    ModalResult := mrNone;
  end;
end;

procedure TfrmPhraseData.edPhraseChange(Sender: TObject);
var count : integer;
begin
  count := maxChars - Length(edPhrase.Text);

  lbChars.Caption := IntToStr(count) + ' characters';

end;

procedure TfrmPhraseData.FormCreate(Sender: TObject);
begin
  maxChars := 50;
end;

procedure TfrmPhraseData.FormShow(Sender: TObject);
begin
  edPhrase.SetFocus;
end;

end.


