unit DragDropInternet;
// -----------------------------------------------------------------------------
// Project:         Drag and Drop Component Suite.
// Module:          DragDropInternet
// Description:     Implements Dragging and Dropping of internet related data.
// Version:         5.0
// Date:            04-FEB-2009
// Target:          Win32, Delphi 5-2009
// Authors:         Anders Melander, anders@melander.dk, http://melander.dk
// Copyright        � 1997-1999 Angus Johnson & Anders Melander
//                  � 2000-2009 Anders Melander
// -----------------------------------------------------------------------------

interface

uses
  DragDrop,
  DropTarget,
  DropSource,
  DragDropFormats,
  DragDropText,
  Windows,
  Classes,
  ActiveX;

{$include DragDrop.inc}

type

////////////////////////////////////////////////////////////////////////////////
//
//		TAnsiURLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
// Implements support for the 'UniformResourceLocator' format.
////////////////////////////////////////////////////////////////////////////////

  TAnsiURLClipboardFormat = class(TCustomAnsiTextClipboardFormat)
  public
    function GetClipboardFormat: TClipFormat; override;
    property URL: AnsiString read GetString write SetString;
  end;

////////////////////////////////////////////////////////////////////////////////
//
//		TUnicodeURLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
// Implements support for the 'UniformResourceLocatorW' format.
////////////////////////////////////////////////////////////////////////////////

  TUnicodeURLClipboardFormat = class(TCustomUnicodeTextClipboardFormat)
  public
    function GetClipboardFormat: TClipFormat; override;
    property URL: UnicodeString read GetText write SetText;
  end;

  TURLWClipboardFormat = TUnicodeURLClipboardFormat {$ifdef VER17_PLUS}deprecated {$IFDEF VER20_PLUS}'Use TURLWClipboardFormat instead'{$ENDIF}{$endif};

////////////////////////////////////////////////////////////////////////////////
//
//		TURLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////

{$ifdef UNICODE}
  TURLClipboardFormat = TUnicodeURLClipboardFormat;
{$else}
  TURLClipboardFormat = TAnsiURLClipboardFormat;
{$endif}

////////////////////////////////////////////////////////////////////////////////
//
//		TNetscapeBookmarkClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
// Implements support for the 'Netscape Bookmark' format.
////////////////////////////////////////////////////////////////////////////////
//
//              Deprecated
//
////////////////////////////////////////////////////////////////////////////////
  TNetscapeBookmarkClipboardFormat = class(TCustomSimpleClipboardFormat)
  private
    FURL: AnsiString;
    FTitle: AnsiString;
  protected
    function ReadData(Value: pointer; Size: integer): boolean; override;
    function WriteData(Value: pointer; Size: integer): boolean; override;
    function GetSize: integer; override;
  public
    function GetClipboardFormat: TClipFormat; override;
    procedure Clear; override;
    property URL: AnsiString read FURL write FURL;
    property Title: AnsiString read FTitle write FTitle;
  end {$ifdef VER15_PLUS} deprecated {$endif};

////////////////////////////////////////////////////////////////////////////////
//
//		TNetscapeImageClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
// Implements support for the 'Netscape Image Format' format.
////////////////////////////////////////////////////////////////////////////////
//
//              Deprecated
//
////////////////////////////////////////////////////////////////////////////////
  TNetscapeImageClipboardFormat = class(TCustomSimpleClipboardFormat)
  private
    FURL: AnsiString;
    FTitle: AnsiString;
    FImage: AnsiString;
    FLowRes: AnsiString;
    FExtra: AnsiString;
    FHeight: integer;
    FWidth: integer;
  protected
    function ReadData(Value: pointer; Size: integer): boolean; override;
    function WriteData(Value: pointer; Size: integer): boolean; override;
    function GetSize: integer; override;
  public
    function GetClipboardFormat: TClipFormat; override;
    procedure Clear; override;
    property URL: AnsiString read FURL write FURL;
    property Title: AnsiString read FTitle write FTitle;
    property Image: AnsiString read FImage write FImage;
    property LowRes: AnsiString read FLowRes write FLowRes;
    property Extra: AnsiString read FExtra write FExtra;
    property Height: integer read FHeight write FHeight;
    property Width: integer read FWidth write FWidth;
  end {$ifdef VER15_PLUS} deprecated {$endif};

////////////////////////////////////////////////////////////////////////////////
//
//		TVCardClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
// Implements support for the '+//ISBN 1-887687-00-9::versit::PDI//vCard'
// (vCard) format.
////////////////////////////////////////////////////////////////////////////////
  TVCardClipboardFormat = class(TCustomStringListClipboardFormat)
  protected
    function ReadData(Value: pointer; Size: integer): boolean; override;
    function WriteData(Value: pointer; Size: integer): boolean; override;
    function GetSize: integer; override;
  public
    function GetClipboardFormat: TClipFormat; override;
    property Items: TStrings read GetLines;
  end;

////////////////////////////////////////////////////////////////////////////////
//
//		THTMLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
// Implements support for the 'HTML Format' format.
////////////////////////////////////////////////////////////////////////////////
  THTMLClipboardFormat = class(TCustomStringListClipboardFormat)
  private
  protected
    class procedure RegisterCompatibleFormats; override;
  public
    function GetClipboardFormat: TClipFormat; override;
    function HasData: boolean; override;
    function Assign(Source: TCustomDataFormat): boolean; override;
    function AssignTo(Dest: TCustomDataFormat): boolean; override;
    property HTML: TStrings read GetLines;
  end;

////////////////////////////////////////////////////////////////////////////////
//
//		TRFC822ClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
  TRFC822ClipboardFormat = class(TCustomStringListClipboardFormat)
  private
  protected
    class procedure RegisterCompatibleFormats; override;
  public
    function GetClipboardFormat: TClipFormat; override;
    function Assign(Source: TCustomDataFormat): boolean; override;
    function AssignTo(Dest: TCustomDataFormat): boolean; override;
    property Text: TStrings read GetLines;
  end;


