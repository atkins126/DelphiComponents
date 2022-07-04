{**************************************************************************************************}
{                                                                                                  }
{ Project JEDI Code Library (JCL)                                                                  }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is JclHookExcept.pas.                                                          }
{                                                                                                  }
{ The Initial Developer of the Original Code is Petr Vones. Portions created by Petr Vones are     }
{ Copyright (C) Petr Vones. All Rights Reserved.                                                   }
{                                                                                                  }
{ Contributor(s):                                                                                  }
{   Petr Vones (pvones)                                                                            }
{   Robert Marquardt (marquardt)                                                                   }
{   Andreas Hausladen (ahuser)                                                                     }
{                                                                                                  }
{**************************************************************************************************}
{                                                                                                  }
{ Exception hooking routines                                                                       }
{                                                                                                  }
{ Unit owner: Petr Vones                                                                           }
{                                                                                                  }
{**************************************************************************************************}

// Last modified: $Date: 07-04-07 12:45 $

unit JclHookExcept;

interface

{$I jcl.inc}

uses
  {+}
  uFxtApiHook,
  {+.}
  {$IFDEF UNITVERSIONING}
  JclUnitVersioning,
  {$ENDIF UNITVERSIONING}
  Windows, SysUtils;

type
  // Exception hooking notifiers routines
  TJclExceptNotifyProc = procedure(ExceptObj: TObject; ExceptAddr: Pointer; OSException: Boolean);
  TJclExceptNotifyProcEx = procedure(ExceptObj: TObject; ExceptAddr: Pointer; OSException: Boolean; ESP: Pointer);
  TJclExceptNotifyMethod = procedure(ExceptObj: TObject; ExceptAddr: Pointer; OSException: Boolean) of object;

  TJclExceptNotifyPriority = (npNormal, npFirstChain);

function JclAddExceptNotifier(const NotifyProc: TJclExceptNotifyProc; Priority: TJclExceptNotifyPriority = npNormal): Boolean; overload;
function JclAddExceptNotifier(const NotifyProc: TJclExceptNotifyProcEx; Priority: TJclExceptNotifyPriority = npNormal): Boolean; overload;
function JclAddExceptNotifier(const NotifyMethod: TJclExceptNotifyMethod; Priority: TJclExceptNotifyPriority = npNormal): Boolean; overload;

function JclRemoveExceptNotifier(const NotifyProc: TJclExceptNotifyProc): Boolean; overload;
function JclRemoveExceptNotifier(const NotifyProc: TJclExceptNotifyProcEx): Boolean; overload;
function JclRemoveExceptNotifier(const NotifyMethod: TJclExceptNotifyMethod): Boolean;  overload;

procedure JclReplaceExceptObj(NewExceptObj: Exception);

// Exception hooking routines
function JclHookExceptions: Boolean;
function JclUnhookExceptions: Boolean;
function JclExceptionsHooked: Boolean;

function JclHookExceptionsInModule(Module: HMODULE): Boolean;
function JclUnkookExceptionsInModule(Module: HMODULE): Boolean;

// Exceptions hooking in libraries
type
  TJclModuleArray = array of HMODULE;

function JclInitializeLibrariesHookExcept: Boolean;
function JclHookedExceptModulesList(var ModulesList: TJclModuleArray): Boolean;

// Hooking routines location info helper
function JclBelongsHookedCode(Addr: Pointer): Boolean;

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$URL: https://svn.sourceforge.net/svnroot/jcl/trunk/jcl/source/windows/JclHookExcept.pas $';
    Revision: '$Revision: 2 $';
    Date: '$Date: 07-04-07 12:45 $';
    LogPath: 'JCL\source\windows'
    );
{$ENDIF UNITVERSIONING}

implementation

uses
  Classes,
  JclBase, JclPeImage, JclSysInfo, JclSysUtils;

