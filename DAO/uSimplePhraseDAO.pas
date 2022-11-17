unit uSimplePhraseDAO;

interface

uses
  FireDAC.Comp.Client, Firedac.DApt, SysUtils, uSimplePhrase, Dialogs;

type
  TSimplePhraseDAO = class

  private
    FQuery : TFDQuery;

  public
    constructor Create;
    destructor Destroy; override;

    function ListPhrasesDAO : TFDQuery;
    function InsertDAO(vPhrase : TSimplePhrase) : boolean;
    function DeleteDAO(vPhrase : TSimplePhrase) : boolean;
    function UpdateDAO(vPhrase : TSimplePhrase): boolean;

  end;

implementation

{ TSimplePhraseDAO }
uses uSingleton;

constructor TSimplePhraseDAO.Create;
begin
  FQuery := TSingleton.GetInstance.Connection.CreateQuery;
end;

destructor TSimplePhraseDAO.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TSimplePhraseDAO.ListPhrasesDAO: TFDQuery;
begin
  FQuery.Open('SELECT * FROM PHRASES ORDER BY ID DESC');
  Result := FQuery;
end;

function TSimplePhraseDAO.InsertDAO(vPhrase : TSimplePhrase) : boolean;
begin
  try
    FQuery.ExecSQL('INSERT INTO PHRASES(MESSAGE) VALUES (:message)',[vPhrase.PhraseMessage]);
    Result := True;
  except
    Result := False;
  end;
end;

function TSimplePhraseDAO.DeleteDAO(vPhrase: TSimplePhrase): boolean;
begin
  try
    FQuery.ExecSQL('DELETE FROM PHRASES WHERE ID = :id',[vPhrase.Id]);
    Result := True;
  except
    Result := False;
  end;
end;

function TSimplePhraseDAO.UpdateDAO(vPhrase: TSimplePhrase): boolean;
begin
  try
    FQuery.ExecSQL('UPDATE PHRASES SET MESSAGE = :message WHERE ID = :id',[vPhrase.PhraseMessage, vPhrase.Id]);
    Result := True;
  except
    Result := False;
  end;
end;

end.
