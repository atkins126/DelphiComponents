unit uHunspellAddictConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst;

type
  TFrmHunspellAddictConfig = class(TForm)
    lbDictsFound: TLabel;
    lbSpellDicts: TCheckListBox;
    Label1: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    lbDictInfo: TLabel;
    procedure lbSpellDictsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHunspellAddictConfig: TFrmHunspellAddictConfig;

implementation
uses
  NHunspell;

{$R *.dfm}

resourceString
  hmSpellConfigDictHint = 'Publisher: %s, Version: %s, ID: %s, Internal ID: %s';

procedure TFrmHunspellAddictConfig.lbSpellDictsClick(Sender: TObject);
begin
  if lbSpellDicts.ItemIndex > -1 then
    with TNHSpellDictionary(lbSpellDicts.Items.Objects[lbSpellDicts.ItemIndex]) do
      lbDictInfo.Caption := Format(hmSpellConfigDictHint, [Publisher, Version, ID, InternalFileID]);
end;

end.
