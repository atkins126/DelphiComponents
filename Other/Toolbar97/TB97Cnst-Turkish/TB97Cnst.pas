unit TB97Cnst_tr;

{
  Toolbar97
  Copyright (C) 1998-99 by Jordan Russell
  For conditions of distribution and use, see LICENSE.TXT.

  String constants for Turkish language by Adnan Yusuf / giussuf@yahoo.com.
}

interface

{$I TB97Ver.inc}

{$IFDEF TB97D3} resourcestring {$ELSE} const {$ENDIF}
  { TDock97 exception messages }
//  STB97DockParentNotAllowed = 'A TDock97 control cannot be placed inside a tool window or another TDock97';
  STB97DockParentNotAllowed = 'Bir TDock97 kontrol� bir ara� penceresine yada ba�ka bir TDock97 kontrol�ne eklenemez';
//  STB97DockCannotChangePosition = 'Cannot change Position of a TDock97 if it already contains controls';
  STB97DockCannotChangePosition = 'E�er sahip oldu�u kontroller varsa, TDock97 kontrol�n�n Position �zelli�i de�i�tirilemez';

  { TCustomToolWindow97 exception messages }
//  STB97ToolwinNameNotSet = 'Cannot save tool window''s position because Name property is not set';
  STB97ToolwinNameNotSet = 'Name �zelli�i belirtilmedi�i i�in ara� penceresinin pozisyonu kaydedilemiyor';
//  STB97ToolwinDockedToNameNotSet = 'Cannot save tool window''s position because DockedTo''s Name property not set';
  STB97ToolwinDockedToNameNotSet = 'DockedTo �zelli�inde belirtilen kontrol�n Name �zelli�i belirtilmedi�i i�in ara� penceresinin pozisyonu kaydedilemiyor';
//  STB97ToolwinParentNotAllowed = 'A tool window can only be placed on a TDock97 or directly on the form';
  STB97ToolwinParentNotAllowed = 'Ara� penceresi sadece TDock97 �zerine yada do�rudan formun �zerine eklenebilir';

  { TCustomToolbar97 exception messages }
//  STB97ToolbarControlNotChildOfToolbar = 'Control ''%s'' is not a child of the toolbar';
  STB97ToolbarControlNotChildOfToolbar = '''%s'' kontrol� ara� �ubu�unun bir bile�eni de�ildir';

  { TToolbarSep97 exception messages }
//  STB97SepParentNotAllowed = 'TToolbarSep97 can only be placed on a TToolbar97';
  STB97SepParentNotAllowed = 'TToolbarSep97 sadece TToolbar97 �zerine eklenebilir';

  STB97Language = 'Turkish';

implementation

end.
 
