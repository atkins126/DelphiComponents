{*******************************************************}
{                                                       }
{            Windows Dialogs interface unit             }
{                    version 2.2                        }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{*******************************************************}

Unit psvDialogs;

{$IFNDEF VER130}
{$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}


interface

Uses ShellAPI,Windows,Classes,Forms,SysUtils,Graphics, Dialogs,
     Controls, ShlOBJ, ComObj,
     CPL, ActiveX, CommDlg;

type
  EShellOleError = class(Exception);

  TShellLinkInfo = record
    PathName: string;
    Arguments: string;
    Description: string;
    WorkingDirectory: string;
    IconLocation: string;
    IconIndex: integer;
    ShowCmd: integer;
    HotKey: word;
  end;

  TSpecialFolderInfo = record
    Name: string;
    ID: Integer;
  end;

TOpenFileNameEx = packed record
   // Size of the structure in bytes.
  lStructSize: DWORD;
   // Handle that is the parent of the dialog.
  hWndOwner: HWND;
   // Application instance handle.
  hInstance: HINST;
   // String containing filter information.
  lpstrFilter: PAnsiChar;
   // Will hold the filter chosen by the user.
  lpstrCustomFilter: PAnsiChar;
   // Size of lpstrCustomFilter, in bytes.
  nMaxCustFilter: DWORD;
   // Index of the filter to be shown. 
  nFilterIndex: DWORD;
   // File name to start with (and retrieve). 
  lpstrFile: PAnsiChar; 
   // Size of lpstrFile, in bytes.
  nMaxFile: DWORD; 
   // File name without path will be returned.
  lpstrFileTitle: PAnsiChar;
   // Size of lpstrFileTitle, in bytes.
  nMaxFileTitle: DWORD; 
   // Starting directory. 
  lpstrInitialDir: PansiChar; 
   // Title of the open dialog.
  lpstrTitle: PAnsiChar;
   // Controls user selection options. 
  Flags: DWORD; 
   // Offset of file name in filepath=lpstrFile. 
  nFileOffset: Word;
   // Offset of extension in filepath=lpstrFile.
  nFileExtension: Word;
   // Default extension if no extension typed. 
  lpstrDefExt: PAnsiChar; 
   // Custom data to be passed to hook.
  lCustData: LPARAM;
  lpfnHook: function(Wnd: HWND; Msg: UINT; wParam: WPARAM;
    lParam: LPARAM): UINT stdcall;  // Hook.
   // Template dialog, if applicable. 
  lpTemplateName: PAnsiChar; 
   // Extended structure starts here. 
  pvReserved: Pointer;   // Reserved, use nil.
  dwReserved: DWORD;     // Reserved, use 0.
  FlagsEx: DWORD;        // Extended Flags.
end;

