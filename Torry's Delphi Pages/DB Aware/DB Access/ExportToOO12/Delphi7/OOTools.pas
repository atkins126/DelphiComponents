unit OOTools;

interface

uses Variants;

type
  TCellHoriJustify = (chjStandard = 0,chjRight=1,chjLeft=3,chjCenter=2);


var
  OpenOffice, StarDesktop: Variant;
  OOIntrospection, OOReflection: Variant;

procedure ConnectOpenOffice;
function  CreateUnoService(serviceName: String): Variant;
function  CreateUnoStruct(structName: String; indexMax: Integer= -1): Variant;
function  CreateProperties(propertyList: array of Variant): Variant;
function  MakePropertyValue(PropName: string; PropValue: Variant): Variant;
function  HasUnoInterfaces(thisObject: Variant; interfaceList: array of String): Boolean;
function  isNullEmpty(thisVariant: Variant): Boolean;
function  dummyArray: Variant;
function  GetProcessServiceManager: Variant;

procedure execDispatch(Command: String; params: Variant);
procedure copyToClipboard;
procedure pasteFromClipboard;
function  convertToURL(winAddr: String): String;
function  convertFromURL(URLaddr: String): String;
function  RGB(redV, greenV, blueV: byte): Longword;
function  Red(colorOOo: Longword): Byte;
function  Green(colorOOo: Longword): Byte;
function  Blue(colorOOo: Longword): Byte;

implementation

uses Classes, Controls, Forms, SysUtils, ComObj;

type
  EOOoError= class(Exception);

const USASCIIexcl =   // US-ASCII characters to be replaced by % hexa
  '%%25 %20<%3C>%3E#%23"%22{%7B}%7D|%7C\%5C^%5E[%5B]%5D`%60';
const UTF8chars =        // non US-ASCII characters to be replaced by % hexa % hexa
  '�%C3%80�%C3%81�%C3%82�%C3%83�%C3%84�%C3%85�%C3%86�%C3%87�%C3%88�%C3%89�%C3%8A�%C3%8B�%C3%8C�%C3%8D�%C3%8E�%C3%8F' +
  '�%C3%90�%C3%91�%C3%92�%C3%93�%C3%94�%C3%95�%C3%96�%C3%97�%C3%98�%C3%99�%C3%9A�%C3%9B�%C3%9C�%C3%9D�%C3%9E�%C3%9F' +
  '�%C3%A0�%C3%A1�%C3%A2�%C3%A3�%C3%A4�%C3%A5�%C3%A6�%C3%A7�%C3%A8�%C3%A9�%C3%AA�%C3%AB�%C3%AC�%C3%AD�%C3%AE�%C3%AF' +
  '�%C3%B0�%C3%B1�%C3%B2�%C3%B3�%C3%B4�%C3%B5�%C3%B6�%C3%B7�%C3%B8�%C3%B9�%C3%BA�%C3%BB�%C3%BC�%C3%BD�%C3%BE�%C3%BF' +
  '�%C5%92�%C5%93';

const URLprefix : Array [1..7] of String =
    ('file:', 'ftp:', 'news:', 'http:', 'mailto:', 'macro:', 'private:');

const  // error messages texts
  mess01= 'OpenOffice connection is impossible';
  mess02= 'Incorrect argument list';
  mess03= 'The argument in position %d (starting from 0) is incorrect';
  mess05= 'Impossible to create service : %s';
  mess07= 'Impossible to find the interfaces of this object';


var
  disp : Variant;

  { -------------------------------------------------- }


// Tests wether the Variant contains something
function  isNullEmpty(thisVariant: Variant): Boolean;
begin
  Result:= VarIsEmpty(thisVariant) or VarIsNull(thisVariant) or VarIsClear(thisVariant);
end;




// equivalent to OOoBasic function
function CreateUnoService(serviceName: String): Variant;
begin
  Result:= OpenOffice.createInstance(serviceName);
  if isNullEmpty(Result) then    Raise EOOoError.Create(Format(mess05, [serviceName]));
end;



// equivalent to OOoBasic function; in principle not necessary for the user
function GetProcessServiceManager: Variant;
begin
  Result := CreateOleObject('com.sun.star.ServiceManager');
  if isNullEmpty(Result) then    Raise EOOoError.Create(mess01);
end;


// initiate COM interface towards OpenOffice
procedure ConnectOpenOffice;
begin
  if not isNullEmpty(OpenOffice) then exit;
  Screen.Cursor:= crHourglass;      Application.ProcessMessages;
  try
    OpenOffice:= GetProcessServiceManager;
    StarDesktop:=       CreateUnoService('com.sun.star.frame.Desktop');
    disp:=              CreateUnoService('com.sun.star.frame.DispatchHelper');
    OOIntrospection:=  CreateUnoService('com.sun.star.beans.Introspection');
    OOReflection:=     CreateUnoService('com.sun.star.reflection.CoreReflection');
  finally
    Screen.Cursor:= crDefault;
  end;
end;


// equivalent to OOoBasic function
function CreateUnoStruct(structName: String; indexMax: Integer= -1): Variant;
var
  d: Integer;
begin
  if indexMax < 0  then
    Result:= OpenOffice.Bridge_GetStruct(structName)
  else begin
    Result:= VarArrayCreate([0, indexMax], varVariant);
    for d:= 0 to indexMax  do
      Result[d]:=  OpenOffice.Bridge_GetStruct(structName);
  end;
end;


function MakePropertyValue(PropName: string; PropValue: Variant): Variant;
begin
  Result:= OpenOffice.Bridge_GetStruct('com.sun.star.beans.PropertyValue');
  Result.Name:= PropName;   Result.Value:= PropValue;
end;


