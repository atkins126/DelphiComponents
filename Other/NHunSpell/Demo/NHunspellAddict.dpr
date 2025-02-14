program NHunspellAddict;

uses
  Forms,
  uHunspellAddictMain in 'uHunspellAddictMain.pas' {FrmHunspellAddictMain},
  NHunspell in '..\NHunspell.pas',
  NHunXml in '..\NHunXml.pas',
  PasZip in '..\PasZip.pas',
  uHunspellAddictConfig in 'uHunspellAddictConfig.pas' {FrmHunspellAddictConfig},
  ad3MainDictionary in '..\Addict4\ad3MainDictionary.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmHunspellAddictMain, FrmHunspellAddictMain);
  Application.CreateForm(TFrmHunspellAddictConfig, FrmHunspellAddictConfig);
  Application.Run;
end.
