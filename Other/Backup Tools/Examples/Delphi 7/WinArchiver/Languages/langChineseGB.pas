unit langChineseGB;

interface

procedure SetLanguage;

implementation
uses unTranslation;

procedure SetLanguage;
begin
  // Misc strings
  AddStr(   1, 'ѡ�� "���µ���" �� "�����ɵ�" ���������������е�ѹ����' );
  AddStr(   2, 'ȷ��' );
  AddStr(   3, 'ȡ��' );
  AddStr(   4, '˵��(&H)' );
  // unit fmAboutBox
  AddStr( 500, '���' );
  AddStr( 501, 'by Morgan Martinet (C)1998' );
  AddStr( 502, '��ЩԪ��������ѵ�.' );
  AddStr( 503, 'Copyright (C) 1998 by NOMSSI NZALI Jacques H. C.' );
  AddStr( 504, 'pasZLib ��ʽ��:' );
  AddStr( 505, 'mmm@imaginet.fr or mmm@mcom.fr' );
  AddStr( 506, 'BlowFish ���㷨��ʵ���� Greg Carter, CRYPTOCard �ṩ' );
  AddStr( 507, '���ҽ�ѹ����ʽ���� Oliver Buschjost �ṩ' );
  AddStr( 508, '��վ:' );
  // unit fmTiming
  AddStr( 600, '�ѻ�ʱ�� :' );
  AddStr( 601, 'ʣ��ʱ�� :' );
  // unit fmMain
  AddStr( 700, '���µ���...' );
  AddStr( 701, '�����ɵ�...' );
  AddStr( 702, '����(&A)...' );
  AddStr( 703, '��ѹ��(&E)...' );
  AddStr( 704, 'ɾ��(&D)...' );
  AddStr( 705, '����(&A)' );
  AddStr( 706, '���µ���' );
  AddStr( 707, '�����ɵ�' );
  AddStr( 708, '���뵵��...' );
  AddStr( 709, '�⿪����...' );
  AddStr( 710, 'ɾ������...' );
  AddStr( 711, 'ѹ���� (*.mmm)|*.mmm|SFX Archives (*.exe)|*.exe|���еĵ��� (*.*)|*.*' );
  AddStr( 712, 'ѹ���� (*.mmm)|*.mmm|���еĵ��� (*.*)|*.*' );
  AddStr( 713, '�������е�ѹ����' );
  AddStr( 714, '�����µ�ѹ����' );
  AddStr( 715, '����ѹ������һ���ָ�����' );
  AddStr( 718, '%d ������, %s' );
  AddStr( 720, '���� "%s" �Ѿ�����' );
  AddStr( 721, '��Ҫ�������ѹ������ ?' );
  AddStr( 722, '��Ҫɾ�����ѹ������ ?' );
  AddStr( 723, '%.0n Byte' );
  AddStr( 724, '%.0n Bytes' );
  AddStr( 725, '%.0n Kb' );
  AddStr( 726, '%.0n Mb' );
  AddStr( 727, 'ѡ���� %d ������, %s' );
  AddStr( 729, '��Ч' );
  AddStr( 730, '��Ŀǰ��ѹ��������Ϊ:' );
  AddStr( 731, '�޷���ѹ��������Ϊ "%s" !' );
  AddStr( 732, '�Խ⵵(SFX) ��̬�趨' );
  AddStr( 733, '����һ�����ҽ�ѹ������' );
  AddStr( 734, '����' );
  AddStr( 735, '�޷������Խ⵵ !' );
  AddStr( 736, '�趨ѹ����ע��' );
  AddStr( 737, 'ѹ����ע��' );
  AddStr( 738, '���������, ��ȴ�ֱ���������, ���߰�[����]���жϡ�' );
  AddStr( 739, '���Ѿ�ִ����ĳ������, �뽫�����Ȼ������һ�Ρ�' );
  AddStr( 740, '������ȿ���һ��ѹ������' );
  AddStr( 741, '�Ҳ����뵵������ %s �����ĳ�ʽ' );
  AddStr( 742, '����' );
  AddStr( 743, '����' );
  AddStr( 744, 'ʱ��' );
  AddStr( 745, '����' );
  AddStr( 746, '����' );
  AddStr( 747, 'ѹ����ĳ���' );
  AddStr( 748, '�ָ�#' );
  AddStr( 749, '·��' );
  AddStr( 750, '����(&F)' );
  AddStr( 751, '����(&A)' );
  AddStr( 752, 'ѡ��(&O)' );
  AddStr( 753, '˵��(&H)' );
  AddStr( 754, '���µ���(&N)...' );
  AddStr( 755, '�����ɵ�(&O)...' );
  AddStr( 756, '����һ���ָ(&S)...' );
  AddStr( 757, '�ر�ѹ����(&C)' );
  AddStr( 758, '&��Ѷ...' );
  AddStr( 759, '����ѹ��������(&N)' );
  AddStr( 760, '����ѹ����(&R)' );
  AddStr( 761, 'ɾ��ѹ����(&D)' );
  AddStr( 762, '����(&Q)' );
  AddStr( 763, '����(&V)...' );
  AddStr( 764, 'ȫѡ(&S)' );
  AddStr( 765, '������ִ�е�(&M)' );
  AddStr( 766, '�趨ѹ����ע��...' );
  AddStr( 767, '�Խ⵵(&SFX) ��̬�趨...' );
  AddStr( 769, '���(&A)...' );
  AddStr( 770, '�����µ�ѹ����' );
  AddStr( 771, '�����ִ��ѹ����' );
  AddStr( 772, '����ѹ������һ���ָ�����' );
  AddStr( 773, '�ر�ѹ����' );
  AddStr( 774, '��ʾѹ���������Ѷ' );
  AddStr( 775, '����Ŀǰѹ����������...' );
  AddStr( 776, '����ѹ��������' );
  AddStr( 777, 'ɾ��ѹ����' );
  AddStr( 778, '������ʽ' );
  AddStr( 781, '���뵵��' );
  AddStr( 782, '��ѹ������' );
  AddStr( 783, 'ɾ������' );
  AddStr( 784, '���ӵ���' );
  AddStr( 785, 'ѡ�����е���' );
  AddStr( 786, '�����Խ⵵' );
  AddStr( 787, 'ΪĿǰ��ѹ��������ע��' );
  AddStr( 788, '����趨' );
  AddStr( 789, '����Խ⵵�趨' );
  AddStr( 790, '��춱���ʽ' );
  AddStr( 798, '�趨(&C)...' );
  AddStr( 799, '%s ����' );
  AddStr( 800, '�رյ���...' );
  AddStr( 801, 'ȡ��ѡ��(&N)' );
  AddStr( 802, '����ѡ��(&I)' );
  AddStr( 803, '��' );
  AddStr( 804, '��״����' );
  AddStr( 805, '��ͼʾ' );
  AddStr( 806, 'Сͼʾ' );
  AddStr( 807, '�嵥' );
  AddStr( 808, '��ϸ����' );
  AddStr( 809, 'ȫ��չ��' );
  AddStr( 810, 'ȫ���պ�' );
  AddStr( 809, '��ȫչ��' );
  AddStr( 810, '��ȫ�պ�' );
  AddStr( 811, '��������嵥' );
  AddStr( 812, '���������嵥' );
  AddStr( 813, '���򵵰��嵥' );
  AddStr( 814, '%s'#10#13'ѹ����������!' );
  AddStr( 815, '���������' );
  AddStr( 816, '���ѹ������������' );
  AddStr( 817, '������һ�ε����(&V)...' );
  AddStr( 818, '������һ�β�����������' );
  AddStr( 819, '��װ' );
  AddStr( 820, '��ѹ����ִ�а�װ��ʽ' );
  AddStr( 821, '����(&F)...' );
  AddStr( 822, '����(&S)' );
  AddStr( 823, 'ԭʼ˳��(&O)' );
  AddStr( 824, '���Ŀǰ������' );
  AddStr( 825, 'ѡ������ʽ' );
{*}  AddStr( 826, 'F&ilters...' );
{*}  AddStr( 827, 'Lets you define filters to select files to be added' );
  // unit fmAdd and fmAddDropedFiles
  AddStr( 900, '������Щ����' );
  AddStr( 901, '���� :' );
  AddStr( 902, '���ϼ�' );
  AddStr( 903, '��Ѱ�����ϼ�' );
  AddStr( 904, '����Ŀǰ·��' );
  AddStr( 905, '��������ϼ�' );
  AddStr( 906, '·�����淽ʽ :' );
  AddStr( 907, '�Ƿ񽫵������� ?' );
  AddStr( 908, 'ѹ���ȼ�:' );
  AddStr( 909, '����' );
  AddStr( 910, '��'+#13+
               '����'+#13+
               '���' );
  AddStr( 911, '��� (����)'+#13+
               'һ��'+#13+
               '����'+#13+
               '������'+#13+
               '��' );
  AddStr( 912, '������ҷ�ĵ���' );
  AddStr( 913, '������Ŀ' );
  AddStr( 914, 'ɸѡ :' );
  AddStr( 915, '�ӵ�Ŀǰ�����ϼ� ?' );
{*}AddStr( 916, 'Filter files ?' );
  // unit fmConfiguration
  AddStr( 1000, '�趨' );
  AddStr( 1001, '�����ָ�' );
  AddStr( 1002, 'ѹ�����Ľ���' );
  AddStr( 1003, 'ѡ��' );
  AddStr( 1004, '�и�ѹ����' );
  AddStr( 1005, 'ÿ���ָ���������:' );
  AddStr( 1006, '720 Kb'+#13+
                '1,44 Mb'+#13+
                '���� (Kb):' );
  AddStr( 1007, 'ʹ��ѹ��' );
  AddStr( 1008, 'ʹ�ü���' );
  AddStr( 1009, 'ǿ��ѹ��(Solid)' );
  AddStr( 1010, 'Ψ��' );
  AddStr( 1011, '�����Խ⵵' );
  AddStr( 1014, '�����С' );
  AddStr( 1015, '�����ռ�' );
  AddStr( 1016, 'Kb' );
  AddStr( 1017, '��ϵ:' );
  AddStr( 1018, '�Զ�'+#13+
                'Ӣ��'+#13+
                '����'+#13+
                'BIG5����'+#13+
                'GB����'+#13+
                '��������'+#13+
                '����'+#13+
                '�������'+#13+
                '������'+#13+
                '��������'+#13+
{*}             'Danish'+#13+
                'Dutch'+#13+
                'Czech'
                );
  AddStr( 1019, '��ʾ�յ����ϼ�' );
  AddStr( 1020, '��ʾ��״�ṹ' );
  // unit fmCreateFolder
  AddStr( 1100, 'Ŀǰ���ϼ�:' );
  AddStr( 1101, '����:' );
  // unit fmDelete
  AddStr( 1200, 'ɾ��' );
  AddStr( 1201, '����' );
  AddStr( 1202, '����ѹ����(&E)'+#13+
                'ѡ��ĵ���(&S)'+#13+
                '����(&F):' );
  // unit fmEnterCryptKey
  AddStr( 1300, 'ϵͳѶϢe' );
  AddStr( 1301, '�������� ?' );
  // unit fmExtract
  AddStr( 1400, '��ѹ��' );
  AddStr( 1401, '��ѹ����:' );
  AddStr( 1402, '����' );
  AddStr( 1403, 'ѡ��ĵ���(&S)'+#13+
                '���е���(&A)'+#13+
                '����(&I):' );
  AddStr( 1404, 'ʹ�����ϼ�����(&U)' );
  AddStr( 1405, '�����Ѵ��ڵĵ���'+#13+
                '�Թ��Ѵ��ڵĵ���'+#13+
                '���½��µĵ���'+#13+
                'Ҫ��ȷ��'+#13+
                'ֻ�ش��Ѵ��ڵĵ���'+#13+
                '�����Ѵ��ڵĵ���' );
  AddStr( 1406, '���ϼ� / �ŵ���' );
  AddStr( 1407, '�����ϼ�...' );
  // unit fmHelpOnSFX
  AddStr( 1500, '���¹ؼ��ֿ��ܻ�ʹ���"������"��'+#13+
                '"�ڶ���ѹ��·��" ��λ :' );
  AddStr( 1501, '���ᱻ�ݴ�Ŀ¼��ȡ��'+#13+
                '(ͨ���� ''c:\windows\temp'' �� ''c:\win95\temp'' �� ''c:\temp'')' );
  AddStr( 1502, '���ᱻ Windows Ŀ¼��ȡ��'+#13+
                '(ͨ���� ''c:\windows'' �� ''c:\win95'')' );
  AddStr( 1503, '���ᱻ System Ŀ¼��ȡ��'+#13+
                '(ͨ���� ''c:\windows\system'' �� ''c:\win95\system'')' );
  AddStr( 1504, '���ᱻ Program Files Ŀ¼��ȡ��'+#13+
                '(ͨ���� ''c:\Program Files'' [�� Windows ��װ�����Զ���])' );
  AddStr( 1505, '���ᱻ��������ѹ����Ŀ¼��ȡ��'+#13+
                '(ֻ����� "������" �� "����" ��λ)' );
  AddStr( 1506, '  ��:' );
  AddStr( 1507, '<PF>MyCompany\MyStuff' );
  // unit fmInformation
  AddStr( 1600, '·��:' );
  AddStr( 1601, '����:' );
  AddStr( 1602, '������С:' );
  AddStr( 1603, '����:' );
  AddStr( 1604, 'ѹ��:' );
  AddStr( 1605, '����/ʱ��:' );
  AddStr( 1606, '�ָ�����:' );
  AddStr( 1607, '����' );
  AddStr( 1608, '�Ѽ���' );
  AddStr( 1609, '��ѹ��' );
  AddStr( 1610, 'ǿ��ѹ��(Solid)' );
  AddStr( 1611, 'Ψ��' );
  AddStr( 1612, '����ķָ�����' );
  AddStr( 1613, '��Ѷ' );
  // unit fmSFXcomments
  AddStr( 1700, 'ע��' );
  AddStr( 1701, '�����Խ⵵ʱ��ʾע��' );
  AddStr( 1702, '�⿪�Խ⵵֮����ʾע��' );
  AddStr( 1703, '���ע��' );
  // unit fmSFXConfig
  AddStr( 1800, '�Խ⵵�趨' );
  AddStr( 1801, '��ѹ����ִ�е��� ?' );
  AddStr( 1802, 'ʹ����ѡ��Ҫ��ѹ���ĵ��� ?' );
  AddStr( 1803, 'ʹ����ѡ�񸲸�ģʽ ?');
  AddStr( 1804, '����:' );
  AddStr( 1805, '������:' );
  AddStr( 1806, '����:' );
  AddStr( 1807, '�ڶ���ѹ��·��:' );
  AddStr( 1808, '��������ģʽ:' );
  AddStr( 1809, 'ע��...' );
  AddStr( 1810, 'Ҫ��ȷ��'+#13+
                '�����Ѵ��ڵĵ���'+#13+
                '�Թ��Ѵ��ڵĵ���'+#13+
                'ֻ���ǽ��µĵ���'+#13+
                'ֻ��ԭ�Ѵ��ڵĵ���'+#13+
                'ֻ��ѹ���Ѵ��ڶ��ұȽ��µĵ���' );
  AddStr( 1811, '����ʹ���߲�ִ��������� ?' );
  // unit fmTextViewer
  AddStr( 1900, '����: %s' );
  AddStr( 1901, '���Ƽ�����(&C)' );
  AddStr( 1902, '����(&F)' );
  // unit fmView
  AddStr( 2000, '���� : %s' );
  AddStr( 2001, 'ʹ��' );
  AddStr( 2002, '����' );
  AddStr( 2003, '�Ǽǹ����ĳ�ʽ(&A) (%s)'+#13+
                '�ڽ��� ASCII ���������' );
  // unit fmLastOutput
  AddStr( 2100, '�����ϴ����' );
  // unit fmFilters
{*}  AddStr( 2200, 'Filters' );
{*}  AddStr( 2202, '����' );
{*}  AddStr( 2203, '�༭' );
{*}  AddStr( 2204, 'ɾ��' );
{*}  AddStr( 2205, 'ȫ�����' );
{*}  AddStr( 2206, 'filter����' );
{*}  AddStr( 2207, '����'+#13+
{*}                '�ų�' );
{*}  AddStr( 2208, '�޸�filter:' );
{*}  AddStr( 2209, '����filter:' );
end;

end.
