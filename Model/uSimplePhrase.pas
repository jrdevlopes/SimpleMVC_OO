unit uSimplePhrase;

interface

uses SysUtils, FireDAC.Comp.Client, Firedac.DApt, uEnumOperarion;

type
  TSimplePhrase = class

  private
    FId : integer;
    FPhrase : string;
    FAction : TOperation;
    procedure SetAction(const Value: TOperation);

  public
    function SaveAction : boolean;
    function ListPhrases : TFDQuery;

    property Id: integer read FId write FId;
    property PhraseMessage: string read FPhrase write FPhrase;
    property Action : TOperation read FAction write SetAction;
  end;

implementation
{ TSimplePhrase }

uses uSimplePhraseDAO;

function TSimplePhrase.ListPhrases: TFDQuery;
var
  PhraseDAO : TSimplePhraseDAO;
begin
  PhraseDAO := TSimplePhraseDAO.Create;
  Result := PhraseDAO.ListPhrasesDAO;
end;

function TSimplePhrase.SaveAction: boolean;
var
  PhraseDAO : TSimplePhraseDAO;
begin
  Result := False;
  PhraseDAO := TSimplePhraseDAO.Create;
  try
    case FAction of
      tpInsert:
        Result := PhraseDAO.InsertDAO(Self);
      tpDelete:
        Result := PhraseDAO.DeleteDAO(Self);
      tpUpdate:
        Result := PhraseDAO.UpdateDAO(Self);
    end;
  finally
    FreeAndNil(PhraseDAO);
  end;
end;

procedure TSimplePhrase.SetAction(const Value: TOperation);
begin
  FAction := Value;
end;

end.
