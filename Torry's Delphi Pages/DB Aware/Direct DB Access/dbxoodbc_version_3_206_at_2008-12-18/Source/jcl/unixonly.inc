{$IFNDEF UNIXONLY_INC}
{$DEFINE UNIXONLY_INC}

{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: unixonly.inc, released on 2004-06-21

Last Modified: 2004-05-07

You may retrieve the latest version of this file at the JCL home page,
located at http://homepages.borland.com/jedi/jcl/

Known Issues:
-----------------------------------------------------------------------------}

// Last modified: $Date: 07-01-18 16:18 $
// For history see end of file

{$IFNDEF JEDI_INC}
ALERT_jedi_inc_missing
// This inc file depends on jedi.inc which has to
// be included first (usually indirectly through
// the inclusion of jcl.inc).
{$ENDIF ~JEDI_INC}

// Suppress platform warnings which are irrelevant
// because the including unit can only be compiled
// for Unix platforms anyway.

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

// Cause a compilation error for non-Unix platforms.

{$IFNDEF UNIX}
  {$IFDEF SUPPORTS_COMPILETIME_MESSAGES}
    {$MESSAGE FATAL 'This unit is only supported on Unix!'}
  {$ELSE}
    'This unit is only supported on Unix!'
  {$ENDIF SUPPORTS_COMPILETIME_MESSAGES}
{$ENDIF ~UNIX}

{$ENDIF ~UNIXONLY_INC}
