unit fmArchComment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TArchComment = class(TForm)
    Panel1: TPanel;
    Comment: TMemo;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  ArchComment: TArchComment;
  Comment : String;

implementation

{$R *.DFM}

end.