const

 OFN_EX_NOPLACESBAR = 1; // for new style of standard Windows dialogs

  SpecialFolders: array[0..29] of TSpecialFolderInfo = (
    (Name: 'Alt Startup'; ID: CSIDL_ALTSTARTUP),
    (Name: 'Application Data'; ID: CSIDL_APPDATA),
    (Name: 'Recycle Bin'; ID: CSIDL_BITBUCKET),
    (Name: 'Common Alt Startup'; ID: CSIDL_COMMON_ALTSTARTUP),
    (Name: 'Common Desktop'; ID: CSIDL_COMMON_DESKTOPDIRECTORY),
    (Name: 'Common Favorites'; ID: CSIDL_COMMON_FAVORITES),
    (Name: 'Common Programs'; ID: CSIDL_COMMON_PROGRAMS),
    (Name: 'Common Start Menu'; ID: CSIDL_COMMON_STARTMENU),
    (Name: 'Common Startup'; ID: CSIDL_COMMON_STARTUP),
    (Name: 'Controls'; ID: CSIDL_CONTROLS),
    (Name: 'Cookies'; ID: CSIDL_COOKIES),
    (Name: 'Desktop'; ID: CSIDL_DESKTOP),
    (Name: 'Desktop Directory'; ID: CSIDL_DESKTOPDIRECTORY),
    (Name: 'Drives'; ID: CSIDL_DRIVES),
    (Name: 'Favorites'; ID: CSIDL_FAVORITES),
    (Name: 'Fonts'; ID: CSIDL_FONTS),
    (Name: 'History'; ID: CSIDL_HISTORY),
    (Name: 'Internet'; ID: CSIDL_INTERNET),
    (Name: 'Internet Cache'; ID: CSIDL_INTERNET_CACHE),
    (Name: 'Network Neighborhood'; ID: CSIDL_NETHOOD),
    (Name: 'Network Top'; ID: CSIDL_NETWORK),
    (Name: 'Personal'; ID: CSIDL_PERSONAL),
    (Name: 'Printers'; ID: CSIDL_PRINTERS),
    (Name: 'Printer Links'; ID: CSIDL_PRINTHOOD),
    (Name: 'Programs'; ID: CSIDL_PROGRAMS),
    (Name: 'Recent Documents'; ID: CSIDL_RECENT),
    (Name: 'Send To'; ID: CSIDL_SENDTO),
    (Name: 'Start Menu'; ID: CSIDL_STARTMENU),
    (Name: 'Startup'; ID: CSIDL_STARTUP),
    (Name: 'Templates'; ID: CSIDL_TEMPLATES));

 {SHObjectProperties Flags}
  OPF_PRINTERNAME = $01;
  OPF_PATHNAME    = $02;

 type
    TpsvFormatType = (ftFull, ftQuick);
    TShellObjectType = (sdPathObject, sdPrinterObject);
    TShellObjectTypes = set of TShellObjectType;

    TpsvComponent = class(TComponent)
    private
      FAbout : string;
      procedure SetAbout(const Value : string);
    public
      constructor Create(AOwner : TComponent); override;
    published
      property About : string read FAbout write SetAbout stored false;
    end;

    {Format drive dialog}
    TpsvFormatDialog = class(TpsvComponent)
      private
       FFormatType : TpsvFormatType;
       FDrive : integer;
       FDriveChar : Char;
       procedure SetDriveChar(Value: Char);
      public
        constructor Create(AOwner : TComponent); override;
        function Execute : integer; virtual;
      published
       property FormatType : TpsvFormatType read FFormatType write FFormatType;
       property DriveChar  : char read FDriveChar write SetDriveChar;
    end;

    {Organize Favorites dialog}
    TpsvOrganizeFavoritesDialog = class(TpsvComponent)
     public
       function Execute : boolean; virtual;
     end;

    {Show control panel}
    TpsvControlPanelDialog = class(TpsvComponent)
    public
      function Execute : boolean; virtual;
    end;

    {execute Control Panel applet}
    TpsvAppletDialog = Class(TpsvComponent)
    private
      FAppletName : string;
    public
      function Execute : boolean; virtual;
    published
      property AppletName : string read FAppletName write FAppletName;
    end;

    {browse network}
    TpsvComputerNameDialog = Class(TpsvComponent)
    private
      FComputerName : String;
      FCaption : String;
    public
      constructor Create(AOwner : TComponent); override;
      function Execute : boolean; virtual;
      property ComputerName : string read FComputerName;
    published
      property Caption : string read FCaption write FCaption;
    end;

    {selection folder from tree}
    TpsvBrowseFolderDialog = Class(TpsvComponent)
    private
      FFolderName : String;
      FCaption : String;
    public
      Constructor Create(AOwner : TComponent); override;
      function Execute : boolean; virtual;
      property FolderName : string read FFolderName;
    published
      property Caption : string read FCaption write FCaption;
    end;

  {"Out of memory" dialog}
  TpsvOutOfMemoryDialog= class(TpsvComponent)
  private
   FCaption : string;
  public
   function Execute : boolean; virtual;
  published
   property Caption : string read FCaption write FCaption;
  end;

  TpsvChangeIconDialog = class(TpsvComponent)
    private
      FIconIndex : integer;
    public
        function Execute : integer;
    published
      property IconIndex : integer read FIconIndex write FIconIndex;
    end;

  TpsvShellAboutDialog = class(TpsvComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  private
    FCaption:        String;
    FIcon:           TIcon;
    FOtherText:      String;
    FProduct:        String;
  private
    procedure SetIcon(NewValue: TIcon);
  private
    function  StoreIcon: Boolean;
  public
    function  Execute: Boolean;
  published
    property  Caption:        String    read FCaption        write FCaption;
    property  Icon:           TIcon     read FIcon           write SetIcon         stored  StoreIcon;
    property  OtherText:      String    read FOtherText      write FOtherText;
    property  Product:        String    read FProduct        write FProduct;
  end;

   TpsvRunDialog = class(TpsvComponent)
   private
    FCaption:       String;
    FDescription:   String;
    FIcon:          TIcon;
    procedure SetIcon(const Value: TIcon);
   public
     constructor Create(AOwner : TComponent); override;
     destructor  Destroy; override;
     function Execute : integer;
   published
     property Caption : string read FCaption write FCaption;
     property Description : string read FDescription write FDescription;
     property Icon : TIcon read FIcon write SetIcon;
   end;

  TpsvObjectPropertiesDialog = class(TpsvComponent)
  private
    FObjectName : TFileName;
    FObjectType : TShellObjectType;
    FInitialTab : string;
  public
    function Execute : boolean;
  published
    property ObjectName : TFileName read FObjectName write FObjectName;
    property ObjectType : TShellObjectType read FObjectType write FObjectType;
    property InitialTab : string read FInitialTab write FInitialTab;
  end;

  //Common dialogs with Windows 2000 style support
  TpsvOpenDialog = class(TOpenDialog)
  public
    function Execute: Boolean; override;
  end;

  TpsvSaveDialog = class(TSaveDialog)
  public
    function Execute: Boolean; override;
  end;


 TpsvNewLinkDialog = class(TpsvComponent)
  private
   FDestinationFolder : string;
  public
    procedure Execute;
  published
   property DestinationFolder : string read FDestinationFolder write FDestinationFolder;
  end;

 TpsvAddHardwareDialog = class(TpsvComponent)
 public
   procedure Execute;
 end;


 TpsvOpenWidthDialog = class(TpsvComponent)
 private
   FFileName : string;
 public
   procedure Execute;
 published
   property FileName : string read FFileName write FFileName;
 end;


  TpsvDiskFullDialog = class(TpsvComponent)
    private
       FDrive : integer;
       FDriveChar : Char;
       procedure SetDriveChar(Value: Char);
      public
        constructor Create(AOwner : TComponent); override;
        function Execute : integer; virtual;
      published
        property DriveChar  : char read FDriveChar write SetDriveChar;
   end;

  TpsvExitWindowsDialog = class(TpsvComponent)
   public
    function Execute : integer; virtual;
  end;

//Tools routines
function  GetSpecialFolderPath(FolderName: String; CanCreate: Boolean): string;
procedure AddToRecentDocs(Const Filename: string);
procedure ClearRecentDocs;
function  ExtractIconFromFile(FileName: string; Index: integer): HIcon;
function  CreateShellLink(const AppName, Desc: string; Dest: String): string;
procedure GetShellLinkInfo(const LinkFile: WideString; var SLI: TShellLinkInfo);
procedure SetShellLinkInfo(const LinkFile: WideString; const SLI: TShellLinkInfo);
function  RecycleFile(FileToRecycle: string): boolean;
function  CopyFile(FromFile, ToDir : string) : boolean;
procedure ExecuteApplet(AppletName : string);
function  ShellObjectTypeEnumToConst(ShellObjectType: TShellObjectType):UINT;
function  ShellObjectTypeConstToEnum(ShellObjectType: UINT):TShellObjectType;
function  ShellMessageBox(Instance: THandle; Owner: HWND; Text: PChar; Caption: PChar;
                           Style: UINT; Parameters: Array of Pointer): Integer; cdecl;

Type
  FreePIDLProc  =  procedure (PIDL: PItemIDList); stdcall;
  SHFormatDriveProc = function  (wnd: HWND; drive : UINT; fmtID : UINT; options : UINT): DWORD; stdcall;
  SHShutDownDialogProc =  procedure (wnd : HWND); stdcall;
  SHRunDialogProc =  function  (wnd : HWND; Unknown1:integer; Unknown2 : Pointer; szTitle : PChar; szPrompt : PChar; uiFlages : integer) : DWORD; stdcall;
  SHChangeIconProc = function  (wnd : HWND; szFileName : PChar; reserved : integer; var lpIconIndex : integer) : DWORD; stdcall;
  SHFindFilesProc =  function  (Root: PItemIDList; SavedSearchFile: PItemIDList): LongBool; stdcall;
  SHFindComputerProc = function  (Reserved1: PItemIDList; Reserved2: PItemIDList): LongBool; stdcall;
  SHObjectPropertiesProc = function  (Owner: HWND; Flags: UINT; ObjectName: Pointer; InitialTabName: Pointer): LongBool; stdcall;
  SHNetConnectionDialogProc =  function  (Owner: HWND; ResourceName: Pointer; ResourceType: DWORD): DWORD; stdcall;
  SHStartNetConnectionDialogProc =  function  (Owner: HWND; ResourceName: PWideChar; ResourceType: DWORD): DWORD; stdcall;
  SHOutOfMemoryMessageBoxProc = function  (Owner: HWND; Caption: Pointer; Style: UINT): Integer; stdcall;
  SHHandleDiskFullProc = procedure (Owner: HWND; uDrive: UINT); stdcall;
  GetOpenFileNameExProc = function  (var OpenFile: TOpenFilenameEx): Bool; stdcall;
  GetSaveFileNameExProc =  function  (var SaveFile: TOpenFileNameEx): bool; stdcall;
  NewLinkHereProc =  procedure (HWND : THandle; HInstance : THandle; CmdLine : Pchar; cmdShow : integer); stdcall;
  SHOpenWidthProc =  procedure (HWND : THandle; HInstance : THandle; cmdLine : PChar; cmdShow : integer); stdcall;


var
 FreePIDL : FreePIDLProc = nil;
 SHFormatDrive : SHFormatDriveProc = nil;
 SHShutDownDialog : SHShutDownDialogProc = nil;
 SHRunDialog : SHRunDialogProc = nil;
 SHFindFiles : SHFindFilesProc = nil;
 SHFindComputer : SHFindComputerProc = nil;
 SHObjectProperties : SHObjectPropertiesProc = nil;
 SHNetConnectionDialog : SHNetConnectionDialogProc = nil;
 SHStartNetConnectionDialog : SHStartNetConnectionDialogProc = nil;
 SHOutOfMemoryMessageBox : SHOutOfMemoryMessageBoxProc = nil;
 SHHandleDiskFull : SHHandleDiskFullProc = nil;
 GetOpenFileNameEx : GetOpenFileNameExProc = nil;
 GetSaveFileNameEx : GetSaveFileNameExProc = nil;
 NewLinkHere : NewLinkHereProc = nil;
 SHOpenWidth : SHOpenWidthProc = nil;
 SHChangeIcon : SHChangeIconProc = nil;

implementation


const
shell32 = 'shell32.dll';

sNotSupported = 'This function is not supported by your version of Windows';

var
  ShellHandle: THandle = 0;
  CommHandle : THandle = 0;
  AppWizHandle : THandle = 0;

procedure LoadpsvDialogs;
begin
 ShellHandle := Windows.LoadLibrary(PChar(shell32));
 if ShellHandle <> 0 then
   begin
     SHFormatDrive :=         GetProcAddress(ShellHandle, PChar('SHFormatDrive'));
     FreePIDL :=              GetProcAddress(ShellHandle, PChar(155));
     SHShutDownDialog :=      GetProcAddress(ShellHandle, PChar(60));
     SHRunDialog :=           GetProcAddress(ShellHandle, PChar(61));
     SHChangeIcon :=          GetProcAddress(ShellHandle, PChar(62));
     SHFindFiles :=           GetProcAddress(ShellHandle, PChar(90));
     SHFindComputer :=        GetProcAddress(ShellHandle, PChar(91));
     SHObjectProperties :=    GetProcAddress(ShellHandle, PChar(178));
     SHNetConnectionDialog := GetProcAddress(ShellHandle, PChar(160));
     SHOutOfMemoryMessageBox := GetProcAddress(ShellHandle, PChar(126));
     SHHandleDiskFull :=       GetProcAddress(ShellHandle, PChar(185));
     SHStartNetConnectionDialog :=  GetProcAddress(ShellHandle, PChar(215));
     SHOpenWidth   :=       GetProcAddress(ShellHandle, PChar('OpenAs_RunDLLA'));

   end;

  CommHandle := Windows.LoadLibrary('comdlg32.dll');
  if CommHandle <> 0 then
   begin
     GetOpenFileNameEx :=  GetProcAddress(CommHandle, PChar('GetOpenFileNameA'));
     GetSaveFileNameEx :=   GetProcAddress(CommHandle, PChar('GetSaveFileNameA'));
   end;

  AppWizHandle := Windows.LoadLibrary('appwiz.cpl');
  if AppWizHandle <> 0 then
     NewLinkHere :=  GetProcAddress(AppWizHandle, PChar('NewLinkHereA'));
end;


procedure UnloadpsvDialogs;
begin
  if Shellhandle <> 0 then
   FreeLibrary(ShellHandle);
  if CommHandle <> 0 then
   FreeLibrary(CommHandle);
  if AppWizHandle <> 0 then
   FreeLibrary(AppWizHandle);
end;

{  Although most Win32 applications do not need to be able
   to format disks, some do. Windows 95 and Windows NT provide
   an API function called SHFormatDrive, which presents the
   same dialog box as the Windows 95 and Windows NT shells,
   formats the specified diskette.

   The SHFormatDrive API provides access to the Shell's format
   dialog box. This allows applications that want to format disks to bring
   up the same dialog box that the Shell uses for disk formatting.

   PARAMETERS
      hwnd    = The window handle of the window that will own the
                dialog. NOTE that hwnd == NULL does not cause this
                dialog to come up as a "top level application"
                window. This parameter should always be non-null,
                this dialog box is only designed to be the child of
                another window, not a stand-alone application.

      drive   = The 0 based (A: == 0) drive number of the drive
                to format.

      fmtID   = Currently must be set to SHFMT_ID_DEFAULT.

      options = There are currently only two option bits defined.

                   SHFMT_OPT_FULL
                   SHFMT_OPT_SYSONLY

                SHFMT_OPT_FULL specifies that the "Quick Format"
                setting should be cleared by default. If the user
                leaves the "Quick Format" setting cleared, then a
                full format will be applied (this is useful for
                users that detect "unformatted" disks and want
                to bring up the format dialog box).

                If options is set to zero (0), then the "Quick Format"
                setting is set by default. In addition, if the user leaves
                it set, a quick format is performed. Under Windows NT 4.0,
                this flag is ignored and the "Quick Format" box is always
                checked when the dialog box first appears. The user can
                still change it. This is by design.

                The SHFMT_OPT_SYSONLY initializes the dialog to
                default to just sys the disk.

                All other bits are reserved for future expansion
                and must be 0.

                Please note that this is a bit field and not a
                value, treat it accordingly.

      RETURN
         The return is either one of the SHFMT_* values, or if
         the returned DWORD value is not == to one of these
         values, then the return is the physical format ID of the
         last successful format. The LOWORD of this value can be
         passed on subsequent calls as the fmtID parameter to
         "format the same type you did last time".
}

const
 SHFMT_ID_DEFAULT = $FFFF;
 SHFMT_OPT_FULL   = $0001;
 SHFMT_OPT_SYSONLY= $0002;
 // Special return values. PLEASE NOTE that these are DWORD values.
  SHFMT_ERROR = $FFFFFFFF;  // Error on last format
 // drive may be formatable
  SHFMT_CANCEL = $FFFFFFFE;  // Last format wascanceled
  SHFMT_NOFORMAT = $FFFFFFFD;  // Drive is not formatable



type
 LPFNORGFAV = function(Wnd : hWnd; Str : lptStr) : integer; stdcall;


function ExtractIconFromFile(FileName: string; Index: integer): HIcon;
var
  iNumberOfIcons: integer;
begin
  Result := 0;
  if FileExists(FileName) then
   begin
    iNumberOfIcons := ExtractIcon(hInstance, PChar(FileName), Cardinal(-1));
    if (( Index > 0) and
        (Index < iNumberOfIcons) and
        (iNumberOfIcons > 0))
         then
           Result:= ExtractIcon(hInstance, PChar(FileName), Index);
  end;
end;

Function TpsvOrganizeFavoritesDialog.Execute: boolean;
var
  SHModule : THandle;
  Path : string;
  lpfnDoOrganizeFavDlg : LPFNORGFAV;
begin
ShModule := SafeLoadLibrary('shdocvw.dll');
  if ShModule <= HINSTANCE_ERROR then
    begin
      Result := False;
      Exit;
    end;
 Path := GetSpecialFolderPath('Favorites',true)+#0#0;
 lpfnDoOrganizeFavDlg := LPFNORGFAV(GetProcAddress(SHModule,'DoOrganizeFavDlg'));
 lpfnDoOrganizeFavDlg(Application.Handle,PChar(Path));
 FreeLibrary(SHModule);
 Result := true;
end;





function TpsvControlPanelDialog.Execute : boolean;
begin
 Result := (ShellExecute(0,'open',
                     'Control.exe',
                     nil,
                     nil,
                     SW_SHOWDEFAULT) > 32);
end;



Function TpsvAppletDialog.Execute : boolean;
var APModule : THandle;
    Applet   : Applet_PROC;
begin
  if FAppletName = EmptyStr then
   begin
     Result := False;
     Exit;
   end;
  APModule := LoadLibrary(Pchar(AppletName));
  if APModule <= HINSTANCE_ERROR then
   begin
    Result := False;
    Exit;
   end;
  Applet := Applet_proc(GetProcAddress(APModule,'CPlApplet'));
  Applet(0,CPL_DBLCLK,0,0);
  FreeLibrary(ApModule);
  Result := true;
end;

constructor TpsvComputerNameDialog.Create(AOwner : TComponent);
begin
  inherited;
  FComputerName := EmptyStr;
end;

function TpsvComputerNameDialog.Execute : boolean;
var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  NameBuffer: array[0..MAX_PATH] of Char;
  WindowList: Pointer;
begin
  Result := False;

  if Failed(SHGetSpecialFolderLocation(Application.Handle, CSIDL_NETWORK, ItemIDList)) then
     Exit;

  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  BrowseInfo.hwndOwner := Application.Handle;
  BrowseInfo.pidlRoot := ItemIDList;
  BrowseInfo.pszDisplayName := NameBuffer;
  BrowseInfo.lpszTitle := PChar(FCaption);
  BrowseInfo.ulFlags := BIF_BROWSEFORCOMPUTER;
  WindowList := DisableTaskWindows(0);
  try
    Result := SHBrowseForFolder(BrowseInfo) <> nil;
  finally
    EnableTaskWindows(WindowList);
    FreePidl(BrowseInfo.pidlRoot);
  end;
  if Result then FComputerName := NameBuffer;
end;


constructor TpsvBrowseFolderDialog.Create(AOwner : TComponent);
begin
  inherited;
  FFolderName := EmptyStr;
end;

function TpsvBrowseFolderDialog.Execute : boolean;
var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  ItemSelected : PItemIDList;
  NameBuffer: array[0..MAX_PATH] of Char;
  WindowList: Pointer;
begin
  itemIDList := nil;
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  BrowseInfo.hwndOwner := Application.Handle;
  BrowseInfo.pidlRoot := ItemIDList;
  BrowseInfo.pszDisplayName := NameBuffer;
  BrowseInfo.lpszTitle := PChar(FCaption);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  WindowList := DisableTaskWindows(0);
  try
    ItemSelected := SHBrowseForFolder(BrowseInfo);
    Result := ItemSelected <> nil;
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
   begin
    SHGetPathFromIDList(ItemSelected,NameBuffer);
    FFolderName := NameBuffer;
   end;
  Freepidl(BrowseInfo.pidlRoot);

end;





{ TpsvFormatDialog }

constructor TpsvFormatDialog.Create(AOwner: TComponent);
begin
  inherited;
  FDriveChar := 'A';
end;

function TpsvFormatDialog.Execute: integer;
var options : UINT;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
   begin
     case FFormatType of
      ftFull    : options := 0;
      ftQuick   : options := SHFMT_OPT_FULL;
       else options := 0;
     end;
   end
     else
       begin
         case FFormatType of
          ftFull    : options := SHFMT_OPT_FULL;
          ftQuick   : options := 0;
          else options := 0;
        end;
      end;
   Result := SHFormatDrive(Application.Handle,FDrive,SHFMT_ID_DEFAULT,Options);
end;

procedure TpsvFormatDialog.SetDriveChar(Value: Char);
begin
  if ( Value in ['a'..'z']) then
  Value := Char(ord(Value) - $20);
  if (not ( Value in ['A'..'Z'] ))then
   raise Exception.Create('Wrong drive char');
  FDriveChar := Value;
  FDrive := ord(FDriveChar) - ord('A');
end;


function GetSpecialFolderPath(FolderName: String; CanCreate: Boolean): string;
var
  FilePath: array[0..MAX_PATH] of char;
  Folder : integer;
  Found : boolean;
  I : integer;
begin
  Found := False;
  Folder := 0;
  Result := EmptyStr;
  For i := 0 to 29 do
  begin
    if ( UpperCase(FolderName) = UpperCase(SpecialFolders[i].Name)) then
     begin
       Folder := SpecialFolders[i].ID;
       Found := true;
       break;
     end;
  end;
  if Not found then
    Exit;
  { Get path of selected location }
  SHGetSpecialFolderPath(0, FilePath, Folder, CanCreate);
  Result := FilePath;
end;

procedure AddToRecentDocs(Const Filename: string);
begin
  SHAddToRecentDocs(SHARD_PATH, PChar(Filename));
end;

procedure ClearRecentDocs;
begin
  SHAddToRecentDocs(SHARD_PATH, nil);
end;

function ExecuteShellMessageBox(MethodPtr: Pointer; Instance: THandle; Owner: HWND; Text: Pointer; Caption: Pointer; Style: UINT; Parameters: Array of Pointer): Integer;

type
  PPointer = ^Pointer;
var
  ParamCount:  Integer;
  ParamBuffer: PChar;
  BufferIndex: Integer;
begin
  ParamCount := (High(Parameters) + 1);
  GetMem(ParamBuffer, ParamCount * SizeOf(Pointer));
  try
    for BufferIndex := 0 to High(Parameters) do begin
      PPointer(@ParamBuffer[BufferIndex * SizeOf(Pointer)])^ := Parameters[High(Parameters) - BufferIndex];
    end;
    asm
      mov ECX, ParamCount
      cmp ECX, 0
      je  @MethodCall
      mov EDX, ParamBuffer
      @StartLoop:
      push DWORD PTR[EDX]
      add  EDX, 4
      loop @StartLoop
      @MethodCall:
      push Style
      push Caption
      push Text
      push Owner
      push Instance

      call MethodPtr
      mov  Result, EAX
    end;
  finally
    FreeMem(ParamBuffer);
  end;
end;


function  ShellMessageBox(Instance: THandle; Owner: HWND; Text: PChar; Caption: PChar;
                           Style: UINT; Parameters: Array of Pointer):
          Integer; cdecl;
var
  MethodPtr:   Pointer;
  ShellDLL:    HMODULE;
begin
  ShellDLL := LoadLibrary(PChar(shell32));
  MethodPtr := GetProcAddress(ShellDLL, PChar(183));
  if (MethodPtr <> nil) then begin
    Result := ExecuteShellMessageBox(MethodPtr, Instance, Owner, Text, Caption, Style, Parameters);
  end
  else begin
    Result := ID_CANCEL;
  end;
end;


{ TpsvOutOfMemoryDialog }

function TpsvOutOfMemoryDialog.Execute: boolean;
var
  CaptionBuffer:     Pointer;

begin
   CaptionBuffer     := nil;
  if (FCaption <> '') then
    GetMem(CaptionBuffer, (Length(FCaption) + 1) * SizeOf(WideChar));

 if (Win32Platform = VER_PLATFORM_WIN32_NT) then
   begin
     if (CaptionBuffer <> nil) then
      StringToWideChar(FCaption, PWideChar(CaptionBuffer), (Length(FCaption) + 1));
   end
     else
       begin
         if (CaptionBuffer <> nil) then
            StrPCopy(PChar(CaptionBuffer), FCaption);
       end;
   if Assigned(SHOutOfMemoryMessageBox) then
     Result := Boolean(SHOutOfMemoryMessageBox(Application.Handle, CaptionBuffer, MB_OK or MB_ICONHAND))
      else
        raise Exception.Create(sNotSupported);
end;


function TpsvChangeIconDialog.Execute: integer;
begin
  if Assigned(SHChangeIcon) then
    Result := SHChangeIcon(Application.Handle,nil,0,FIconIndex)
     else
        raise Exception.Create(sNotSupported);

end;


constructor TpsvShellAboutDialog.Create(AOwner: TComponent);
begin
  inherited;
  FIcon := TIcon.Create;
end;

destructor TpsvShellAboutDialog.Destroy;
begin
  FIcon.Free;
  inherited Destroy;
end;

procedure TpsvShellAboutDialog.SetIcon(NewValue: TIcon);
begin
  FIcon.Assign(NewValue);
end;

function TpsvShellAboutDialog.StoreIcon: Boolean;
begin
  Result := (not FIcon.Empty);
end;

function TpsvShellAboutDialog.Execute: Boolean;
const
  AboutText        = 'psvDialogs 2.2';
  CaptionSeparator = '#';
var
  CaptionText: String;
begin
  if (Caption = EmptyStr) then begin
    CaptionText := AboutText;
  end
  else begin
    CaptionText := Caption;
  end;

  CaptionText := CaptionText + CaptionSeparator + Product;


  Win32Check(LongBool(ShellAbout(Application.MainForm.Handle,
                                 PChar(CaptionText),
                                 PChar(OtherText),
                                 FIcon.Handle)));
  Result := True;
end;


constructor TpsvRunDialog.Create(AOwner: TComponent);
begin
  inherited;
  FCaption := '';
  FDescription := '';
  FIcon := TIcon.Create;
end;

destructor TpsvRunDialog.Destroy;
begin
  FIcon.Free;
  inherited;
end;

function TpsvRunDialog.Execute: integer;
var
  CaptionBuffer:     Pointer;
  DescriptionBuffer: Pointer;
begin
  CaptionBuffer     := nil;
  DescriptionBuffer := nil;

  if (FCaption <> '') then
    GetMem(CaptionBuffer, (Length(FCaption) + 1) * SizeOf(WideChar));

 if (FDescription <> '') then
   GetMem(DescriptionBuffer, (Length(FDescription) + 1) * SizeOf(WideChar));

 if (Win32Platform = VER_PLATFORM_WIN32_NT) then
   begin
     if (CaptionBuffer <> nil) then
      StringToWideChar(FCaption, PWideChar(CaptionBuffer), (Length(FCaption) + 1));
     if (DescriptionBuffer <> nil) then
      StringToWideChar(FDescription, PWideChar(DescriptionBuffer), (Length(FDescription) + 1));
   end
     else
       begin
         if (CaptionBuffer <> nil) then
            StrPCopy(PChar(CaptionBuffer), FCaption);
        if (DescriptionBuffer <> nil) then
            StrPCopy(PChar(DescriptionBuffer), FDescription);
       end;

  if Assigned(SHRunDialog) then
    Result := SHRunDialog(Application.Handle, FIcon.Handle, nil,CaptionBuffer, DescriptionBuffer,0)
     else
       raise Exception.Create(sNotSupported);
end;

procedure TpsvRunDialog.SetIcon(const Value: TIcon);
begin
  FIcon.Assign(Value);
end;


function TpsvObjectPropertiesDialog.Execute : boolean;
var
  ObjectNameBuffer: Pointer;
  TabNameBuffer:    Pointer;
begin
  GetMem(ObjectNameBuffer, (Length(ObjectName) + 1) * SizeOf(WideChar));
  try
    if (SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT) then
     begin
      StringToWideChar(ObjectName, PWideChar(ObjectNameBuffer),(Length(ObjectName) + 1));
     end
    else
     begin
      StrPCopy(PChar(ObjectNameBuffer), ObjectName);
     end;

    GetMem(TabNameBuffer, (Length(InitialTab) + 1) * SizeOf(WideChar));
    try
      if (SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT) then
       begin
        StringToWideChar(InitialTab, PWideChar(TabNameBuffer),(Length(InitialTab) + 1));
       end
      else
       begin
        StrPCopy(PChar(TabNameBuffer), InitialTab);
       end;
      Result := SHObjectProperties(Application.Handle,ShellObjectTypeEnumToConst(ObjectType), ObjectNameBuffer, TabNameBuffer);
    finally
      FreeMem(TabNameBuffer);
    end;
  finally
    FreeMem(ObjectNameBuffer);
  end;
end;


function ShellObjectTypeEnumToConst(ShellObjectType: TShellObjectType):
UINT;
begin
  case (ShellObjectType) of
    sdPathObject:    Result := OPF_PATHNAME;
    sdPrinterObject: Result := OPF_PRINTERNAME;
    else               Result := 0;
  end;
end;

function ShellObjectTypeConstToEnum(ShellObjectType: UINT):
TShellObjectType;
begin
  case (ShellObjectType) of
    OPF_PATHNAME:    Result := sdPathObject;
    OPF_PRINTERNAME: Result := sdPrinterObject;
    else             Result := sdPathObject;
  end;
end;



function OpenInterceptor(var DialogData: TOpenFileName):
  Bool; stdcall;
var
  DialogDataEx : TOpenFileNameEx;
begin
  Move(DialogData, DialogDataEx, SizeOf(DialogData));
  DialogDataEx.FlagsEx := 0;
  DialogDataEx.lStructSize := SizeOf(TOpenFileNameEx);
  Result := GetOpenFileNameEx(DialogDataEx);
  Move(DialogDataEx, DialogData, SizeOf(DialogData));
end;


function SaveInterceptor(var DialogData: TOpenFileName):
  Bool; stdcall;
var
  DialogDataEx : TOpenFileNameEx;
begin
  Move(DialogData, DialogDataEx, SizeOf(DialogData));
  DialogDataEx.FlagsEx := 0;
  DialogDataEx.lStructSize := SizeOf(TOpenFileNameEx);
  Result := GetSaveFileNameEx(DialogDataEx);
  Move(DialogDataEx, DialogData, SizeOf(DialogData));
end;


function TpsvOpenDialog.Execute: Boolean;
begin
  if (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) then
    begin
      Result := DoExecute(@OpenInterceptor);
    end
     else
       Result := inherited Execute;
end;


function TpsvSaveDialog.Execute: Boolean;
begin
  if (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) then
    begin
      Result := DoExecute(@SaveInterceptor);
     end
   else
    Result := inherited Execute;
end;

{ TNewLinkDialog }

procedure TpsvNewLinkDialog.Execute;
begin
  NewLinkHere(0,0,PChar(DestinationFolder),0);
end;


{ TpsvAddHardwareDialog }

procedure TpsvAddHardwareDialog.Execute;
var APModule : THandle;
    Applet   : Applet_PROC;
begin
  APModule := LoadLibrary('hdwwiz.cpl');
  if APModule <= HINSTANCE_ERROR then
    Exit;
  Applet := Applet_proc(GetProcAddress(APModule,'CPlApplet'));
  Applet(0,CPL_DBLCLK,0,0);
  FreeLibrary(ApModule);
end;

{ TpsvComponent }

constructor TpsvComponent.Create(AOwner: TComponent);
begin
  inherited;
  FAbout := 'psvDialogs 2.0';
end;

procedure TpsvComponent.SetAbout(const Value: string);
begin
  //
end;


function CreateShellLink(const AppName, Desc: string; Dest: String): string;
{ Creates a shell link for application or document specified in  }
{ AppName with description Desc.  Link will be located in folder }
{ specified by Dest, which is one of the string constants shown  }
{ at the top of this unit.  Returns the full path name of the    }
{ link file. }
var
  SL: IShellLink;
  PF: IPersistFile;
  LnkName: WideString;
begin
  OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
    IShellLink, SL));
  { The IShellLink implementer must also support the IPersistFile }
  { interface. Get an interface pointer to it. }
  PF := SL as IPersistFile;
  OleCheck(SL.SetPath(PChar(AppName)));  // set link path to proper file
  if Desc <> '' then
    OleCheck(SL.SetDescription(PChar(Desc))); // set description
  { create a path location and filename for link file }
  LnkName := GetSpecialFolderPath(Dest, True) + '\' +
             ChangeFileExt(AppName, 'lnk');
  PF.Save(PWideChar(LnkName), True);          // save link file
  Result := LnkName;
