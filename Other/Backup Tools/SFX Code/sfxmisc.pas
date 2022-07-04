{
  TArchiverSFX (C) Copyright by Oliver Buschjost (autor_oliver@iname.com), 1998

  I didn't mark my modifications, because there were to many. But on request I
  can send you the original Archive with the original ZIP-SFX package.

- This SFX is based on Freewarecode that is copyrighted by:
}
(******************************************************************)
(* Copyright 1997, Microchip Systems / Carl Bunton                *)
(* Email: Twojags@cris.com                                        *)
(* Web-page: http://www.concentric.net/~twojags                   *)
(*                                                                *)
(* This program was written in Delphi 2 because version 2         *)
(* compiles a much smaller executable using the windows api.  It  *)
(* should be fully compatible with Delphi 3, but will produce a   *)
(* noticable increase of size in the final compiled program.      *)
(*                                                                *)
(*MODIFIED by M. Stephany mirbir.st@t-online.de  12/28/97-01/04/98*)
(* for some special purposes; modified lines are marked (##)      *)
(******************************************************************)
UNIT SFXmisc;

INTERFACE

USES Messages, Windows,sysutils,archiverroot;

type TOverwritemode=(confirm,overwrite,skip,update,existing,updateexisting);
TCommentMode=(none,Before,After,Both);
TSfxMessages = packed record
                 STR_CANNOTOPEN    :STRING; //'Cannot open file ..';
                 STR_CANNOTCLOSE   :STRING; //'Cannot close the file';
                 STR_E             :STRING; //'Error..';
                 STR_EXISTS        :STRING; //'...already exists, overwrite ?';
                 STR_EARCHIVE      :STRING; //'Error reading archive.';
                 STR_INVALIDNAME   :STRING; //'Invalid filename.';
                 STR_EDIRECTORY    :STRING; //'Error in directory ..';
                 STR_PREXT         :STRING; //'Extracting: ';
                 STR_ALLEXT        :STRING; //'All files have been extracted.';
                 STR_OK            :STRING; //'Finished.';
                 STR_NOTSELEXT     :STRING; //'The selected file(s) couldn''t get extracted.';
                 STR_MP            :STRING; //'TArchver SFX';
                 STR_RUN           :STRING; //'After extraction, run : ';
                 STR_EINC_SIZE     :STRING; //'Incorrect file size, please try to download this file again.';

                 DLGNEW_CAPTION    :STRING; //'Create subdirectory';
                 DLGNEW_8001       :STRING; // 'Current directory :';
                 DLGNEW_8002       :STRING; // 'New subdirectory :';
                 OK                :STRING; // '&OK';
                 CANCEL            :STRING; // '&Cancel';
                 DLGSEL_CAPTION    :STRING; // 'Select extract directory';
                 DLGSEL_2002       :STRING; // '&Network...';
                 DLGSEL_2004       :STRING; // 'New...';
                 MAINDIALOG_100    :STRING; // 'Extract to :';
                 MAINDIALOG_8008   :STRING; // 'Files :';
                 MAINDIALOG_1      :STRING; // 'Start';
                 MAINDIALOG_2      :STRING; // 'C&lose';
                 confirm           :STRING; // 'Confirm what to do';
                 overwrite         :STRING; // 'Overwrite existing files';
                 skip              :STRING; // 'Don't extract the files';
                 update            :STRING; // 'Overwrite only if newer';
                 existing          :STRING; // 'Extract the file only if it already exists';
                 updateexisting    :STRING; // 'Extract the file only if it already exists and is newer';
                 existingfiles     :STRING; // 'Existing file(s) :';
                 SelectAll         :STRING; // 'Select All';
                 DeSelectAll       :STRING; // 'Deselect All';
                 PreparingExtraction:STRING; // 'Preparing Extraction...';
                 ReadingArchive    :STRING; // 'Reading Archive Content';
                 Information       :String; // 'Information';
                 Progress_caption  :STRING; // 'Progress';
                 author_of_this_sfx:STRING; // 'The Author of this SFX:';
                 copyright         :STRING; // 'This SFX is based on Freewarecode that is copyrighted by';
                 further_info      :STRING; // 'Please contact the author for further Information.';
                 about_button      :STRING; // 'About this SFX...';
                 about_caption     :STRING; // 'About this SFX';
            end;

TTagInfo = packed record
                ExecuteFileAfterExtract:boolean;
                UserChooseFilesToExtract:boolean;
                UserChooseOverwriteMode:boolean;
                UserAllowedToDontRunTheFile:boolean;
                DefaultOwerwriteMode:TOverwritemode;
                SFXFileSize:DWord; //Dateigr��e des fertigen SFX, also: SFX.EXE-Code, sizeof(TTagefile) and Archivesize
                CommandLine:string[80];
                Caption:string[60];
                DefaultExtractPath:string[80];
                CopyrightLine:string[80];
                Language:TLanguage;
                Comment:TCommentMode;
                end;

CONST
  (* Dialog Control-IDs *)
  CM_YES        = 1;
  CM_NO         = 2;
  CM_NOASK      = 401;
  CM_OK         = 1;
  CM_CANCEL     = 2;
  CM_EDIT1      = 101;
  CM_LIST       = 301;
  CM_OVERWRITE  = 501;
  CM_SKIP       = 502;
  CM_CONFIRM    = 503;
  CM_STATUS     = 601;
  NEWREGSTR_PATH_SETUP = 'Software\Microsoft\Windows\CurrentVersion';

CONST
  fsMaxPath     = 256;
  fsMaxPassword = 80;

const
     STR_MAINDLG       = 'MainDialog';
     STR_SELDLG        = 'DLGSEL';
     STR_NEWDLG        = 'DLGNEW';
     BSL               = '\';

var STR_CANNOTOPEN    : Pchar;
    STR_CANNOTCLOSE   : Pchar;
    STR_E             : Pchar;
    STR_EXISTS        : Pchar;
    STR_EARCHIVE      : Pchar;
    STR_INVALIDNAME   : Pchar;
    STR_EDIRECTORY    : Pchar;
    STR_PREXT         : Pchar;
    STR_ALLEXT        : Pchar;
    STR_OK            : Pchar;
    STR_NOTSELEXT     : Pchar;
    STR_MP            : Pchar;
    STR_RUN           : Pchar;
    STR_EINC_SIZE     : PChar;
    temp              : PChar;             

VAR
  Index         : LONGINT;
  ExtPath       : ARRAY[0..fsMaxPath-1] OF CHAR;
  Password      : ARRAY[0..fsMaxPassword-1] OF CHAR;
  PWLen         : LONGINT {BYTE};
  FilePos       : LONGINT;
  OverWriteMode : BYTE;
  OverWriteFile : BOOLEAN;
  CurrentFile   : STRING;
  MainWin       : hWnd;
  processresult : boolean; //## added to get the result of a proccessarchive in sfxgbls.pas
  Msg:TSFXMessages;

PROCEDURE CenterDialog(Wnd : hWnd);
PROCEDURE ForceDirectories(Dir: STRING);
PROCEDURE FSeek(Offset: LONGINT; MoveMethod: WORD);
FUNCTION  IsSelected (hWndList: hWnd; Filename: pchar): boolean;
FUNCTION  ExtractFileName(FileName: STRING): STRING;
FUNCTION  PCharToStr(p: PCHAR; Len: WORD): STRING;
FUNCTION  Min(CONST I1, I2: LONGINT): LONGINT;
FUNCTION  StrLen(Str: PCHAR): WORD;
FUNCTION  AppendDirTail(sDir: PCHAR) : PCHAR;
FUNCTION  RemoveDirTail(sDir: PCHAR) : PCHAR;
FUNCTION  FileExists(Filename: PCHAR): BOOLEAN;
FUNCTION  StrToInt(CONST S: STRING): LONGINT;
FUNCTION  WindowsDir: String;
FUNCTION  SystemDir: String;
FUNCTION  TempDir: String;
function StrPCopy(Dest: PChar; const Source: string): PChar;
function StrAlloc(Size: Cardinal): PChar;
function StrLCopy(Dest, Source: PChar; MaxLen: Cardinal): PChar; assembler;
function StrPas(Str: PChar): string;
procedure StrDispose(Str: PChar);
function StrPChar(const Msg : String): PChar;
PROCEDURE ProcessMessages;
procedure CutFirstDirectory(var S: TFileName);
procedure DrawOverwriteListItem(DrawItemStruct : TDrawItemStruct);
function GetProgramFilesPath (const TrailingBackslash: Boolean): String;
function RegQueryStringValue (H: HKEY; Name: PChar; var ResultStr: String): Boolean;
function SetLanguage( language : TLanguage ):TSfxMessages; //Sets the right strings for all messages
procedure GetMemoryForTheStrings;       //Allocates the Memory for this strings
procedure FreeTheMemoryOfTheStrings;    //The memory allocated for all these strings is freed
function SplitLine(index:integer;comment:string):string; // splits the Archive Comment into the ones that are shown
Procedure ShowComment(comment:string);  //Shows the comment in a normal Messagebox

IMPLEMENTATION

USES SFXgbls;

(*--------------------------------------------------------------------------*)
(*     CenterDialog --- Center dialog on screen.                            *)
(*--------------------------------------------------------------------------*)
PROCEDURE CenterDialog(Wnd : hWnd);
VAR
   R : TRect;
BEGIN (* CenterDialog *)
   GetWindowRect(Wnd , R);
   R.Left := (GetSystemMetrics(sm_CXScreen) - R.right  + R.left) DIV 2;
   R.Top  := (GetSystemMetrics(sm_CYScreen) - R.bottom + R.top) DIV 2;
   SetWindowPos(Wnd, 0, R.left, R.top, 0, 0, Swp_NoSize OR Swp_NoZOrder);
END   (* CenterDialog *);

(*--------------------------------------------------------------------------*)
FUNCTION  StrToInt(CONST S: STRING): LONGINT;
VAR
   E: Integer;
BEGIN
   Val(S, Result, E);
END;

(*--------------------------------------------------------------------------*)
FUNCTION  Min(CONST I1, I2: LONGINT): LONGINT;
BEGIN
   IF I2 < I1 THEN
      Min := I2
   ELSE
      Min := I1;
END;

(*--------------------------------------------------------------------------*)
FUNCTION  IsSelected (hWndList: hWnd; Filename: pchar): boolean;
BEGIN
   Index := SendMessage(hWndList, LB_FINDSTRINGEXACT, Index, LONGINT(Filename));
   RESULT := SendMessage(hWndList, LB_GETSEL, Index, 0) > 0;
END (* IsSelected *);

(*--------------------------------------------------------------------------*)
FUNCTION  StrLen(Str: PCHAR): WORD;
VAR
   i: WORD;
BEGIN
   i := 0;
   WHILE Str[i] <> #0 DO
      inc(i);
   RESULT := i;
END;

(*--------------------------------------------------------------------------*)
PROCEDURE FSeek(Offset: LONGINT; MoveMethod: WORD);
BEGIN
  FilePos := SetFilePointer (InFile, Offset, NIL, MoveMethod);

  IF (FilePos = LONGINT($FFFFFFFF)) AND (GetLastError <> NO_ERROR) THEN
     FilePos := -1;

  (* if we failed ... *)
  //RESULT := NOT ((dwPointerLow = $FFFFFFFF) AND
  //        (GetLastError <> NO_ERROR));
END (* FSeek *);

(*--------------------------------------------------------------------------*)
FUNCTION  ExtractFileName(FileName: STRING): STRING;
VAR
  I: Integer;
BEGIN
  (* Handle archive relative paths *)
  I := Length(FileName);
  WHILE (I > 0) AND NOT (FileName[I] IN ['\', '/', ':'])
     DO Dec(I);
  Result := Copy(FileName, I + 1, 255);
END;

(*--------------------------------------------------------------------------*)
FUNCTION  FixDirChar(s: PCHAR): PCHAR;
VAR
   i: BYTE;
BEGIN
   FOR i := 0 TO StrLen(s) DO
      IF s[i] = '/' THEN
         s[i] := '\';
   RESULT := s;
END;

(*--------------------------------------------------------------------------*)
FUNCTION  FileExists(Filename: PCHAR): BOOLEAN; //## this func has changed a bit
VAR
   SearchRec: TWin32FindData;
   i, isav, Handle: INTEGER;
   FN: PCHAR;
BEGIN
   IF Filename[ StrLen(Filename) - 1 ] = '\' THEN
   BEGIN
      GETMEM(FN, 255);
      isav:=0;
      FOR i := 0 TO StrLen(Filename) - 1 DO
      begin
         isav:=i;
         FN[ i ] := Filename[ i ];
      end;
      i:=isav+1; //## here we should not use the resulting i, cause in d3 after a for, the value of the loop-var isn't always defined
      FN[ i  ] := '*';
      FN[ i + 1 ] := '.';
      FN[ i + 2 ] := '*';
      FN[ i + 3 ] := #0;

      TRY
         HANDLE := FindFirstFile(FixDirChar(FN), SearchRec)
      FINALLY
         DISPOSE(FN);
      END;
   END
   ELSE
      HANDLE := FindFirstFile(FixDirChar(Filename), SearchRec);

   windows.FindClose(HANDLE);
   RESULT :=  HANDLE <> Integer(INVALID_HANDLE_VALUE);
END;

(*--------------------------------------------------------------------------*)
(* Set the contents of a STRING *)
FUNCTION  PCharToStr(p: PCHAR; Len: WORD): STRING;
VAR
   s: STRING;
BEGIN
  SetLength(s, Len);
  Move(p^, s[1], Len);
  IF POS(#0, s) > 0 THEN
    SetLength(s, POS(#0, s) - 1);
  RESULT := s;
END (* SetString *);

(*--------------------------------------------------------------------------*)
PROCEDURE ForceDirectories(Dir: STRING);
BEGIN
  IF Dir[ Length(Dir) ] = '\' THEN
     SetLength(Dir, Length(Dir) - 1);
  IF (Length(Dir) < 3) OR FileExists(PCHAR(Dir)) THEN
     EXIT;
  ForceDirectories(ExtractFilePath(Dir));
  MkDir(Dir);
END;

(*--------------------------------------------------------------------------*)
FUNCTION  AppendDirTail(sDir: PCHAR) : PCHAR;
VAR
   i: WORD;
BEGIN
   i := StrLen(sDir);
   IF sDir[ i - 1 ] <> '\' THEN
   BEGIN
      sDir[ i ] := '\';
      sDir[ i + 1 ] := #0;
   END;
   RESULT := sDir;
END;

(*--------------------------------------------------------------------------*)
FUNCTION  RemoveDirTail(sDir: PCHAR) : PCHAR;
VAR
   i: WORD;
BEGIN
   i := StrLen(sDir);

   IF sDir[ i - 1 ] = '\' THEN
      sDir[ i - 1 ] := #0;
   RESULT := sDir;
END;

(*--------------------------------------------------------------------------*)
function WindowsDir: String;
var
  pPath : PChar;
begin
  pPath := StrAlloc(MAX_PATH);
  try
    GetWindowsDirectory(pPath, MAX_PATH);
//    Result := ExtractFilePath(StrPas(pPath));
    Result:=StrPas(pPath);
  finally
    StrDispose(pPath);
  end;
end;

(*--------------------------------------------------------------------------*)
function SystemDir: String;
var
  pPath : PChar;
begin
  pPath := StrAlloc(MAX_PATH);
  try
    GetSystemDirectory(pPath, MAX_PATH);
//    Result := ExtractFilePath(StrPas(pPath));
    Result:=StrPas(pPath);
  finally
    StrDispose(pPath);
  end;
end;

(*--------------------------------------------------------------------------*)
function TempDir: String;
var
  pPath : PChar;
begin
  pPath := StrAlloc(MAX_PATH);
  try
    GetTempPath(MAX_PATH, pPath);
    Result := StrPas(pPath);
  finally
    StrDispose(pPath);
  end;
end;

(*--------------------------------------------------------------------------*)
function StrPCopy(Dest: PChar; const Source: string): PChar;
begin
  Result := StrLCopy(Dest, PChar(Source), 255);
end;

(*--------------------------------------------------------------------------*)
function StrLCopy(Dest, Source: PChar; MaxLen: Cardinal): PChar; assembler;
asm
        PUSH    EDI
        PUSH    ESI
        PUSH    EBX
        MOV     ESI,EAX
        MOV     EDI,EDX
        MOV     EBX,ECX
        XOR     AL,AL
        TEST    ECX,ECX
        JZ      @@1
        REPNE   SCASB
        JNE     @@1
        INC     ECX
@@1:    SUB     EBX,ECX
        MOV     EDI,ESI
        MOV     ESI,EDX
        MOV     EDX,EDI
        MOV     ECX,EBX
        SHR     ECX,2
        REP     MOVSD
        MOV     ECX,EBX
        AND     ECX,3
        REP     MOVSB
        STOSB
        MOV     EAX,EDX
        POP     EBX
        POP     ESI
        POP     EDI
end;

(*--------------------------------------------------------------------------*)
function StrAlloc(Size: Cardinal): PChar;
begin
  Inc(Size, SizeOf(Cardinal));
  GetMem(Result, Size);
  Cardinal(Pointer(Result)^) := Size;
  Inc(Result, SizeOf(Cardinal));
end;

(*--------------------------------------------------------------------------*)
function StrPas(Str: PChar): string;
begin
  Result := Str;
end;

(*--------------------------------------------------------------------------*)
procedure StrDispose(Str: PChar);
begin
  if Str <> nil then
  begin
    Dec(Str, SizeOf(Cardinal));
    FreeMem(Str, Cardinal(Pointer(Str)^));
  end;
end;

function StrPChar(const Msg : String): PChar;
{$IFDEF WINDOWS}
Var
    Len : Integer;
{$ENDIF}
begin
  {$IFDEF WIN32}
  Result := PChar(Msg);
  {$ELSE}
  StrPFree;
  P := StrAlloc(Length(Msg)+1);
  StrPCopy(P, Msg);
  Result := P;
  {$ENDIF}
end;
//## we don't need the loadstr since we calculate the startoffile different.
(*--------------------------------------------------------------------------*)
(*FUNCTION  LoadStr(Ident: Word): STRING;
BEGIN
   //Result[0] := Char(LoadString(HInstance, Ident, @Result[1], 254));
   RESULT := Char(LoadString(HInstance, Ident, @Result[1], 254));
END;

(*--------------------------------------------------------------------------*)

PROCEDURE ProcessMessages;
VAR
   Msg : TMsg;
BEGIN
   WHILE PeekMessage(Msg, 0, 0, 0, PM_REMOVE) DO
   BEGIN
      IF Msg.Message <> WM_QUIT THEN
      BEGIN
         TranslateMessage(Msg);
         DispatchMessage(Msg);
      END;
   END;
END;

procedure CutFirstDirectory(var S: TFileName);
var
  Root: Boolean;
  P: Integer;
begin
  if S = '\' then S := ''
  else begin
    if S[1] = '\' then
    begin
      Root := True;
      S := Copy(S, 2, 255);
    end else Root := False;
    if S[1] = '.' then S := Copy(S, 5, 255);
    P := Pos('\',S);
    if P <> 0 then S := '...\' + Copy(S, P + 1, 255)
    else S := '';
    if Root then S := '\' + S;
  end;
end;
(*--------------------------------------------------------------------------*)
procedure DrawOverwriteListItem(DrawItemStruct : TDrawItemStruct);
var
  hbr : hBrush;
  pItem : PChar;
  lOld  : TColorRef;
begin
  with DrawItemStruct do
   begin
     SetBkMode(hdc, TRANSPARENT);
     if (ItemState=ODS_SELECTED) or (ItemAction=ODA_FOCUS) then
      begin
        hbr := CreateSolidBrush(GetSysColor(COLOR_HIGHLIGHT));
        lOld := SetTextColor(hdc, GetSysColor(COLOR_HIGHLIGHTTEXT));
      end
     else
      begin
        hbr := CreateSolidBrush(GetSysColor(COLOR_WINDOW));
        lOld := SetTextColor(hdc, GetSysColor(COLOR_WINDOWTEXT));
      end;
     FillRect(hdc, rcItem, hbr);
     DeleteObject(hbr);
     if {(itemID>=0) and} (itemID<UINT(SendMessage(hwndItem, CB_GETCOUNT, 0, 0))) then
      begin
        pItem := StrAlloc(MAX_PATH);
        try
          SendMessage(hwndItem, CB_GETLBTEXT, itemID, LongInt(pItem));
          if lstrlen(pItem)>0 then
           begin
             DrawText(hdc, pItem, lstrlen(pItem), rcItem, DT_LEFT or DT_SINGLELINE or DT_VCENTER);
           end;
          SetTextColor(hdc, lOld);
          if (ItemAction=ODA_FOCUS) and (ItemState and ODS_FOCUS<>0) then DrawFocusRect(hdc, rcItem);
        finally
          StrDispose(pItem);
        end;
      end;
   end;
end;
(*--------------------------------------------------------------------------*)
function GetProgramFilesPath (const TrailingBackslash: Boolean): String;
{ Gets path of Program Files.
  Returns blank string if not found in registry. }
var
  H: HKEY;
begin
  if RegOpenKeyEx(HKEY_LOCAL_MACHINE, NEWREGSTR_PATH_SETUP, 0,
     KEY_QUERY_VALUE, H) = ERROR_SUCCESS then begin
    if not RegQueryStringValue(H, 'ProgramFilesDir', Result) then
      Result := '';
    RegCloseKey (H);
    if (Result <> '') and TrailingBackslash then
      Result := AppendDirTail(pchar(Result));  //AddBackslash(Result);
  end
  else
    Result := '';
end;
(*--------------------------------------------------------------------------*)
function RegQueryStringValue (H: HKEY; Name: PChar; var ResultStr: String): Boolean;
{ Queries the specified REG_SZ registry key/value, and returns the value in
  ResultStr. Returns True if successful. }
var
  Typ, Size: DWORD;
begin
  Result := False;
  if (RegQueryValueEx(H, Name, nil, @Typ, nil, @Size) = ERROR_SUCCESS) and
     ((Typ = REG_SZ) or (Typ = REG_EXPAND_SZ)) then begin
    if Size < 2 then begin  {for the following code to work properly, Size can't be 0 or 1}
      ResultStr := '';
      Result := True;
    end
    else begin
      SetLength (ResultStr, Size-1); {long strings implicity include a null terminator}
      if RegQueryValueEx(H, Name, nil, nil, @ResultStr[1], @Size) = ERROR_SUCCESS then
        Result := True
      else
        ResultStr := '';
    end;
  end;
end;
(*--------------------------------------------------------------------------*)
function SetLanguage( language : TLanguage ):TSfxMessages; //Sets the right strings for all messages
var
  lang : TLanguage;
begin
  if Language = lgAutomatic then
    lang := GetUserLanguage
  else
    lang := Language;
  case lang of
    lgEnglish:
      begin
           Result.STR_CANNOTOPEN    :='Cannot open file ..';
           Result.STR_CANNOTCLOSE   :='Cannot close the file';
           Result.STR_E             :='Error..';
           Result.STR_EXISTS        :='...already exists, overwrite ?';
           Result.STR_EARCHIVE      :='Error reading archive.';
           Result.STR_INVALIDNAME   :='Invalid filename.';
           Result.STR_EDIRECTORY    :='Error in directory ..';
           Result.STR_PREXT         :='Extracting: ';
           Result.STR_ALLEXT        :='All files have been extracted.';
           Result.STR_OK            :='Finished.';
           Result.STR_NOTSELEXT     :='The selected file(s) couldn''t get extracted.';
           Result.STR_MP            :='TArchiver SFX Tool';
           Result.STR_RUN           :='After extraction, run : ';
           Result.STR_EINC_SIZE     :='Incorrect file size, please try to download this file again.';
           Result.MAINDIALOG_100    :='Extract to :';
           Result.MAINDIALOG_8008   :='Files :';

           Result.DLGNEW_CAPTION    :='Create subdirectory';
           Result.DLGNEW_8001       :='Current directory :';
           Result.DLGNEW_8002       :='New subdirectory :';
           Result.OK                :='&OK';
           Result.CANCEL            :='&Cancel';
           Result.DLGSEL_CAPTION    :='Select extract directory';
           Result.DLGSEL_2002       :='&Network...';
           Result.DLGSEL_2004       :='New...';
           Result.MAINDIALOG_1      :='Start';
           Result.MAINDIALOG_2      :='C&lose';
           Result.confirm           :='Ask confirmation';
           Result.overwrite         :='Overwrite existing files';
           Result.skip              :='Skip existing files';
           Result.update            :='Overwrite only if newer';
           Result.existing          :='Restore existing files only';
           Result.updateexisting    :='Extract the file only if it already exists and is newer';
           Result.existingfiles     :='Existing file(s) :';
           Result.SelectAll         :='Select All';
           Result.DeSelectAll       :='Deselect All';
           Result.PreparingExtraction:='Preparing Extraction...';
           Result.ReadingArchive    :='Reading Archive Content';
           Result.Information       :='Information';
           Result.Progress_caption  :='Progress';
           Result.author_of_this_sfx:='The Author of this SFX:';
           Result.copyright         :='This SFX is based on Freewarecode that is copyrighted by';
           Result.further_info      :='Please contact the author for further Information.';
           Result.about_button      :='&About this SFX...';
           Result.about_caption     :='About this SFX';
      end;
    lgFrench:
      begin
             Result.STR_CANNOTOPEN    :='Impossible d''ouvrir le fichier ..';
             Result.STR_CANNOTCLOSE   :='Impossible de fermer le fichier';
             Result.STR_E             :='Erreur..';
             Result.STR_EXISTS        :='... existe d�j�, voulez-vous le remplacer ?';
             Result.STR_EARCHIVE      :='Erreur lors de la lecture de l''archive.';
             Result.STR_INVALIDNAME   :='Nom de fichier invalide.';
             Result.STR_EDIRECTORY    :='Erreur dans le r�pertoire ..';
             Result.STR_PREXT         :='Extraction en cours: ';
             Result.STR_ALLEXT        :='Tous les fichiers ont �t� extraits.';

             Result.STR_OK            :='Fini.';
             Result.STR_NOTSELEXT     :='Les fichier(s) s�lectionn�(s) n''ont pu �tre extraits.';
             Result.STR_MP            :='TArchiver SFX Tool';
             Result.STR_RUN           :='Apr�s l''extraction, ex�cuter : ';
             Result.STR_EINC_SIZE     :='Taille de fichier incorrecte, veuillez ret�l�charger ce fichier..';
             Result.DLGNEW_CAPTION    :='Cr�er un sous-r�pertoire';
             Result.DLGNEW_8001       :='R�pertoire courant :';
             Result.DLGNEW_8002       :='Nouveau sous-r�pertoire :';
             Result.OK                :='&OK';
             Result.CANCEL            :='&Annuler';
             Result.DLGSEL_CAPTION    :='S�lectionner le r�pertoire d''extraction';
             Result.DLGSEL_2002       :='&R�seau...';
             Result.DLGSEL_2004       :='Nouveau...';
             Result.MAINDIALOG_100    :='Extraire vers :';
             Result.MAINDIALOG_8008   :='Fichiers :';

             Result.MAINDIALOG_1      :='&D�marrer';
             Result.MAINDIALOG_2      :='&Fermer';
             Result.confirm           :='Demander confirmation';
             Result.overwrite         :='Ecraser les fichiers existants';
             Result.skip              :='Sauter les fichiers existants';
             Result.update            :='Ecraser seulement si plus r�cent';
             Result.existing          :='Restorer les fichiers existants uniquement';
             Result.updateexisting    :='Extraire les fichiers existants et plus r�cents uniquement';
             Result.existingfiles     :='Fichier(s) existant(s) :';
             Result.SelectAll         :='&Tout s�lect.';
             Result.DeSelectAll       :='Tout d�&s�lect';
             Result.PreparingExtraction:='Pr�paration de l''extraction...';
             Result.ReadingArchive    :='Lecture du contenu de l''archive';
             Result.Information       :='Information';
             Result.Progress_caption  :='Progression';
             Result.author_of_this_sfx:='L''auteur de ce SFX:';
             Result.copyright         :='Ce SFX est bas� sur le code Freeware de ';
             Result.further_info      :='Contactez l''auteur pour plus d''informations.';
             Result.about_button      :='&A propos...';
             Result.about_caption     :='A propos de ce SFX';      end;
    lgChinese:
      begin
        // Traditional Chinese constants (in BIG-5 code).
           Result.STR_CANNOTOPEN    :='�L�k�}���ɮ� ..';
           Result.STR_CANNOTCLOSE   :='�L�k�����ɮ�';
           Result.STR_E             :='���~..';
           Result.STR_EXISTS        :='...�w�g�s�b, �O�_�л\ ?';
           Result.STR_EARCHIVE      :='Ū�����Y�ɮɵo�Ϳ��~.';
           Result.STR_INVALIDNAME   :='�L�Ī��ɦW.';
           Result.STR_EDIRECTORY    :='�ؿ����~ ..';
           Result.STR_PREXT         :='�����Y: ';
           Result.STR_ALLEXT        :='�Ҧ����ɮפw�Q�����Y.';
           Result.STR_OK            :='����.';
           Result.STR_NOTSELEXT     :='�ҿ�����ɮ׵L�k�Q�����Y.';
           Result.STR_MP            :='TArchiver �ۧڸ����Y�u��';
           Result.STR_RUN           :='�����Y����, ���� : ';
           Result.STR_EINC_SIZE     :='�ɮת��פ����T, �Хۭܵ��s�U���o���ɮ�.';
           Result.MAINDIALOG_100    :='�����Y�� :';
           Result.MAINDIALOG_8008   :='�ɮ� :';
           Result.DLGNEW_CAPTION    :='�إߤl�ؿ�';
           Result.DLGNEW_8001       :='�ثe���ؿ� :';
           Result.DLGNEW_8002       :='�s���l�ؿ� :';
           Result.OK                :='�T�w(&O)';
           Result.CANCEL            :='����(&C)';
           Result.DLGSEL_CAPTION    :='��ܸ����Y�ؿ�';
           Result.DLGSEL_2002       :='����(&N)...';
           Result.DLGSEL_2004       :='�إ߷s��...';
           Result.MAINDIALOG_1      :='�}�l';
           Result.MAINDIALOG_2      :='����(&L)';
           Result.confirm           :='�n�D�T�{';
           Result.overwrite         :='�л\�w�s�b���ɮ�';
           Result.skip              :='���L�w�s�b���ɮ�';
           Result.update            :='�u�л\���s���ɮ�';
           Result.existing          :='�u�٭�s�b���ɮ�';
           Result.updateexisting    :='�u�٭�w�s�b�B���s���ɮ�';
           Result.existingfiles     :='�w�s�b���ɮ� :';
           Result.SelectAll         :='����';
           Result.DeSelectAll       :='������';
           Result.PreparingExtraction:='�ǳƸ����Y...';
           Result.ReadingArchive    :='Ū�����Y�ɤ��e';
           Result.Information       :='��T';
           Result.Progress_caption  :='�i��';
           Result.author_of_this_sfx:='�ۧڸ����Y�{�� (SFX) ���@��:';
           Result.copyright         :='���ۧڸ����Y�{���O�K�O�n��, �䪩�v�ݩ�';
           Result.further_info      :='�лP�@���p���w��o�i�@�B����T.';
           Result.about_button      :='���� SFX (&A)...';
           Result.about_caption     :='���� SFX';
      end;
    lgPortuguese:
      begin
        // If it looks strange do not change. It's designed for page 850
           Result.STR_CANNOTOPEN    :='Imposs�vel abrir arquivo ..';
           Result.STR_CANNOTCLOSE   :='Impss�vel fechar arquivo';
           Result.STR_E             :='Erro..';
           Result.STR_EXISTS        :='...j� existe. Substituir ?';
           Result.STR_EARCHIVE      :='Erro lendo arquivo.';
           Result.STR_INVALIDNAME   :='Nome de arquivo inv�lido.';
           Result.STR_EDIRECTORY    :='Erro no diret�rio ..';
           Result.STR_PREXT         :='Extraindo: ';
           Result.STR_ALLEXT        :='Todos os arquivos foram extra�dos.';
           Result.STR_OK            :='Fim.';
           Result.STR_NOTSELEXT     :='Imposs�vel extrair arquivos(s) selecionado(s).';
           Result.STR_MP            :='Ferramenta SFX do TArchiver';
           Result.STR_RUN           :='Ap�s a extra��o, executar : ';
           Result.STR_EINC_SIZE     :='Tamanho do arquivo incorreto, favor tentar baixar o aquivo novamente.';
           Result.MAINDIALOG_100    :='Extrair para :';
           Result.MAINDIALOG_8008   :='Arquivos :';

           Result.DLGNEW_CAPTION    :='Criar subdiretorio';
           Result.DLGNEW_8001       :='Diretorio corrente :';
           Result.DLGNEW_8002       :='Novo subdirectorio :';
           Result.OK                :='&OK';
           Result.CANCEL            :='&Cancela';
           Result.DLGSEL_CAPTION    :='Selecione diretorio para extra��o';
           Result.DLGSEL_2002       :='&Rede...';
           Result.DLGSEL_2004       :='Novo...';
           Result.MAINDIALOG_1      :='Iniciar';
           Result.MAINDIALOG_2      :='F&echar';
           Result.confirm           :='Pedir confirma��o';
           Result.overwrite         :='Atualizar arquivos existentes';
           Result.skip              :='Ignorar arquivos existentes';
           Result.update            :='Atualizar apenas quando for mais recente';
           Result.existing          :='Atualizar apenas arquivos existentes';
           Result.updateexisting    :='Extrair apenas arquivos existentes e mais recentes';
           Result.existingfiles     :='Arquivos existentes :';
           Result.SelectAll         :='Selecionar todos';
           Result.DeSelectAll       :='Desfazer todas as sele��es';
           Result.PreparingExtraction:='Preparando Extra��o...';
           Result.ReadingArchive    :='Lendo conte�do do arquivo';
           Result.Information       :='Informa��o';
           Result.Progress_caption  :='Progresso';
           Result.author_of_this_sfx:='O Autor deste SFX:';
           Result.copyright         :='SFX baseado em c�digo Freeware cujo Copyright pertence a';
           Result.further_info      :='Favor contactar o autor para maiores informa��es.';
           Result.about_button      :='&Sobre este SFX...';
           Result.about_caption     :='Sobre este SFX';
      end;
    lgGerman:
      begin
           Result.STR_CANNOTOPEN    :='Kann Datei nicht �ffnen ...';
           Result.STR_CANNOTCLOSE   :='Kann Datei nicht schlie�en.';
           Result.STR_E             :='Fehler...';
           Result.STR_EXISTS        :='...existiert bereits, �berschreiben ?';
           Result.STR_EARCHIVE      :='Fehler beim Lesen des Archivs.';
           Result.STR_INVALIDNAME   :='Ung�ltiger Dateiname.';
           Result.STR_EDIRECTORY    :='Verzeichnisfehler ...';
           Result.STR_PREXT         :='Extrahiere: ';
           Result.STR_ALLEXT        :='Alle Dateien wurden entpackt.';
           Result.STR_OK            :='Fertig.';
           Result.STR_NOTSELEXT     :='Die markierten Dateien konnten nicht entpackt werden.';
           Result.STR_MP            :='TArchiver SFX Tool';
           Result.STR_RUN           :='Nach Entpacken, Ausf�hren von : ';
           Result.STR_EINC_SIZE     :='Falsche Dateigr��e, bitte versuchen Sie, diese Datei erneut downzuloaden.';
           Result.DLGNEW_CAPTION    :='Verzeichnis erstellen';
           Result.DLGNEW_8001       :='Aktuelles Verzeichnis :';
           Result.DLGNEW_8002       :='Neues Unterverzeichnis :';
           Result.OK                :='&OK';
           Result.CANCEL            :='&Abbrechen';
           Result.DLGSEL_CAPTION    :='Zielverzeichnis w�hlen';
           Result.DLGSEL_2002       :='&Netzwerk...';
           Result.DLGSEL_2004       :='Neu...';
           Result.MAINDIALOG_100    :='Entpacken nach :';
           Result.MAINDIALOG_8008   :='Dateien :';

           Result.MAINDIALOG_1      :='Start';
           Result.MAINDIALOG_2      :='Sch&lie�en';
           Result.confirm           :='Nachfragen';
           Result.overwrite         :='Dateien �berschreiben';
           Result.skip              :='Dateien nicht entpacken';
           Result.update            :='�ltere Dateien �berschreiben';
           Result.existing          :='nur entpacken, wenn gleichnamige Dateien existieren';
           Result.updateexisting    :='nur entpacken, wenn gleichnamige, �ltere Dateien existieren';
           Result.existingfiles     :='Reaktion bei vorhandenen Dateien:';
           Result.SelectAll         :='&Alles markieren';
           Result.DeSelectAll       :='&Nichts markieren';
           Result.PreparingExtraction:='Vorbereiten des entpackens...';
           Result.ReadingArchive    :='Reading Archive ContentEinlesen des Archiveinhalts';
           Result.Information       :='Information';
           Result.Progress_caption  :='Fortschritt';
           Result.author_of_this_sfx:='Der Autor von diesem SFX ist:';
           Result.copyright         :='Dieses SFX basiert auf Freewaresourcecode, der dem Copyright folgender Personen unterliegt:';
           Result.further_info      :='Bitte kontaktieren Sie den Autor f�r weitere Informationen.';
           Result.about_button      :='&�ber dieses SFX...';
           Result.about_caption     :='�ber dieses SFX';
      end;
    lgItalian: // Thanks to Gabriele Bigliardi (gbigliardi@manord.com)
      begin
           Result.STR_CANNOTOPEN    :='Non si riesce ad aprire il file ..';
           Result.STR_CANNOTCLOSE   :='Non si riesce a chiudere il file';
           Result.STR_E             :='Errore..';
           Result.STR_EXISTS        :='...esiste gi�, sovrascrivere ?';
           Result.STR_EARCHIVE      :='Errore leggendo l''archivio.';
           Result.STR_INVALIDNAME   :='Non file non valido.';
           Result.STR_EDIRECTORY    :='Errore nella directory ..';
           Result.STR_PREXT         :='Estrazione: ';
           Result.STR_ALLEXT        :='Tutti i Files sono stati estratti.';
           Result.STR_OK            :='Finito.';
           Result.STR_NOTSELEXT     :='I files selezionati non possono essere estratti.';
           Result.STR_MP            :='TArchiver SFX Tool';
           Result.STR_RUN           :='Dopo l''estrazione esegui : ';
           Result.STR_EINC_SIZE     :='Ampiezza File non corretta, provare a scaricare il file di nuovo.';
           Result.MAINDIALOG_100    :='Estrazione in :';
           Result.MAINDIALOG_8008   :='Files :';

           Result.DLGNEW_CAPTION    :='Crea subdirectory';
           Result.DLGNEW_8001       :='Directory corrente:';
           Result.DLGNEW_8002       :='Nuova subdirectory :';
           Result.OK                :='&OK';
           Result.CANCEL            :='&Cancel';
           Result.DLGSEL_CAPTION    :='Selezionare la directory di estrazione';
           Result.DLGSEL_2002       :='&Rete...';
           Result.DLGSEL_2004       :='Nuovo...';
           Result.MAINDIALOG_1      :='Start';
           Result.MAINDIALOG_2      :='C&lose';
           Result.confirm           :='Chiedi conferma';
           Result.overwrite         :='Sovrascrivi i files esistenti';
           Result.skip              :='Salta i files esistenti';
           Result.update            :='Sovrascrivi solo se nuovi';
           Result.existing          :='Rimetti solo i files esistenti';
           Result.updateexisting    :='Estrai il file solo se esiste gi� ed � pi� recente';
           Result.existingfiles     :='Files esistenti:';
           Result.SelectAll         :='Seleziona Tutti';
           Result.DeSelectAll       :='Deseleziona Tutti';
           Result.PreparingExtraction:='Preparazione Estrazione...';
           Result.ReadingArchive    :='Leggendo il contenuto dell''archivio';
           Result.Information       :='Informazione';
           Result.Progress_caption  :='In corso';
           Result.author_of_this_sfx:='L''autore di questo SFX:';
           Result.copyright         :='Questo SFX � basato su codice Freeware che � copyright by';
           Result.further_info      :='Per favore contattare l''autore per ulteriori informazioni.';
           Result.about_button      :='&About this SFX...';
           Result.about_caption     :='About this SFX';
      end;
    lgSpanish:
      begin
           Result.STR_CANNOTOPEN    :='No puedo abrir archivo ..';
           Result.STR_CANNOTCLOSE   :='No puedo cerrar archivo';
           Result.STR_E             :='Error..';
           Result.STR_EXISTS        :='...ya existe,� Sobreescribir ?';
           Result.STR_EARCHIVE      :='Error al leer el archivo.';
           Result.STR_INVALIDNAME   :='Nombre invalido.';
           Result.STR_EDIRECTORY    :='Error en el directorio ..';
           Result.STR_PREXT         :='Extrayendo: ';
           Result.STR_ALLEXT        :='Todos los archivos han sido extraidos.';
           Result.STR_OK            :='Finalizado.';
           Result.STR_NOTSELEXT     :='No se puede extraer el(los) archivos(s) seleccionado(s).';
           Result.STR_MP            :='Herramienta SFX TArchiver';
           Result.STR_RUN           :='Despues de la extracci�n ejecutar: ';
           Result.STR_EINC_SIZE     :='Tama�o incorrecto, favor de bajar el archivo nuevamente.';
           Result.DLGNEW_CAPTION    :='Crear subdirectorio';
           Result.DLGNEW_8001       :='Directorio actual :';
           Result.DLGNEW_8002       :='Subdirectorio nuevo :';
           Result.OK                :='&Aceptar';
           Result.CANCEL            :='&Cancelar';
           Result.DLGSEL_CAPTION    :='Selecciona directorio a extraer';
           Result.DLGSEL_2002       :='&Red...';
           Result.DLGSEL_2004       :='Nuevo...';
           Result.MAINDIALOG_100    :='Extraer a :';
           Result.MAINDIALOG_8008   :='Archivos :';
           Result.MAINDIALOG_1      :='Iniciar';
           Result.MAINDIALOG_2      :='Ce&rrar';
           Result.confirm           :='Preguntar confirmaci�n';
           Result.overwrite         :='Escribir archivos existentes';
           Result.skip              :='Omitir archivos existentes';
           Result.update            :='Escribir s�lo si es nuevo';
           Result.existing          :='Restaurar s�lo archivos existentes';
           Result.updateexisting    :='Extraer s�lo archivos existentes y s�lo si son nuevos';
           Result.existingfiles     :='Si existe el archivo(s) :';
           Result.SelectAll         :='Selecciona Todo';
           Result.DeSelectAll       :='Deseleccionar';
           Result.PreparingExtraction:='Preparando la extracci�n...';
           Result.ReadingArchive    :='Leyendo contenido de archivo';
           Result.Information       :='Informaci�n';
           Result.Progress_caption  :='Progreso';
           Result.author_of_this_sfx:='Autor de este archivo SFX:';
           Result.copyright         :='Este archivo SFX es basado en Freewarecode y es registrado por';
           Result.further_info      :='Contacta al autor para la informaci�n adicional.';
           Result.about_button      :='&Acerca del SFX...';
           Result.about_caption     :='Acerca del SFX';
      end;
    lgRussian:
      begin
           Result.STR_CANNOTOPEN    :='���������� ������� ���� ..';
           Result.STR_CANNOTCLOSE   :='���������� ������� ����';
           Result.STR_E             :='������..';
           Result.STR_EXISTS        :='...��� ����������, ������������ ?';
           Result.STR_EARCHIVE      :='������ ������ ������.';
           Result.STR_INVALIDNAME   :='�������� ��� �����.';
           Result.STR_EDIRECTORY    :='������ � ���������� ..';
           Result.STR_PREXT         :='����������: ';
           Result.STR_ALLEXT        :='��� ����� ���������.';
           Result.STR_OK            :='���������.';
           Result.STR_NOTSELEXT     :='���������� ����� �� ����� ���� �����������.';
           Result.STR_MP            :='�������� �������������� TArchiver';
           Result.STR_RUN           :='����� ���������� ��������� : ';
           Result.STR_EINC_SIZE     :='�������� ������ �����, ��������� ��������� ���� ���� ��� ���.';
           Result.MAINDIALOG_100    :='����������� � :';
           Result.MAINDIALOG_8008   :='����� :';

           Result.DLGNEW_CAPTION    :='������� �������������';
           Result.DLGNEW_8001       :='������� ���������� :';
           Result.DLGNEW_8002       :='����� ������������� :';
           Result.OK                :='�&�';
           Result.CANCEL            :='&��������';
           Result.DLGSEL_CAPTION    :='�������� ���������� ��� ����������';
           Result.DLGSEL_2002       :='&����...';
           Result.DLGSEL_2004       :='�������...';
           Result.MAINDIALOG_1      :='������';
           Result.MAINDIALOG_2      :='&�������';
           Result.confirm           :='������ �������������';
           Result.overwrite         :='������������ ������������ �����';
           Result.skip              :='���������� ������������ �����';
           Result.update            :='������������ ������ ���� �����';
           Result.existing          :='������������ ������ ������������ �����';
           Result.updateexisting    :='������� ���� ������ ���� �� ���������� � �����';
           Result.existingfiles     :='���������� �����(��) :';
           Result.SelectAll         :='�������� ���';
           Result.DeSelectAll       :='�������� ��� ���������';
           Result.PreparingExtraction:='���������� � ����������...';
           Result.ReadingArchive    :='������ ���������� ������';
           Result.Information       :='����������';
           Result.Progress_caption  :='������';
           Result.author_of_this_sfx:='����� ����� ������:';
           Result.copyright         :='���� ����� ������� �� ����������������������� ���������. ��������� ����� �����������';
           Result.further_info      :='��� ��������� ���������� ������������ � ��������';
           Result.about_button      :='&�� ���� ������...';
           Result.about_caption     :='�� ���� ������';
      end;
    lgDanish:
      begin
           Result.STR_CANNOTOPEN    :='Kan ikke �bne filen ..';
           Result.STR_CANNOTCLOSE   :='Kan ikke lukke filen';
           Result.STR_E             :='Fejl..';
           Result.STR_EXISTS        :='...eksistere allerede, overskriv ?';
           Result.STR_EARCHIVE      :='Fejl ved l�sning af arkivet.';
           Result.STR_INVALIDNAME   :='Forkert filnavn';
           Result.STR_EDIRECTORY    :='Fejl i biblioteket ..';
           Result.STR_PREXT         :='Udpakker: ';
           Result.STR_ALLEXT        :='Alle filer er blevet udpakket.';
           Result.STR_OK            :='F�rdig.';
           Result.STR_NOTSELEXT     :='Den valgte fil(er) kunne ikke udpakkes.';
           Result.STR_MP            :='TArkivere SFX v�rkt�j';
           Result.STR_RUN           :='Efter udpakning, k�r : ';
           Result.STR_EINC_SIZE     :='Forkert fil st�rrelse, pr�v at downloade denne fil igen.';
           Result.MAINDIALOG_100    :='Udpak til :';
           Result.MAINDIALOG_8008   :='Filer :';
           Result.DLGNEW_CAPTION    :='Lav under bibliotek';
           Result.DLGNEW_8001       :='Nuv�rende bibliotek :';
           Result.DLGNEW_8002       :='Nyt under bibliotek :';
           Result.OK                :='&OK';
           Result.CANCEL            :='&Annuller';
           Result.DLGSEL_CAPTION    :='V�lg udpaknings bibliotek';
           Result.DLGSEL_2002       :='&Netv�rk...';
           Result.DLGSEL_2004       :='Ny...';
           Result.MAINDIALOG_1      :='Start';
           Result.MAINDIALOG_2      :='L&uk';
           Result.confirm           :='Sp�rg om bekr�ftelse';
           Result.overwrite         :='Overskriv eksisterende filer';
           Result.skip              :='Skip eksisterende filer';
           Result.update            :='Overskriv kun hvis nyere';
           Result.existing          :='Genskab kun eksisterende filer';
           Result.updateexisting    :='Udpak kun filen hvis den allerede eksistere og er nyere';
           Result.existingfiles     :='Eksisterende fil(er) :';
           Result.SelectAll         :='V�lg alle';
           Result.DeSelectAll       :='Frav�lg alle';
           Result.PreparingExtraction:='Forbered udpakning...';
           Result.ReadingArchive    :='L�ser arkiv indhold';
           Result.Information       :='Information';
           Result.Progress_caption  :='Udf�relse';
           Result.author_of_this_sfx:='Forfatteren af denne SFX:';
           Result.copyright         :='Denne SFX er baseret p� Freeware codeen som er copyrighted af';
           Result.further_info      :='Kontakt forfatteren for mere Information.';
           Result.about_button      :='&Om denne SFX...';
           Result.about_caption     :='Om denne SFX';
      end;
    lgDutch:
      begin
           Result.STR_CANNOTOPEN     := 'Kan bestand niet openen ..';
           Result.STR_CANNOTCLOSE    := 'Kan bestand niet sluiten';
           Result.STR_E              := 'Fout...';
           Result.STR_EXISTS         := '...bestaat al, overschrijven ?';
           Result.STR_EARCHIVE       := 'Fout bij lezen archief.';
           Result.STR_INVALIDNAME    := 'Ongeldige bestandsnaam.';
           Result.STR_EDIRECTORY     := 'Fout in directory...';
           Result.STR_PREXT          := 'Terugzetten: ';
           Result.STR_ALLEXT         := 'Alle bestanden zijn teruggezet.';
           Result.STR_OK             := 'Klaar.';
           Result.STR_NOTSELEXT      := 'Geselecteerde bestanden konden niet worden uitgepakt.';
           Result.STR_MP             := 'TArchiver SFX Tool';
           Result.STR_RUN            := 'Na uitpakken, uitvoeren: ';
           Result.STR_EINC_SIZE      := 'Ongeldige bestandsgrootte, probeer dit bestand nogmaals te downloaden.';
           Result.MAINDIALOG_100     := 'Terugzetten naar:';
           Result.MAINDIALOG_8008    := 'Bestanden:';
           Result.DLGNEW_CAPTION     := 'Creatie subdirectory';
           Result.DLGNEW_8001        := 'Huidige directory:';
           Result.DLGNEW_8002        := 'Nieuwe subdirectory:';
           Result.OK                 := '&OK';
           Result.CANCEL             := '&Annuleer';
           Result.DLGSEL_CAPTION     := 'Selecteer doeldirectory';
           Result.DLGSEL_2002        := '&Netwerk...';
           Result.DLGSEL_2004        := 'Nieuw...';
           Result.MAINDIALOG_1       := 'Start';
           Result.MAINDIALOG_2       := '&Sluiten';
           Result.confirm            := 'Vraag bevestiging';
           Result.overwrite          := 'Overschrijven bestaande bestanden';
           Result.skip               := 'Sla bestaande bestanden over';
           Result.update             := 'Overschrijf alleen oudere bestanden';
           Result.existing           := 'Zet alleen bestaande bestanden terug';
           Result.updateexisting     := 'Zet het bestand alleen terug als het al bestaat en als het nieuwer is';
           Result.existingfiles      := 'Bestaande bestanden:';
           Result.SelectAll          := 'Selecteer alles';
           Result.DeSelectAll        := 'Deselecteer alles';
           Result.PreparingExtraction:= 'Voorbereiden terugzetten...';
           Result.ReadingArchive     := 'Ophalen inhoudsopgave archief...';
           Result.Information        := 'Informatie';
           Result.Progress_caption   := 'Voortgang';
           Result.author_of_this_sfx := 'Auteur van dit SFX-archief:';
           Result.copyright          := 'Deze SFX is gebaseerd op freeware code, copyright van ';
           Result.further_info       := 'Contacteer de auteur voor verdere informatie.';
           Result.about_button       := 'O&ver dit SFX-archief';
           Result.about_caption      := 'Over dit SFX-archief';
      end;
    lgCzech:
      begin
           Result.STR_CANNOTOPEN    :='Nelze otev��t soubor ..';
           Result.STR_CANNOTCLOSE   :='Nelze zav��t soubor';
           Result.STR_E             :='Chyba..';
           Result.STR_EXISTS        :='...ji� existuje, p�epsat?';
           Result.STR_EARCHIVE      :='Chyba p�i �ten� archivu.';
           Result.STR_INVALIDNAME   :='Chybn� n�zev souboru.';
           Result.STR_EDIRECTORY    :='Chyba v adres��i ..';
           Result.STR_PREXT         :='Rozbaluje se: ';
           Result.STR_ALLEXT        :='V�echny soubory byly rozbaleny.';
           Result.STR_OK            :='Ukon�eno.';
           Result.STR_NOTSELEXT     :='Vybran� soubory nelze rozbalit.';
           Result.STR_MP            :='TArchiver SFX Tool';
           Result.STR_RUN           :='Spustit po rozbalen�: ';
           Result.STR_EINC_SIZE     :='Nespr�vn� velikost souboru. Pros�m, zkuste na��st tento soubor znovu.';
           Result.MAINDIALOG_100    :='Rozbalit do:';
           Result.MAINDIALOG_8008   :='Soubory:';

           Result.DLGNEW_CAPTION    :='Vytvo�it podadres��';
           Result.DLGNEW_8001       :='Aktu�ln� adres��:';
           Result.DLGNEW_8002       :='Nov� podadres��:';
           Result.OK                :='&OK';
           Result.CANCEL            :='S&torno';
           Result.DLGSEL_CAPTION    :='Zvolte adres�� pro rozbalen�';
           Result.DLGSEL_2002       :='&S�...';
           Result.DLGSEL_2004       :='Nov�...';
           Result.MAINDIALOG_1      :='Start';
           Result.MAINDIALOG_2      :='&Zav��t';
           Result.confirm           :='Vy��dat potvrzen�';
           Result.overwrite         :='P�epsat existuj�c� soubory';
           Result.skip              :='P�esko�it existuj�c� soubory';
           Result.update            :='P�epsat pouze nov�j��m';
           Result.existing          :='Rozbalit pouze existuj�c� soubory';
           Result.updateexisting    :='Rozbalit soubor pouze pokud existuje a je nov�j��';
           Result.existingfiles     :='Existuj�c� soubor(y):';
           Result.SelectAll         :='Vyber v�echny';
           Result.DeSelectAll       :='Nevyber ��dn�';
           Result.PreparingExtraction:='P�ipravuje se rozbalen� ...';
           Result.ReadingArchive    :='�te se obsah archivu';
           Result.Information       :='Informace';
           Result.Progress_caption  :='V�voj';
           Result.author_of_this_sfx:='Autor tohoto SFX:';
           Result.copyright         :='Tento SFX je zalo�en na Freewarecode - copyright';
           Result.further_info      :='Pros�m, kontaktujte autora k z�sk�n� dal��ch informac�.';
           Result.about_button      :='&O SFX...';
           Result.about_caption     :='O SFX';
      end;
  end;
end;
(*--------------------------------------------------------------------------*)
procedure GetMemoryForTheStrings;   //Allocates the Memory for this strings
begin
              STR_CANNOTOPEN:=Stralloc(length(Msg.STR_CANNOTOPEN)+1);
              STR_CANNOTCLOSE:=Stralloc(length(Msg.STR_CANNOTCLOSE)+1);
              STR_E:=Stralloc(length(Msg.STR_E)+1);
              STR_EXISTS:=Stralloc(length(Msg.STR_EXISTS)+1);
              STR_EARCHIVE:=Stralloc(length(Msg.STR_EARCHIVE)+1);
              STR_INVALIDNAME:=Stralloc(length(Msg.STR_INVALIDNAME)+1);
              STR_EDIRECTORY:=Stralloc(length(Msg.STR_EDIRECTORY)+1);
              STR_PREXT:=Stralloc(length(Msg.STR_PREXT)+1);
              STR_ALLEXT:=Stralloc(length(Msg.STR_ALLEXT)+1);
              STR_OK:=Stralloc(length(Msg.STR_OK)+1);
              STR_NOTSELEXT:=Stralloc(length(Msg.STR_NOTSELEXT)+1);
              STR_MP:=Stralloc(length(Msg.STR_MP)+1);
              STR_RUN:=Stralloc(length(Msg.STR_RUN)+1);
              STR_EINC_SIZE:=Stralloc(200+1);
              temp:=Stralloc(200+1);
end;
(*--------------------------------------------------------------------------*)
procedure FreeTheMemoryOfTheStrings;  //The memory allocated for all these strings is freed
Begin
            Strdispose(STR_CANNOTOPEN);
            Strdispose(STR_CANNOTCLOSE);
            Strdispose(STR_E);
            Strdispose(STR_EXISTS);
            Strdispose(STR_EARCHIVE);
            Strdispose(STR_INVALIDNAME);
            Strdispose(STR_EDIRECTORY);
            Strdispose(STR_PREXT);
            Strdispose(STR_ALLEXT);
            Strdispose(STR_OK);
            Strdispose(STR_NOTSELEXT);
            Strdispose(STR_MP);
            Strdispose(STR_RUN);
            Strdispose(STR_EINC_SIZE);
            Strdispose(temp);
end;
(*--------------------------------------------------------------------------*)
function SplitLine(index:integer;comment:string):string; // splits the Archive Comment into the ones that are shown
//          index=1 : the part from <SFXStartComment> to <SFXEndComment>
//          index=2 : the part from <SFXEndComment> to <SFXCommentEnd>
var pip,pip1:integer;
begin
result := comment;

if index = 1 then begin
                       pip := pos('<SFXStartComment>',comment);
                       pip1 := pos('<SFXEndComment>',comment);
                       if (pip = 0) or (pip1 = 0) then result := ''
                                                  else result := copy(comment,pip+17,pip1-pip-17);
                  end else
if index = 2 then begin
                       pip := pos('<SFXEndComment>',comment);
                       pip1 := pos('<SFXCommentEnd>',comment);
                       if (pip = 0) or (pip1 = 0) then result := ''
                                                  else result := copy(comment,pip+15,pip1-pip-15);
                  end;
end;

(*--------------------------------------------------------------------------*)
Procedure ShowComment(comment:string);  //Shows the comment in a normal Messagebox
var temp,temp1:pchar;
Begin
temp:=stralloc(length(comment)+1);
temp1:=stralloc(length(SfxMisc.Msg.Information)+1);
strpcopy(temp,comment+#0);
strpcopy(temp1,SfxMisc.Msg.Information+#0);
MessageBox ( MainWin , @temp[0] , @temp1[0] , 0 );
strdispose(temp);
strdispose(temp1);
End;
(*--------------------------------------------------------------------------*)

END.
