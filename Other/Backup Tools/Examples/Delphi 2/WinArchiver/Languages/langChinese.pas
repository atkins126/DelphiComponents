unit langChinese;

interface

procedure SetLanguage;

implementation
uses unTranslation;

procedure SetLanguage;
begin
  // Misc strings
  AddStr(   1, '��� "�}�s�ɮ�" �� "�}������" �ӫإߤζ}�Ҳ{�������Y��' );
  AddStr(   2, '�T�w' );
  AddStr(   3, '����' );
  AddStr(   4, '����(&H)' );
  // unit fmAboutBox
  AddStr( 500, '����' );
  AddStr( 501, 'by Morgan Martinet (C)1998' );
  AddStr( 502, '�o�Ǥ��󳣬O�K�O��.' );
  AddStr( 503, 'Copyright (C) 1998 by NOMSSI NZALI Jacques H. C.' );
  AddStr( 504, 'pasZLib �禡�w:' );
  AddStr( 505, 'mmm@imaginet.fr or mmm@mcom.fr' );
  AddStr( 506, 'BlowFish �t��k����@�� Greg Carter, CRYPTOCard ����' );
  AddStr( 507, '�ۧڸ����Y�{���X�� Oliver Buschjost ����' );
  AddStr( 508, '����:' );
  // unit fmTiming
  AddStr( 600, '�w��ɶ� :' );
  AddStr( 601, '�Ѿl�ɶ� :' );
  // unit fmMain
  AddStr( 700, '�}�s�ɮ�...' );
  AddStr( 701, '�}������...' );
  AddStr( 702, '�[�J(&A)...' );
  AddStr( 703, '�����Y(&E)...' );
  AddStr( 704, '�R��(&D)...' );
  AddStr( 705, '���(&A)' );
  AddStr( 706, '�}�s�ɮ�' );
  AddStr( 707, '�}������' );
  AddStr( 708, '�[�J�ɮ�...' );
  AddStr( 709, '�Ѷ}�ɮ�...' );
  AddStr( 710, '�R���ɮ�...' );
  AddStr( 711, '���Y�� (*.mmm)|*.mmm|SFX Archives (*.exe)|*.exe|�Ҧ����ɮ� (*.*)|*.*' );
  AddStr( 712, '���Y�� (*.mmm)|*.mmm|�Ҧ����ɮ� (*.*)|*.*' );
  AddStr( 713, '�}�Ҳ{�������Y��' );
  AddStr( 714, '�إ߷s�����Y��' );
  AddStr( 715, '�}�����Y�ɪ��@�Ӥ��ΰϬq' );
  AddStr( 718, '%d ���ɮ�, %s' );
  AddStr( 720, '�ɮ� "%s" �w�g�s�b' );
  AddStr( 721, '�z�n���]�o�����Y�ɶ� ?' );
  AddStr( 722, '�z�n�R���o�����Y�ɶ� ?' );
  AddStr( 723, '%.0n Byte' );
  AddStr( 724, '%.0n Bytes' );
  AddStr( 725, '%.0n Kb' );
  AddStr( 726, '%.0n Mb' );
  AddStr( 727, '��ܤF %d ���ɮ�, %s' );
  AddStr( 729, '�L��' );
  AddStr( 730, '�N�ثe�����Y�ɧ�W��:' );
  AddStr( 731, '�L�k�N���Y�ɧ�W�� "%s" !' );
  AddStr( 732, '�۸���(SFX) �պA�]�w' );
  AddStr( 733, '�إߤ@�Ӧۧڸ����Y�ɮ�' );
  AddStr( 734, '�إ�' );
  AddStr( 735, '�L�k�إߦ۸��� !' );
  AddStr( 736, '�]�w���Y�ɵ���' );
  AddStr( 737, '���Y�ɵ���' );
  AddStr( 738, '�{�Ƕi�椤, �е��ݪ���u�@����, �Ϊ̫�[���]�Ӥ��_�C' );
  AddStr( 739, '�z�w�g����F�Y���ɮ�, �бN�䵲���M��b�դ@���C' );
  AddStr( 740, '�A�������}�Ҥ@�����Y�ɡC' );
  AddStr( 741, '�䤣��P�ɮ����� %s ���p���{��' );
  AddStr( 742, '�ɦW' );
  AddStr( 743, '���' );
  AddStr( 744, '�ɶ�' );
  AddStr( 745, '����' );
  AddStr( 746, '���' );
  AddStr( 747, '���Y�᪺����' );
  AddStr( 748, '����#' );
  AddStr( 749, '���|' );
  AddStr( 750, '�ɮ�(&F)' );
  AddStr( 751, '�ʧ@(&A)' );
  AddStr( 752, '�ﶵ(&O)' );
  AddStr( 753, '����(&H)' );
  AddStr( 754, '�}�s�ɮ�(&N)...' );
  AddStr( 755, '�}������(&O)...' );
  AddStr( 756, '�}�Ҥ@�Ӥ�����(&S)...' );
  AddStr( 757, '�������Y��(&C)' );
  AddStr( 758, '&��T...' );
  AddStr( 759, '������Y�ɦW��(&N)' );
  AddStr( 760, '���]���Y��(&R)' );
  AddStr( 761, '�R�����Y��(&D)' );
  AddStr( 762, '����(&Q)' );
  AddStr( 763, '�˵�(&V)...' );
  AddStr( 764, '����(&S)' );
  AddStr( 765, '�إߥi������(&M)' );
  AddStr( 766, '�]�w���Y�ɵ���...' );
  AddStr( 767, '�۸���(&SFX) �պA�]�w...' );
  AddStr( 769, '����(&A)...' );
  AddStr( 770, '�إ߷s�����Y��' );
  AddStr( 771, '�}�Ҳ{�s�����Y��' );
  AddStr( 772, '�}�����Y�ɪ��@�Ӥ��ΰϬq' );
  AddStr( 773, '�������Y��' );
  AddStr( 774, '������Y�ɬ�����T' );
  AddStr( 775, '���ثe���Y�ɪ��W��...' );
  AddStr( 776, '���]���Y�ɤ��e' );
  AddStr( 777, '�R�����Y��' );
  AddStr( 778, '�����{��' );
  AddStr( 781, '�[�J�ɮ�' );
  AddStr( 782, '�����Y�ɮ�' );
  AddStr( 783, '�R���ɮ�' );
  AddStr( 784, '�˵��ɮ�' );
  AddStr( 785, '��ܩҦ��ɮ�' );
  AddStr( 786, '�إߦ۸���' );
  AddStr( 787, '���ثe�����Y�ɩw�q����' );
  AddStr( 788, '�ܧ�]�w' );
  AddStr( 789, '�ܧ�۸��ɳ]�w' );
  AddStr( 790, '���󥻵{��' );
  AddStr( 798, '�]�w(&C)...' );
  AddStr( 799, '%s �ɮ�' );
  AddStr( 800, '�����ɮ�...' );
  AddStr( 801, '�������(&N)' );
  AddStr( 802, '�ϦV���(&I)' );
  AddStr( 803, '��' );
  AddStr( 804, '���˵�' );
  AddStr( 805, '�j�ϥ�' );
  AddStr( 806, '�p�ϥ�' );
  AddStr( 807, '�M��' );
  AddStr( 808, '�ԲӸ��' );
  AddStr( 809, '�����i�}' );
  AddStr( 810, '�������X' );
  AddStr( 809, '�����i�}' );
  AddStr( 810, '�������X' );
  AddStr( 811, '�M���ɮײM��' );
  AddStr( 812, '�إ��ɮײM��' );
  AddStr( 813, '�Ƨ��ɮײM��' );
  AddStr( 814, '%s'#10#13'���Y�ɤ��s�b!' );
  AddStr( 815, '�ˬd�����' );
  AddStr( 816, '�ˬd���Y�ɪ������' );
  AddStr( 817, '�˵��W�@������X(&V)...' );
  AddStr( 818, '�˵��W�@���ާ@����X���G' );
  AddStr( 819, '�w��' );
  AddStr( 820, '�����Y�ð���w�˵{��' );
  AddStr( 821, '�r��(&F)...' );
  AddStr( 822, '�Ƨ�(&S)' );
  AddStr( 823, '��l����(&O)' );
  AddStr( 824, '�ܧ�ثe���r��' );
  AddStr( 825, '��ܱƧǤ覡' );
  // unit fmAdd and fmAddDropedFiles
  AddStr( 900, '�[�J�����ɮ�' );
  AddStr( 901, '�W�� :' );
  AddStr( 902, '��Ƨ�' );
  AddStr( 903, '�j�M�l��Ƨ�' );
  AddStr( 904, '�]�t�ثe���|' );
  AddStr( 905, '�x�s�Ÿ�Ƨ�' );
  AddStr( 906, '���|�x�s�覡 :' );
  AddStr( 907, '�O�_�N�ɮץ[�K ?' );
  AddStr( 908, '���Y����:' );
  AddStr( 909, '�[�J' );
  AddStr( 910, '�L'+#13+
               '����'+#13+
               '�۹�' );
  AddStr( 911, '�̤j (�̺C)'+#13+
               '�@��'+#13+
               '�ֳt'+#13+
               '�W�ֳt'+#13+
               '�L' );
  AddStr( 912, '�[�J�즲���ɮ�' );
  AddStr( 913, '�[�J����' );
  AddStr( 914, '�z�� :' );
  AddStr( 915, '�[��ثe����Ƨ� ?' );
  // unit fmConfiguration
  AddStr( 1000, '�]�w' );
  AddStr( 1001, '�ɮפ���' );
  AddStr( 1002, '���Y�ɪ��إ�' );
  AddStr( 1003, '�ﶵ' );
  AddStr( 1004, '�������Y��' );
  AddStr( 1005, '�C�Ӥ����ɮ׳̤j�e�q:' );
  AddStr( 1006, '720 Kb'+#13+
                '1,44 Mb'+#13+
                '��L (Kb):' );
  AddStr( 1007, '�ϥ����Y' );
  AddStr( 1008, '�ϥΥ[�K' );
  AddStr( 1009, '�j�T���Y(Solid)' );
  AddStr( 1010, '��Ū' );
  AddStr( 1011, '�إߦ۸���' );
  AddStr( 1014, '�϶��j�p' );
  AddStr( 1015, '�O�d�Ŷ�' );
  AddStr( 1016, 'Kb' );
  AddStr( 1017, '�y�Y:' );
  AddStr( 1018, '�۰�'+#13+
                '�^��'+#13+
                '�k��'+#13+
                '����'+#13+
                '�������'+#13+
                '�w��'+#13+
                '�q�j�Q��'+#13+
                'Ĭ�p��'+#13+
                '��Z����' );
  AddStr( 1019, '��ܪŪ���Ƨ�' );
  AddStr( 1020, '��ܾ𪬵��c' );
  // unit fmCreateFolder
  AddStr( 1100, '�ثe��Ƨ�:' );
  AddStr( 1101, '�W��:' );
  // unit fmDelete
  AddStr( 1200, '�R��' );
  AddStr( 1201, '�ɮ�' );
  AddStr( 1202, '������Y��(&E)'+#13+
                '��ܪ��ɮ�(&S)'+#13+
                '�ɮ�(&F):' );
  // unit fmEnterCryptKey
  AddStr( 1300, '�t�ΰT��e' );
  AddStr( 1301, '���ñK�X ?' );
  // unit fmExtract
  AddStr( 1400, '�����Y' );
  AddStr( 1401, '�[���Y��:' );
  AddStr( 1402, '�ɮ�' );
  AddStr( 1403, '��ܪ��ɮ�(&S)'+#13+
                '�Ҧ��ɮ�(&A)'+#13+
                '�ɮ�(&I):' );
  AddStr( 1404, '�ϥθ�Ƨ��W��(&U)' );
  AddStr( 1405, '�л\�w�s�b���ɮ�'+#13+
                '���L�w�s�b���ɮ�'+#13+
                '��s���s���ɮ�'+#13+
                '�n�D�T�{'+#13+
                '�u�^�s�w�s�b���ɮ�'+#13+
                '��s�w�s�b���ɮ�' );
  AddStr( 1406, '��Ƨ� / �Ϻо�' );
  AddStr( 1407, '�s��Ƨ�...' );
  // unit fmHelpOnSFX
  AddStr( 1500, '�H�U����r�i��|�ϥΩ�"�R�O�C"��'+#13+
                '"���w�����Y���|" ��� :' );
  AddStr( 1501, '�N�|�Q�Ȧs�ؿ��Ҩ��N'+#13+
                '(�q�`�O ''c:\windows\temp'' �� ''c:\win95\temp'' �� ''c:\temp'')' );
  AddStr( 1502, '�N�|�Q Windows �ؿ��Ҩ��N'+#13+
                '(�q�`�O ''c:\windows'' �� ''c:\win95'')' );
  AddStr( 1503, '�N�|�Q System �ؿ��Ҩ��N'+#13+
                '(�q�`�O ''c:\windows\system'' �� ''c:\win95\system'')' );
  AddStr( 1504, '�N�|�Q Program Files �ؿ��Ҩ��N'+#13+
                '(�q�`�O ''c:\Program Files'' [�� Windows �w�˪��y���өw])' );
  AddStr( 1505, '�N�|�Q�ɮױ������ܪ��ؿ��Ҩ��N'+#13+
                '(�u�A�Ω� "�R�O�C" �� "�޼�" ���)' );
  AddStr( 1506, '�d��:' );
  AddStr( 1507, '<PF>MyCompany\MyStuff' );
  // unit fmInformation
  AddStr( 1600, '���|:' );
  AddStr( 1601, '�W��:' );
  AddStr( 1602, '�ɮפj�p:' );
  AddStr( 1603, '�ɮ�:' );
  AddStr( 1604, '���Y:' );
  AddStr( 1605, '���/�ɶ�:' );
  AddStr( 1606, '���ΰϬq:' );
  AddStr( 1607, '�ݩ�' );
  AddStr( 1608, '�w�[�K' );
  AddStr( 1609, '�w���Y' );
  AddStr( 1610, '�j�T���Y(Solid)' );
  AddStr( 1611, '��Ū' );
  AddStr( 1612, '�̫᪺���ΰϬq' );
  AddStr( 1613, '��T' );
  // unit fmSFXcomments
  AddStr( 1700, '����' );
  AddStr( 1701, '�}�Ҧ۸��ɮ���ܵ���' );
  AddStr( 1702, '�Ѷ}�۸��ɤ�����ܵ���' );
  AddStr( 1703, '�M������' );
  // unit fmSFXConfig
  AddStr( 1800, '�۸��ɳ]�w' );
  AddStr( 1801, '�����Y������ɮ� ?' );
  AddStr( 1802, '�ϥΪ̿�ܭn�����Y���ɮ� ?' );
  AddStr( 1803, '�ϥΪ̿���л\�Ҧ� ?');
  AddStr( 1804, '���D:' );
  AddStr( 1805, '�R�O�C:' );
  AddStr( 1806, '�޼�:' );
  AddStr( 1807, '���w�����Y���|:' );
  AddStr( 1808, '�ɮ��л\�Ҧ�:' );
  AddStr( 1809, '����...' );
  AddStr( 1810, '�n�D�T�{'+#13+
                '�л\�w�s�b���ɮ�'+#13+
                '���L�w�s�b���ɮ�'+#13+
                '�u�л\���s���ɮ�'+#13+
                '�u�٭�w�s�b���ɮ�'+#13+
                '�u�����Y�w�s�b�ӥB����s���ɮ�' );
  AddStr( 1811, '���\�ϥΪ̤�����o���ɮ� ?' );
  // unit fmTextViewer
  AddStr( 1900, '�˵�: %s' );
  AddStr( 1901, '�ƻs�ŶKï(&C)' );
  AddStr( 1902, '�r��(&F)' );
  // unit fmView
  AddStr( 2000, '�˵� : %s' );
  AddStr( 2001, '�ϥ�' );
  AddStr( 2002, '�˵�' );
  AddStr( 2003, '�n�O���p���{��(&A) (%s)'+#13+
                '���ت� ASCII ��r�s����' );
  // unit fmLastOutput
  AddStr( 2100, '�˵��W����X' );
end;

end.
