unit fmProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TProgress = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Progress: TProgress;

implementation
uses fmMain;
{$R *.DFM}

procedure TProgress.BitBtn1Click(Sender: TObject);
begin
  Main.Archiver1.RequestAbort;
end;

end.