function CreateProperties(propertyList: array of Variant): Variant;
var
  x, y, xMax: Integer;
begin
  xMax:= High(propertyList);
  if (not odd(xMax)) or (xMax < 1)  then
    Raise EOOoError.Create(mess02);

  Result:= VarArrayCreate([0, xMax shr 1], varVariant);   x:= 0;  y:= 0;
  repeat
    Result[y]:=  OpenOffice.Bridge_GetStruct('com.sun.star.beans.PropertyValue');
    Case VarType(propertyList[x])of { check that the argument is a String }
    varOleStr, varStrArg, varString:    Result[y].Name:= propertyList[x];
    else
      Raise EOOoError.Create(Format(mess03, [x]));
    end;
    Result[y].Value:= propertyList[x +1];
    inc(y); inc(x,2);
  until x > xMax;
end;


// creates an empty array for an empty list
function dummyArray: Variant;
begin
  Result:= VarArrayCreate([0, -1], varVariant);
end;



// equivalent to OOoBasic function
function  HasUnoInterfaces(thisObject: Variant; interfaceList: array of String): Boolean;
var
  objInterf: TStringList;
  insp, info1, info2, info3: Variant;  x, x2 : Integer;  oneInterf: String;
begin
  Result:= False;
  objInterf:= TStringList.Create;
  try
    insp:= OOIntrospection.inspect(thisObject);
    info1:= insp.getMethods(-1);
    for x:= 0 to VarArrayHighBound(info1, 1) do begin
      info2:= info1[x];  info3:= info2.DeclaringClass;  oneInterf:= info3.Name;
      if (oneInterf <> '')  and (objInterf.IndexOf(oneInterf) < 0)  then
        objInterf.Add(oneInterf);
    end;
    for x:= 0 to High(interfaceList) do begin
      x2:= objInterf.IndexOf(interfaceList[x]);
      if x2 < 0  then exit;
      if objInterf.Strings[x2] <> interfaceList[x]  then exit; // v�rifier la casse
    end;
    Result:= True;
  except
    Raise EOOoError.Create(mess07);
  end;
end;


// calling OpenOffice dispatch, like the macro recorder
procedure execDispatch(Command: String; params: Variant);
begin
  disp.executeDispatch(StarDesktop.CurrentFrame, Command, '', 0, params);
end;


procedure copyToClipboard;
begin
  execDispatch('.uno:Copy', dummyArray);
end;


procedure pasteFromClipboard;
begin
  execDispatch('.uno:Paste', dummyArray);
end;




{ ---------  URL conversion : see RFC 2396  ---------------------
  characters to be changed are converted to UTF8,
  and each byte is written in hexadecimal preceded by %

  functions similar to those of OOoBasic    }

function convertToURL(winAddr: String): String;
var
  x : Integer; s, sLow : String;

  function escapeToUTF8URL(c: Char): String;
  var
    x: Integer;
  begin
    if ord(c) < 128  then begin
      x:= Pos(c, USASCIIexcl);
      if (c in ['0'..'9', 'a'..'z', 'A'..'Z']) or (x = 0) then  
        Result:= c    // accepted, reserved or not reserved characters
      else            // excluded characters, to be converted
        Result:= Copy(USASCIIexcl, x+1, 3);
    end else begin    // convert to UTF8 with two bytes
      x:= Pos(c, UTF8chars);
      if x > 0 then
        Result:= Copy(UTF8chars, x+1, 6)
      else            // unknown character ( update table UTF8chars ? )
        Result:= '?';
    end;
  end;

  function existsPrefix: Boolean;
  var
    x: Integer;
  begin
    Result:= False;
    for x:= 1 to High(URLprefix) do begin
      if Pos(URLprefix[x], sLow) = 1 then
        begin Result:= True; break; end;
    end;
  end;

begin { -------- convertToURL ---------- }
  s:= StringReplace(winAddr, '\', '/', [rfReplaceAll]);
  sLow:= AnsiLowerCase(s);
  if existsPrefix then
    Result:= ''
  else
    if Pos('@', sLow) > 0 then
      Result:= 'mailto:'
    else
      Result:= 'file:///';
  for x:= 1 to Length(s) do
    Result:= Result + escapeToUTF8URL(s[x]);
end;


function convertFromURL(URLaddr: String): String;
const
  pr= 'file:///';
var
  s : String; x: Integer;
begin
  s:= URLaddr;
  if Pos(pr, LowerCase(URLaddr)) = 1 then begin   // special case : file:///
    Delete(s, 1, Length(pr));
    s:= StringReplace(s, '/', '\', [rfReplaceAll]);
  end;
  x:= 1;
  while x < Length(UTF8chars) do begin  // first replace 2-bytes codes
    s:= StringReplace(s, Copy(UTF8chars, x+1, 6), UTF8chars[x], [rfReplaceAll, rfIgnoreCase]);
    inc(x, 7);
  end;
  x:= 1;
  while x < Length(USASCIIexcl) do begin
    s:= StringReplace(s, Copy(USASCIIexcl, x+1, 3), USASCIIexcl[x], [rfReplaceAll, rfIgnoreCase]);
    inc(x, 4);
  end;
  Result:= s;
end;


{  -------------  color functions  ---------------
        functions identical to those of OOoBasic               }


function RGB(redV, greenV, blueV: byte): Longword;
begin
  Result:= (redV shl 16) + (greenV shl 8) +blueV
end;


function Blue(colorOOo: Longword): Byte;
begin
  Result:= colorOOo and 255
end;


function Green(colorOOo: Longword): Byte;
begin
  Result:= (colorOOo shr 8) and 255
end;


function Red(colorOOo: Longword): Byte;
begin
  Result:= (colorOOo shr 16) and 255
end;

end.
