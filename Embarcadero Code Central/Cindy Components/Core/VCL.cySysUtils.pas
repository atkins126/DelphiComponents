{   Unit VCL.cySysUtils

    Description:
    Unit with system functions.

    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    $   Accept any PAYPAL DONATION $$$  
    $      to: mauricio_box@yahoo.com      
    

    * ***** BEGIN LICENSE BLOCK *****
    *
    * Version: MPL 1.1
    *
    * The contents of this file are subject to the Mozilla Public License Version
    * 1.1 (the "License"); you may not use this file except in compliance with the
    * License. You may obtain a copy of the License at http://www.mozilla.org/MPL/
    *
    * Software distributed under the License is distributed on an "AS IS" basis,
    * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
    * the specific language governing rights and limitations under the License.
    *
    * The Initial Developer of the Original Code is Mauricio
    * (https://sourceforge.net/projects/tcycomponents/).
    *
    * Donations: see Donation section on Description.txt
    *
    * Alternatively, the contents of this file may be used under the terms of
    * either the GNU General Public License Version 2 or later (the "GPL"), or the
    * GNU Lesser General Public License Version 2.1 or later (the "LGPL"), in which
    * case the provisions of the GPL or the LGPL are applicable instead of those
    * above. If you wish to allow use of your version of this file only under the
    * terms of either the GPL or the LGPL, and not to allow others to use your
    * version of this file under the terms of the MPL, indicate your decision by
    * deleting the provisions above and replace them with the notice and other
    * provisions required by the LGPL or the GPL. If you do not delete the
    * provisions above, a recipient may use your version of this file under the
    * terms of any one of the MPL, the GPL or the LGPL.
    *
    * ***** END LICENSE BLOCK *****}

unit VCL.cySysUtils;

interface

uses classes, sysUtils, comCtrls, controls, forms;

  procedure SortArrayOfIntegers(var aArray: Array of Integer);

  // File system utils:
  function IsFolder(SRec: TSearchrec): Boolean;

  function isFolderReadOnly(Directory: String): Boolean;

  function DirectoryIsEmpty(Directory: String): Boolean;

  function DirectoryWithSubDir(Directory: String): Boolean;

  procedure GetSubDirs(FromDirectory: String; aList: TStrings);

  function DiskFreeBytes(Drv: Char): Int64;

  function DiskBytes(Drv: Char): Int64;

  function GetFileBytes(Filename: String): Int64;

  function GetFilesBytes(Directory, Filter: String): Int64;

  // Others :
  function RichTextToText(const rtfText: String): string;       // rtfText can be rtf or not rtf text !

  function TextToRichText(const aText: String): string;   // aText can be rtf or not rtf text !

  procedure Textfile_Add(OnTextFile: TFilename; const AddText: String; const CleanBefore: Boolean);


const
  // Privilege constants to use with NTSetPrivilege() :
  SE_CREATE_TOKEN_NAME = 'SeCreateTokenPrivilege';
  SE_ASSIGNPRIMARYTOKEN_NAME = 'SeAssignPrimaryTokenPrivilege';
  SE_LOCK_MEMORY_NAME = 'SeLockMemoryPrivilege';
  SE_INCREASE_QUOTA_NAME = 'SeIncreaseQuotaPrivilege';
  SE_UNSOLICITED_INPUT_NAME = 'SeUnsolicitedInputPrivilege';
  SE_MACHINE_ACCOUNT_NAME = 'SeMachineAccountPrivilege';
  SE_TCB_NAME = 'SeTcbPrivilege';
  SE_SECURITY_NAME = 'SeSecurityPrivilege';
  SE_TAKE_OWNERSHIP_NAME = 'SeTakeOwnershipPrivilege';
  SE_LOAD_DRIVER_NAME = 'SeLoadDriverPrivilege';
  SE_SYSTEM_PROFILE_NAME = 'SeSystemProfilePrivilege';
  SE_SYSTEMTIME_NAME = 'SeSystemtimePrivilege';
  SE_PROF_SINGLE_PROCESS_NAME = 'SeProfileSingleProcessPrivilege';
  SE_INC_BASE_PRIORITY_NAME = 'SeIncreaseBasePriorityPrivilege';
  SE_CREATE_PAGEFILE_NAME = 'SeCreatePagefilePrivilege';
  SE_CREATE_PERMANENT_NAME = 'SeCreatePermanentPrivilege';
  SE_BACKUP_NAME = 'SeBackupPrivilege';
  SE_RESTORE_NAME = 'SeRestorePrivilege';
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
  SE_DEBUG_NAME = 'SeDebugPrivilege';
  SE_AUDIT_NAME = 'SeAuditPrivilege';
  SE_SYSTEM_ENVIRONMENT_NAME = 'SeSystemEnvironmentPrivilege';
  SE_CHANGE_NOTIFY_NAME = 'SeChangeNotifyPrivilege';
  SE_REMOTE_SHUTDOWN_NAME = 'SeRemoteShutdownPrivilege';
  SE_UNDOCK_NAME = 'SeUndockPrivilege';
  SE_SYNC_AGENT_NAME = 'SeSyncAgentPrivilege';
  SE_ENABLE_DELEGATION_NAME = 'SeEnableDelegationPrivilege';
  SE_MANAGE_VOLUME_NAME = 'SeManageVolumePrivilege';

implementation

procedure SortArrayOfIntegers(var aArray: Array of Integer);
var
  p1, p2, sav: Integer;
begin
  for p1 := Length(aArray)-1 downto 1 do   // Starting from the end allow us to read Length(aArray) just one time !
    for p2 := p1 - 1 downto 0 do           // Find max integer
      if aArray[p1] < aArray[p2] then
      begin
        Sav := aArray[p1];
        aArray[p1] := aArray[p2];
        aArray[p2] := Sav;
      end;
end;

function IsFolder(SRec: TSearchrec): Boolean;
begin
  Result := SRec.Attr and faDirectory <> 0;
end;

function isFolderReadOnly(Directory: String): Boolean;
var
  TmpFile: String;
  Seq: Integer;
  Fich: TextFile;
begin
  Result := True;

  if Directory <> '' then
    if DirectoryExists(Directory) then
    begin
      if Directory[length(Directory)] <> '\' then
        Directory := Directory + '\';

      Seq := 1;
      repeat
        TmpFile := Directory + '~tmp' + intToStr(Seq) + '.txt';
        Seq := Seq + 1;
      until (not FileExists(TmpFile)) or (Seq = 10000);

      if not FileExists(TmpFile)
      then
        try
          AssignFile(Fich, TmpFile);
          Rewrite(Fich);
          CloseFile(Fich);
          Result := false;
          DeleteFile(TmpFile);
        except

        end;
    end;
end;

function DirectoryIsEmpty(Directory: String): Boolean;
var
  SRec: TSearchRec;
begin
  Result := true;
  if Directory <> '' then
    if Directory[length(Directory)] <> '\' then
      Directory := Directory + '\';

  Directory := Directory + '*';

  if FindFirst(Directory, faAnyfile, SRec) = 0 then
    repeat
      if (SRec.Name + '.')[1] <> '.'
      then Result := false;
    until (not Result) or (FindNext(SRec) <> 0);

  FindClose(SRec);
end;

function DirectoryWithSubDir(Directory: String): Boolean;
var
  SRec: TSearchRec;
begin
  Result := false;
  if Directory <> '' then
    if Directory[length(Directory)] <> '\' then
      Directory := Directory + '\';

  Directory := Directory + '*';

  if FindFirst(Directory, faAnyfile, SRec) = 0 then
    repeat
      if IsFolder(SRec)
      then
        if (SRec.Name + '.')[1] <> '.'    // If (SREC.Name + 'X')[1] <> '.'
        then RESULT := true;
    until (Result) or (FindNext(SREC) <> 0);

  FindClose(SREC);
end;

procedure GetSubDirs(FromDirectory: String; aList: TStrings);
var
  SREC: TSearchRec;
begin
  aList.Clear;

  if FromDirectory <> '' then
    if FromDirectory[length(FromDirectory)] <> '\' then
      FromDirectory := FromDirectory + '\';

  FromDirectory := FromDirectory + '*';


  if FindFirst(FromDirectory, faAnyfile, SRec) = 0 then
    repeat
      if IsFolder(SRec)
      then
        if (SRec.Name + '.')[1] <> '.'
        then aList.Add(SRec.Name);
    until FindNext(SRec) <> 0;

  FindClose(SRec);
end;

function DiskFreeBytes(Drv: Char): Int64;
var Valor: Integer;
begin
  Result := -1;   // Disco invalido !
  Valor  := Ord( AnsiUpperCase(Drv)[1] ) - 64;   // A=65, B=66    Etc ...

  if Valor in [1..66] then
    if DirectoryExists(Drv + ':') then
      Result := DiskFree(Valor);      // A=1, B=2   Etc ..
end;

function DiskBytes(Drv: Char): Int64;
var Valor: Byte;
begin
  Result := -1;
  Valor := Ord( AnsiUpperCase(Drv)[1] ) - 64;   // A=65, B=66    Etc ...

  if Valor in [1..66] then
    if DirectoryExists(Drv + ':') then
      Result := DiskSize(Valor);
end;

function GetFileBytes(Filename: String): Int64;
var SRec: TSearchRec;
begin
  if FindFirst(Filename, FaAnyFile, SRec) = 0
  then Result := SRec.Size
  else Result := 0;

  FindClose(SRec);
end;

function GetFilesBytes(Directory, Filter: String): Int64;
var
  SRec: TSearchRec;
begin
  Result := 0;
  if Directory <> '' then
    if Directory[length(Directory)] <> '\' then
      Directory := Directory + '\';

  if FindFirst(Directory + Filter, FaAnyFile, SRec) = 0 then
  begin
    Result := SRec.Size;
    while FindNext(SRec) = 0 do
       Result := Result + SRec.Size;
  end;

  FindClose(SRec);
end;

function RichTextToText(const rtfText: String): string;       // rtfText can be rtf or not rtf text !
var
  aOwner: TForm;
  aRichEdit: TRichEdit;
  aStringStream: TStringStream;
begin
  Result := '';
  if rtfText = '' then Exit;

  Application.CreateForm(TForm, aOwner);
  aRichEdit := TRichEdit.Create(aOwner);

  try
    aStringStream := TStringStream.Create(rtfText);
    aRichEdit.Parent := aOwner;
    aRichEdit.Lines.LoadFromStream(aStringStream);
    aStringStream.Free;

    Result := aRichEdit.Text;
  except
  end;

  aRichEdit.Free;
  aOwner.Free;
end;

function TextToRichText(const aText: String): string;   // aText can be rtf or not rtf text !
var
  aOwner: TForm;
  aRichEdit: TRichEdit;
  aStringStream: TStringStream;
begin
  Result := '';
  if aText = '' then Exit;

  Application.CreateForm(TForm, aOwner);
  aRichEdit := TRichEdit.Create(aOwner);

  try
    aStringStream := TStringStream.Create(aText);
    aRichEdit.Parent := aOwner;
    aRichEdit.Lines.LoadFromStream(aStringStream);

    {$IFDEF UNICODE}
    aStringStream.Clear;
    {$ELSE}
    aStringStream.Size := 0;
    aStringStream.Position := 0;
    {$ENDIF}

    aRichEdit.Lines.SaveToStream(aStringStream);
    Result := aStringStream.DataString;
    aStringStream.Free;
  except
  end;

  aRichEdit.Free;
  aOwner.Free;
end;

procedure Textfile_Add(OnTextFile: TFilename; const AddText: String; const CleanBefore: Boolean);
var
  aTextFile: TextFile;
  IsEmpty: Boolean;
begin
  try
    AssignFile(aTextFile, OnTextFile);

    if (not FileExists(OnTextFile)) or (CleanBefore)
    then begin
      Rewrite(aTextFile);          // Cria um novo OnTextFile e abre-o ...
      IsEmpty := True;
    end
    else begin
      Reset(aTextFile);            // Abre um OnTextFile existente ...
      IsEmpty := Eof(aTextFile);
    end;

    Append(aTextFile);             // Prepara o OnTextFile para inserηγo no fim ...

    if not IsEmpty
    then Writeln(aTextFile, '');   // Abre uma nova linha ...

    Write(aTextFile, AddText);       // Escreve na sua posiηγo (Sem abrir uma nova linha no fim) ...
    CloseFile(aTextFile);
  except
  end;
end;

end.