end;

procedure GetShellLinkInfo(const LinkFile: WideString; var SLI: TShellLinkInfo);
{ Retrieves information on an existing shell link }
var
  SL: IShellLink;
  PF: IPersistFile;
  FindData: TWin32FindData;
  AStr: array[0..MAX_PATH] of char;
begin
  OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
    IShellLink, SL));
  { The IShellLink implementer must also support the IPersistFile }
  { interface. Get an interface pointer to it. }
  PF := SL as IPersistFile;
  { Load file into IPersistFile object }
  OleCheck(PF.Load(PWideChar(LinkFile), STGM_READ));
  { Resolve the link by calling the Resolve interface function. }
  OleCheck(SL.Resolve(0, SLR_ANY_MATCH or SLR_NO_UI));
  { Get all the info! }
  with SLI do
  begin
    OleCheck(SL.GetPath(AStr, MAX_PATH, FindData, SLGP_SHORTPATH));
    PathName := AStr;
    OleCheck(SL.GetArguments(AStr, MAX_PATH));
    Arguments := AStr;
    OleCheck(SL.GetDescription(AStr, MAX_PATH));
    Description := AStr;
    OleCheck(SL.GetWorkingDirectory(AStr, MAX_PATH));
    WorkingDirectory := AStr;
    OleCheck(SL.GetIconLocation(AStr, MAX_PATH, IconIndex));
    IconLocation := AStr;
    OleCheck(SL.GetShowCmd(ShowCmd));
    OleCheck(SL.GetHotKey(HotKey));
  end;
