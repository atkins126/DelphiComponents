unit TB97Cnst;

{
  Toolbar97
  Copyright (C) 1998-99 by Jordan Russell
  For conditions of distribution and use, see LICENSE.TXT.

  String constants for russian language by Grischenko Alexander.
}

interface

{$I TB97Ver.inc}

{$IFDEF TB97D3} resourcestring {$ELSE} const {$ENDIF}
  { TDock97 exception messages }
  STB97DockParentNotAllowed = '��������� TDock97 �� ����� ���� ������� ������ Tool window ��� ������� TDock97';
  STB97DockCannotChangePosition = '���������� �������� �������� Position ���������� TDock97, ���� �� ��� �������� ������ ����������';

  { TCustomToolWindow97 exception messages }
  STB97ToolwinNameNotSet = '���������� ��������� ������� Tool window, �.�. �� ���������� �������� Name';
  STB97ToolwinDockedToNameNotSet = '���������� ��������� ������� Tool window, �.�. �� ���������� �������� Name ���������� DockedTo';
  STB97ToolwinParentNotAllowed = 'Tool window ����� ���� �������� ������ �� TDock97 ���� ��������������� �� �����';

  { TCustomToolbar97 exception messages }
  STB97ToolbarControlNotChildOfToolbar = '��������� ''%s'' �� ����������� Toolbar''�';

  { TToolbarSep97 exception messages }
  STB97SepParentNotAllowed = 'TToolbarSep97 ����� ���� ������� ������ �� TToolbar97';

  STB97Language = 'Russian';

implementation

end.
 