type
  PExceptionArguments = ^TExceptionArguments;
  TExceptionArguments = record
    ExceptAddr: Pointer;
    ExceptObj: Exception;
  end;

  TNotifierItem = class(TObject)
  private
    FNotifyMethod: TJclExceptNotifyMethod;
    FNotifyProc: TJclExceptNotifyProc;
    FNotifyProcEx: TJclExceptNotifyProcEx;
    FPriority: TJclExceptNotifyPriority;
  public
    constructor Create(const NotifyProc: TJclExceptNotifyProc; Priority: TJclExceptNotifyPriority); overload;
    constructor Create(const NotifyProc: TJclExceptNotifyProcEx; Priority: TJclExceptNotifyPriority); overload;
    constructor Create(const NotifyMethod: TJclExceptNotifyMethod; Priority: TJclExceptNotifyPriority); overload;
    procedure DoNotify(ExceptObj: TObject; ExceptAddr: Pointer; OSException: Boolean; ESP: Pointer);
    property Priority: TJclExceptNotifyPriority read FPriority;
  end;

var
  ExceptionsHooked: Boolean;
  Kernel32_RaiseException: procedure (dwExceptionCode, dwExceptionFlags,
    nNumberOfArguments: DWORD; lpArguments: PDWORD); stdcall;
  SysUtils_ExceptObjProc: function (P: PExceptionRecord): Exception;
  Notifiers: TThreadList;

const
  JclHookExceptDebugHookName = '__JclHookExcept';

type
  TJclHookExceptDebugHook = procedure(Module: HMODULE; Hook: Boolean); stdcall;

  TJclHookExceptModuleList = class(TObject)
  private
    FModules: TThreadList;
  protected
    procedure HookStaticModules;
  public
    constructor Create;
    destructor Destroy; override;
    class function JclHookExceptDebugHookAddr: Pointer;
    procedure HookModule(Module: HMODULE);
    procedure List(var ModulesList: TJclModuleArray);
    procedure UnhookModule(Module: HMODULE);
  end;

var
  HookExceptModuleList: TJclHookExceptModuleList;
  JclHookExceptDebugHook: Pointer;

{$IFDEF HOOK_DLL_EXCEPTIONS}
exports
  JclHookExceptDebugHook name JclHookExceptDebugHookName;
{$ENDIF HOOK_DLL_EXCEPTIONS}

{$STACKFRAMES OFF}

threadvar
  Recursive: Boolean;
  NewResultExc: Exception;

//=== Helper routines ========================================================

function RaiseExceptionAddress: Pointer;
begin
  Result := GetProcAddress(GetModuleHandle(kernel32), 'RaiseException');
  Assert(Result <> nil);
end;

procedure FreeNotifiers;
var
  I: Integer;
begin
  with Notifiers.LockList do
    try
      for I := 0 to Count - 1 do
        TObject(Items[I]).Free;
    finally
      Notifiers.UnlockList;
    end;
  FreeAndNil(Notifiers);
end;

//=== { TNotifierItem } ======================================================

constructor TNotifierItem.Create(const NotifyProc: TJclExceptNotifyProc; Priority: TJclExceptNotifyPriority);
begin
  inherited Create;
  FNotifyProc := NotifyProc;
  FPriority := Priority;
end;

constructor TNotifierItem.Create(const NotifyProc: TJclExceptNotifyProcEx; Priority: TJclExceptNotifyPriority);
begin
  inherited Create;
  FNotifyProcEx := NotifyProc;
  FPriority := Priority;
end;

constructor TNotifierItem.Create(const NotifyMethod: TJclExceptNotifyMethod; Priority: TJclExceptNotifyPriority);
begin
  inherited Create;
  FNotifyMethod := NotifyMethod;
  FPriority := Priority;
end;

procedure TNotifierItem.DoNotify(ExceptObj: TObject; ExceptAddr: Pointer;
  OSException: Boolean; ESP: Pointer);
