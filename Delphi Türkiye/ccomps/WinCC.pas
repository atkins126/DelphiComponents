unit WinCC;

interface

// Parametreler
// Path        : �al��t�r�lacak dosya
// Visibility  : True ise �al��t�r�lan program show edilir.
// TimeOut     : Program�n �al��mas�n� bekleme s�resi (Milisaniye olarak) $FFFFFFFF verilirse
//              i�lem bitene kadar bekler.
function WinExecAndWait(Path: String; Visibility: Boolean;Timeout : DWORD): integer;

implementation

function WinExecAndWait(Path: String; Visibility: Boolean;Timeout : DWORD): integer;
var
  WaitResult        : integer;
  StartupInfo       : TStartupInfo;
  ProcessInfo       : TProcessInformation;
  iResult           : integer;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
       begin
         cb := SizeOf(TStartupInfo);
         dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;

         if visibility then
            wShowWindow := 5
         else
            wShowWindow :=0;
       end;  // with StartupInfo do

  if CreateProcess(nil,
                   PChar(Path),
                   nil,
                   nil,
                   False,
		   NORMAL_PRIORITY_CLASS,
                   nil,
                   nil,
		   StartupInfo,
                   ProcessInfo) then
     begin
       WaitResult := WaitForSingleObject(ProcessInfo.hProcess, timeout);  //
       result := WaitResult;
     end
  else
     result:=GetLastError;
end;

end.