end;

procedure SetShellLinkInfo(const LinkFile: WideString; const SLI: TShellLinkInfo);
{ Sets information for an existing shell link }
var
  SL: IShellLink;
  PF: IPersistFile;
begin
  OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
    IShellLink, SL));
  { The IShellLink implementer must also support the IPersistFile }
  { interface. Get an interface pointer to it. }
  PF := SL as IPersistFile;
  { Load file into IPersistFile object }
  OleCheck(PF.Load(PWideChar(LinkFile), STGM_SHARE_DENY_WRITE));
  { Resolve the link by calling the Resolve interface function. }
  OleCheck(SL.Resolve(0, SLR_ANY_MATCH or SLR_UPDATE or SLR_NO_UI));
  { Set all the info! }
  with SLI, SL do
  begin
    OleCheck(SetPath(PChar(PathName)));
    OleCheck(SetArguments(PChar(Arguments)));
    OleCheck(SetDescription(PChar(Description)));
    OleCheck(SetWorkingDirectory(PChar(WorkingDirectory)));
    OleCheck(SetIconLocation(PChar(IconLocation), IconIndex));
    OleCheck(SetShowCmd(ShowCmd));
    OleCheck(SetHotKey(HotKey));
  end;
  PF.Save(PWideChar(LinkFile), True);   // save file