begin
  if Assigned(FNotifyProc) then
    FNotifyProc(ExceptObj, ExceptAddr, OSException)
  else
  if Assigned(FNotifyProcEx) then
    FNotifyProcEx(ExceptObj, ExceptAddr, OSException, ESP)
  else
  if Assigned(FNotifyMethod) then
    FNotifyMethod(ExceptObj, ExceptAddr, OSException);
end;

function GetEBP: Pointer;
asm
        MOV     EAX, EBP
end;

{$STACKFRAMES ON}

procedure DoExceptNotify(ExceptObj: Exception; ExceptAddr: Pointer; OSException: Boolean; ESP: Pointer);
var
  Priorities: TJclExceptNotifyPriority;
  I: Integer;
begin
  if Recursive then
    Exit;
  if Assigned(Notifiers) then
  begin
    Recursive := True;
    NewResultExc := nil;
    try
      with Notifiers.LockList do
      try
        if Count = 1 then
        begin
          with TNotifierItem(Items[0]) do
            DoNotify(ExceptObj, ExceptAddr, OSException, ESP);
        end
        else
        begin
          for Priorities := High(Priorities) downto Low(Priorities) do
            for I := 0 to Count - 1 do
              with TNotifierItem(Items[I]) do
                if Priority = Priorities then
                  DoNotify(ExceptObj, ExceptAddr, OSException, ESP);
        end;
      finally
        Notifiers.UnlockList;
      end;
    finally
      Recursive := False;
    end;
  end;
end;

procedure HookedRaiseException(ExceptionCode, ExceptionFlags, NumberOfArguments: DWORD;
  Arguments: PExceptionArguments); stdcall;
const
  {$IFDEF DELPHI2}
  cDelphiException = $0EEDFACE;
  {$ELSE}
  cDelphiException = $0EEDFADE;
  {$ENDIF DELPHI2}
  cNonContinuable = 1;
begin
  if (ExceptionFlags = cNonContinuable) and (ExceptionCode = cDelphiException) and
    (NumberOfArguments = 7) and (DWORD(Arguments) = DWORD(@Arguments) + 4) then
  begin
    DoExceptNotify(Arguments.ExceptObj, Arguments.ExceptAddr, False, GetEBP);
  end;
  Kernel32_RaiseException(ExceptionCode, ExceptionFlags, NumberOfArguments, PDWORD(Arguments));
end;

function HookedExceptObjProc(P: PExceptionRecord): Exception;
var
  NewResultExcCache: Exception; // TLS optimization
begin
  Result := SysUtils_ExceptObjProc(P);
  DoExceptNotify(Result, P^.ExceptionAddress, True, GetEBP);
  NewResultExcCache := NewResultExc;
  if NewResultExcCache <> nil then
    Result := NewResultExcCache;
end;

{$IFNDEF STACKFRAMES_ON}
{$STACKFRAMES OFF}
{$ENDIF ~STACKFRAMES_ON}

// Do not change ordering of HookedRaiseException, HookedExceptObjProc and JclBelongsHookedCode routines

function JclBelongsHookedCode(Addr: Pointer): Boolean;
begin
  Result := (Cardinal(@HookedRaiseException) < Cardinal(@JclBelongsHookedCode)) and
    (Cardinal(@HookedRaiseException) <= Cardinal(Addr)) and
    (Cardinal(@JclBelongsHookedCode) > Cardinal(Addr));
end;

function JclAddExceptNotifier(const NotifyProc: TJclExceptNotifyProc; Priority: TJclExceptNotifyPriority): Boolean;
begin
  Result := Assigned(NotifyProc);
  if Result then
    with Notifiers.LockList do
    try
      Add(TNotifierItem.Create(NotifyProc, Priority));
    finally
      Notifiers.UnlockList;
    end;
end;

function JclAddExceptNotifier(const NotifyProc: TJclExceptNotifyProcEx; Priority: TJclExceptNotifyPriority): Boolean;
begin
  Result := Assigned(NotifyProc);
  if Result then
    with Notifiers.LockList do
    try
      Add(TNotifierItem.Create(NotifyProc, Priority));
    finally
      Notifiers.UnlockList;
    end;
