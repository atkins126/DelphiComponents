{ ���� ���� ��� ������������� ������ Lazarus. �� �������������!
�������� ��� ������������ ������ ��� ���������� � ��������� ������.
 }

unit fbdemofpc; 

interface

uses
  fbcustomdataset, mydbunit, metadatasqlgenerator, jvuibstoredproc, 
    FBDataSetRegister, LazarusPackageIntf; 

implementation

procedure Register; 
begin
  RegisterUnit('metadatasqlgenerator', @metadatasqlgenerator.Register); 
  RegisterUnit('FBDataSetRegister', @FBDataSetRegister.Register); 
end; 

initialization
  RegisterPackage('fbdemofpc', @Register); 
end.