end;

function RecycleFile(FileToRecycle: string): boolean;
var Struct: TSHFileOpStruct;
    pFromc: PChar;
    Resultval: integer;
begin
   if not FileExists(FileToRecycle) then begin
      RecycleFile := False;
      exit;
   end
   else
    begin
      pfromc := PChar(ExpandFileName(FileToRecycle)+#0#0);
      Struct.wnd := 0;
      Struct.wFunc := FO_DELETE;
      Struct.pFrom := pFromC;
      Struct.pTo   := nil;
      Struct.fFlags:= FOF_ALLOWUNDO;
      Struct.fAnyOperationsAborted := false;
      Struct.hNameMappings := nil;
      Resultval := ShFileOperation(Struct);
      RecycleFile := (Resultval = 0);
   end;
end;


function CopyFile(FromFile, ToDir : string) : boolean;
var F : TShFileOpStruct;
begin
  F.Wnd := 0;
  F.wFunc := FO_COPY;
  FromFile:=FromFile+#0;
  F.pFrom:=pchar(FromFile);
  ToDir:=ToDir+#0;
  F.pTo:=pchar(ToDir);
  F.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  result:=ShFileOperation(F) = 0;
end;


type CPLApplet = function(hwndCPL: HWND; uMsg: UINT;
  lParam1: LPARAM; lParam2: LPARAM) : LongInt; stdcall;

procedure ExecuteApplet(AppletName : string);
var APModule : THandle;
    Applet : CPLApplet;
begin
APModule := LoadLibrary(Pchar(AppletName));
  if APModule <= HINSTANCE_ERROR then
    Exit;
 Applet := CPLApplet(GetProcAddress(APModule,'CPlApplet'));
 Applet(0,CPL_DBLCLK,0,0);
 FreeLibrary(ApModule);
end;

{ TpsvOpenWidthDialog }

procedure TpsvOpenWidthDialog.Execute;
begin
  SHOpenWidth(0,0,PChar(FFileName),SW_SHOW);
end;


constructor TpsvDiskFullDialog.Create(AOwner: TComponent);
begin
  inherited;
  FDriveChar := 'A';
end;


function TpsvDiskFullDialog.Execute: integer;
begin
  SHHandleDiskFull(Application.Handle, UINT(FDrive));
  Result := 0;
end;

procedure TpsvDiskFullDialog.SetDriveChar(Value: Char);
begin
  if ( Value in ['a'..'z']) then
  Value := Char(ord(Value) - $20);
  if (not ( Value in ['A'..'Z'] ))then
   raise Exception.Create('Wrong drive char');
  FDriveChar := Value;
  FDrive := ord(FDriveChar) - ord('A');
end;


{ TpsvExitWindowsDialog }

function TpsvExitWindowsDialog.Execute: integer;
begin
  Result := 0;
  SHShutDownDialog(Application.Handle);
end;

Initialization
  LoadpsvDialogs;
Finalization
  UnloadpsvDialogs;

end.
