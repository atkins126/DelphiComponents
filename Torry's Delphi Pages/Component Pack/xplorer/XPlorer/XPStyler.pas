unit XPStyler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TXPStyler = class(TComponent)
  private
    { Private-Deklarationen }
  protected
    { Protected-Deklarationen }
  public
   constructor Create (AOwner: TComponent); override;
   destructor Destroy; override;
    { Public-Deklarationen }
  published
    { Published-Deklarationen }
  end;

procedure Register;

implementation

{$R XPStyler.RES}

procedure Register;
begin
  RegisterComponents('XPlorer', [TXPStyler]);
end;



constructor TXPStyler.Create (AOwner : TComponent);
var
  c, existingcomponents:Integer;

begin
  inherited Create(AOwner);

  existingcomponents := 0;
  for c := 0 to Owner.ComponentCount - 1 do if (Owner.Components[c] is TXPStyler) then Inc(existingcomponents);
  if (existingcomponents > 1) then raise Exception.Create('Sie k�nnen maximal einen TXPStyler auf dem Formular platzieren.');
end;



destructor TXPStyler.Destroy;
begin

 inherited;
end;


end.
 