////////////////////////////////////////////////////////////////////////////////
//
//		TURLDataFormat
//
////////////////////////////////////////////////////////////////////////////////
// Renderer for URL formats.
////////////////////////////////////////////////////////////////////////////////
  TURLDataFormat = class(TCustomDataFormat)
  private
    FURL: string;
    FTitle: UnicodeString;
    procedure SetTitle(const Value: UnicodeString);
    procedure SetURL(const Value: string);
  protected
    class procedure RegisterCompatibleFormats; override;
  public
    function Assign(Source: TClipboardFormat): boolean; override;
    function AssignTo(Dest: TClipboardFormat): boolean; override;
    procedure Clear; override;
    function HasData: boolean; override;
    function NeedsData: boolean; override;

    property URL: string read FURL write SetURL;
    property Title: UnicodeString read FTitle write SetTitle;
  end;


////////////////////////////////////////////////////////////////////////////////
//
//		THTMLDataFormat
//
////////////////////////////////////////////////////////////////////////////////
// Renderer for HTML text data.
////////////////////////////////////////////////////////////////////////////////
  THTMLDataFormat = class(TCustomDataFormat)
  private
    FHTML: TStrings;
    procedure SetHTML(const Value: TStrings);
  protected
    class procedure RegisterCompatibleFormats; override;
  public
    constructor Create(AOwner: TDragDropComponent); override;
    destructor Destroy; override;
    function Assign(Source: TClipboardFormat): boolean; override;
    function AssignTo(Dest: TClipboardFormat): boolean; override;
    procedure Clear; override;
    function HasData: boolean; override;
    function NeedsData: boolean; override;
    property HTML: TStrings read FHTML write SetHTML;
  end;


