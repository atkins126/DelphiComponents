unit TB97Cnst;

{
  Toolbar97
  Copyright (C) 1998-99 by Jordan Russell
  For conditions of distribution and use, see LICENSE.TXT.

  String constants for Korean language by Baek UnYoung, 2000.03. (TB97 v1.75e base)
}

interface

{$I TB97Ver.inc}

{$IFDEF TB97D3} resourcestring {$ELSE} const {$ENDIF}
  { TDock97 exception messages }
  STB97DockParentNotAllowed = 'TDock97 ��Ʈ���� TToolWindow97 �Ǵ� �ٸ� TDock97 �� ���� �� �����ϴ�.';
      {'A TDock97 control cannot be placed inside a tool window or another TDock97'}
  STB97DockCannotChangePosition = '�̹� ��Ʈ���� �����ϰ� �־�, TDock97 �� ��ġ�� ������ �� �����ϴ�.';
      {'Cannot change Position of a TDock97 if it already contains controls'}

  { TCustomToolWindow97 exception messages }
  STB97ToolwinNameNotSet = 'Name ������Ƽ�� �����Ǿ� ���� �ʱ� ������, TToolWindow97 �� ��ġ�� ������ �� �����ϴ�.';
      {'Cannot save tool window''s position because Name property is not set'}
  STB97ToolwinDockedToNameNotSet = 'DackedTo �� Name ������Ƽ�� �����Ǿ� ���� �ʱ� ������, TToolWindow97 �� ��ġ�� ������ �� �����ϴ�.';
      {'Cannot save tool window''s position because DockedTo''s Name property not set'}
  STB97ToolwinParentNotAllowed = 'TToolWindow97 �� TDock97 �Ǵ� �� �ٷ� ������ ���� �� �ֽ��ϴ�.';
      {'A tool window can only be placed on a TDock97 or directly on the form'}

  { TCustomToolbar97 exception messages }
  STB97ToolbarControlNotChildOfToolbar = '��Ʈ�� ''%s'' �� ������ �ڽ��� �ƴմϴ�.';
      {'Control ''%s'' is not a child of the toolbar'}

  { TToolbarSep97 exception messages }
  STB97SepParentNotAllowed = 'TToolbarSep97 �� TToolbar97 ������ ���� �� �ֽ��ϴ�.';
      {'TToolbarSep97 can only be placed on a TToolbar97'}

implementation

end.
 
