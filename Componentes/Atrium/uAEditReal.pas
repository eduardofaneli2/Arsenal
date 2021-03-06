unit uAEditReal;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, uAEdit, Winapi.Messages;

type
  TAEditReal = class(TAEdit)
  private
    FFloatOnly : Boolean;
    procedure KeyPressFloat(Sender: TObject; var Key: Char);
    procedure SetFloatOnly(const Value : Boolean);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    { Public declarations }
  published
    property FloatOnly : Boolean read FFloatOnly write SetFloatOnly default True;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Atrium', [TAEditReal]);
end;

{ TAEditReal }

constructor TAEditReal.Create(AOwner: TComponent);
begin
  inherited;
  Self.FloatOnly := True;
end;


procedure TAEditReal.KeyPressFloat(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #44]) then
    Key := #0;
end;

procedure TAEditReal.SetFloatOnly(const Value: Boolean);
begin
  FFloatOnly := Value;
  OnKeyPress := nil;
  if Value then
    OnKeyPress := KeyPressFloat;

end;

end.
