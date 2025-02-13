{*******************************************************}
{                                                       }
{     Delphi VCL Extensions (RX) demo program           }
{                                                       }
{     Copyright (c) 1996 AO ROSNO                       }
{                                                       }
{*******************************************************}

unit Options;

interface

uses SysUtils, Classes, IniFiles, DB, DBTables;

const
  AutoActivate: Boolean = True;
  SystemTables: Boolean = False;
  ASCIIDelimited: Boolean = True;
  defFloatFormat: string = ',0.00';
  defDateFormat: string = 'dd/mm/yyyy';
  defTimeFormat: string = 'hh:mm:ss';
  defDateTimeFormat: string = 'dd/mm/yyyy hh:mm:ss';
  ASCIICharSet: string = 'ascii';
  SQLHistoryCapacity: Integer = 20;
  LiveQueries: Boolean = True;
  ShowExecTime: Boolean = False;
  SQLCalcCount: Boolean = False;
{$IFDEF WIN32}
  QueryInThreads: Boolean = True;
  EnableQueryAbort: Boolean = True;
{$ELSE}
  QueryInThreads: Boolean = False;
  EnableQueryAbort: Boolean = False;
{$ENDIF}

procedure SetKeepConnections(Value: Boolean);
procedure SaveOptions(IniFile: TIniFile);
procedure LoadOptions(IniFile: TIniFile);

implementation

uses Consts, RxVCLUtils, RxDBUtils, RxBdeUtils;

const
  siOptions = 'Options';
  siAutoActive = 'AutoActivate';
  siSystemTables = 'SystemTables';
  siKeepConnections = 'KeepConnections';
  siFloatFormat = 'FloatFormat';
  siDateTimeFormat = 'DateTimeFormat';
  siDateFormat = 'DateFormat';
  siTimeFormat = 'TimeFormat';
  siAsciiCharSet = 'ASCIICharSet';
  siAsciiFormat = 'ASCIIFormat';
  siSQLHistoryCapacity = 'SQLHistoryCapacity';
  siQueryInThreads = 'RunQueryInSeparateThread';
  siEnableQueryAbort = 'EnableQueryAbort';
  siLiveQueries = 'LiveQueries';
  siQueryTime = 'ShowQueryTime';
  siSQLCount = 'SQLCalcCount';

procedure SetKeepConnections(Value: Boolean);
var
  I: Integer;
begin
  Session.KeepConnections := Value;
  for I := 0 to Session.DatabaseCount - 1 do
    Session.Databases[I].KeepConnection := Session.KeepConnections;
end;

procedure SaveOptions(IniFile: TIniFile);
begin
  with IniFile do begin
    WriteBool(siOptions, siAutoActive, AutoActivate);
    WriteBool(siOptions, siSystemTables, SystemTables);
    WriteBool(siOptions, siKeepConnections, Session.KeepConnections);
    WriteBool(siOptions, siLiveQueries, LiveQueries);
    WriteBool(siOptions, siQueryTime, ShowExecTime);
    WriteBool(siOptions, siSQLCount, SQLCalcCount);
    WriteString(siOptions, siFloatFormat, defFloatFormat);
    WriteString(siOptions, siDateFormat, defDateFormat);
    WriteString(siOptions, siDateTimeFormat, defDateTimeFormat);
    WriteString(siOptions, siTimeFormat, defTimeFormat);
    WriteBool(siOptions, siAsciiFormat, ASCIIDelimited);
    WriteString(siOptions, siAsciiCharSet, ASCIICharSet);
    WriteInteger(siOptions, siSQLHistoryCapacity, SQLHistoryCapacity);
    WriteBool(siOptions, siQueryInThreads, QueryInThreads);
    WriteBool(siOptions, siEnableQueryAbort, EnableQueryAbort);
  end;
end;

procedure LoadOptions(IniFile: TIniFile);
begin
  with IniFile do begin
    AutoActivate := ReadBool(siOptions, siAutoActive, AutoActivate);
    SystemTables := ReadBool(siOptions, siSystemTables, SystemTables);
    LiveQueries := ReadBool(siOptions, siLiveQueries, LiveQueries);
    ShowExecTime := ReadBool(siOptions, siQueryTime, ShowExecTime);
    SQLCalcCount := ReadBool(siOptions, siSQLCount, SQLCalcCount);
    SetKeepConnections(ReadBool(siOptions, siKeepConnections,
      Session.KeepConnections));
    defFloatFormat := ReadString(siOptions, siFloatFormat, defFloatFormat);
    defDateFormat := ReadString(siOptions, siDateFormat, defDateFormat);
    defDateTimeFormat := ReadString(siOptions, siDateTimeFormat, defDateTimeFormat);
    defTimeFormat := ReadString(siOptions, siTimeFormat, defTimeFormat);
    ASCIIDelimited := ReadBool(siOptions, siAsciiFormat, ASCIIDelimited);
    ASCIICharSet := ReadString(siOptions, siAsciiCharSet, ASCIICharSet);
    SQLHistoryCapacity := ReadInteger(siOptions, siSQLHistoryCapacity, SQLHistoryCapacity);
    EnableQueryAbort := ReadBool(siOptions, siEnableQueryAbort, EnableQueryAbort);
    QueryInThreads := ReadBool(siOptions, siQueryInThreads, QueryInThreads);
  end;
end;

end.