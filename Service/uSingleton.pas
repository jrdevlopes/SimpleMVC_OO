unit uSingleton;

interface

uses
  SysUtils, uConnection;

type
  TSingleton = class

  private
    FConnection : TConnection;
    class var FInstance : TSingleton;
  public
    constructor Create;
    destructor Destroy; override;
    class function GetInstance : TSingleton;
    property Connection: TConnection read FConnection;

  end;

implementation

constructor TSingleton.Create;
begin
  FConnection := TConnection.Create;
end;

destructor TSingleton.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

class function TSingleton.GetInstance: TSingleton;
begin
  if not Assigned(Self.FInstance) then
    Self.FInstance := TSingleton.Create;

  Result := Self.FInstance;
end;

end.