end;

function JclAddExceptNotifier(const NotifyMethod: TJclExceptNotifyMethod; Priority: TJclExceptNotifyPriority): Boolean;
begin
  Result := Assigned(NotifyMethod);
  if Result then
    with Notifiers.LockList do
    try
      Add(TNotifierItem.Create(NotifyMethod, Priority));
    finally
      Notifiers.UnlockList;
    end;
end;

function JclRemoveExceptNotifier(const NotifyProc: TJclExceptNotifyProc): Boolean;
var
  O: TNotifierItem;
  I: Integer;
begin
  Result := Assigned(NotifyProc);
  if Result then
    with Notifiers.LockList do
    try
      for I := 0 to Count - 1 do
      begin
        O := TNotifierItem(Items[I]);
        if @O.FNotifyProc = @NotifyProc then
        begin
          O.Free;
          Items[I] := nil;
        end;
      end;
      Pack;
    finally
      Notifiers.UnlockList;
    end;
end;

function JclRemoveExceptNotifier(const NotifyProc: TJclExceptNotifyProcEx): Boolean;
var
  O: TNotifierItem;
  I: Integer;
begin
  Result := Assigned(NotifyProc);
  if Result then
    with Notifiers.LockList do
    try
      for I := 0 to Count - 1 do
      begin
        O := TNotifierItem(Items[I]);
        if @O.FNotifyProcEx = @NotifyProc then
        begin
          O.Free;
          Items[I] := nil;
        end;
      end;
      Pack;
    finally
      Notifiers.UnlockList;
    end;
end;

function JclRemoveExceptNotifier(const NotifyMethod: TJclExceptNotifyMethod): Boolean;
var
  O: TNotifierItem;
  I: Integer;
begin
  Result := Assigned(NotifyMethod);
  if Result then
    with Notifiers.LockList do
    try
      for I := 0 to Count - 1 do
      begin
        O := TNotifierItem(Items[I]);
        if (TMethod(O.FNotifyMethod).Code = TMethod(NotifyMethod).Code) and
          (TMethod(O.FNotifyMethod).Data = TMethod(NotifyMethod).Data) then
        begin
          O.Free;
          Items[I] := nil;
        end;
      end;
      Pack;
    finally
      Notifiers.UnlockList;
    end;
end;

procedure JclReplaceExceptObj(NewExceptObj: Exception);
begin
  Assert(Recursive);
  NewResultExc := NewExceptObj;
end;

{+}
var
  ImportExceptionsHooked: Boolean = False;
  pKernelRaiseExceptionCode: PAnsiChar = nil;

function MakeSystemHook_KernelRaiseException: Boolean;
{$IFDEF WIN32}
var
  pCode: PAnsiChar;
{$ENDIF}
begin
  Result := False;
  {$IFDEF WIN32}
  if (Win32Platform <> VER_PLATFORM_WIN32_NT) then
    Exit;

  pCode := GetProcAddress(GetModuleHandle(kernel32), 'RaiseException');
  if not Assigned(pCode) then
    Exit;

  //
  // uFxtApiHook.pas:
  // function HookCode(TargetProc, NewProc: pointer; var OldProc: pointer): boolean;
  //
  Result := uFxtApiHook.HookCode(Pointer(pCode), @HookedRaiseException, Pointer(pKernelRaiseExceptionCode));
  //if Result then
  //  ShowMessage('INFORMATION: API HOOKED: "' + kernel32 + '.RaiseException'); // *** debug ***
  {$ENDIF}
end;

procedure FreeSystemHook_KernelRaiseException();
begin
  {$IFDEF WIN32}
  //
  // uFxtApiHook.pas:
  // function UnhookCode(OldProc: pointer): boolean;
  //
  uFxtApiHook.UnhookCode(pKernelRaiseExceptionCode);
  //if not uFxtApiHook.UnhookCode(pKernelRaiseExceptionCode) then
  //  ShowMessage('WARNING: NOT API UNHOOKED: "' + kernel32 + '.RaiseException'); // *** debug ***
  {$ENDIF}
