{****************************************************************************}
{                                                                            }
{ Project JEDI Code Library (JCL)                                            }
{                                                                            }
{ The contents of this file are subject to the Mozilla Public License        }
{ Version 1.1 (the "License"); you may not use this file except in           }
{ compliance with the License. You may obtain a copy of the License at       }
{ http://www.mozilla.org/MPL/                                                }
{                                                                            }
{ Software distributed under the License is distributed on an "AS IS" basis, }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   }
{ for the specific language governing rights and limitations under the       }
{ License.                                                                   }
{                                                                            }
{ The Original Code is jcl.inc                                               }
{                                                                            }
{ The Initial Developer of the Original Code is Marcel van Brakel.           }
{ Portions created by Marcel van Brakel are Copyright (C) Marcel van Brakel. }
{                                                                            }
{ Contributors:                                                              }
{   Marcel van Brakel                                                        }
{   Matthias Thoma (mthoma)                                                  }
{   Petr Vones                                                               }
{   Robert Marquardt (marquardt)                                             }
{   Robert Rossmair (rrossmair)                                              }
{                                                                            }
{****************************************************************************}
{                                                                            }
{ This include file defines various JCL specific defines. The more generic   }
{ defines are defined in the jedi.inc file which is shared with the JEDI VCL.}
{                                                                            }
{****************************************************************************}

{$B-} // Boolean shortcut evaluation
{$H+} // Long strings
{$J-} // Read-only typed constants
{$T-} // Type checked pointers off

{+}
{$IFDEF JCL_DEBUG}
  {$D+,L+,O-}
{$ELSE}
  {$IFDEF RELEASE}
    {$D-,O+}
  {$ELSE}
    {$D-,O+}
  {$ENDIF}
{$ENDIF}
{+.}

{$I jedi.inc} // Pull in the JCL/J-VCL shared directives

{$IFNDEF JEDI_INC}
ALERT_jedi_inc_incompatible
// secure against old versions of jedi.inc.
{$ENDIF ~JEDI_INC}

{$IFNDEF JCLINSTALL}
  {$IFDEF CLR}
    {----------------------------}
    { BDS                        }
    {----------------------------}
    {$IFDEF BDS3}
      {$I jcld9.net.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS3}
    {----------------------------}
    {$IFDEF BDS4}
      {$I jcld10.net.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS4}
    {----------------------------}
  {$ELSE ~CLR}
    {----------------------------}
    { Kylix                      }
    {----------------------------}
    // KYLIX3 is not defined (version numbers comparisons are wrong)
    // won't fix because of possible bug with floating point comparisons
    // at compile time
    {$IFDEF KYLIX}
      {$IFDEF BCB}
        {$I jclkc3.inc}
      {$ELSE ~BCB}
        {$I jclkd3.inc}
      {$ENDIF ~BCB}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF KYLIX}
    {----------------------------}
    { C++Builder                 }
    {----------------------------}
    {$IFDEF BCB5}
      {$I jclc5.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BCB5}
    {----------------------------}
    {$IFDEF BCB6}
      {$I jclc6.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BCB6}
    {----------------------------}
    { Delphi                     }
    {----------------------------}
    {$IFDEF DELPHI5}
      {$I jcld5.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF DELPIH5}
    {----------------------------}
    {$IFDEF DELPHI6}
      {$I jcld6.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF DELPIH6}
    {----------------------------}
    {$IFDEF DELPHI7}
      {$I jcld7.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF DELPIH7}
    {----------------------------}
    { BDS                        }
    {----------------------------}
    // BDS 1 and BDS 2 have the same version numbers for their native compilers
    // no compiler defines are used for BDS 1 and BDS 2
    {$IFDEF BDS1}
      //{$I jclcs1.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS1}
    {----------------------------}
    {$IFDEF BDS2}
      //{$I jcld8.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS2}
    {----------------------------}
    {$IFDEF BDS3}
      {$I jcld9.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS3}
    {----------------------------}
    {$IFDEF BDS4}
      {$I jcld10.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS4}
    {----------------------------}
    {$IFDEF BDS5}
      {$I jcld11.inc}
      {$DEFINE JCL_CONFIGURED}
    {$ENDIF BDS5}
    {----------------------------}
  {$ENDIF ~CLR}

  // check configuration
  {$IFNDEF JCL_CONFIGURED}
    {$IFDEF SUPPORTS_COMPILETIME_MESSAGES}
      {$MESSAGE FATAL 'Your Delphi/BCB version is not supported by this JCL version!'}
    {$ELSE}
      'Your Delphi/BCB version is not supported by this JCL version!'
    {$ENDIF SUPPORTS_COMPILETIME_MESSAGES}
  {$ENDIF !JCL_CONFIGURED}

{$ENDIF ~JCLINSTALL}

// Math precision selection, mutually exclusive
{$IFDEF MATH_EXTENDED_PRECISION}
  {$UNDEF MATH_SINGLE_PRECISION}
  {$UNDEF MATH_DOUBLE_PRECISION}
{$ENDIF}
{$IFDEF MATH_DOUBLE_PRECISION}
  {$UNDEF MATH_SINGLE_PRECISION}
  {$UNDEF MATH_EXTENDED_PRECISION}
{$ENDIF}
{$IFDEF MATH_SINGLE_PRECISION}
  {$UNDEF MATH_DOUBLE_PRECISION}
  {$UNDEF MATH_EXTENDED_PRECISION}
{$ENDIF}

{$IFNDEF MATH_EXTENDED_PRECISION}
  {$IFNDEF MATH_DOUBLE_PRECISION}
    {$IFNDEF MATH_SINGLE_PRECISION}
      {$DEFINE MATH_EXTENDED_PRECISION}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

{$IFDEF SUPPORTS_UNSAFE_WARNINGS}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

{$IFNDEF DROP_OBSOLETE_CODE}
  {$DEFINE KEEP_DEPRECATED}
{$ENDIF}

{$IFDEF CLR}
 {$WARN UNSAFE_TYPE ON}
 {$WARN UNSAFE_CODE ON}
 {$WARN UNSAFE_CAST ON}
 {$WARN UNIT_PLATFORM OFF}

 {$DEFINE MSWINDOWS}
 {$DEFINE PIC}
 {$DEFINE PUREPASCAL}
{$ENDIF CLR}
