unit uSimplesPhraseController;

interface

uses SysUtils, FireDAC.Comp.Client, Firedac.DApt, uSimplePhrase;

type
  TSimplesPhraseController = class

  private
    FPhrase: TSimplePhrase;

  public
    constructor Create;
    destructor Destroy; override;

    function Save: boolean;
    function List : TFDQuery;

    property Phrase: TSimplePhrase read FPhrase write FPhrase;
  end;

implementation

{ TSimplesPhraseController }
constructor TSimplesPhraseController.Create;
begin
  FPhrase := TSimplePhrase.Create;
end;

destructor TSimplesPhraseController.Destroy;
begin
  FreeAndNil(FPhrase);
  inherited;
end;

function TSimplesPhraseController.List: TFDQuery;
begin
  Result := FPhrase.ListPhrases;
end;

function TSimplesPhraseController.Save: boolean;
begin
  Result := FPhrase.SaveAction;
end;

end.
