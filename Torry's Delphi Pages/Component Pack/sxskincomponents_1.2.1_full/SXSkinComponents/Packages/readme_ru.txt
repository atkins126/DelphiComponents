��� ������� ����� ����������� ��� Delphi/C++Builder:
 1. �������� ����� ����� (File -> New -> Package).
 2. ��������� ��� ��� ������ SXSkin_XX_R.bpk (��������, SXSkin_D5_R ��� SXSkin_CB5_R).
 3. ��������� �� �������� ������ ������� � ���������� Usage options � Designtime and Runtime.
 4. �������� ��� pas-����� � ���� �����, �� ������� ���������:
     SXSkinIcons.dcr
     SXSkinNotebookReg.pas
     SXSkinReg_D.pas
     SXStrLEdit.pas
     SXSkinEditors.pas
 5. ������������� ���� �����.
 6. �������� ����� �����.
 7. ��������� ��� ��� ������ SXSkin_XX_D.bpk.
 8. ��������� �� �������� ������� ������� � ���������� Usage options � Designtime only.
 9. �������� ��������� ����� � ���� �����:
     SXSkinIcons.dcr
     SXSkinNotebookReg.pas
     SXSkinReg_D.pas
     SXStrLEdit.pas
     SXSkinEditors.pas
10. �������� Project -> View Source � �������� SXSkin_XX_R � ������ requires.
11. ���������� ������ �����.

P.S. ��� ������������� ���������� ����� SXSkinIcons.dcr �������� ���������
     ������ � ���� SXSkin_XX_R.bpk:
     {$R '..\SXSkinIcons.dcr'}
     (���� ����� �������� � ����� SXSkinComponents\Packages).