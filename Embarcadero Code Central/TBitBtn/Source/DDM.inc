
{$DEFINE D1}
{$DEFINE D2_up}
{$DEFINE D3_up}
{$DEFINE D4_up}
{$DEFINE D5_up}
{$DEFINE D6_up}
{$DEFINE D7_up}
{$DEFINE D2005_up}
{$DEFINE BDS2005_up}

{ DELPHI 1 }
{$IFNDEF VER80}
{$UNDEF D2_up}
{$UNDEF D3_up}
{$UNDEF D4_up}
{$UNDEF D5_up}
{$UNDEF D6_up}
{$UNDEF D7_up}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 2 }
{$IFDEF VER90}
{$UNDEF D1}
{$UNDEF D3_up}
{$UNDEF D4_up}
{$UNDEF D5_up}
{$UNDEF D6_up}
{$UNDEF D7_up}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 3 }
{$IFDEF VER100}
{$UNDEF D1}
{$UNDEF D4_up}
{$UNDEF D5_up}
{$UNDEF D6_up}
{$UNDEF D7_up}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 4 }
{$IFDEF VER120}
{$UNDEF D1}
{$UNDEF D5_up}
{$UNDEF D6_up}
{$UNDEF D7_up}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 5 }
{$IFDEF VER130}
{$UNDEF D1}
{$UNDEF D6_up}
{$UNDEF D7_up}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 6 }
{$IFDEF VER140}
{$UNDEF D1}
{$UNDEF D7_up}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 7 }
{$IFDEF VER150}
{$UNDEF D1}
{$UNDEF D2005_up}
{$UNDEF BDS2005_up}
{$ENDIF}

{ DELPHI 2005 }
{$IFDEF VER170}
{$UNDEF D1}
{$UNDEF BDS2005_up}
{$ENDIF}

{ BDS2006 }
{$IFDEF VER180}
{$UNDEF D1}
{$ENDIF}

