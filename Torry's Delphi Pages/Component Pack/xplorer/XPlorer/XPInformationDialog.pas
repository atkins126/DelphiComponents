unit XPInformationDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, info;

type
  TXPInformationDialog = class(TComponent)
  private
    { Private-Deklarationen }

   FCaption: string;
   FIName: String;
   FIVersion: String;
   FICopyright: String;
   FILicense: String;
   FIList: TImageList;
   FImageIndex: Integer;
   FStretched: boolean;
   FCentered: boolean;
   FBitmap: TBitmap;
  protected
    { Protected-Deklarationen }
  public
   constructor Create (AOwner: TComponent); override;
   destructor Destroy; override;
   function Execute: Boolean;
    { Public-Deklarationen }
  published
   property Title: string read FCaption write FCaption;
   property InformationName: string read FIName write FIName;
   property InformationVersion: string read FIVersion write FIVersion;
   property InformationCopyright: string read FICopyright write FICopyright;
   property InformationLicense: string read FILicense write FILicense;
   property LogoImageList: TImagelist read FIList write FIList;
   property LogoImageIndex: Integer read FImageIndex write FImageIndex;
   property LogoImageStretched: boolean read FStretched write FStretched;
   property LogoImageCentered: boolean read FCentered write FCentered;

    { Published-Deklarationen }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('XPlorer', [TXPInformationDialog]);
end;


constructor TXPInformationDialog.Create (AOwner : TComponent);
begin
 inherited Create(AOwner);

 Title:= 'Info �ber';
 InformationName:= '<Programmname>';
 InformationVersion:= '<Version>';
 InformationCopyright:= '<Copyright>';
 InformationLicense:= 'Dieses Produkt ist unter den Bedingungen des Endbenutzerlizenzvertrags lizenziert.';
 LogoImageIndex:= -1;

end;



destructor TXPInformationDialog.Destroy;
begin

 inherited;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////// Prozeduren und Funktionen der Komponente
///////////////////////////////////////////////////////////////////////////////////////////////////////

function TXPInformationDialog.Execute: Boolean;
var Diag: TXPInfoDialog;
begin
 result:=false;
 FBitmap:= TBitmap.Create;
 Diag:= TXPInfoDialog.create(Owner);
 Diag.Caption:= FCaption;
 Diag.AppName.Caption:= FIName;
 Diag.AppVersion.Caption:= FIVersion;
 Diag.AppCopyright.Caption:= FICopyright;
 Diag.AppLicense.Caption:= FILicense;

 if (FIMageIndex<>-1) and (FIList<>nil) then
 begin
  FIList.GetBitmap(FImageIndex, FBitmap);
  Diag.LogoImage.Picture.Bitmap:= FBitmap;
  Diag.LogoImage.Stretch:= FStretched;
  Diag.LogoImage.Center:= FCentered;
 end;

 if Diag.ShowModal= mrOK then Result:= true;
 Diag.Free;
 FBitmap.Free;
end;


end.
