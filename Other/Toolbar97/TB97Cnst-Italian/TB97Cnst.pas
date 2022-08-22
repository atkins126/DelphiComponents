unit TB97Cnst;

{
  Toolbar97
  Copyright (C) 1998-99 by Jordan Russell
  For conditions of distribution and use, see LICENSE.TXT.

  String constants
}

interface

{$I TB97Ver.inc}

{$IFDEF TB97D3} resourcestring {$ELSE} const {$ENDIF}
  { TDock97 exception messages }
  STB97DockParentNotAllowed = 'Un controllo TDock97 non pu� essere posto all''interno di una tool window o di un''altra TDock97';
  STB97DockCannotChangePosition = 'Non � possibile cambiare la posizione di un TDock97 se al suo interno sono presenti altri componenti';

  { TCustomToolWindow97 exception messages }
  STB97ToolwinNameNotSet = 'Non � possibile salvare la posizione della tool window perch� la propriet� Name non � impostata';
  STB97ToolwinDockedToNameNotSet = 'Non � possibile salvare la posizione della tool window perch� la propriet� Name di DockedTo non � impostata';
  STB97ToolwinParentNotAllowed = 'Una tool window pu� essere posizionata solamente su di un componente TDock97 oppure direttamente sul form';

  { TCustomToolbar97 exception messages }
  STB97ToolbarControlNotChildOfToolbar = 'Il controllo ''%s'' non � figlio di una toolbar';

  { TToolbarSep97 exception messages }
  STB97SepParentNotAllowed = 'Il componente TToolbarSep97 pu� essere inserito solo all''interno di una TToolbar97';

implementation

end.
 