////////////////////////////////////////////////////////////////////////////////
//
//		TStorageDataFormat
//		TOutlookDataFormat
//
////////////////////////////////////////////////////////////////////////////////
// Renderer for Microsoft Outlook email formats.
////////////////////////////////////////////////////////////////////////////////
  TStorageDataFormat = class(TCustomDataFormat)
  private
    FStorages: TStorageInterfaceList;
  protected
    class procedure RegisterCompatibleFormats; override;
  public
    constructor Create(AOwner: TDragDropComponent); override;
    destructor Destroy; override;
    function Assign(Source: TClipboardFormat): boolean; override;
    function AssignTo(Dest: TClipboardFormat): boolean; override;
    procedure Clear; override;
    function HasData: boolean; override;
    function NeedsData: boolean; override;
    property Storages: TStorageInterfaceList read FStorages;
  end;

  TMessages = class(TObject)
  private
    FStorages: TStorageInterfaceList;
    FMessages: TInterfaceList;
    function GetCount: integer;
  protected
    function GetMessage(Index: integer): IUnknown;
  public
    constructor Create(AStorages: TStorageInterfaceList);
    destructor Destroy; override;
    procedure Clear;
    property Storages: TStorageInterfaceList read FStorages;
    property Messages[Index: integer]: IUnknown read GetMessage; default;
    property Count: integer read GetCount;
  end;

  TOutlookDataFormat = class(TStorageDataFormat)
  private
    FMessages: TMessages;
  protected
    class procedure RegisterCompatibleFormats; override;
  public
    constructor Create(AOwner: TDragDropComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
    property Messages: TMessages read FMessages;
  end;


////////////////////////////////////////////////////////////////////////////////
//
//		TDropURLTarget
//
////////////////////////////////////////////////////////////////////////////////
// URL drop target component.
////////////////////////////////////////////////////////////////////////////////
  TDropURLTarget = class(TCustomDropMultiTarget)
  private
    FURLFormat: TURLDataFormat;
  protected
    function GetTitle: UnicodeString;
    function GetURL: string;
    function GetPreferredDropEffect: LongInt; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property URL: string read GetURL;
    property Title: UnicodeString read GetTitle;
  end;

////////////////////////////////////////////////////////////////////////////////
//
//		TDropURLSource
//
////////////////////////////////////////////////////////////////////////////////
// URL drop source component.
////////////////////////////////////////////////////////////////////////////////
  TDropURLSource = class(TCustomDropMultiSource)
  private
    FURLFormat: TURLDataFormat;
    procedure SetTitle(const Value: UnicodeString);
    procedure SetURL(const Value: string);
  protected
    function GetTitle: UnicodeString;
    function GetURL: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property URL: string read GetURL write SetURL;
    property Title: UnicodeString read GetTitle write SetTitle;
  end;


////////////////////////////////////////////////////////////////////////////////
//
//		Misc.
//
////////////////////////////////////////////////////////////////////////////////
// Since an URL and HTML never contains anything but ANSI characters, it makes
// sense to keep these as AnsiStrings.
////////////////////////////////////////////////////////////////////////////////
function GetURLFromFile(const Filename: string; var URL: AnsiString): boolean;
function GetURLFromString(const s: AnsiString; var URL: AnsiString): boolean;
function GetURLFromStream(Stream: TStream; var URL: AnsiString): boolean;
function ConvertURLToFilename(const url: AnsiString): AnsiString;

function IsHTML(const s: AnsiString): boolean;
function MakeHTML(const s: AnsiString): AnsiString;
function MakeTextFromHTML(const s: AnsiString; FullHTML: boolean = False): string;


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//			IMPLEMENTATION
//
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
implementation

uses
  SysUtils,
  ShlObj,
  ComObj,
  DragDropFile;

////////////////////////////////////////////////////////////////////////////////
//
//		Utilities
//
////////////////////////////////////////////////////////////////////////////////
function GetURLFromFile(const Filename: string; var URL: AnsiString): boolean;
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
  try
    Result := GetURLFromStream(Stream, URL);
  finally
    Stream.Free;
  end;
end;

function GetURLFromString(const s: AnsiString; var URL: AnsiString): boolean;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Stream.Size := Length(s);
    Move(PAnsiChar(s)^, Stream.Memory^, Length(s));
    Result := GetURLFromStream(Stream, URL);
  finally
    Stream.Free;
  end;
end;

const
  // *** DO NOT LOCALIZE ***
  sInternetShortcut	= '[InternetShortcut]';
  sInternetShortcutExt	= '.url';

function GetURLFromStream(Stream: TStream; var URL: AnsiString): boolean;
var
  URLfile: TStringList;
  i: integer;
  s: AnsiString;
  p: PAnsiChar;
begin
  Result := False;
  URLfile := TStringList.Create;
  try
    URLFile.LoadFromStream(Stream);
    i := 0;
    while (not Result) and (i < URLFile.Count-1) do
    begin
      if (CompareText(URLFile[i], sInternetShortcut) = 0) then
      begin
        inc(i);
        while (not Result) and (i < URLFile.Count) do
        begin
          s := URLFile[i];
          p := PAnsiChar(s);
          if (StrLIComp(p, 'URL=', length('URL=')) = 0) then
          begin
            inc(p, length('URL='));
            URL := p;
            Result := True;
          end else
            if (p^ = '[') then
              exit;
          inc(i);
        end;
      end;
      inc(i);
    end;
  finally
    URLFile.Free;
  end;
end;

function ConvertURLToFilename(const url: AnsiString): AnsiString;
const
  Invalids: set of AnsiChar =
    ['\', '/', ':', '?', '*', '<', '>', ',', '|', '''', '"'];
  Protocols: array[0..3] of string =
    ('http://', 'ftp://', 'mailto:', 'file:');
var
  i: integer;
  LastInvalid: boolean;
  LowerUrl: string;
begin
  Result := url;
  LowerUrl := LowerCase(url);
  for i := Low(Protocols) to High(Protocols) do
    if (StrLIComp(PChar(LowerUrl), PChar(Protocols[i]), Length(Protocols[i])) = 0) then
    begin
      Delete(Result, 1, Length(Protocols[i]));
      break;
    end;

  if (length(Result) > 120) then
    SetLength(Result, 120);

  // Truncate at first slash
  i := pos('/', Result);
  if (i > 0) then
    SetLength(Result, i-1);

  // Replace invalids with spaces.
  // If string starts with invalids, they are trimmed.
  LastInvalid := True;
  for i := length(Result) downto 1 do
    if (Result[i] in Invalids) then
    begin
      if (not LastInvalid) then
      begin
        Result[i] := ' ';
        LastInvalid := True;
      end else
        // Repeating invalids are trimmed.
        Delete(Result, i, 1);
    end else
      LastInvalid := False;

  if Result = '' then
    Result := 'untitled';

   Result := Result+sInternetShortcutExt;
end;

function IsHTML(const s: AnsiString): boolean;
begin
  Result := (pos('<HTML', Uppercase(s)) > 0);
end;

function MakeHTML(const s: AnsiString): AnsiString;
const
  Header: AnsiString =
    'Version:0.9'+#13#10+
    'StartHTML:aaaaaaaa'+#13#10+
    'EndHTML:bbbbbbbb'+#13#10+
    'StartFragment:cccccccc'+#13#10+
    'EndFragment:dddddddd'+#13#10;
  WrapperStart: AnsiString =
    '<HTML>'+#13#10+
    '<BODY>'+#13#10+
    '<!--StartFragment-->';
  WrapperEnd: AnsiString =
    '<!--EndFragment-->'+#13#10+
    '</BODY>'+#13#10+
    '</HTML>';
var
  n: integer;
begin
  (*
  ** See MSDN articles Q274308 and Q274326.
  *)
  { TODO -oanme -cImprovement : Needs to escape special chars in text to HTML conversion. ...or do I? }
  { DONE -oanme -cImprovement : Needs better text to HTML conversion. }
  if (not IsHTML(s)) then
  begin
    Result := Header+WrapperStart+s+WrapperEnd;
    n := Length(Header);
    Result := StringReplace(Result, 'aaaaaaaa', format('%.8d', [n]), []);
    Result := StringReplace(Result, 'bbbbbbbb', format('%.8d', [Length(Result)]), []);
    inc(n, Length(WrapperStart));
    Result := StringReplace(Result, 'cccccccc', format('%.8d', [n]), []);
    inc(n, Length(s));
    Result := StringReplace(Result, 'dddddddd', format('%.8d', [n]), []);
  end else
    Result := s;
end;

function MakeTextFromHTML(const s: AnsiString; FullHTML: boolean): string;
const
  Sections: array[boolean, 0..1] of AnsiString =
    (('StartFragment:', 'EndFragment'), ('StartHTML', 'EndHTML'));
var
  n1, n2: integer;
  p: PAnsiChar;
begin
  n1 := Pos(Sections[FullHTML, 0], s);
  n2 := Pos(Sections[FullHTML, 1], s);
  if (n1 > 0) and (n2 > 0) then
  begin
    p := PAnsiChar(@s[n1+Length(Sections[FullHTML, 0])]);
    // Convert string to number.
    n1 := 0;
    while (p^ <> #0) and (p^ in ['0'..'9']) do
    begin
      n1 := 10*n1 + ord(p^)-ord('0');
      inc(p);
    end;

    p := PAnsiChar(@s[n2+Length(Sections[FullHTML, 1])]);
    // Convert string to number.
    n2 := 0;
    while (p^ <> #0) and (p^ in ['0'..'9']) do
    begin
      n2 := 10*n2 + ord(p^)-ord('0');
      inc(p);
    end;

    Result := Copy(s, n1+1, n2-n1);
  end else
    Result := s;
end;

////////////////////////////////////////////////////////////////////////////////
//
//		TAnsiURLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_URL: TClipFormat = 0;

// Note: CFSTR_INETURL = CFSTR_SHELLURL
function TAnsiURLClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_URL = 0) then
    CF_URL := RegisterClipboardFormat(CFSTR_SHELLURL);
  Result := CF_URL;
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TUnicodeURLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_INETURLW: TClipFormat = 0;

function TUnicodeURLClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_INETURLW = 0) then
    CF_INETURLW := RegisterClipboardFormat('UniformResourceLocatorW'); // *** DO NOT LOCALIZE ***
  Result := CF_INETURLW;
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TNetscapeBookmarkClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_NETSCAPEBOOKMARK: TClipFormat = 0;

function TNetscapeBookmarkClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_NETSCAPEBOOKMARK = 0) then
    CF_NETSCAPEBOOKMARK := RegisterClipboardFormat('Netscape Bookmark'); // *** DO NOT LOCALIZE ***
  Result := CF_NETSCAPEBOOKMARK;
end;

function TNetscapeBookmarkClipboardFormat.GetSize: integer;
begin
  Result := 0;
  if (FURL <> '') then
  begin
    inc(Result, 1024);
    if (FTitle <> '') then
      inc(Result, 1024);
  end;
end;

function TNetscapeBookmarkClipboardFormat.ReadData(Value: pointer;
  Size: integer): boolean;
begin
  // Note: No check for missing string terminator!
  FURL := PAnsiChar(Value);
  if (Size > 1024) then
  begin
    inc(PAnsiChar(Value), 1024);
    FTitle := PAnsiChar(Value);
  end;
  Result := True;
end;

function TNetscapeBookmarkClipboardFormat.WriteData(Value: pointer;
  Size: integer): boolean;
begin
  StrLCopy(Value, PAnsiChar(FURL), Size);
  dec(Size, 1024);
  if (Size > 0) and (FTitle <> '') then
  begin
    inc(PAnsiChar(Value), 1024);
    StrLCopy(Value, PAnsiChar(FTitle), Size);
  end;
  Result := True;
end;

procedure TNetscapeBookmarkClipboardFormat.Clear;
begin
  FURL := '';
  FTitle := '';
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TNetscapeImageClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_NETSCAPEIMAGE: TClipFormat = 0;

function TNetscapeImageClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_NETSCAPEIMAGE = 0) then
    CF_NETSCAPEIMAGE := RegisterClipboardFormat('Netscape Image Format');
  Result := CF_NETSCAPEIMAGE;
end;

type
  TNetscapeImageRec = record
    Size,
    _Unknown1,
    Width,
    Height,
    HorMargin,
    VerMargin,
    Border,
    OfsLowRes,
    OfsTitle,
    OfsURL,
    OfsExtra: DWORD
  end;
  PNetscapeImageRec = ^TNetscapeImageRec;

function TNetscapeImageClipboardFormat.GetSize: integer;
begin
  Result := SizeOf(TNetscapeImageRec);
  inc(Result, Length(FImage)+1);

  if (FLowRes <> '') then
    inc(Result, Length(FLowRes)+1);
  if (FTitle <> '') then
    inc(Result, Length(FTitle)+1);
  if (FUrl <> '') then
    inc(Result, Length(FUrl)+1);
  if (FExtra <> '') then
    inc(Result, Length(FExtra)+1);
end;

function TNetscapeImageClipboardFormat.ReadData(Value: pointer;
  Size: integer): boolean;
begin
  Result := (Size > SizeOf(TNetscapeImageRec));
  if (Result) then
  begin
    FWidth := PNetscapeImageRec(Value)^.Width;
    FHeight := PNetscapeImageRec(Value)^.Height;
    // Warning: Pointer math used below
    FImage := PAnsiChar(Value) + SizeOf(TNetscapeImageRec);
    if (PNetscapeImageRec(Value)^.OfsLowRes <> 0) then
      FLowRes := PAnsiChar(Value) + PNetscapeImageRec(Value)^.OfsLowRes;
    if (PNetscapeImageRec(Value)^.OfsTitle <> 0) then
      FTitle := PAnsiChar(Value) + PNetscapeImageRec(Value)^.OfsTitle;
    if (PNetscapeImageRec(Value)^.OfsURL <> 0) then
      FUrl := PAnsiChar(Value) + PNetscapeImageRec(Value)^.OfsUrl;
    if (PNetscapeImageRec(Value)^.OfsExtra <> 0) then
      FExtra := PAnsiChar(Value) + PNetscapeImageRec(Value)^.OfsExtra;
  end;
end;

function TNetscapeImageClipboardFormat.WriteData(Value: pointer;
  Size: integer): boolean;
var
  NetscapeImageRec: PNetscapeImageRec;
begin
  Result := (Size > SizeOf(TNetscapeImageRec));
  if (Result) then
  begin
    NetscapeImageRec := PNetscapeImageRec(Value);
    NetscapeImageRec^.Width := FWidth;
    NetscapeImageRec^.Height := FHeight;
    inc(PByte(Value), SizeOf(TNetscapeImageRec));
    dec(Size, SizeOf(TNetscapeImageRec));
    StrLCopy(Value, PAnsiChar(FImage), Size);
    dec(Size, Length(FImage)+1);
    if (Size <= 0) then
      exit;
    if (FLowRes <> '') then
    begin
      StrLCopy(Value, PAnsiChar(FLowRes), Size);
      NetscapeImageRec^.OfsLowRes := integer(Value) - integer(NetscapeImageRec);
      dec(Size, Length(FLowRes)+1);
      inc(PByte(Value), Length(FLowRes)+1);
      if (Size <= 0) then
        exit;
    end;
    if (FTitle <> '') then
    begin
      StrLCopy(Value, PAnsiChar(FTitle), Size);
      NetscapeImageRec^.OfsTitle := integer(Value) - integer(NetscapeImageRec);
      dec(Size, Length(FTitle)+1);
      inc(PByte(Value), Length(FTitle)+1);
      if (Size <= 0) then
        exit;
    end;
    if (FUrl <> '') then
    begin
      StrLCopy(Value, PAnsiChar(FUrl), Size);
      NetscapeImageRec^.OfsUrl := integer(Value) - integer(NetscapeImageRec);
      dec(Size, Length(FUrl)+1);
      inc(PByte(Value), Length(FUrl)+1);
      if (Size <= 0) then
        exit;
    end;
    if (FExtra <> '') then
    begin
      StrLCopy(Value, PAnsiChar(FExtra), Size);
      NetscapeImageRec^.OfsExtra := integer(Value) - integer(NetscapeImageRec);
      dec(Size, Length(FExtra)+1);
      inc(PByte(Value), Length(FExtra)+1);
      if (Size <= 0) then
        exit;
    end;
  end;
end;

procedure TNetscapeImageClipboardFormat.Clear;
begin
  FURL := '';
  FTitle := '';
  FImage := '';
  FLowRes := '';
  FExtra := '';
  FHeight := 0;
  FWidth := 0;
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TVCardClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_VCARD: TClipFormat = 0;

function TVCardClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_VCARD = 0) then
    CF_VCARD := RegisterClipboardFormat('+//ISBN 1-887687-00-9::versit::PDI//vCard'); // *** DO NOT LOCALIZE ***
  Result := CF_VCARD;
end;

function TVCardClipboardFormat.GetSize: integer;
var
  i: integer;
begin
  if (Items.Count > 0) then
  begin
    Result := 22; // Length('begin:vcard'+#13+'end:vcard'+#0);
    for i := 0 to Items.Count-1 do
      inc(Result, Length(Items[i])+1);
  end else
    Result := 0;
end;

function TVCardClipboardFormat.ReadData(Value: pointer; Size: integer): boolean;
var
  i: integer;
  s: string;
begin
  Result := inherited ReadData(Value, Size);
  if (Result) then
  begin
    // Zap vCard header and trailer
    if (Items.Count > 0) and (CompareText(Items[0], 'begin:vcard') = 0) then
      Items.Delete(0);
    if (Items.Count > 0) and (CompareText(Items[Items.Count-1], 'end:vcard') = 0) then
      Items.Delete(Items.Count-1);
    // Convert to item/value list
    for i := 0 to Items.Count-1 do
      if (pos(':', Items[i]) > 0) then
      begin
        s := Items[i];
        s[pos(':', Items[i])] := '=';
        Items[i] := s;
      end;
  end;
end;

function DOSStringToUnixString(dos: string): string;
var
  s, d: PChar;
  l: integer;
begin
  SetLength(Result, Length(dos)+1);
  s := PChar(dos);
  d := PChar(Result);
  l := 1;
  while (s^ <> #0) do
  begin
    // Ignore LF
    if (s^ <> #10) then
    begin
      d^ := s^;
      inc(l);
      inc(d);
    end;
    inc(s);
  end;
  SetLength(Result, l);
end;

function TVCardClipboardFormat.WriteData(Value: pointer; Size: integer): boolean;
var
  s: AnsiString;
begin
  Result := (Items.Count > 0);
  if (Result) then
  begin
    s := DOSStringToUnixString('begin:vcard'+#13+Items.Text+#13+'end:vcard');
    StrLCopy(Value, PAnsiChar(s), Size);
  end;
end;


////////////////////////////////////////////////////////////////////////////////
//
//		THTMLClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_HTML: TClipFormat = 0;

function THTMLClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_HTML = 0) then
    CF_HTML := RegisterClipboardFormat('HTML Format');
  Result := CF_HTML;
end;

function THTMLClipboardFormat.HasData: boolean;
begin
  Result := inherited HasData and IsHTML(HTML.Text);
end;

class procedure THTMLClipboardFormat.RegisterCompatibleFormats;
begin
  inherited RegisterCompatibleFormats;
  RegisterDataConversion(TTextDataFormat, 3);
end;

function THTMLClipboardFormat.Assign(Source: TCustomDataFormat): boolean;
begin
  Result := True;
  if (Source is TTextDataFormat) then
  begin
    if IsHTML(TTextDataFormat(Source).Text) then
      HTML.Text := TTextDataFormat(Source).Text
    else
      HTML.Text := MakeHTML(TTextDataFormat(Source).Text);
  end else
    Result := inherited Assign(Source);
end;

function THTMLClipboardFormat.AssignTo(Dest: TCustomDataFormat): boolean;
begin
  Result := True;
  if (Dest is TTextDataFormat) then
  begin
    TTextDataFormat(Dest).Text := MakeTextFromHTML(HTML.Text, False);
    if (TTextDataFormat(Dest).Text = '') then
      TTextDataFormat(Dest).Text := MakeTextFromHTML(HTML.Text, True);
    if (TTextDataFormat(Dest).Text = '') then
      TTextDataFormat(Dest).Text := HTML.Text;
  end else
    Result := inherited AssignTo(Dest);
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TRFC822ClipboardFormat
//
////////////////////////////////////////////////////////////////////////////////
var
  CF_RFC822: TClipFormat = 0;

function TRFC822ClipboardFormat.GetClipboardFormat: TClipFormat;
begin
  if (CF_RFC822 = 0) then
    CF_RFC822 := RegisterClipboardFormat('Internet Message (rfc822/rfc1522)'); // *** DO NOT LOCALIZE ***
  Result := CF_RFC822;
end;

class procedure TRFC822ClipboardFormat.RegisterCompatibleFormats;
begin
  inherited RegisterCompatibleFormats;
  RegisterDataConversion(TTextDataFormat, 2);
end;

function TRFC822ClipboardFormat.Assign(Source: TCustomDataFormat): boolean;
begin
  Result := True;
  if (Source is TTextDataFormat) then
    Text.Text := TTextDataFormat(Source).Text
  else
    Result := inherited Assign(Source);
end;

function TRFC822ClipboardFormat.AssignTo(Dest: TCustomDataFormat): boolean;
begin
  Result := True;
  if (Dest is TTextDataFormat) then
    TTextDataFormat(Dest).Text := Text.Text
  else
    Result := inherited AssignTo(Dest);
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TURLDataFormat
//
////////////////////////////////////////////////////////////////////////////////
function TURLDataFormat.Assign(Source: TClipboardFormat): boolean;
var
  s: string;
  NewUrl: AnsiString;
begin
  Result := False;
  (*
  ** TAnsiURLClipboardFormat
  *)
  if (Source is TAnsiURLClipboardFormat) then
  begin
    if (FURL = '') then
      FURL := TAnsiURLClipboardFormat(Source).URL;
    Result := True;
  end else
  (*
  ** TAnsiTextClipboardFormat
  *)
  if (Source is TAnsiTextClipboardFormat) then
  begin
    if (FURL = '') then
    begin
      s := TAnsiTextClipboardFormat(Source).Text;
      // Convert from text if the string looks like an URL
      if (pos('://', s) > 1) then
      begin
        FURL := s;
        Result := True;
      end;
    end;
  end else
  (*
  ** TFileClipboardFormat
  *)
  if (Source is TFileClipboardFormat) then
  begin
    if (FURL = '') then
    begin
      s := TFileClipboardFormat(Source).Files[0];
      // Convert from Internet Shortcut file format.
      if (CompareText(ExtractFileExt(s), sInternetShortcutExt) = 0) and
        (GetURLFromFile(s, NewUrl)) then
      begin
        FURL := NewUrl;
        if (FTitle = '') then
          FTitle := ChangeFileExt(ExtractFileName(s), '');
        Result := True;
      end;
    end;
  end else
  (*
  ** TFileContentsClipboardFormat
  *)
  if (Source is TFileContentsClipboardFormat) then
  begin
    // Reject file contents unless we have already accepted the file group
    // descriptor (i.e. the internet shortcut file name).
    // We do this to prevent the situation where we has to pull a lot of data
    // from the source and then discard the data because it didn't actually
    // contain anything usefull (e.g. 10Mb of data from the AsyncSource demo).
    if (FURL = '') and (FTitle <> '') then
    begin
      s := TFileContentsClipboardFormat(Source).Data;
      Result := GetURLFromString(s, NewUrl);
      if (Result) then
        FURL := NewUrl;
    end;
  end else
  (*
  ** TAnsiFileGroupDescriptorClipboardFormat
  *)
  if (Source is TAnsiFileGroupDescriptorClipboardFormat) then
  begin
    if (FTitle = '') then
    begin
      if (TAnsiFileGroupDescriptorClipboardFormat(Source).FileGroupDescriptor^.cItems > 0) then
      begin
        // Extract the title of an Internet Shortcut
        s := TAnsiFileGroupDescriptorClipboardFormat(Source).FileGroupDescriptor^.fgd[0].cFileName;
        if (CompareText(ExtractFileExt(s), sInternetShortcutExt) = 0) then
        begin
          FTitle := ChangeFileExt(s, '');
          Result := True;
        end;
      end;
    end;
  end else
  (*
  ** TUnicodeFileGroupDescriptorClipboardFormat
  *)
  if (Source is TUnicodeFileGroupDescriptorClipboardFormat) then
  begin
    if (FTitle = '') then
    begin
      if (TUnicodeFileGroupDescriptorClipboardFormat(Source).FileGroupDescriptor^.cItems > 0) then
      begin
        // Extract the title of an Internet Shortcut
        s := TUnicodeFileGroupDescriptorClipboardFormat(Source).FileGroupDescriptor^.fgd[0].cFileName;
        if (CompareText(ExtractFileExt(s), sInternetShortcutExt) = 0) then
        begin
          FTitle := ChangeFileExt(s, '');
          Result := True;
        end;
      end;
    end;
  end else
    Result := inherited Assign(Source);
end;

function TURLDataFormat.AssignTo(Dest: TClipboardFormat): boolean;
var
  FGDA: TFileGroupDescriptorA;
  FGDW: DragDropFile.TFileGroupDescriptorW;
  Filename: UnicodeString;
begin
  Result := True;
  (*
  ** TAnsiURLClipboardFormat
  *)
  if (Dest is TAnsiURLClipboardFormat) then
  begin
    TAnsiURLClipboardFormat(Dest).URL := URL;
  end else
  (*
  ** TAnsiTextClipboardFormat
  *)
  if (Dest is TAnsiTextClipboardFormat) then
  begin
    TAnsiTextClipboardFormat(Dest).Text := URL;
  end else
  (*
  ** TFileContentsClipboardFormat
  *)
  if (Dest is TFileContentsClipboardFormat) then
  begin
    TFileContentsClipboardFormat(Dest).Data := sInternetShortcut + #13#10 +
      'URL='+URL + #13#10;
  end else
  (*
  ** TAnsiFileGroupDescriptorClipboardFormat
  *)
  if (Dest is TAnsiFileGroupDescriptorClipboardFormat) then
  begin
    FillChar(FGDA, SizeOf(FGDA), 0);
    FGDA.cItems := 1;
    if (Title <> '') then
      Filename := Title
    else
      Filename := URL;
    StrPLCopy(@FGDA.fgd[0].cFileName[0], ConvertURLToFilename(Filename),
      SizeOf(FGDA.fgd[0].cFileName));
    FGDA.fgd[0].dwFlags := FD_LINKUI or FD_FILESIZE;
    FGDA.fgd[0].nFileSizeLow := Length(sInternetShortcut)+Length(URL)+8;
    TAnsiFileGroupDescriptorClipboardFormat(Dest).CopyFrom(@FGDA);
  end else
  (*
  ** TUnicodeFileGroupDescriptorClipboardFormat
  *)
  if (Dest is TUnicodeFileGroupDescriptorClipboardFormat) then
  begin
    FillChar(FGDW, SizeOf(FGDW), 0);
    FGDW.cItems := 1;
    if (Title <> '') then
      Filename := Title
    else
      Filename := URL;
    WStrPLCopy(@FGDW.fgd[0].cFileName[0],
      // TODO : This will convert the filename to ANSI
      ConvertURLToFilename(Filename),
      SizeOf(FGDW.fgd[0].cFileName) div 2);
    FGDW.fgd[0].dwFlags := FD_LINKUI or FD_FILESIZE;
    FGDW.fgd[0].nFileSizeLow := Length(sInternetShortcut)+Length(URL)+8;
    TUnicodeFileGroupDescriptorClipboardFormat(Dest).CopyFrom(@FGDW);
  end else
    Result := inherited AssignTo(Dest);
end;

procedure TURLDataFormat.Clear;
begin
  Changing;
  FURL := '';
  FTitle := '';
end;

procedure TURLDataFormat.SetTitle(const Value: UnicodeString);
begin
  Changing;
  FTitle := Value;
end;

procedure TURLDataFormat.SetURL(const Value: string);
begin
  Changing;
  FURL := Value;
end;

function TURLDataFormat.HasData: boolean;
begin
  Result := (URL <> '') or (Title <> '');
end;

function TURLDataFormat.NeedsData: boolean;
begin
  Result := (URL = '') or (Title = '');
end;


class procedure TURLDataFormat.RegisterCompatibleFormats;
begin
  inherited RegisterCompatibleFormats;

  RegisterDataConversion(TAnsiFileGroupDescriptorClipboardFormat, AnsiBoost);
  RegisterDataConversion(TUnicodeFileGroupDescriptorClipboardFormat, UnicodeBoost);
  RegisterDataConversion(TFileContentsClipboardFormat, 1);
  RegisterDataConversion(TAnsiURLClipboardFormat, 2);
  RegisterDataConversion(TAnsiTextClipboardFormat, 3);
  RegisterDataConversion(TFileClipboardFormat, 4);
end;

////////////////////////////////////////////////////////////////////////////////
//
//		THTMLDataFormat
//
////////////////////////////////////////////////////////////////////////////////
function THTMLDataFormat.Assign(Source: TClipboardFormat): boolean;
begin
  Result := True;

  if (Source is THTMLClipboardFormat) then
    FHTML.Assign(THTMLClipboardFormat(Source).HTML)

  else
    Result := inherited Assign(Source);
end;

function THTMLDataFormat.AssignTo(Dest: TClipboardFormat): boolean;
begin
  Result := True;

  if (Dest is THTMLClipboardFormat) then
    THTMLClipboardFormat(Dest).HTML.Assign(FHTML)

  else
    Result := inherited AssignTo(Dest);
end;

procedure THTMLDataFormat.Clear;
begin
  Changing;
  FHTML.Clear;
end;

constructor THTMLDataFormat.Create(AOwner: TDragDropComponent);
begin
  inherited Create(AOwner);
  FHTML := TStringList.Create;
end;

destructor THTMLDataFormat.Destroy;
begin
  FHTML.Free;
  inherited Destroy;
end;

function THTMLDataFormat.HasData: boolean;
begin
  Result := (FHTML.Count > 0);
end;

function THTMLDataFormat.NeedsData: boolean;
begin
  Result := (FHTML.Count = 0);
end;

class procedure THTMLDataFormat.RegisterCompatibleFormats;
begin
  inherited RegisterCompatibleFormats;

  RegisterDataConversion(THTMLClipboardFormat);
end;

procedure THTMLDataFormat.SetHTML(const Value: TStrings);
begin
  FHTML.Assign(Value);
end;

////////////////////////////////////////////////////////////////////////////////
//
//		TStorageDataFormat
//
////////////////////////////////////////////////////////////////////////////////
constructor TStorageDataFormat.Create(AOwner: TDragDropComponent);
begin
  inherited Create(AOwner);
  FStorages := TStorageInterfaceList.Create;
  FStorages.OnChanging := DoOnChanging;
end;

destructor TStorageDataFormat.Destroy;
begin
  Clear;
  FStorages.Free;
  inherited Destroy;
end;

procedure TStorageDataFormat.Clear;
begin
  Changing;
  FStorages.Clear;
end;

function TStorageDataFormat.Assign(Source: TClipboardFormat): boolean;
begin
  Result := True;

  if (Source is TFileContentsStorageClipboardFormat) then
    FStorages.Assign(TFileContentsStorageClipboardFormat(Source).Storages)

  else
    Result := inherited Assign(Source);
end;

function TStorageDataFormat.AssignTo(Dest: TClipboardFormat): boolean;
begin
  Result := True;

  if (Dest is TFileContentsStorageClipboardFormat) then
    TFileContentsStorageClipboardFormat(Dest).Storages.Assign(FStorages)

  else
    Result := inherited AssignTo(Dest);
end;

function TStorageDataFormat.HasData: boolean;
begin
  Result := (FStorages.Count > 0);
end;

function TStorageDataFormat.NeedsData: boolean;
begin
  Result := (FStorages.Count = 0);
end;

class procedure TStorageDataFormat.RegisterCompatibleFormats;
begin
  inherited RegisterCompatibleFormats;

  // RegisterDataConversion(TFileContentsStorageClipboardFormat);
end;

procedure TMessages.Clear;
var
  i: integer;
begin
  for i := 0 to FMessages.Count-1 do
  begin
    (*
    ** Due to an apparent bug in Outlook, we have to prevent the reference count
    ** of the IMessage object from reaching zero.
    *)
    // Artificially increment reference count before we zap the reference to the
    // object.
    FMessages[i]._AddRef;
    // Zap reference stored in list.
    FMessages[i] := nil;
  end;
  FMessages.Clear;
end;

constructor TMessages.Create(AStorages: TStorageInterfaceList);
begin
  inherited Create;
  FStorages := AStorages;
  FMessages := TInterfaceList.Create;
end;

destructor TMessages.Destroy;
begin
  Clear;
  FMessages.Free;
  inherited Destroy;
end;

function TMessages.GetCount: integer;
begin
  Result := FStorages.Count;
end;

type
  TMAPIGetDefaultMalloc = function: pointer; stdcall;
  TMAPIInitialize = function(lpMapiInit: pointer): HResult; stdcall;
  TMAPIUninitialize = procedure; stdcall;
  TMAPIAllocateBuffer = function(cbSize: ULONG; var lppBuffer: pointer): SCODE; stdcall;
  TMAPIAllocateMore = function(cbSize: ULONG; lpObject: pointer; var lppBuffer: pointer): SCODE; stdcall;
  TMAPIFreeBuffer = function(lpBuffer: pointer): ULONG; stdcall;
  // Note: This declaration of OpenIMsgOnIStg has been hacked to remove dependencies on MAPI structures.
  TOpenIMsgOnIStg = function(lpMsgSess: pointer; lpAllocateBuffer: pointer;
    lpAllocateMore: pointer; lpFreeBuffer: pointer; lpMalloc: pointer;
    lpMapiSup: pointer; lpStg: IStorage; lpfMsgCallRelease: pointer;
    ulCallerData: ULONG; ulFlags: ULONG; out lppMsg: IUnknown): SCODE; stdcall;

var
  MAPIGetDefaultMalloc: TMAPIGetDefaultMalloc = nil;
  MAPIInitialize: TMAPIInitialize = nil;
  MAPIUninitialize: TMAPIUninitialize = nil;
  MAPIAllocateBuffer: TMAPIAllocateBuffer = nil;
  MAPIAllocateMore: TMAPIAllocateMore = nil;
  MAPIFreeBuffer: TMAPIFreeBuffer = nil;
  OpenIMsgOnIStg: TOpenIMsgOnIStg = nil;

var
  MAPI32: HMODULE = 0;

const
  MAPI32DLL = 'mapi32.dll';

procedure LoadMAPI32;

  procedure GetProc(const Name: AnsiString; var Func: pointer);
  begin
    Func := GetProcAddress(MAPI32, PAnsiChar(Name));
    if (Func = nil) then
      raise Exception.CreateFmt('Failed to get %s entry point for %s: %s',
        [MAPI32DLL, Name, SysErrorMessage(GetLastError)]);
  end;

begin
  if (MAPI32 = 0) then
  begin
    MAPI32 := SafeLoadLibrary(MAPI32DLL);
    if (MAPI32 <= HINSTANCE_ERROR) then
      raise Exception.CreateFmt('%s: %s', [SysErrorMessage(GetLastError), MAPI32DLL]);
    GetProc('MAPIGetDefaultMalloc@0', @MAPIGetDefaultMalloc);
    GetProc('MAPIInitialize', @MAPIInitialize);
    GetProc('MAPIUninitialize', @MAPIUninitialize);
    GetProc('MAPIAllocateBuffer', @MAPIAllocateBuffer);
    GetProc('MAPIAllocateMore', @MAPIAllocateMore);
    GetProc('MAPIFreeBuffer', @MAPIFreeBuffer);
    GetProc('OpenIMsgOnIStg@44', @OpenIMsgOnIStg);
  end;
end;

(*
function MAPIGetDefaultMalloc: pointer; stdcall; external 'mapi32.dll' name 'MAPIGetDefaultMalloc@0';
function MAPIInitialize(lpMapiInit: pointer): HResult; stdcall; external 'mapi32.dll';
procedure MAPIUninitialize; stdcall; external 'mapi32.dll';
function MAPIAllocateBuffer(cbSize: ULONG; var lppBuffer: pointer): SCODE; stdcall; external 'mapi32.dll';
function MAPIAllocateMore(cbSize: ULONG; lpObject: pointer; var lppBuffer: pointer): SCODE; stdcall; external 'mapi32.dll';
function MAPIFreeBuffer(lpBuffer: pointer): ULONG; stdcall; external 'mapi32.dll';

// Note: This declaration of OpenIMsgOnIStg has been hacked to remove dependencies on other structures.
function OpenIMsgOnIStg (
  lpMsgSess: pointer;                  { -> message session obj (optional) }
  lpAllocateBuffer: pointer;           { -> AllocateBuffer memory routine  }
  lpAllocateMore: pointer;             { -> AllocateMore memory routine    }
  lpFreeBuffer: pointer;               { -> FreeBuffer memory routine      }
  lpMalloc: pointer;                   { -> Co malloc object               }
  lpMapiSup: pointer;                  { -> MAPI Support Obj (optional)    }
  lpStg : IStorage;                    { -> open IStorage containing msg   }
  lpfMsgCallRelease: pointer;          { -> release callback rtn (opt) }
  ulCallerData: ULONG;                { caller data returned in callback  }
  ulFlags: ULONG;                     { -> flags (controls istg commit)   }
  out lppMsg: IUnknown): SCODE; stdcall; external 'mapi32.dll' name 'OpenIMsgOnIStg@44';
                                       { <- open message object            }
*)

function TMessages.GetMessage(Index: integer): IUnknown;
var
  i: integer;
begin
  if (FStorages.Count <> FMessages.Count) then
  begin
    FMessages.Capacity := FStorages.Count;
    for i := 0 to FStorages.Count-1 do
      FMessages.Add(nil);
  end;

  if (FMessages[Index] = nil) then
  begin
    LoadMAPI32;
    // Get IMessage from IStorage
    OleCheck(OpenIMsgOnIStg(nil,
      @MAPIAllocateBuffer,
      @MAPIAllocateMore,
      @MAPIFreeBuffer,
      MapiGetDefaultMalloc,
      nil,
      FStorages[Index],
      nil, 0, 0,
      Result));
    FMessages[Index] := Result;
  end else
    Result := FMessages[Index];
end;

{ TOutlookDataFormat }

procedure TOutlookDataFormat.Clear;
begin
  inherited Clear;
  FMessages.Clear;
end;

constructor TOutlookDataFormat.Create(AOwner: TDragDropComponent);
begin
  inherited Create(AOwner);
  FMessages := TMessages.Create(Storages);
end;

destructor TOutlookDataFormat.Destroy;
begin
  inherited Destroy;
  FMessages.Free;
end;


class procedure TOutlookDataFormat.RegisterCompatibleFormats;
begin
  inherited RegisterCompatibleFormats;

  RegisterDataConversion(TFileContentsStorageClipboardFormat);
end;

////////////////////////////////////////////////////////////////////////////////
//
//		TDropURLTarget
//
////////////////////////////////////////////////////////////////////////////////

constructor TDropURLTarget.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DragTypes := [dtCopy, dtLink];
  GetDataOnEnter := True;

  FURLFormat := TURLDataFormat.Create(Self);
end;

destructor TDropURLTarget.Destroy;
begin
  FURLFormat.Free;
  inherited Destroy;
end;

function TDropURLTarget.GetTitle: UnicodeString;
begin
  Result := FURLFormat.Title;
end;

function TDropURLTarget.GetURL: string;
begin
  Result := FURLFormat.URL;
end;

function TDropURLTarget.GetPreferredDropEffect: LongInt;
begin
  Result := GetPreferredDropEffect;
  if (Result = DROPEFFECT_NONE) then
    Result := DROPEFFECT_LINK;
end;

////////////////////////////////////////////////////////////////////////////////
//
//		TDropURLSource
//
////////////////////////////////////////////////////////////////////////////////
constructor TDropURLSource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DragTypes := [dtCopy, dtLink];
  PreferredDropEffect := DROPEFFECT_LINK;

  FURLFormat := TURLDataFormat.Create(Self);
end;

destructor TDropURLSource.Destroy;
begin
  FURLFormat.Free;
  inherited Destroy;
end;

function TDropURLSource.GetTitle: UnicodeString;
begin
  Result := FURLFormat.Title;
end;

procedure TDropURLSource.SetTitle(const Value: UnicodeString);
begin
  FURLFormat.Title := Value;
end;

function TDropURLSource.GetURL: string;
begin
  Result := FURLFormat.URL;
end;

procedure TDropURLSource.SetURL(const Value: string);
begin
  FURLFormat.URL := Value;
end;


////////////////////////////////////////////////////////////////////////////////
//
//		Initialization/Finalization
//
////////////////////////////////////////////////////////////////////////////////

initialization
  // Data format registration
  TURLDataFormat.RegisterDataFormat;
  THTMLDataFormat.RegisterDataFormat;
  TOutlookDataFormat.RegisterDataFormat;

  // Clipboard format registration
  TAnsiURLClipboardFormat.RegisterFormat;
  THTMLClipboardFormat.RegisterFormat;
  TRFC822ClipboardFormat.RegisterFormat;

finalization
end.