end;

{+.}

function JclHookExceptions: Boolean;
var
  RaiseExceptionAddressCache: Pointer;
begin
  {+}
  Result := ExceptionsHooked;
  if not Result then
  begin
    Recursive := False;
    RaiseExceptionAddressCache := RaiseExceptionAddress;
    with TJclPeMapImgHooks do
      Result := ReplaceImport(SystemBase, kernel32, RaiseExceptionAddressCache, @HookedRaiseException);
    ImportExceptionsHooked := Result;
    if (not ImportExceptionsHooked) then
    begin
      //ShowMessage('WARNING: NOT IMPORT TABLE HOOKED: "' + kernel32 + '.RaiseException'); // *** debug ***
      Result := MakeSystemHook_KernelRaiseException();
      if Result then
        RaiseExceptionAddressCache := pKernelRaiseExceptionCode;
      //if not Result then
      //  ShowMessage('WARNING: NOT API HOOKED: "' + kernel32 + '.RaiseException'); // *** debug ***
    end;
    if Result then
    begin
      @Kernel32_RaiseException := RaiseExceptionAddressCache;
      SysUtils_ExceptObjProc := System.ExceptObjProc;
      System.ExceptObjProc := @HookedExceptObjProc;
    end;
    ExceptionsHooked := Result;
  end;
  {+.}
end;

function JclUnhookExceptions: Boolean;
begin
  if ExceptionsHooked then
  begin
    {+}
    if ImportExceptionsHooked then
    begin
      with TJclPeMapImgHooks do
        ReplaceImport(SystemBase, kernel32, @HookedRaiseException, @Kernel32_RaiseException);
      ImportExceptionsHooked := False;
    end
    else
      FreeSystemHook_KernelRaiseException();
    {+.}
    System.ExceptObjProc := @SysUtils_ExceptObjProc;
    @SysUtils_ExceptObjProc := nil;
    @Kernel32_RaiseException := nil;
    Result := True;
    ExceptionsHooked := False;
  end
  else
    Result := True;
end;

function JclExceptionsHooked: Boolean;
begin
  Result := ExceptionsHooked;
end;

function JclHookExceptionsInModule(Module: HMODULE): Boolean;
begin
  Result := ExceptionsHooked and
    TJclPeMapImgHooks.ReplaceImport(Pointer(Module), kernel32, RaiseExceptionAddress, @HookedRaiseException);
end;

function JclUnkookExceptionsInModule(Module: HMODULE): Boolean;
begin
  Result := ExceptionsHooked and
    TJclPeMapImgHooks.ReplaceImport(Pointer(Module), kernel32, @HookedRaiseException, @Kernel32_RaiseException);
end;

// Exceptions hooking in libraries

procedure JclHookExceptDebugHookProc(Module: HMODULE; Hook: Boolean); stdcall;
begin
  if Hook then
    HookExceptModuleList.HookModule(Module)
  else
    HookExceptModuleList.UnhookModule(Module);
end;

function CallExportedHookExceptProc(Module: HMODULE; Hook: Boolean): Boolean;
var
  HookExceptProcPtr: PPointer;
  HookExceptProc: TJclHookExceptDebugHook;
begin
  HookExceptProcPtr := TJclHookExceptModuleList.JclHookExceptDebugHookAddr;
  Result := Assigned(HookExceptProcPtr);
  if Result then
  begin
    @HookExceptProc := HookExceptProcPtr^;
    if Assigned(HookExceptProc) then
      HookExceptProc(Module, True);
  end;
end;

