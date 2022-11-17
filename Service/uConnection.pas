unit uConnection;

interface

uses
  SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Firedac.DApt, FireDAC.Phys.SQLite;

type
  TConnection = class

  private
    FConnection : TFDConnection;
    procedure ConfigConnection;
    procedure CreateTables;

  public
    constructor Create;
    destructor Destroy; override;

    function GetConnection : TFDConnection;
    function CreateQuery: TFDQuery;
  end;

implementation

{ TConexao }
procedure TConnection.ConfigConnection;
begin
  FConnection.Params.DriverID := 'SQLite';
  FConnection.Params.Database := ':memory:';
  FConnection.LoginPrompt := False;
end;

function TConnection.CreateQuery: TFDQuery;
var vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := FConnection;

  Result := vQuery;
end;

procedure TConnection.CreateTables;
var vQuery : TFDQuery;
    qry : TStringBuilder;
begin
  qry := TStringBuilder.Create;
  vQuery := Self.CreateQuery;
  try
    //qry.Append('CREATE DATABASE MY_PHRASES;');

    qry.Append('CREATE TABLE IF NOT EXISTS "PHRASES" (');
    qry.Append('"ID" INTEGER NOT NULL UNIQUE,');
    qry.Append('"MESSAGE"	TEXT(50) NOT NULL, ');
    qry.Append('PRIMARY KEY("ID" AUTOINCREMENT) );');

    vQuery.SQL.Add(qry.ToString);
    vQuery.ExecSQL;
  finally
    FreeAndNil(vQuery);
    FreeAndNil(qry);
  end;
end;

constructor TConnection.Create;
begin
  FConnection := TFDConnection.Create(nil);
  Self.ConfigConnection;
  Self.CreateTables;
end;

destructor TConnection.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

function TConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

end.
