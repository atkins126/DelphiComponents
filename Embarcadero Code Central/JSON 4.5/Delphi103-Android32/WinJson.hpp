﻿// CodeGear C++Builder
// Copyright (c) 1995, 2018 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'WinJson.pas' rev: 33.00 (Android)

#ifndef WinjsonHPP
#define WinjsonHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <System.Classes.hpp>
#include <System.SysUtils.hpp>
#include <System.Types.hpp>

//-- user supplied -----------------------------------------------------------

namespace Winjson
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS EJsonError;
class DELPHICLASS TJson;
class DELPHICLASS TJsonLiteral;
class DELPHICLASS TJsonNull;
class DELPHICLASS TJsonFalse;
class DELPHICLASS TJsonTrue;
class DELPHICLASS TJsonNumber;
class DELPHICLASS TJsonString;
class DELPHICLASS TJsonArray;
struct TJsonMember;
class DELPHICLASS TJsonObject;
class DELPHICLASS TJsonCustomParser;
class DELPHICLASS TJsonParser;
class DELPHICLASS TJsonWriter;
class DELPHICLASS TJsonReader;
//-- type declarations -------------------------------------------------------
typedef System::UnicodeString WideString;

using System::WideChar;

#pragma pack(push,4)
class PASCALIMPLEMENTATION EJsonError : public System::Sysutils::Exception
{
	typedef System::Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall EJsonError(const System::UnicodeString Msg) : System::Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EJsonError(const System::UnicodeString Msg, const System::TVarRec *Args, const int Args_High) : System::Sysutils::Exception(Msg, Args, Args_High) { }
	/* Exception.CreateRes */ inline __fastcall EJsonError(System::PResStringRec ResStringRec) : System::Sysutils::Exception(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall EJsonError(System::PResStringRec ResStringRec, const System::TVarRec *Args, const int Args_High) : System::Sysutils::Exception(ResStringRec, Args, Args_High) { }
	/* Exception.CreateHelp */ inline __fastcall EJsonError(const System::UnicodeString Msg, int AHelpContext) : System::Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EJsonError(const System::UnicodeString Msg, const System::TVarRec *Args, const int Args_High, int AHelpContext) : System::Sysutils::Exception(Msg, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EJsonError(System::PResStringRec ResStringRec, int AHelpContext) : System::Sysutils::Exception(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EJsonError(System::PResStringRec ResStringRec, const System::TVarRec *Args, const int Args_High, int AHelpContext) : System::Sysutils::Exception(ResStringRec, Args, Args_High, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EJsonError() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJson : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	TJson* operator[](const System::UnicodeString Name) { return this->Items[Name]; }
	
private:
	virtual TJson* __fastcall Clone() = 0 ;
	virtual TJson* __fastcall GetAt(int Index);
	virtual TJson* __fastcall GetItem(const System::UnicodeString Name);
	virtual void __fastcall SetAt(int Index, TJson* Value);
	virtual void __fastcall SetItem(const System::UnicodeString Name, TJson* Value);
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder) = 0 /* overload */;
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder, System::WideChar TabChar, int TabSize, int Indentation)/* overload */;
	
public:
	virtual bool __fastcall AsBoolean();
	virtual System::TDateTime __fastcall AsDateTime();
	virtual int __fastcall AsDateTimeOffset();
	virtual double __fastcall AsNumber();
	virtual System::UnicodeString __fastcall AsString();
	__property TJson* At[int Index] = {read=GetAt, write=SetAt};
	__property TJson* Items[const System::UnicodeString Name] = {read=GetItem, write=SetItem/*, default*/};
	virtual bool __fastcall IsArray();
	virtual bool __fastcall IsBoolean();
	virtual bool __fastcall IsDateTime();
	virtual bool __fastcall IsLiteral();
	virtual bool __fastcall IsNull();
	virtual bool __fastcall IsNumber();
	virtual bool __fastcall IsObject();
	virtual bool __fastcall IsString();
	HIDESBASE System::UnicodeString __fastcall ToString(bool PrettyPrint = true, bool UseTabChar = false, int TabSize = 0x2);
	System::TArray__1<System::Byte> __fastcall ToUtf8(bool PrettyPrint = true, bool UseTabChar = false, int TabSize = 0x2);
	void __fastcall ToUtf8File(const System::UnicodeString FileName, bool PrettyPrint = true, bool UseTabChar = false, int TabSize = 0x2);
public:
	/* TObject.Create */ inline __fastcall TJson() : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TJson() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonLiteral : public TJson
{
	typedef TJson inherited;
	
private:
	bool FFreeInstance;
	
public:
	virtual bool __fastcall IsLiteral();
	virtual void __fastcall FreeInstance();
public:
	/* TObject.Create */ inline __fastcall TJsonLiteral() : TJson() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TJsonLiteral() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonNull : public TJsonLiteral
{
	typedef TJsonLiteral inherited;
	
private:
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	
public:
	virtual bool __fastcall IsNull();
public:
	/* TObject.Create */ inline __fastcall TJsonNull() : TJsonLiteral() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TJsonNull() { }
	
	/* Hoisted overloads: */
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonFalse : public TJsonLiteral
{
	typedef TJsonLiteral inherited;
	
private:
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	
public:
	virtual bool __fastcall AsBoolean();
	virtual bool __fastcall IsBoolean();
public:
	/* TObject.Create */ inline __fastcall TJsonFalse() : TJsonLiteral() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TJsonFalse() { }
	
	/* Hoisted overloads: */
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonTrue : public TJsonLiteral
{
	typedef TJsonLiteral inherited;
	
private:
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	
public:
	virtual bool __fastcall AsBoolean();
	virtual bool __fastcall IsBoolean();
public:
	/* TObject.Create */ inline __fastcall TJsonTrue() : TJsonLiteral() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TJsonTrue() { }
	
	/* Hoisted overloads: */
	
};

#pragma pack(pop)

class PASCALIMPLEMENTATION TJsonNumber : public TJson
{
	typedef TJson inherited;
	
private:
	double FValue;
	
protected:
	__fastcall TJsonNumber(double Value);
	
private:
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	
public:
	virtual double __fastcall AsNumber();
	virtual bool __fastcall IsNumber();
	__property double Value = {read=FValue};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TJsonNumber() { }
	
	/* Hoisted overloads: */
	
};


#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonString : public TJson
{
	typedef TJson inherited;
	
private:
	System::UnicodeString FValue;
	
protected:
	__fastcall TJsonString(const System::UnicodeString Value);
	
private:
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	System::TDateTime __fastcall GetDateTime();
	int __fastcall GetDateTimeOffset();
	
public:
	virtual System::UnicodeString __fastcall AsString();
	virtual System::TDateTime __fastcall AsDateTime();
	virtual int __fastcall AsDateTimeOffset();
	virtual bool __fastcall IsDateTime();
	virtual bool __fastcall IsString();
	__property System::UnicodeString Value = {read=FValue};
	__property System::TDateTime DateTime = {read=GetDateTime};
	__property int DateTimeOffset = {read=GetDateTimeOffset, nodefault};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TJsonString() { }
	
	/* Hoisted overloads: */
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonArray : public TJson
{
	typedef TJson inherited;
	
	
private:
	typedef System::DynamicArray<TJson*> _TJsonArray__1;
	
	
public:
	TJson* operator[](int Index) { return this->Elements[Index]; }
	
private:
	_TJsonArray__1 FElements;
	void __fastcall CheckIndex(int Index);
	virtual TJson* __fastcall GetAt(int Index);
	virtual void __fastcall SetAt(int Index, TJson* Value);
	int __fastcall GetElementCount();
	void __fastcall SetElementCount(int Value);
	TJson* __fastcall GetElement(int Index);
	void __fastcall SetElement(int Index, TJson* Element);
	void __fastcall SetRawElement(int Index, TJson* Element);
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder, System::WideChar TabChar, int TabSize, int Indentation)/* overload */;
	
public:
	__fastcall TJsonArray(int ElementCount);
	__fastcall virtual ~TJsonArray();
	__property TJson* Elements[int Index] = {read=GetElement, write=SetElement/*, default*/};
	__property int ElementCount = {read=GetElementCount, write=SetElementCount, nodefault};
	virtual bool __fastcall IsArray();
	void __fastcall SetNull(int Index);
	void __fastcall SetFalse(int Index);
	void __fastcall SetTrue(int Index);
	void __fastcall SetNumber(int Index, double Value);
	void __fastcall SetString(int Index, const System::UnicodeString Value);
	void __fastcall SetDateTime(int Index, const System::TDateTime Value, int Offset = 0x0);
	TJsonArray* __fastcall SetArray(int Index, int ElementCount);
	TJsonObject* __fastcall SetObject(int Index);
	TJson* __fastcall SetJson(int Index, TJson* Value);
};

#pragma pack(pop)

struct DECLSPEC_DRECORD TJsonMember
{
public:
	System::UnicodeString FName;
	TJson* FValue;
};


#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonObject : public TJson
{
	typedef TJson inherited;
	
	
private:
	typedef System::DynamicArray<TJsonMember> _TJsonObject__1;
	
	
public:
	TJson* operator[](const System::UnicodeString Name) { return this->Members[Name]; }
	
private:
	_TJsonObject__1 FMembers;
	int FMemberCount;
	int __fastcall GetMemberCapacity();
	void __fastcall CheckIndex(int Index);
	void __fastcall ClearMember(int Index);
	virtual TJson* __fastcall GetItem(const System::UnicodeString Name);
	virtual void __fastcall SetItem(const System::UnicodeString Name, TJson* Value);
	System::UnicodeString __fastcall GetMemberName(int Index);
	void __fastcall SetMemberName(int Index, const System::UnicodeString Value);
	TJson* __fastcall GetMemberValue(int Index);
	void __fastcall SetMemberValue(int Index, TJson* Value);
	virtual TJson* __fastcall Clone();
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder)/* overload */;
	virtual void __fastcall Write(System::Sysutils::TStringBuilder* StringBuilder, System::WideChar TabChar, int TabSize, int Indentation)/* overload */;
	TJson* __fastcall GetMember(const System::UnicodeString Name);
	void __fastcall SetMember(const System::UnicodeString Name, TJson* Value);
	void __fastcall SetRawMember(int Index, const System::UnicodeString Name, TJson* Value);
	__property int MemberCapacity = {read=GetMemberCapacity, nodefault};
	
public:
	__fastcall TJsonObject();
	__fastcall virtual ~TJsonObject();
	__property int MemberCount = {read=FMemberCount, nodefault};
	__property System::UnicodeString MemberName[int Index] = {read=GetMemberName, write=SetMemberName};
	__property TJson* MemberValue[int Index] = {read=GetMemberValue, write=SetMemberValue};
	__property TJson* Members[const System::UnicodeString Name] = {read=GetMember, write=SetMember/*, default*/};
	int __fastcall Find(const System::UnicodeString Name);
	void __fastcall DeleteAll();
	void __fastcall Delete(int Index)/* overload */;
	void __fastcall Delete(const System::UnicodeString Name)/* overload */;
	virtual bool __fastcall IsObject();
	void __fastcall SetNull(const System::UnicodeString Name);
	void __fastcall SetFalse(const System::UnicodeString Name);
	void __fastcall SetTrue(const System::UnicodeString Name);
	void __fastcall SetNumber(const System::UnicodeString Name, double Value);
	void __fastcall SetString(const System::UnicodeString Name, const System::UnicodeString Value);
	void __fastcall SetDateTime(const System::UnicodeString Name, const System::TDateTime Value, int Offset = 0x0);
	TJsonArray* __fastcall SetArray(const System::UnicodeString Name, int ElementCount);
	TJsonObject* __fastcall SetObject(const System::UnicodeString Name);
	TJson* __fastcall SetJson(const System::UnicodeString Name, TJson* Value);
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonCustomParser : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	System::UnicodeString FText;
	int FLastColumn;
	int FLastPosition;
	int FLastRow;
	int FPosition;
	System::Sysutils::TStringBuilder* FStringBuilder;
	bool __fastcall IsEnd();
	System::WideChar __fastcall Current();
	void __fastcall Next();
	bool __fastcall IsWhiteSpace();
	void __fastcall SkipWhiteSpace();
	bool __fastcall IsStructuralCharacter();
	bool __fastcall IsDigit();
	void __fastcall PositionToRowColumn(int Position, int &Row, int &Column);
	void __fastcall Error(int Position, const System::UnicodeString ErrorMessage);
	void __fastcall Read(System::WideChar C);
	int __fastcall ReadDigit();
	int __fastcall ReadHexaDigit();
	double __fastcall ParseNumber();
	System::UnicodeString __fastcall ParseString();
	
protected:
	__fastcall TJsonCustomParser();
	virtual TJson* __fastcall Parse(const System::UnicodeString Text);
	
public:
	__fastcall virtual ~TJsonCustomParser();
	TJson* __fastcall ParseUtf8(const System::TArray__1<System::Byte> Utf8)/* overload */;
	TJson* __fastcall ParseAnsi(const System::TArray__1<System::Byte> Ansi)/* overload */;
	TJson* __fastcall ParseUtf8(System::Classes::TStream* Stream)/* overload */;
	TJson* __fastcall ParseAnsi(System::Classes::TStream* Stream)/* overload */;
	TJson* __fastcall ParseUtf8File(const System::UnicodeString FileName);
	TJson* __fastcall ParseAnsiFile(const System::UnicodeString FileName);
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonParser : public TJsonCustomParser
{
	typedef TJsonCustomParser inherited;
	
private:
	TJson* __fastcall ParseValue();
	TJson* __fastcall ParseLiteral();
	TJsonObject* __fastcall ParseObject();
	TJsonArray* __fastcall ParseArray();
	
public:
	__fastcall TJsonParser();
	virtual TJson* __fastcall Parse(const System::UnicodeString Text);
public:
	/* TJsonCustomParser.Destroy */ inline __fastcall virtual ~TJsonParser() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TJsonWriter : public System::TObject
{
	typedef System::TObject inherited;
	
	
private:
	typedef System::DynamicArray<bool> _TJsonWriter__1;
	
	
private:
	_TJsonWriter__1 FNesting;
	int FNestedLevel;
	bool FDestroyStream;
	bool FFirstItem;
	bool FPrettyPrint;
	System::Classes::TStream* FStream;
	int FTabSize;
	bool FUseTabChar;
	bool FUtf8;
	void __fastcall AddNesting(bool IsObject);
	bool __fastcall InArray();
	bool __fastcall InObject();
	void __fastcall WriteIndentation();
	void __fastcall WriteSeparator();
	void __fastcall WriteNamePart(const System::UnicodeString Name);
	void __fastcall RequireObject();
	void __fastcall RequireArray();
	bool __fastcall IsEmpty();
	
public:
	__fastcall TJsonWriter(System::Classes::TStream* Stream, bool PrettyPrint, bool UseTabChar, int TabSize, bool Utf8)/* overload */;
	__fastcall TJsonWriter(const System::UnicodeString FileName, bool PrettyPrint, bool UseTabChar, int TabSize)/* overload */;
	__fastcall virtual ~TJsonWriter();
	void __fastcall Check();
	void __fastcall BeginArray()/* overload */;
	void __fastcall BeginObject()/* overload */;
	void __fastcall BeginArray(const System::UnicodeString Name)/* overload */;
	void __fastcall BeginObject(const System::UnicodeString Name)/* overload */;
	void __fastcall EndArray();
	void __fastcall EndObject();
	void __fastcall WriteNull()/* overload */;
	void __fastcall Write(bool Value)/* overload */;
	void __fastcall Write(double Value)/* overload */;
	void __fastcall Write(const System::UnicodeString Value)/* overload */;
	void __fastcall Write(const System::TDateTime Value, int Offset)/* overload */;
	void __fastcall WriteNull(const System::UnicodeString Name)/* overload */;
	void __fastcall Write(const System::UnicodeString Name, bool Value)/* overload */;
	void __fastcall Write(const System::UnicodeString Name, double Value)/* overload */;
	void __fastcall Write(const System::UnicodeString Name, const System::UnicodeString Value)/* overload */;
	void __fastcall Write(const System::UnicodeString Name, const System::TDateTime Value, int Offset)/* overload */;
};

#pragma pack(pop)

enum DECLSPEC_DENUM TJsonItem : unsigned char { itEof, itNull, itFalse, itTrue, itNumber, itString, itBeginArray, itEndArray, itBeginObject, itEndObject };

class PASCALIMPLEMENTATION TJsonReader : public TJsonCustomParser
{
	typedef TJsonCustomParser inherited;
	
	
private:
	typedef System::DynamicArray<bool> _TJsonReader__1;
	
	
private:
	bool FFirstItem;
	bool FIsMember;
	int FItemPosition;
	System::UnicodeString FMemberName;
	_TJsonReader__1 FNesting;
	int FNestedLevel;
	double FNumberValue;
	System::UnicodeString FStringValue;
	bool FWasJsonItem;
	void __fastcall AddNesting(bool IsObject);
	int __fastcall GetColumn();
	int __fastcall GetRow();
	bool __fastcall InArray();
	bool __fastcall InObject();
	TJsonItem __fastcall ParseLiteral();
	TJsonItem __fastcall ReadValue();
	
public:
	__fastcall TJsonReader(const System::UnicodeString Text)/* overload */;
	__fastcall TJsonReader(const System::TArray__1<System::Byte> Data, bool Utf8)/* overload */;
	__fastcall TJsonReader(System::Classes::TStream* Stream, bool Utf8)/* overload */;
	__fastcall TJsonReader(const System::UnicodeString FileName, bool Utf8, bool FromFile)/* overload */;
	HIDESBASE TJsonItem __fastcall Read();
	__property int Column = {read=GetColumn, nodefault};
	__property bool IsMember = {read=FIsMember, nodefault};
	__property int ItemPosition = {read=FItemPosition, nodefault};
	__property System::UnicodeString MemberName = {read=FMemberName};
	__property double NumberValue = {read=FNumberValue};
	__property int Row = {read=GetRow, nodefault};
	__property System::UnicodeString StringValue = {read=FStringValue};
public:
	/* TJsonCustomParser.Destroy */ inline __fastcall virtual ~TJsonReader() { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define JsonMIME u"application/json"
#define JsonFileExtension u".json"
}	/* namespace Winjson */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_WINJSON)
using namespace Winjson;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// WinjsonHPP