function JclInitializeLibrariesHookExcept: Boolean;
begin
  {$IFDEF HOOK_DLL_EXCEPTIONS}
  if IsLibrary then
    Result := CallExportedHookExceptProc(SystemTObjectInstance, True)
  else
  begin
    if not Assigned(HookExceptModuleList) then
      HookExceptModuleList := TJclHookExceptModuleList.Create;
    Result := True;
  end;
  {$ELSE HOOK_DLL_EXCEPTIONS}
  Result := True;
  {$ENDIF HOOK_DLL_EXCEPTIONS}
end;

function JclHookedExceptModulesList(var ModulesList: TJclModuleArray): Boolean;
begin
  {$IFDEF HOOK_DLL_EXCEPTIONS}
  Result := Assigned(HookExceptModuleList);
  if Result then
    HookExceptModuleList.List(ModulesList);
  {$ELSE HOOK_DLL_EXCEPTIONS}
  Result := False;
  {$ENDIF HOOK_DLL_EXCEPTIONS}
end;

procedure FinalizeLibrariesHookExcept;
begin
  FreeAndNil(HookExceptModuleList);
  if IsLibrary then
    CallExportedHookExceptProc(SystemTObjectInstance, False);
end;

//=== { TJclHookExceptModuleList } ===========================================

constructor TJclHookExceptModuleList.Create;
begin
  inherited Create;
  FModules := TThreadList.Create;
  HookStaticModules;
  JclHookExceptDebugHook := @JclHookExceptDebugHookProc;
end;

destructor TJclHookExceptModuleList.Destroy;
begin
  JclHookExceptDebugHook := nil;
  FreeAndNil(FModules);
  inherited Destroy;
end;

procedure TJclHookExceptModuleList.HookModule(Module: HMODULE);
begin
  with FModules.LockList do
  try
    if IndexOf(Pointer(Module)) = -1 then
    begin
      Add(Pointer(Module));
      JclHookExceptionsInModule(Module);
    end;
  finally
    FModules.UnlockList;
  end;
end;

procedure TJclHookExceptModuleList.HookStaticModules;
var
  ModulesList: TStringList;
  I: Integer;
  Module: HMODULE;
begin
  ModulesList := nil;
  with FModules.LockList do
  try
    ModulesList := TStringList.Create;
    if LoadedModulesList(ModulesList, GetCurrentProcessId, True) then
      for I := 0 to ModulesList.Count - 1 do
      begin
        Module := HMODULE(ModulesList.Objects[I]);
        if GetProcAddress(Module, JclHookExceptDebugHookName) <> nil then
          HookModule(Module);
      end;
  finally
    FModules.UnlockList;
    ModulesList.Free;
  end;
end;

class function TJclHookExceptModuleList.JclHookExceptDebugHookAddr: Pointer;
var
  HostModule: HMODULE;
begin
  HostModule := GetModuleHandle(nil);
  Result := GetProcAddress(HostModule, JclHookExceptDebugHookName);
end;

procedure TJclHookExceptModuleList.List(var ModulesList: TJclModuleArray);
var
  I: Integer;
begin
  with FModules.LockList do
  try
    SetLength(ModulesList, Count);
    for I := 0 to Count - 1 do
      ModulesList[I] := HMODULE(Items[I]);
  finally
    FModules.UnlockList;
  end;
end;

procedure TJclHookExceptModuleList.UnhookModule(Module: HMODULE);
begin
  with FModules.LockList do
  try
    Remove(Pointer(Module));
  finally
    FModules.UnlockList;
  end;
end;

initialization
  Notifiers := TThreadList.Create;
  {$IFDEF UNITVERSIONING}
  RegisterUnitVersion(HInstance, UnitVersioning);
  {$ENDIF UNITVERSIONING}

finalization
  {$IFDEF UNITVERSIONING}
  UnregisterUnitVersion(HInstance);
  {$ENDIF UNITVERSIONING}
  {$IFDEF HOOK_DLL_EXCEPTIONS}
  FinalizeLibrariesHookExcept;
  {$ENDIF HOOK_DLL_EXCEPTIONS}
  FreeNotifiers;

end.