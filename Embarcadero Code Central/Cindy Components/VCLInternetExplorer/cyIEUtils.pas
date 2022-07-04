{

    Description:
    Utilities for cyIEWrappers pack

    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    $  ��� Accept any PAYPAL DONATION $$$  �
    $      to: mauricio_box@yahoo.com      �
    ����������������������������������������

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
unit cyIEUtils;

interface

Uses Classes, Forms, Graphics, Windows, SysUtils, Registry, cyStrUtils;

type
  // TWebBrowser emulation version :
  TWBEmulationVersion = (WBEmulUnknown, WBEmulIE7, WBEmulIE8, WBEmulIE9, WBEmulIE10, WBEmulIE11);

  // TWebBrowser print page Setup :
  TwbPageSetup = Record
    font: String;
    footer: String;
    header: String;
    margin_bottom: String;
    margin_left: String;
    margin_right: String;
    margin_top: String;
    Print_Background: String;
    Shrink_To_Fit: String;
  End;

const
  cKEY_FEATURE_BROWSER_EMULATION = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
  cValue_FBE_IE7  =  7000;
  cValue_FBE_IE8  =  8888;
  cValue_FBE_IE9  =  9999;
  cValue_FBE_IE10 = 10001;
  cValue_FBE_IE11 = 11001;


function GetInternetExplorerVersion: String;

// TwebBrowser get/set IE version with FEATURE_BROWSER_EMULATION !
function GetWebBrowserEmulationVersion(ExeName: string = ''): TWBEmulationVersion;
function SetWebBrowserEmulationVersion(const WBEmulationVersion: TWBEmulationVersion; ExeName: string = ''): Boolean;

function URLEncode(const S: string): string;
function MakeResourceURL(const ModuleName: string; const ResName: PChar; const ResType: PChar = nil): string; overload;
function MakeResourceURL(const Module: HMODULE; const ResName: PChar; const ResType: PChar = nil): string; overload;

function ColorToHtml(const aColor: TColor): String;
function HtmlToColor(const aHtmlColor: String): TColor;

{$IFDEF UNICODE}
function GetStreamEncoding(aStream: TStream): TEncoding;
function IsStreamEncodedWith(aStream: TStream; Encoding: TEncoding): Boolean;
{$ENDIF}

function AddHtmlUnicodePrefix(aHtml: String): String;
function RemoveHtmlUnicodePrefix(aHtml: String): String;

procedure GetPageSetupFromRegistry(var awbPageSetup: TwbPageSetup);
procedure SetPageSetupToRegistry(awbPageSetup: TwbPageSetup);

function TextToHtml(const aText: String): String;
function HtmlToText(const Html: String; const RemoveTags: Boolean = false): String;

function TextToXml(const aText: String): String;
function XmlToText(const Xml: String): String;

const
   IEBodyBorderless = 'none';
   IEBodySingleBorder = '';
   IEDesignModeOn = 'On';
   IEDesignModeOff = 'Off';

  // Html string encoding prefix for UTF-8, Unicode and Unicode big endian charset :
  {$IFDEF UNICODE}
  cHtmlUnicodePrefixChar = #$FEFF;
  {$ELSE}
  cHtmlUnicodePrefixChar = #$FE;
  {$ENDIF}

implementation

function GetInternetExplorerVersion: String;
var
  Registry: TRegistry;
  resultat : String;
begin
  Result := '';

  Registry := TRegistry.Create(KEY_READ);
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    Registry.OpenKey('SOFTWARE\Microsoft\Internet Explorer', false);
    Result := Registry.ReadString('svcVersion');
  finally
    Registry.Free;
  end;
end;

function GetWebBrowserEmulationVersion(ExeName: string = ''): TWBEmulationVersion;
var
  Reg: TRegistry;
  Value: LongInt;
  i : LongInt;
begin
  Result := WBEmulUnknown;

  if ExeName = '' then
    ExeName := ExtractFileName(Application.ExeName);

  Value := 0;
  Reg := TRegistry.Create;

  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.KeyExists(cKEY_FEATURE_BROWSER_EMULATION) then
      if Reg.OpenKey(cKEY_FEATURE_BROWSER_EMULATION, True) then
        if Reg.ValueExists(ExeName) then
        begin
          Value := Reg.ReadInteger(ExeName);
          Reg.CloseKey;
        end;
  except;
  end;

  FreeAndNil(Reg);

  case Value of
     cValue_FBE_IE7: Result := WBEmulIE7;
     cValue_FBE_IE8: Result := WBEmulIE8;
     cValue_FBE_IE9: Result := WBEmulIE9;
    cValue_FBE_IE10: Result := WBEmulIE10;
    cValue_FBE_IE11: Result := WBEmulIE11;
  end;
end;

function SetWebBrowserEmulationVersion(const WBEmulationVersion: TWBEmulationVersion; ExeName: string = ''): Boolean;
var
  Reg: TRegistry;
  Value: LongInt;
begin
  Result := false;

  if ExeName = '' then
    ExeName := ExtractFileName(Application.ExeName);

  if WBEmulationVersion = WBEmulUnknown then
  begin
    // Delete value :
    Reg := TRegistry.Create;

    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(cKEY_FEATURE_BROWSER_EMULATION, True) then
        Reg.DeleteValue(ExeName);
      Result := true;
    finally
      FreeAndNil(Reg);
    end;

    Exit;
  end;

  Reg := TRegistry.Create;

  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKey(cKEY_FEATURE_BROWSER_EMULATION, True) then
    begin
      case WBEmulationVersion of
        WBEmulIE7 : Value := cValue_FBE_IE7;
        WBEmulIE8 : Value := cValue_FBE_IE8;
        WBEmulIE9 : Value := cValue_FBE_IE9;
        WBEmulIE10: Value := cValue_FBE_IE10;
        WBEmulIE11: Value := cValue_FBE_IE11;
        else        Value := cValue_FBE_IE7;
      end;

      Reg.WriteInteger(ExeName, Value);
      Reg.CloseKey;

      Result := True;
    end;
  except;
  end;

  FreeAndNil(Reg);
end;

{
  The following 3 functions are taken from the DelphiDabbler article "How to create and use HTML resource files" at:
  http://www.delphidabbler.com/articlesarticle=10
}

{ Do not use this function to URL encode query strings: see the more flexible version in the Code Snippets Database at
  http://www.delphidabbler.com/codesnip?action=named&routines=URLEncode }
function URLEncode(const S: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(S[I], ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.']) then
    {$ELSE}
    if S[I] in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.'] then
    {$ENDIF}
      Result := Result + S[I]
    else
      Result := Result + '%' + IntToHex(Ord(S[I]), 2);
  end;
end;

function MakeResourceURL(const ModuleName: string; const ResName: PChar;
  const ResType: PChar = nil): string; overload;

    function ResNameOrTypeToString(R: PChar): string;
    begin
      if HiWord(LongWord(R)) = 0
      then
        // high word = 0 => numeric resource id
        // numeric value is stored in low word
        Result := Format('#%d', [LoWord(LongWord(R))])
      else
        // high word <> 0 => string value
        // PChar is implicitly converted to string
        Result := R;
    end;

begin
  Assert(ModuleName <> '');
  Assert(Assigned(ResName));
  Result := 'res://' + URLEncode(ModuleName);
  if Assigned(ResType)
  then Result := Result + '/' + URLEncode(ResNameOrTypeToString(ResType));

  Result := Result + '/' + URLEncode(ResNameOrTypeToString(ResName));
end;

function MakeResourceURL(const Module: HMODULE; const ResName: PChar;
  const ResType: PChar = nil): string; overload;
begin
  Result := MakeResourceURL(GetModuleName(Module), ResName, ResType);
end;





function ColorToHtml(const aColor: TColor): String;
var RGBValue, r,g,b: Integer;
begin
  RGBValue := ColorToRGB(aColor);

  R := GetRValue(RGBValue);
  G := GetGValue(RGBValue);
  B := GetBValue(RGBValue);

  RESULT := '#' + IntToHex(R, 2) + IntToHex(G, 2) + IntToHex(B, 2);
end;

function HtmlToColor(const aHtmlColor: String): TColor;
var
  R, G, B: Integer;
begin
  if aHtmlColor <> ''
  then begin
    try
      R := StrToInt('$' + Copy(aHtmlColor, 2, 2));
      G := StrToInt('$' + Copy(aHtmlColor, 4, 2));
      B := StrToInt('$' + Copy(aHtmlColor, 6, 2));
      RESULT := RGB(R, G, B);
    except
      RESULT := clNone;
    end;
  end
  else
    RESULT := clNone;
end;

{$IFDEF UNICODE}
function GetStreamEncoding(aStream: TStream): TEncoding;
var
  Bytes: TBytes;
  Size: Int64;
begin
  Result := nil;        // 2015-07-06 Avoid XE/64 bit error
  aStream.Seek(0, soFromBeginning);
  Size := aStream.Size;
  SetLength(Bytes, Size);
  aStream.ReadBuffer(Pointer(Bytes)^, Size);
  TEncoding.GetBufferEncoding(Bytes, RESULT);
end;
{$ENDIF}

{$IFDEF UNICODE}
function IsStreamEncodedWith(aStream: TStream; Encoding: TEncoding): Boolean;
var
  BOM, Bytes: TBytes;   // Encoding Byte Order Mark ...
  BOMSize: Integer;
begin
  RESULT := false;
  BOM := Encoding.GetPreamble;
  BOMSize := Length(BOM);

  if aStream.Size >= BOMSize
  then begin
    aStream.Seek(0, soFromBeginning);
    SetLength(Bytes, BOMSize);
    aStream.ReadBuffer(Pointer(Bytes)^, BOMSize);

    if CompareMem(@BOM[0], @Bytes[0], BOMSize)
    then RESULT := true;
  end;
end;
{$ENDIF}

function AddHtmlUnicodePrefix(aHtml: String): String;
begin
  Result := aHtml;

  if Result <> ''
  then
    if Result[1] <> cHtmlUnicodePrefixChar
    then Insert(cHtmlUnicodePrefixChar, Result, 1);
end;

function RemoveHtmlUnicodePrefix(aHtml: String): String;
begin
  Result := aHtml;

  if Result <> ''
  then
    if Result[1] = cHtmlUnicodePrefixChar
    then Delete(Result, 1, 1);
end;

procedure GetPageSetupFromRegistry(var awbPageSetup: TwbPageSetup);
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;

  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Internet Explorer\PageSetup', True);
    awbPageSetup.font             := Reg.ReadString('font');
    awbPageSetup.footer           := Reg.ReadString('footer');
    awbPageSetup.header           := Reg.ReadString('header');
    awbPageSetup.margin_bottom    := Reg.ReadString('margin_bottom');
    awbPageSetup.margin_left      := Reg.ReadString('margin_left');
    awbPageSetup.margin_right     := Reg.ReadString('margin_right');
    awbPageSetup.margin_top       := Reg.ReadString('margin_top');
    awbPageSetup.Print_Background := Reg.ReadString('Print_Background');
    awbPageSetup.Shrink_To_Fit    := Reg.ReadString('Shrink_To_Fit');
    Reg.CloseKey;
  finally
    // Deixar mostrar o erro ...
  end;

  Reg.Free;
end;

procedure SetPageSetupToRegistry(awbPageSetup: TwbPageSetup);
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;

  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Internet Explorer\PageSetup', True);
    Reg.WriteString('font', awbPageSetup.font);
    Reg.WriteString('footer', awbPageSetup.footer);
    Reg.WriteString('header', awbPageSetup.header);
    Reg.WriteString('margin_bottom', awbPageSetup.margin_bottom);
    Reg.WriteString('margin_left', awbPageSetup.margin_left);
    Reg.WriteString('margin_right', awbPageSetup.margin_right);
    Reg.WriteString('margin_top', awbPageSetup.margin_top);
    Reg.WriteString('Print_Background', awbPageSetup.Print_Background);
    Reg.WriteString('Shrink_To_Fit', awbPageSetup.Shrink_To_Fit);
    Reg.CloseKey;
  finally
    // Deixar mostrar o erro ...
  end;

  Reg.Free;
end;

function TextToHtml(const aText: String): String;
begin
  Result := aText;

  // Common html tags :

  // 2015-11-13 Does not allow word wrap !!! String_SubstFast(' ', '&nbsp;', Result);

  // 2015-11-13 So, we replace by single space + &nbsp;
  Result := String_Subst('  ', ' &nbsp;', Result, csCaseSensitive, true);

  String_SubstFast('>', '&gt;',       Result);
  String_SubstFast('<', '&lt;',       Result);
  String_SubstFast(#13#10, '<br>',    Result); // To be done after handling '>' and '<'   !

  // Lowercase letters :
  String_SubstFast('�', '&euml;',     Result);  // 2017-02-20
  String_SubstFast('�', '&eacute;',   Result);
  String_SubstFast('�', '&egrave;',   Result);
  String_SubstFast('�', '&ecirc;',    Result);

  String_SubstFast('�', '&auml;',     Result);  // 2017-02-20
  String_SubstFast('�', '&aring;',    Result);  // 2017-02-20
  String_SubstFast('�', '&aacute;',   Result);
  String_SubstFast('�', '&agrave;',   Result);
  String_SubstFast('�', '&acirc;',    Result);

  String_SubstFast('�', '&iuml;',     Result);  // 2017-02-20
  String_SubstFast('�', '&iacute;',   Result);
  String_SubstFast('�', '&igrave;',   Result);
  String_SubstFast('�', '&icirc;',    Result);

  String_SubstFast('�', '&oacute;',   Result);
  String_SubstFast('�', '&ograve;',   Result);
  String_SubstFast('�', '&ocirc;',    Result);
  String_SubstFast('�', '&eth;',      Result);  // 2017-02-20
  String_SubstFast('�', '&ouml;',     Result);  // 2017-02-20
  String_SubstFast('�', '&otilde;',   Result);  // 2017-02-20

  String_SubstFast('�', '&uacute;',   Result);
  String_SubstFast('�', '&ugrave;',   Result);
  String_SubstFast('�', '&ucirc;',    Result);
  String_SubstFast('�', '&yacute;',   Result);  // 2017-02-20
  String_SubstFast('�', '&yuml;',     Result);  // 2017-02-20


  // Uppercase letters :
  String_SubstFast('�', '&Eacute;',   Result);
  String_SubstFast('�', '&Egrave;',   Result);
  String_SubstFast('�', '&Ecirc;',    Result);
  String_SubstFast('�', '&Euml;',     Result);  // 2017-02-20

  String_SubstFast('�', '&Aacute;',   Result);
  String_SubstFast('�', '&Agrave;',   Result);
  String_SubstFast('�', '&Acirc;',    Result);
  String_SubstFast('�', '&Aring;',    Result);  // 2017-02-20
  String_SubstFast('�', '&Auml;',     Result);  // 2017-02-20

  String_SubstFast('�', '&Iacute;',   Result);
  String_SubstFast('�', '&Igrave;',   Result);
  String_SubstFast('�', '&Icirc;',    Result);
  String_SubstFast('�', '&Iuml;',     Result);  // 2017-02-20


  String_SubstFast('�', '&Oacute;',   Result);
  String_SubstFast('�', '&Ograve;',   Result);
  String_SubstFast('�', '&Ocirc;',    Result);
  String_SubstFast('�', '&Otilde;',   Result);  // 2017-02-20
  String_SubstFast('�', '&Ouml;',     Result);  // 2017-02-20

  String_SubstFast('�', '&Uuml;',     Result);  // 2017-02-20
  String_SubstFast('�', '&Uacute;',   Result);
  String_SubstFast('�', '&Ugrave;',   Result);
  String_SubstFast('�', '&Ucirc;',    Result);

  String_SubstFast('�', '&Yacute;',   Result);  // 2017-02-20


  // Uncommon symbols :
  String_SubstFast('�', '&aelig;',    Result);  // 2017-02-20
  String_SubstFast('�', '&AElig;',    Result);  // 2017-02-20
  String_SubstFast('�', '&ccedil;',   Result);  // 2017-02-20
  String_SubstFast('�', '&ntilde;',   Result);  // 2017-02-20
  String_SubstFast('�', '&Ntilde;',   Result);  // 2017-02-20
  String_SubstFast('�', '&oslash;',   Result);  // 2017-02-20
  String_SubstFast('�', '&Oslash;',   Result);  // 2017-02-20
  String_SubstFast('�', '&szlig;',    Result);  // 2017-02-20
  String_SubstFast('�', '&THORN;',    Result);  // 2017-02-20
  String_SubstFast('�', '&thorn;',    Result);  // 2017-02-20
  String_SubstFast('�', '&ETH;',      Result);  // 2017-02-20
  String_SubstFast('�', '&divide;',   Result);  // 2017-02-20
  String_SubstFast('�', '&times;',    Result);  // 2017-02-20
  String_SubstFast('�', '&iquest;',   Result);  // 2017-02-20
  String_SubstFast('�', '&frac34;',   Result);  // 2017-02-20
  String_SubstFast('�', '&frac12;',   Result);  // 2017-02-20
  String_SubstFast('�', '&frac14;',   Result);  // 2017-02-20
  String_SubstFast('�', '&raquo;',    Result);  // 2017-02-20
  String_SubstFast('�', '&ordm;',     Result);  // 2017-02-20
  String_SubstFast('�', '&sup1;',     Result);  // 2017-02-20
  String_SubstFast('�', '&cedil;',    Result);  // 2017-02-20
  String_SubstFast('�', '&middot;',   Result);  // 2017-02-20
  String_SubstFast('�', '&para;',     Result);  // 2017-02-20
  String_SubstFast('�', '&micro;',    Result);  // 2017-02-20
  String_SubstFast('�', '&acute;',    Result);  // 2017-02-20
  String_SubstFast('�', '&sup3;',     Result);  // 2017-02-20
  String_SubstFast('�', '&sup2;',     Result);  // 2017-02-20
  String_SubstFast('�', '&plusmn;',   Result);  // 2017-02-20
  String_SubstFast('�', '&deg;',      Result);  // 2017-02-20
  String_SubstFast('�', '&macr;',     Result);  // 2017-02-20
  String_SubstFast('�', '&reg;',      Result);  // 2017-02-20
  String_SubstFast('�', '&not;',      Result);  // 2017-02-20
  String_SubstFast('�', '&laquo;',    Result);  // 2017-02-20
  String_SubstFast('�', '&ordf;',     Result);  // 2017-02-20
  String_SubstFast('�', '&copy;',     Result);  // 2017-02-20
  String_SubstFast('�', '&uml;',      Result);  // 2017-02-20
  String_SubstFast('�', '&sect;',     Result);  // 2017-02-20
  String_SubstFast('�', '&brvbar;',   Result);  // 2017-02-20
  String_SubstFast('�', '&yen;',      Result);  // 2017-02-20
  String_SubstFast('�', '&curren;',   Result);  // 2017-02-20
  String_SubstFast('�', '&pound;',    Result);  // 2017-02-20
  String_SubstFast('�', '&cent;',     Result);  // 2017-02-20
  String_SubstFast('�', '&iexcl;',    Result);  // 2017-02-20
  String_SubstFast('�', '&euro;',     Result);  // 2017-02-20
end;

function HtmlToText(const Html: String; const RemoveTags: Boolean = false): String;
var
  P: PChar;
  InTag: Boolean;
begin
  Result := Html;

  // Common html tags :
  String_SubstFast('&amp;',    '&',    Result); // 2017-02-20

  String_SubstFast('&nbsp;',   ' ',    Result);
  String_SubstFast('&gt;',     '>',    Result);
  String_SubstFast('&lt;',     '<',    Result);
  String_SubstFast('<br>',     #13#10, Result); // NEED TO BE AFTER    '>' AND  '<'   !

  String_SubstFast('&quot;',   '"',    Result); // 2017-02-20
  String_SubstFast('&apos;',   '''',   Result);

  // Lowercase letters :
  if pos('&', Result) <> 0 then
  begin
    String_SubstFast('&euml;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&eacute;', '�',    Result);
    String_SubstFast('&egrave;', '�',    Result);
    String_SubstFast('&ecirc;',  '�',    Result);

    String_SubstFast('&auml;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&aring;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&aacute;', '�',    Result);
    String_SubstFast('&agrave;', '�',    Result);
    String_SubstFast('&acirc;',  '�',    Result);

    String_SubstFast('&iuml;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&iacute;', '�',    Result);
    String_SubstFast('&igrave;', '�',    Result);
    String_SubstFast('&icirc;',  '�',    Result);

    String_SubstFast('&oacute;', '�',    Result);
    String_SubstFast('&ograve;', '�',    Result);
    String_SubstFast('&ocirc;',  '�',    Result);
    String_SubstFast('&eth;',    '�',    Result);  // 2017-02-20
    String_SubstFast('&ouml;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&otilde;', '�',    Result);  // 2017-02-20

    String_SubstFast('&uacute;', '�',    Result);
    String_SubstFast('&ugrave;', '�',    Result);
    String_SubstFast('&ucirc;',  '�',    Result);
    String_SubstFast('&yacute;', '�',    Result);  // 2017-02-20
    String_SubstFast('&yuml;',   '�',    Result);  // 2017-02-20
  end;

  // Uppercase letters :
  if pos('&', Result) <> 0 then
  begin
    String_SubstFast('&Eacute;', '�',    Result);
    String_SubstFast('&Egrave;', '�',    Result);
    String_SubstFast('&Ecirc;',  '�',    Result);
    String_SubstFast('&Euml;',   '�',    Result);  // 2017-02-20

    String_SubstFast('&Aacute;', '�',    Result);
    String_SubstFast('&Agrave;', '�',    Result);
    String_SubstFast('&Acirc;',  '�',    Result);
    String_SubstFast('&Aring;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&Auml;',   '�',    Result);  // 2017-02-20

    String_SubstFast('&Iacute;', '�',    Result);
    String_SubstFast('&Igrave;', '�',    Result);
    String_SubstFast('&Icirc;',  '�',    Result);
    String_SubstFast('&Iuml;',   '�',    Result);  // 2017-02-20


    String_SubstFast('&Oacute;', '�',    Result);
    String_SubstFast('&Ograve;', '�',    Result);
    String_SubstFast('&Ocirc;',  '�',    Result);
    String_SubstFast('&Otilde;', '�',    Result);  // 2017-02-20
    String_SubstFast('&Ouml;',   '�',    Result);  // 2017-02-20

    String_SubstFast('&Uuml;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&Uacute;', '�',    Result);
    String_SubstFast('&Ugrave;', '�',    Result);
    String_SubstFast('&Ucirc;',  '�',    Result);

    String_SubstFast('&Yacute;', '�',    Result);  // 2017-02-20
  end;

  // Uncommon symbols :
  if pos('&', Result) <> 0 then
  begin
    String_SubstFast('&aelig;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&AElig;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&ccedil;', '�',    Result);  // 2017-02-20
    String_SubstFast('&ntilde;', '�',    Result);  // 2017-02-20
    String_SubstFast('&Ntilde;', '�',    Result);  // 2017-02-20
    String_SubstFast('&oslash;', '�',    Result);  // 2017-02-20
    String_SubstFast('&Oslash;', '�',    Result);  // 2017-02-20
    String_SubstFast('&szlig;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&THORN;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&thorn;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&ETH;',    '�',    Result);  // 2017-02-20
    String_SubstFast('&divide;', '�',    Result);  // 2017-02-20
    String_SubstFast('&times;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&iquest;', '�',    Result);  // 2017-02-20
    String_SubstFast('&frac34;', '�',    Result);  // 2017-02-20
    String_SubstFast('&frac12;', '�',    Result);  // 2017-02-20
    String_SubstFast('&frac14;', '�',    Result);  // 2017-02-20
    String_SubstFast('&raquo;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&ordm;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&sup1;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&cedil;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&middot;', '�',    Result);  // 2017-02-20
    String_SubstFast('&para;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&micro;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&acute;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&sup3;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&sup2;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&plusmn;', '�',    Result);  // 2017-02-20
    String_SubstFast('&deg;',    '�',    Result);  // 2017-02-20
    String_SubstFast('&macr;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&reg;',    '�',    Result);  // 2017-02-20
    String_SubstFast('&not;',    '�',    Result);  // 2017-02-20
    String_SubstFast('&laquo;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&ordf;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&copy;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&uml;',    '�',    Result);  // 2017-02-20    String_SubstFast('',  '',    Result);  // 2017-02-20
    String_SubstFast('&sect;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&brvbar;', '�',    Result);  // 2017-02-20
    String_SubstFast('&yen;',    '�',    Result);  // 2017-02-20
    String_SubstFast('&curren;', '�',    Result);  // 2017-02-20
    String_SubstFast('&pound;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&cent;',   '�',    Result);  // 2017-02-20
    String_SubstFast('&iexcl;',  '�',    Result);  // 2017-02-20
    String_SubstFast('&euro;',   '�',   Result);   // 2017-02-20
  end;

  if RemoveTags then
  begin
    P := PChar(Result);
    Result := '';
    InTag := false;

    repeat
      case P^ of
        '<': InTag := true;
        '>': InTag := false;
        #13, #10: ; {do nothing}
        else
          if not InTag then
          begin
            if (P^ in [#9, #32]) and ((P+1)^ in [#10, #13, #32, #9, '<']) then
            else
              Result := Result + P^;
          end;
      end;
      Inc(P);
    until (P^ = #0);
  end;
end;

function TextToXml(const aText: String): String;
begin
  Result := aText;

  String_SubstFast('&',  '&amp;',  Result);     // !!! First operation because it replace '&' used below !!!
  String_SubstFast('<',  '&lt;',   Result);
  String_SubstFast('>',  '&gt;',   Result);
  String_SubstFast('"',  '&quot;', Result);
  String_SubstFast('''', '&apos;', Result);
  String_SubstFast('�',  '&euro;', Result);
  String_SubstFast(#$D,  '&#xD;',  Result);
  String_SubstFast(#$A,  '&#xA;',  Result);
end;

function XmlToText(const Xml: String): String;
var
  P: PChar;
  InTag: Boolean;
begin
  Result := Xml;

  String_SubstFast('&amp;',  '&',  Result);

  String_SubstFast('&nbsp;', ' ',  Result);
  String_SubstFast('&gt;',   '>',  Result);
  String_SubstFast('&lt;',   '<',  Result);
  String_SubstFast('&quot;', '"',  Result);
  String_SubstFast('&apos;', '''', Result);
  String_SubstFast('&euro;', '�',  Result);
  String_SubstFast('&#xD;', #$D,   Result);
  String_SubstFast('&#xA;', #$A,   Result);
end;

end.
