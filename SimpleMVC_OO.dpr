program SimpleMVC_OO;

uses
  Vcl.Forms,
  uConnection in 'Service\uConnection.pas',
  uSingleton in 'Service\uSingleton.pas',
  uSimplePhrase in 'Model\uSimplePhrase.pas',
  uSimplePhraseDAO in 'DAO\uSimplePhraseDAO.pas',
  uEnumOperarion in 'Model\uEnumOperarion.pas',
  uSimplesPhraseController in 'Controller\uSimplesPhraseController.pas',
  FMainView in 'View\FMainView.pas' {frmMain},
  FPhraseView in 'View\FPhraseView.pas' {frmPhraseData};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPhraseData, frmPhraseData);
  Application.Run;
end.
