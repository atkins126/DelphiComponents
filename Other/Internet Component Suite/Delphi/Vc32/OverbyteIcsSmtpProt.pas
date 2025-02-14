{*_* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


Author:       Fran�ois PIETTE
Object:       TSmtpCli class implements the SMTP protocol (RFC-821)
              Support file attachement using MIME format (RFC-1521, RFC-2045)
              Support authentification (RFC-2104)
              Support HTML mail with embedded images.
Creation:     09 october 1997
Version:      7.24
EMail:        http://www.overbyte.be        francois.piette@overbyte.be
Support:      Use the mailing list twsocket@elists.org
              Follow "support" link at http://www.overbyte.be for subscription.
Legal issues: Copyright (C) 1997-2009 by Fran�ois PIETTE
              Rue de Grady 24, 4053 Embourg, Belgium. Fax: +32-4-365.74.56
              <francois.piette@overbyte.be>
              SSL implementation includes code written by Arno Garrels,
              Berlin, Germany, contact: <arno.garrels@gmx.de>
              
              This software is provided 'as-is', without any express or
              implied warranty.  In no event will the author be held liable
              for any  damages arising from the use of this software.

              Permission is granted to anyone to use this software for any
              purpose, including commercial applications, and to alter it
              and redistribute it freely, subject to the following
              restrictions:

              1. The origin of this software must not be misrepresented,
                 you must not claim that you wrote the original software.
                 If you use this software in a product, an acknowledgment
                 in the product documentation would be appreciated but is
                 not required.

              2. Altered source versions must be plainly marked as such, and
                 must not be misrepresented as being the original software.

              3. This notice may not be removed or altered from any source
                 distribution.

              4. You must register this software by sending a picture postcard
                 to the author. Use a nice stamp and mention your name, street
                 address, EMail address and any comment you like to say.

How to use the HTML feature:
    An HTML mail message is composed of 3 parts: an HTML formatted message,
    a plain text message and a collection of document files which may be
    reference in the HTML (for example images).

    The HTML mail message is formatted by the THtmlSmtpCli component using the
    MIME multipart format. There are two level of parts. An external level
    with the message as part one and the documents in one or more parts.
    The first part is itself a multipart message. The first part in the first
    part is the plain text message, the second part in the first part is the
    HTML message.

    So to build a correct HTML mail message, you have to supply an ascii text
    for the plain text part (PlainText property), a HTML message (HtmlText
    property) and zero or more document filenames (EmailFiles property).

    In the HTML part, you may reference the files (for example images) using
    the special URL beginning with 'cid:'. For example to include an image,
    you use: <IMG SRC="cid:IMAGE1">. And the image file has to be the first
    file listed in EmailFiles property. The second image would be referenced
    <IMG SRC="cid:IMAGE2">, and so on. It is always "cid:IMAGEn" with n
    replaced by the position in EmailFiles property.

    If you wants to have nromal attached files, just put them and the end
    of EmailFiles list. They will be shown as attached files.

Updates:
If not otherwise noted, changes are by Francois Piette
Oct 25, 1997  Added the OnHeaderLine event to allow modification/deletion of
              header lines.
Oct 26, 1997  V1.00 Released
              Changed the OnGetData event arguments to have code compatible
              between 16 and 32 bit versions (replaced string with PChar).
Jan 10, 1998  V1.01 Added a Port property
Feb 14, 1998  V1.02 Added an intermeditae TCustomSmtpClient in order to
              support MIME in the TSmtpCli. I implemented MIME with the
              help of code donated by Brad Choate <choate@delphiexchange.com>
              Mime is used for file attachement.
              Added a SetRcptName to copy values from a string list in place
              of copying the string list reference.
Feb 15, 1998  V1.03 Added a CharSet property, defaulting to iso-8859-1
Mar 02, 1998  V1.04 Corrected result for QUIT command.
              Marcus Schmutz <schmutz@kwsoft.de>
Mar 06, 1998  V1.05 Use OnDataSent event to prenvent over-buffering
Mar 15, 1998  V1.06 Implemented the Date header line
Apr 01, 1998  V1.07 Adapted for BCB V3
Apr 10, 1998  V1.08 Corrected DayNames: sunday is day 1, saturday is day 7.
              Changed UUEncode procedures to virtual methods to ease component
              inheritance.
Apr 26, 1998  V1.09 Ignore any empty file name (a very common error !)
              Check if file exists and raise an exception if not.
              Made Rfc822DateTime public.
              Added Rset method from Victor Garcia Aprea <vga@overnet.com.ar>
              Added Abort procedure to close the socket and abort any operation
              Made the underlaying TWSocket accessible using a property.
Apr 28, 1998  V1.10 Reset FTimeOutFlag in the mail procedure.
May 05, 1998  V1.11 Handled correctly lines beginning with a dot.
May 21, 1998  V1.12 Check for nil argument in SetEMailFiles
              Added OnCommand and OnResponse events.
              Added SendDataLine procedure (same as SendCommand, but do not
              trigger OnCommand event) used for header and message lines.
Jul 29, 1998  V2.00 Asynchronous functions and new TSyncSmtpCli component
              to be a placer holder for synchronous version.
              Renamed source file from SmtpCli to SmtpProt.
Aug 06, 1998  V2.01 Made HighLevelAsync public and added smtpCustom to be used
              for custom calls to HighLevelAsync.
Sep 22, 1998  V2.02 Removed useless Wait unit from the uses clause.
Oct 04, 1998  V2.03 Checked for Error in TriggerRequestDone.
Oct 11, 1998  V2.04 Removed -1 in DataNext. Thanks to Dennis V. Turov
              <chip@quorum.ru> for finding this bug.
Nov 22, 1998  V2.05 Implemented VRFY command with code proposed by
              DZ-Jay <dz@caribe.net> but use HdrTo property as name to verify.
Nov 29, 1998  V2.06 Added SetErrorMessage in WSocketSessionConnected when an
              error occured. Thanks to DZ-Jay.
              Changed FMimeBoundary format to use numbered month instead of
              month names. Thanks to Dmitry Kislov <kislov@tekom.odessa.ua> who
              found that some foreign charsets are invalid in mime boundaries.
Dec 22, 1998  V2.07 Handle exception when connecting (will be triggered when
              an invalid port has been given).
              Force readonly when reading attached files.
              Added ContentType property as suggested by Henri Fournier
              <hfournier@home.com>
Feb 13, 1999  V2.08 Published the state property and OnSessionConnected,
              OnSessionClosed events.
Feb 27, 1999  V2.09 Added Connected property.
              Added code from Larry Pesyna <ldpesyna@aep.com> to handle time
              zone bias.
              Added OnAttachContentType event. Thanks to Vladimir M.
              Zakharychev <zak@dzbjaro.bertelsmann.de> for his suggestion.
              Added ReplyTo and ReturnPath properties. Thanks to Eric Bullen
              <eric@thedeepsky.com> for his code.
Mar 06, 1999  V2.10 Conditional compile to remove timezone code unsupported by
              Delphi 1.
Mar 09, 1999  V2.11 Made state property [really] published.
Mar 27, 1999  V2.12 Published OnProcessHeader
              Changed sign for time zone bias (thanks to Larry Pesyna).
May 10, 1999  V2.13 'daylight' functionality for timezonebias function.
              Thanks to Bernhard Goebel <Bernhard.Goebel@t-online.de>
              Do not set FRequestType in Connect when called from HighLevel
              function. Thanks to Eugene V. Krapivin <evk@tagil.ru>.
May 18, 1999  V2.14 Added Sender field.  If ommited, the sender is becomes
              HdrFrom. Jon Glazer <jglazer@adconn.com>
Jul 30, 1999  V2.15 Added MailMessage property by Thomas Kvamme
              <thokvamm@online.no>. MailMessage property can be used with
              OnGetData event. If both are used, MailMessages lines appears
              before lines got by OnGetData.
Oct 02, 1999  V2.16 Added OnAttachHeader event as suggested by Vladimir M.
              Zakharychev <zak@dzbjaro.bertelsmann.de>
              Accept friendly EMail addresses. Thanks to Thierry De Leeuw
              <thierry.deleeuw@proxis.be> for his code.
Nov 01, 1999  V2.17 Made all fields protected to easy component inheritance.
Oct 15, 2000  V2.18 Check for too long lines in TriggerGetData.
              Thanks to Steve Williams <stevewilliams@kromestudios.com>
Jun 18, 2001  V2.19 Use AllocateHWnd and DeallocateHWnd from wsocket.
              Renamed property WSocket to CtrlSocket (this require code change
              in user application too).
Jul 26, 2001  V2.20  Angus Robertson <angus@magsys.co.uk> found a problem when
              using the MailSync method that it's not possible to send a body
              that takes longer than the timeout in WaitUntilReady. Timeout has
              to be reevaluated in TriggerGetData.
              Jake Traynham <jake@comm-unity.net> added authentification and
              EHLO code. Well done job.
Aug 18, 2001  V2.21 Angus V2.21 added OwnHeaders property flag which allows
              mail relaying where the body includes all headers and none are
              added by the component
Sep 09, 2001  V2.22 Beat Boegli <leeloo999@bluewin.ch> added LocalAddr property
              for multihomed hosts.
Dec 24, 2001  V2.23 Added support for NOFORMS (console mode without Forms unit).
              Added X-Mailer header line.
Jan 09, 2001  V2.24 Corrected WSocketDnsLookupDone where FRequestResult was not
              properly set with errorcode. Corrected DoHighLevelAsync to set
              RequestResult to 426 when aborting. Found by "SJF" <bcb@daqing.net>.
Mar 17, 2002  V2.25 Check for FRequestType = smtpQuit in NextExecAsync to avoid
              calling OnRequestDone before remote server has closed connection.
              And in WSocketSessionClosed, check if last command was smtpQuit
              to select proper error code for OnRequestDone event.
              Lot of peoples helped find this one (Alphabetical order):
              David Colliver <david.colliver@revilloc.com>
              DZ-Jay <dz@caribe.net>
              Max Terentiev <support@nexus6.ru>
              Roger Morton <roger@chez-morton.com>
              Wilfried Mestdagh <wilfried@mestdagh.biz>
Apr 01, 2002  V2.26 TriggerRequestDone with correct winsock error in
              WSocketDnsLookupDone. Thanks to DZ [dz@caribe.net] and
              Roger Morton [roger@chez-morton.com] for fixing this bug.
Apr 20, 2002  V2.27 Enhance NOFORMS mode.
Apr 24, 2002  V2.28 Return real error code in case of error in
              WSocketDnsLookupDone. Thanks to DZ-Jay <dz@caribe.net>.
Sep 07, 2002  V2.29 Added HdrCc property to send mail to CC.
Oct 26, 2002  V2.30 Revised Rfc822DateTime function.
Nov 01, 2002  V2.31 Changed arguments for event from PChar to Pointer to avoid
              Delphi 7 bug with PCHar <-> AnsiChar. This will require small
              changes in your application: change PChar to Pointer in your
              event handler and probably add a PChar cast when using the args.
Nov 11, 2002  V2.32 Revised for Delphi 1
Apr 08, 2003  V2.33 Arno Garrels <arno.garrels@gmx.de> made some useful
              changes:
              ThreadDetach/ThreadAttach added.
              Fixed: A possibly open file handle was not closed on abnormal
              termination (I'm not quite happy with this fix).
              AUTH AutoSelection added.
              Global var FileMode is not thread-safe.
              Modified UUEncoding in a way that it uses a TFileStream.
              New property ShareMode was added.
              Made AuthTypesSupported public.
Apr 18, 2003  V2.34 added THtmlSmtpCli to send HTML formatted mail with
              embedded images or documents.
Apr 19, 2003  V2.35 Arno Garrels <arno.garrels@gmx.de> made some useful changes:
              As Jake Traynham <jake@comm-unity.net> suggested, in case of
              AuthType is set to smtpAuthAutoSelect the component tries each
              of the AuthTypes one after the other until one works (or not).
              That should make it closer to RFC2554. Added X-Priority header,
              proc FoldHdrLine (Reply-To, To, CC headers are *folded* now,
              see TCustomSmtpClient.Data, accoording to RFC822), modified
              Base64 encoded line length from 60 to 72 chars.
Apr 19, 2003  V2.36 Added RcptNameAdd procedure.
              Added ParseEmail function.
              Added Priority (RFC1327) and X-MSMail-Priority header line.
              Added smtpPriorityNone.
              Replaced all spaces in FSignon by underscore before sending.
May 03, 2003  V2.37 Moved MIME routines to MimeUtil unit.
              Renamed UUEncode to EncFileBase64 because it was really base64
              encoding. The routines are now in MimeUtil.
              Break quoted-printable at column 76 as stated in RFC2045
May 09, 2003  V2.38 Revised FoldHdrLine and RcptNameAdd to accept both coma
              and semicolon as email addresses separators.
              Thanks to Arno Garrels <arno.garrels@gmx.de> for his help.
Sep 07, 2003  V2.39 In WSocketDnsLookupDone trigger OnSessionConnected and
              OnSessionClosed events when an error occurs in DNS resolution.
Jan 10, 2004  V2.40 Added CramSHA1 authentication code from
              "Piotr Hellrayzer Dalek" <enigmatical@interia.pl>
May 02, 2004  V2.41 Renamed uint Sha1 to IcsSha1 to avoi conflict with other
              products. Allowed it for Delphi 3 and up.
May 31, 2004  V2.42 Used ICSDEFS.INC the same way as in other units
Jul 18, 2004  V2.43 Adpoted code from eric launay <eric.launay@numericable.fr>
              to have a separate list of images and attached files in the
              THtmlSmtpCli component and send images as inline attachement.
              This solve display problem with some mail client such as HotMail.
Aug 23, 2004  V2.44 Use MsgWaitForMultipleObjects in WaitUntilReady to avoid
              consumming 100% CPU while waiting.
Sep 08, 2004  V2.45 MD5 has been renamed to IcsMD5
Jan 13, 2005  V2.46 In WaitUntilReady, moved MsgWaitForMultipleObjects before
                    the call to the message pump and added a few flags for
                    MsgWaitForMultipleObjects. This make the loop much efficient.
Mar 01, 2005  V2.47 Changes by Arno Garrels <arno.garrels@gmx.de>. Added a new
                    event OnRcptToError. Fixed: When RcptName had multiple
                    recipients request results of all but the last call to
                    RcptTo were silently ignored.
Mar 12, 2005  V2.48 Arno Garrels added new property ConfirmReceipt which means
                    "request confirmation of receipt".
May 28, 2005  V2.49 **Not yet authorized by the author of ICS.**
                    Arno Garrels <arno.garrels@gmx.de> implemented:
                    Properties - Allow8bitChars, DefaultEncoding, FoldHeaders,
                    WrapMessageText, OutStream and SendMode as well as functions
                    SendToFile(), SmtpRqTypeToStr().
                    Allow8bitChars: Default=TRUE, headers are not encoded.
                       If FALSE headers and message text are encoded using
                       method spezified in DefaultEncoding *if necessary.
                       If DefaultEncoding is smtpEnc7bit or smtpEnc8bit
                       quoted printable is used by default.
                    DefaultEncoding: Default=smtpEnc7bit, if smtpEncBase64 or
                       smtpEncQuotedPrintable message text is always encoded.
                    FoldHeaders: Default=FALSE, if TRUE headers are folded.
                    WrapMessageText: Turns on line wrapping of message text.
                    SendMode: Default=smtpToSocket, mail is sent as usual.
                        - smtpCopyToStream, mail is sent as usual and also
                            copied to Outstream.
                        - smtpToStream, mail is written to Outstream only.
                    SendToFile(): Write the message to a named file only.
                    SmtpRqTypeToStr: Utility
                    Reverted changes made to the Date header to
                    use timezone offset again (because Date headers w/o
                    offset were more frequently recognized as SPAM)
Nov 05, 2005 V2.50  Fixed AuthGetType.
                    Thanks to Arno Garrels <arno.garrels@gmx.de> and
                    Vander Clock Stephane <svanderclock@yahoo.fr>.
Mar 19, 2006 V6.00  New version started from ICS-V5
Jul 26, 2006 V6.01  Fixed a memory leak in TSmtpCli.PrepareEMail.
Aug 13, 2006 V6.02  NTLM authentication added. Also changed the 'blind probing'
                    of authentication methods when smtpAuthAutoSelect is set to
                    trigger RequestDone only after AuthPlain failed, AG.
Nov 11, 2006 V6.03  Arno Garrels fixed a buffer overflow in procedure
                    TCustomSmtpClient.DataNext
Feb 17, 2007 V6.04  Arno Garrels fixed Rfc822DateTime (colon within double
                    quotes in FormatDateTime).
Aug 29, 2007 V6.05  A. Garrels: FLineOffset was not reset properly, see
                    THtmlSmtpCli.PrepareEMail. Added an option to send
                    attachments non-encoded, Base64 or quoted printable encoded,
                    see new event OnAttachContentTypeEh that is
                    basically a copy of OnAttachContentType with an additional
                    parameter (idea of the feature Bj�rnar Nielsen).
Dec 29, 2007 V6.06  A.Garrels made WSocketSessionConnected virtual (SSL).
Feb 11, 2008 V6.07  Angus SSL version now supports sync methods
Mar 24, 2008 V6.08  Francois Piette made some changes to prepare code
                    for Unicode.
Apr 08, 2008 V6.09  A.Garrels wrapped some method calls in DoHighLevelAsync
                    in a try-except block to trigger RequestDone with error
                    '500 Internal client error' and the exception message.
                    This bug was found by Bj�rnar Nielsen.
Jun 28, 2008 V6.10  **Breaking Change** enum items "smtpTlsImplicite",
                    "smtpTlsExplicite" renamed to "smtpTlsImplicit",
                    "smtpTlsExplicit".
Apr 25, 2008 V6.11  A.Garrels made some changes to prepare code for Unicode.
                    Fixed a bug that adds an additional blank line after an
                    attachment.
May 15, 2008 V6.12  A.Garrels type change of some published String properties
                    to AnsiString.
Jul 13, 2008 V6.13  F. Piette revised socket names used for debugging purpose
                    A. Garrels fixed RcptToNext
Jul 20, 2008 V6.14  A. Garrels revised the SMTP components to support 'on the fly'
                    charset conversion, this feature is available with compiler
                    post RDS2007 only. Charset conversion is skipped for data
                    passed in event OnGetData. Simplified and revised the code,
                    removed code for older compiler and many outcommented code
                    that is no longer used, added OverbyteIcsCharsetUtils to
                    the uses clause, added property CodePage which is set to a
                    value that maps to current MIME charset in new setter
                    "SetCharset". The codepage value is used to convert Unicode
                    text to Ansi inluding UTF-8 explicitly. Without this
                    modification implicit string conversions, which use the
                    default system codepage, could lead to data loss.
                    Added property HtmlCharset to THtmlSmtpCli. Assignment of
                    an empty string to the CharSet properties will auto select
                    the default system charset and codepage. Take a look
                    at OverbyteIcsCharsetUtils.pas for currently supported
                    charsets.
Jul 23, 2008 V6.15  A. Garrels - Just one little optimization in TSmtpHeaderLines.AddHdr
Jul 29, 2008 V6.16  A. Garrels replaced the various calls to GetAcp by new global
                    var "IcsSystemCodePage" which is initialized just once.
Aug 03, 2008 V6.17  A.Garrels - Components use Ansi buffers internally.
                    More string conversions, however OnGetData works again.
Aug 11, 2008 V6.18  A. Garrels - Type AnsiString rolled back to String.
Oct 01, 2008 V6.19  A. Garrels fixed a ERangeError and took escaped quotation
                    marks into account in RcptNameAdd().
Oct 03, 2008 V6.20  A. Garrels moved IsCharInSysCharSet, IsDigit, IsSpace,
                    IsSpaceOrCRLF and stpblk to OverbyteIcsUtils.pas.
Oct 04, 2008 V7.21  A. Garrels fixed conversion of Unicode file names to Ansi
                    in TSmtpCli. Bumped version number to v7.
Oct 15, 2008 v7.22  A. Garrels adjusted TSmtpCli and THtmlCli.SetCharset to
                    the current changes in OverbyteIcsCharsetUtils.pas
Jan 17, 2009 v7.23  A. Garrels - New methods CalcMsgSize, CalcMsgSizeSync and
                    event OnMessageDataSent. CalcMsgSize precomposes the
                    message including encoding of all text parts to obtain
                    the correct size,  Base64 attachment size however is just
                    calculated. The result of the method is written to new
                    public property MessageSize. Useful if you want to implement
                    a progress bar or make use of RFC-1870 SIZE extension (see
                    MailSnd demo). Note that the returned size is not guaranteed
                    not be 100% correct, it's pretty exact though!
                    Added new method MailFromSIZE which sends the expected
                    message size as the second argument with the MailFrom command.
                    New properties SizeSupported and MaxMessageSize tell you
                    whether a server supports the SIZE extension and whether a
                    maximum message size was present in the EHLO response.
                    SendToFile() no longer takes a ShareMode argument which
                    was useless, and TBufferedFileStream is now used which is
                    much faster than TFileStream.
Feb 09, 2009 v7.24  Arno changed MIME part generation of THtlmSmtpCli when
                    files are attached (beside inline images).


ToDo:
The THtmlSmtpCli still sends file names in headers converted with default
system code page. It also does not inline encode and fold too long headerlines.

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
unit OverbyteIcsSmtpProt;

interface

{$B-}           { Enable partial boolean evaluation   }
{$T-}           { Untyped pointers                    }
{$X+}           { Enable extended syntax              }
{$H+}           { Use long strings                    }
{$J+}           { Allow typed constant to be modified }
{$I OverbyteIcsDefs.inc}
{$IFNDEF COMPILER7_UP}
    Bomb = 'No support for ancient compiler';
{$ENDIF}
{$IFDEF COMPILER12_UP}
    { These are usefull for debugging !}
    {$WARN IMPLICIT_STRING_CAST       ON}
    {$WARN IMPLICIT_STRING_CAST_LOSS  ON}
    {$WARN EXPLICIT_STRING_CAST       OFF}
    {$WARN EXPLICIT_STRING_CAST_LOSS  OFF}
{$ENDIF}
{$IFDEF DELPHI6_UP}
    {$WARN SYMBOL_PLATFORM   OFF}
    {$WARN SYMBOL_LIBRARY    OFF}
    {$WARN SYMBOL_DEPRECATED OFF}
    {$DEFINE USE_BUFFERED_STREAM}
{$ENDIF}
{$IFDEF BCB}
    {$ObjExportAll On}
{$ENDIF}

uses
    Messages,
{$IFDEF USEWINDOWS}
    Windows,
{$ELSE}
    WinTypes, WinProcs,
{$ENDIF}
    SysUtils, Classes,
{$IFNDEF NOFORMS}
    Forms, Controls,
{$ENDIF}
    OverbyteIcsWSocket, OverbyteIcsWndControl, OverbyteIcsWinsock,
    OverbyteIcsMD5,
    OverbyteIcsSha1,
    OverbyteIcsNtlmMsgs,
    OverbyteIcsUtils,
    OverbyteIcsCharsetUtils,
    OverbyteIcsLibrary,
{$IFDEF USE_BUFFERED_STREAM}
    OverbyteIcsStreams,
{$ENDIF}
{$IFDEF USE_SSL}
    OverByteIcsSSLEAY, OverByteIcsLIBEAY,  {AG/SSL}
{$ENDIF}
    OverbyteIcsMimeUtils;

const
  SmtpCliVersion     = 723;
  CopyRight : String = ' SMTP component (c) 1997-2009 Francois Piette V7.23 ';
  smtpProtocolError  = 20600; {AG}
  SMTP_RCV_BUF_SIZE  = 4096;
  
  SmtpDefEncArray : array [0..3] of Ansistring = ('7bit',             '8bit',
                                                  'quoted-printable', 'base64'); {AG}

type
    TSmtpHeaderLines = class(TStringList)
    public
        procedure   AddAddrHdr(const HdrName : String;                     {AG}
                              const HdrBody  : String;
                              EncType        : Char;
                              const ACharset : String;
                              Allow8Bit      : Boolean;
                              DoFold         : Boolean;
                              ACodePage      : Cardinal);

        procedure   AddHdr(const HdrName   : String;
                          HdrBody          : String;
                          EncType          : Char;
                          const ACharset   : String;
                          Allow8Bit        : Boolean;
                          DoFold           : Boolean;
                          ACodePage        : Cardinal);
    end;
    TSmtpDefaultEncoding      = (smtpEnc7bit,            smtpEnc8bit,
                                 smtpEncQuotedPrintable, smtpEncBase64);   {AG}
    TSmtpMessageText = class(TObject)                                      {AG}
    private
        FNeedsEncoding : Boolean;
        FEncoding      : TSmtpDefaultEncoding;
        FWrapText      : Boolean;
    protected
        FText          : AnsiString;
        FCurrentIdx    : Integer;
    public
        function    NextLineAsString: AnsiString;
        function    SetText(const AText: UnicodeString; DestinationCP: Cardinal; WordWrap: Boolean = TRUE): Integer; overload;
        function    SetText(const AText: AnsiString; DestinationCP: Cardinal; WordWrap: Boolean = TRUE): Integer; overload;
        property    NeedsEncoding: Boolean read FNeedsEncoding;
        property    Encoding: TSmtpDefaultEncoding read FEncoding write FEncoding;
        property    CurrentIdx: Integer read FCurrentIdx;
    end;

    SmtpException    = class(Exception);
    TSmtpSendMode    = (smtpToSocket,        smtpToStream,     {AG}
                        smtpCopyToStream);
    TSmtpState       = (smtpReady,           smtpDnsLookup,
                        smtpConnecting,      smtpConnected,
                        smtpInternalReady,   smtpWaitingBanner,
                        smtpWaitingResponse, smtpAbort,
                        smtpInternalBusy);
    TSmtpMimeState   = (smtpMimeIntro,       smtpMimePlainText,
                        smtpMimeHtmlText,    smtpMimeImages,
                        smtpMimeAttach,      smtpMimeDone);
{Start AG/SSL}
    TSmtpRequest     = (smtpConnect,         smtpHelo,          smtpMailFrom,
                        smtpVrfy,            smtpRcptTo,        smtpData,
                        smtpQuit,            smtpRset,          smtpOpen,
                        smtpMail,            smtpEhlo,          smtpAuth,
                     {$IFDEF USE_SSL}
                        smtpStartTls,
                     {$ENDIF}
                        smtpCalcMsgSize,     smtpMailFromSIZE,  smtpToFile,        
                        smtpCustom);
    TSmtpFct         = (smtpFctNone,         smtpFctHelo,       smtpFctConnect,
                        smtpFctMailFrom,     smtpFctRcptTo,     smtpFctData,
                        smtpFctVrfy,         smtpFctQuit,       smtpFctRset,
                        smtpFctEhlo,         smtpFctAuth
                     {$IFDEF USE_SSL}
                        ,smtpFctStartTls
                     {$ENDIF}
                        ,smtpFctCalcMsgSize ,smtpFctMailFromSIZE);
{End AG/SSL}
    TSmtpFctSet      = set of TSmtpFct;
    TSmtpContentType = (smtpHtml,            smtpPlainText);
    TSmtpAuthType    = (smtpAuthNone,        smtpAuthPlain,     smtpAuthLogin,
                        smtpAuthCramMD5,     smtpAuthCramSha1,  smtpAuthNtlm,
                        smtpAuthAutoSelect);
    TSmtpShareMode   = (smtpShareCompat,     smtpShareExclusive,
                        smtpShareDenyWrite,  smtpShareDenyRead,
                        smtpShareDenyNone);
    TSmtpPriority    = (smtpPriorityNone,    smtpPriorityHighest,
                        smtpPriorityHigh,    smtpPriorityNormal,
                        smtpPriorityLow,     smtpPriorityLowest);

    {AG start}

    TSmtpEncoding  = (smtpEncodeNone, smtpEncodeBase64, smtpEncodeQP);
    { Do YOU know shorter & readable designations ?? }
    TSmtpBeforeOpenFileAction = (smtpBeforeOpenFileNone, smtpBeforeOpenFileNext,
                                 smtpBeforeOpenFileAbort);
    TSmtpAfterOpenFileAction  = (smtpAfterOpenFileNone, smtpAfterOpenFileNext,
                                 smtpAfterOpenFileRetry, smtpAfterOpenFileAbort);
    TSmtpBeforeFileOpenEvent = procedure(Sender     : TObject;
                                         Idx        : Integer;
                                         FileName   : String;
                                         var Action : TSmtpBeforeOpenFileAction)
                                         of object;
    TSmtpAfterFileOpenEvent  = procedure(Sender     : TObject;
                                         Idx        : Integer;
                                         FileName   : String;
                                         E          : Exception;
                                         var Action : TSmtpAfterOpenFileAction)
                                         of object;

    TSmtpRcptToErrorAction = (srteAbort, srteRetry, srteIgnore);  {1/3/05}

    TSmtpRcptToErrorEvent    = procedure(Sender      : TObject;   {1/3/05}
                                         ErrorCode   : Word;
                                         RcptNameIdx : Integer;
                                         var Action  : TSmtpRcptToErrorAction)
                                         of object;
    TSmtpMessageDataSentEvent  = procedure(Sender    : TObject;
                                           Size      : Integer) of object;
    {AG end}

    TSmtpDisplay               = procedure(Sender  : TObject;
                                           Msg     : String) of object;
    TSmtpHeaderLineEvent       = procedure(Sender  : TObject;
                                           Msg     : Pointer;
                                           Size    : Integer) of object;
    TSmtpProcessHeaderEvent    = procedure(Sender  : TObject;
                                           HdrLines  : TStrings) of object;
    TSmtpGetDataEvent          = procedure(Sender  : TObject;
                                           LineNum : Integer;
                                           MsgLine : Pointer;
                                           MaxLen  : Integer;
                                           var More: Boolean) of object;
    TSmtpRequestDone           = procedure(Sender    : TObject;
                                           RqType    : TSmtpRequest;
                                           ErrorCode : Word) of object;
    TSmtpAttachmentContentType = procedure(Sender          : TObject;
                                           FileNumber      : Integer;
                                           var FileName    : String;
                                           var ContentType : String) of object;
    TSmtpAttachmentContentTypeEh = procedure(Sender          : TObject;
                                             FileNumber      : Integer;
                                             var FileName    : String;
                                             var ContentType : String;
                                             var AttEncoding : TSmtpEncoding) of object;

    TSmtpAttachHeader          = procedure(Sender          : TObject;
                                           FileNumber      : Integer;
                                           FileName        : String;
                                           HdrLines        : TStrings) of object;
    TSmtpNextProc              = procedure of object;

    { Base component, implementing the transport, without MIME support }
    TCustomSmtpClient = class(TIcsWndControl)
    protected
        FWSocket             : TWSocket;     { Underlaying socket          }
        FHost                : String;       { SMTP server hostname or IP  }
        FLocalAddr           : String; {bb}  { Local Address for mulithome }
        FPort                : String;       { Should be 'smtp'            }
        FSignOn              : String;       { Used for the 'HELO' command }
        FUsername            : String;       { Used with the 'AUTH' command }
        FPassword            : String;       { Used with the 'AUTH' command }
        FAuthType            : TSmtpAuthType;{ Used with the 'AUTH' command }
        FAuthTypesSupported  : TStrings;     { AuthTypes supported by server}
        FFromName            : String;       { Sender's EMail               }
        FRcptName            : TStrings;     { Recepients EMails list       }
        FMailMessage         : TStrings;
        FHdrFrom             : String;
        FHdrTo               : String;
        FHdrCc               : String;
        FHdrReplyTo          : String;
        FHdrReturnPath       : String;
        FHdrSubject          : String;
        FHdrSender           : String;       { Mail Sender's Email          }
        FHdrPriority         : TSmtpPriority;
        FState               : TSmtpState;
        FCharSet             : String;
        FCodePage            : Cardinal;
        FDefaultEncoding     : TSmtpDefaultEncoding; { Default transfer } {AG}
        FAllow8bitChars      : Boolean;                                   {AG}
        FFoldHeaders         : Boolean;                                   {AG}
        FWrapMessageText     : Boolean;
        FContentType         : TSmtpContentType;
        FContentTypeStr      : String;
        FConfirmReceipt      : Boolean;      { Request confirmation of receipt } {AG}
        FLastResponse        : String;
        FErrorMessage        : String;
        FTag                 : LongInt;
        FConnected           : Boolean;
        FESmtpSupported      : Boolean;
        FRequestType         : TSmtpRequest;
        FRequestDoneFlag     : Boolean;
        FReceiveLen          : Integer;
        FRequestResult       : Integer;
        FStatusCode          : Integer;
        FReceiveBuffer       : array [0..SMTP_RCV_BUF_SIZE - 1] of AnsiChar;
        FNext                : TSmtpNextProc;
        FWhenConnected       : TSmtpNextProc;
        FFctSet              : TSmtpFctSet;
        FFctPrv              : TSmtpFct;
        FHighLevelResult     : Integer;
        FHighLevelFlag       : Boolean;
        FNextRequest         : TSmtpNextProc;
        FLastResponseSave    : String;
        FStatusCodeSave      : Integer;
        FRestartFlag         : Boolean;
        FOkResponses         : array [0..15] of Integer;
        FDoneAsync           : TSmtpNextProc;
        FMsg_WM_SMTP_REQUEST_DONE : UINT;
        FMsg_WM_SMTP_DATA_NEXT    : UINT;
        FMsg_WM_SMTP_QUIT_DELAYED : UINT;
        FItemCount           : LongInt;
        FHdrLines            : TSmtpHeaderLines;
        FLineNum             : Integer;
        FMoreLines           : Boolean;
        FMessageID           : String;
        FOwnHeaders          : Boolean ;  { Angus V2.21 }
        FOnDisplay           : TSmtpDisplay;
        FOnCommand           : TSmtpDisplay;
        FOnResponse          : TSmtpDisplay;
        FOnGetData           : TSmtpGetDataEvent;
        FOnHeaderLine        : TSmtpHeaderLineEvent;
        FOnProcessHeader     : TSmtpProcessHeaderEvent;
        FOnRcptToError       : TSmtpRcptToErrorEvent; {AG 1/3/05}
        FOnRequestDone       : TSmtpRequestDone;
        FOnStateChange       : TNotifyEvent;
        FOnSessionConnected  : TSessionConnected;
        FOnSessionClosed     : TSessionClosed;
        FStream              : TStream;         {AG}
        FShareMode           : Word;            {AG}
        FSendMode            : TSmtpSendMode;   {AG}
        FOutStream           : TStream;         {AG}
        FOnBeforeOutStreamFree : TNotifyEvent;  {AG}
        FOnMessageDataSent   : TSmtpMessageDataSentEvent;
        FMsgSize             : Int64;  { Calculated message size }
        FMsgSizeFlag         : Boolean;
        FCurrSize            : Integer;
        FSizeExt             : Boolean;{ Does the server support the SIZE extension ?}
        FMaxMsgSize          : Int64;  { Maximum message size accepted by the server }
        FOldSendMode         : TSmtpSendMode;
        FOldOnDisplay        : TSmtpDisplay;
        procedure   SetCharset(const Value: String); {AG}
        procedure   EndSendToStream;            {AG}
        procedure   SendLineToStream(Data: Pointer; Len: Integer); {AG}
        procedure   CreateSocket; virtual;                         {AG/SSL}
        procedure   AuthGetType;          { parse Ehlo response for AuthTypes }
        procedure   SetShareMode(newValue: TSmtpShareMode);
        function    GetShareMode: TSmtpShareMode;
        procedure   TriggerDisplay(Msg : String); virtual;
        procedure   TriggerCommand(Msg : String); virtual;
        procedure   TriggerResponse(Msg : String); virtual;
        procedure   TriggerRequestDone(ErrorCode : Word); virtual;
        procedure   TriggerStateChange; virtual;
        procedure   TriggerGetData(LineNum  : Integer;
                                   MsgLine  : Pointer;
                                   MaxLen   : Integer;
                                   var More : Boolean); virtual;
        procedure   TriggerHeaderLine(Line : Pointer; Size : Integer); virtual;
        procedure   TriggerMessageDataSent; virtual;
        procedure   TriggerProcessHeader(HdrLines : TStrings); virtual;
        procedure   TriggerSessionConnected(ErrorCode : Word); virtual;
        procedure   TriggerSessionClosed(ErrorCode : Word); virtual;
        procedure   ClearErrorMessage;
        procedure   SetErrorMessage;
        procedure   StateChange(NewState : TSmtpState);
        procedure   SendCommand(Cmd : String); virtual;
        procedure   SetRcptName(newValue : TStrings);
        procedure   SetMailMessage(newValue : TStrings);
        procedure   CheckReady;
        procedure   WSocketDnsLookupDone(Sender: TObject; ErrorCode: Word);
        procedure   WSocketSessionConnected(Sender: TObject; ErrorCode: Word); virtual;
        procedure   WSocketDataAvailable(Sender: TObject; ErrorCode: Word);
        procedure   WSocketDataSent(Sender : TObject; ErrorCode : Word);
        procedure   WSocketSessionClosed(Sender : TObject; ErrorCode : WORD);
        procedure   DisplayLastResponse;
        procedure   DoHighLevelAsync; virtual; {AG/SSL}
        procedure   ExecAsync(RqType      : TSmtpRequest;
                              Cmd         : String;
                              OkResponses : array of Word;
                              DoneAsync   : TSmtpNextProc);
        procedure   NextExecAsync;
        procedure   EhloNext;
        procedure   DoAuthPlain;
        procedure   AuthNextPlain;
        procedure   AuthNextLogin;
        procedure   AuthNextLoginNext;
        procedure   AuthNextCramMD5;
        procedure   AuthNextCramSHA1; {HLX} 
        procedure   AuthNextNtlm;
        procedure   RcptToNext;
        procedure   RcptToDone;
        procedure   DataNext;
        procedure   AllocateMsgHandlers; override;
        procedure   FreeMsgHandlers; override;
        function    MsgHandlersCount: Integer; override;
        procedure   WndProc(var MsgRec: TMessage); override;
        procedure   HandleBackGroundException(E: Exception); override;
        procedure   WMSmtpRequestDone(var msg: TMessage); virtual;
    public
        constructor Create(AOwner : TComponent); override;
        destructor  Destroy;                     override;
        procedure   Connect;  virtual;    { Connect to the mail server }
        procedure   Helo;     virtual;    { Send HELO command          }
        procedure   Ehlo;     virtual;    { Send EHLO command          }
        procedure   Auth;     virtual;    { Send AUTH command          }
        procedure   Vrfy;     virtual;    { Send VRFY command          }
        procedure   MailFrom; virtual;    { Send MAILFROM command      }
        procedure   RcptTo;   virtual;    { Send RECPTTO command       }
        procedure   Data;     virtual;    { Send DATA command          }
        procedure   Quit;     virtual;    { Send QUIT command, close   }
        procedure   Rset;     virtual;    { Send RSET command          }
        procedure   Abort;    virtual;    { Abort opertaion, close     }
        procedure   Open;     virtual;    { Connect, Helo/Ehlo, Auth   }
        procedure   Mail;     virtual;    { MailFrom, RcptTo, Data     }
        procedure   MailFromSIZE; virtual;{ Send MAILFROM command with SIZE extension RFC-1870 }
        procedure   SendToFile(const FileName: String); virtual;{AG}
        procedure   CalcMsgSize; virtual;
{$IFNDEF VER80}
        procedure   ThreadAttach; override;
        procedure   ThreadDetach; override;
{$ENDIF}

        property    ShareMode  : TSmtpShareMode      read  GetShareMode
                                                     write SetShareMode;
        property    CtrlSocket : TWSocket            read  FWSocket;
        property    Connected  : Boolean             read  FConnected;
        { MessageID is generated within the Data method }
        property    MessageID  : String              read  FMessageID;
        procedure   HighLevelAsync(RqType : TSmtpRequest; Fcts : TSmtpFctSet);
        procedure   SetContentType(newValue : TSmtpContentType); virtual;
        procedure   RcptNameAdd(const ToList  : String;
                                const CcList  : String;
                                const BccList : String);
    protected
        property OutStream  : TStream                read  FOutStream       {AG}
                                                     write FOutStream;      {AG}
        property OnBeforeOutStreamFree : TNotifyEvent                       {AG}
                                                     read  FOnBeforeOutStreamFree
                                                     write FOnBeforeOutStreamFree;
        property SendMode : TSmtpSendMode            read  FSendMode        {AG}
                                                     write FSendMode;       {AG}
        property Host : String                       read  FHost
                                                     write FHost;
        property LocalAddr : String                  read  FLocalAddr  {bb}
                                                     write FLocalAddr; {bb}
        property Port : String                       read  FPort
                                                     write FPort;
        property SignOn : String                     read  FSignOn
                                                     write FSignOn;
        property Username : String                   read  FUsername
                                                     write FUsername;
        property Password : String                   read  FPassword
                                                     write FPassword;
        property AuthType : TSmtpAuthType            read  FAuthType
                                                     write FAuthType;
        property AuthTypesSupported : TStrings       read  FAuthTypesSupported;
        property FromName : String                   read  FFromName
                                                     write FFromName;
        property RcptName : TStrings                 read  FRcptName
                                                     write SetRcptName;
        property MailMessage : TStrings              read  FMailMessage
                                                     write SetMailMessage;
        property HdrFrom : String                    read  FHdrFrom
                                                     write FHdrFrom;
        property HdrTo : String                      read  FHdrTo
                                                     write FHdrTo;
        property HdrCc : String                      read  FHdrCc
                                                     write FHdrCc;
        property HdrReplyTo : String                 read  FHdrReplyTo
                                                     write FHdrReplyTo;
        property HdrReturnPath : String              read  FHdrReturnPath
                                                     write FHdrReturnPath;
        property HdrSubject : String                 read  FHdrSubject
                                                     write FHdrSubject;
        property HdrSender : String                  read  FHdrSender
                                                     write FHdrSender;
        property HdrPriority  : TSmtpPriority        read  FHdrPriority
                                                     write FHdrPriority;
        property CharSet      : String               read  FCharSet
                                                     write SetCharset;
        property CodePage     : Cardinal             read  FCodePage       {AG}
                                                     write FCodePage;
        property DefaultEncoding : TSmtpDefaultEncoding  read  FDefaultEncoding {AG}
                                                     write FDefaultEncoding;
        property Allow8bitChars : Boolean            read  FAllow8bitChars    {AG}
                                                     write FAllow8bitChars;
        property FoldHeaders  : Boolean              read  FFoldHeaders       {AG}
                                                     write FFoldHeaders;
        property WrapMessageText : Boolean           read  FWrapMessageText   {AG}
                                                     write FWrapMessageText; 
        property ContentType  : TSmtpContentType     read  FContentType
                                                     write SetContentType;
        property ConfirmReceipt : Boolean            read  FConfirmReceipt    {AG}
                                                     write FConfirmReceipt;   {AG}
        property MessageSize  : Int64                read  FMsgSize
                                                     write FMsgSize;
        property ErrorMessage : String               read  FErrorMessage;
        property LastResponse : String               read  FLastResponse;
        property RequestType  : TSmtpRequest         read  FRequestType;      {AG}
        property State        : TSmtpState           read  FState;
        property Tag          : LongInt              read  FTag
                                                     write FTag;
        property OwnHeaders   : Boolean              read  FOwnHeaders
                 { Angus V2.21 }                     write FOwnHeaders;
        property OnDisplay : TSmtpDisplay            read  FOnDisplay
                                                     write FOnDisplay;
        property OnCommand : TSmtpDisplay            read  FOnCommand
                                                     write FOnCommand;
        property OnResponse: TSmtpDisplay            read  FOnResponse
                                                     write FOnResponse;
        property OnGetData : TSmtpGetDataEvent       read  FOnGetData
                                                     write FOnGetData;
        property OnHeaderLine : TSmtpHeaderLineEvent read  FOnHeaderLine
                                                     write FOnHeaderLine;
        property OnProcessHeader : TSmtpProcessHeaderEvent
                                                     read  FOnProcessHeader
                                                     write FOnProcessHeader;
        property OnRcptToError : TSmtpRcptToErrorEvent  {AG 1/3/05}
                                                     read  FOnRcptToError
                                                     write FOnRcptToError;
        property OnRequestDone : TSmtpRequestDone    read  FOnRequestDone
                                                     write FOnRequestDone;
        property OnStateChange : TNotifyEvent        read  FOnStateChange
                                                     write FOnStateChange;
        property OnSessionConnected : TSessionConnected
                                                     read  FOnSessionConnected
                                                     write FOnSessionConnected;
        property OnSessionClosed : TSessionClosed
                                                     read  FOnSessionClosed
                                                     write FOnSessionClosed;
        property OnMessageDataSent : TSmtpMessageDataSentEvent
                                                     read  FOnMessageDataSent
                                                     write FOnMessageDataSent;
        property MaxMessageSize    : Int64           read  FMaxMsgSize;
        property SizeSupported     : Boolean         read  FSizeExt;
    end;

    { Descending component adding MIME (file attach) support }
    TSmtpCli = class(TCustomSmtpClient)
    protected
        FEmailBody              : TStrings; { Message body text         }
        FEmailFiles             : TStrings; { File names for attachment }
        FCurrentFile            : Integer;  { Current file being sent   }
        FMimeBoundary           : AnsiString; { Message parts boundary    }
        FAttachmentEncoding     : TSmtpEncoding;                          {AG}
        FFileStarted            : Boolean;
        FBodyFlag               : Boolean;
        FBodyLine               : Integer;
        FMailMsgText            : TSmtpMessageText;                       {AG}
        FEncoding               : TSmtpDefaultEncoding;                   {AG}
        FOnAttachContentType    : TSmtpAttachmentContentType;
        FOnAttachContentTypeEh  : TSmtpAttachmentContentTypeEh;           {AG}
        FOnAttachHeader         : TSmtpAttachHeader;
        FOnBeforeFileOpen       : TSmtpBeforeFileOpenEvent;               {AG}
        FOnAfterFileOpen        : TSmtpAfterFileOpenEvent;                {AG}
        procedure   TriggerAttachContentType(FileNumber      : Integer;
                                             var FileName    : String;
                                             var ContentType : String); virtual;
        procedure   TriggerAttachContentTypeEh(FileNumber     : Integer;  {AG}
                                              var FileName    : String;
                                              var ContentType : String); virtual;
        procedure   TriggerAttachHeader(FileNumber : Integer;
                                        FileName   : String;
                                        HdrLines   : TStrings); virtual;
        procedure   TriggerGetData(LineNum  : Integer;
                                   MsgLine  : Pointer;
                                   MaxLen   : Integer;
                                   var More : Boolean); override;
        procedure   TriggerHeaderLine(Line : Pointer; Size : Integer); override;
        procedure   SetEMailFiles(newValue : TStrings);
        procedure   PrepareEMail; virtual;
    public
        constructor Create(AOwner : TComponent); override;
        destructor  Destroy;                     override;
        procedure   Data;                        override;
        procedure   CalcMsgSizeSync;
        property    CodePage;           {AG}
        property    AuthTypesSupported; {AG}
        property    RequestType;        {AG}
        property    OutStream;          {AG}
        property    OnBeforeOutStreamFree; {AG}
        property    MaxMessageSize;
        property    SizeSupported;
    published
        property ShareMode;
        property Host;
        property LocalAddr;             {bb}
        property Port;
        property SignOn;
        property Username;
        property Password;
        property AuthType;
        property ConfirmReceipt;        {AG}
        property FromName;
        property RcptName;
        property MailMessage;
        property HdrFrom;
        property HdrTo;
        property HdrCc;
        property HdrReplyTo;
        property HdrReturnPath;
        property HdrSubject;
        property HdrSender;
        property HdrPriority;
        property State;
        property CharSet;
        property SendMode;              {AG}
        property DefaultEncoding;       {AG}
        property Allow8bitChars;        {AG}
        property FoldHeaders;           {AG}
        property WrapMessageText;       {AG}
        property MessageSize;           {AG}
        property ContentType;
        property ErrorMessage;
        property LastResponse;
        property Tag;
        property OwnHeaders ;           { Angus V2.21 }
        property OnDisplay;
        property OnCommand;
        property OnResponse;
        property OnGetData;
        property OnHeaderLine;
        property OnProcessHeader;
        property OnRcptToError;         {A.G. 1/3/05}
        property OnRequestDone;
        property OnSessionConnected;
        property OnSessionClosed;
        property OnMessageDataSent;      {AG}
        property EmailFiles : TStrings               read  FEmailFiles
                                                     write SetEmailFiles;
        property OnAttachContentType : TSmtpAttachmentContentType
                                                     read  FOnAttachContentType
                                                     write FOnAttachContentType;
        property OnAttachContentTypeEh : TSmtpAttachmentContentTypeEh
                                                     read  FOnAttachContentTypeEh
                                                     write FOnAttachContentTypeEh;
        property OnAttachHeader  : TSmtpAttachHeader read  FOnAttachHeader
                                                     write FOnAttachHeader;
        {A.G. start}
        property OnBeforeFileOpen : TSmtpBeforeFileOpenEvent
                                                     read  FOnBeforeFileOpen
                                                     write FOnBeforeFileOpen;
        property OnAfterFileOpen  : TSmtpAfterFileOpenEvent
                                                     read  FOnAfterFileOpen
                                                     write FOnAfterFileOpen;
        {AG end}
    end;

    { TSyncSmtpCli add synchronous functions. You should avoid using this   }
    { component because synchronous function, apart from being easy, result }
    { in lower performance programs.                                        }
    TSyncSmtpCli = class(TSmtpCli)
    protected
        FTimeout       : Integer;                 { Given in seconds }
        FTimeStop      : LongInt;                 { Milli-seconds    }
        FMultiThreaded : Boolean;
        function WaitUntilReady : Boolean; virtual;
        function Synchronize(Proc : TSmtpNextProc) : Boolean;
        procedure TriggerGetData(LineNum  : Integer;
                                 MsgLine  : Pointer;
                                 MaxLen   : Integer;
                                 var More : Boolean); override;
    public
        constructor Create(AOwner : TComponent); override;
        function    ConnectSync  : Boolean; virtual;
        function    HeloSync     : Boolean; virtual;
        function    EhloSync     : Boolean; virtual;
        function    AuthSync     : Boolean; virtual;
        function    VrfySync     : Boolean; virtual;
        function    MailFromSync : Boolean; virtual;
        function    RcptToSync   : Boolean; virtual;
        function    DataSync     : Boolean; virtual;
        function    QuitSync     : Boolean; virtual;
        function    RsetSync     : Boolean; virtual;
        function    AbortSync    : Boolean; virtual;
        function    OpenSync     : Boolean; virtual;
        function    MailSync     : Boolean; virtual;
    published
        property Timeout : Integer       read  FTimeout
                                         write FTimeout;
        property MultiThreaded : Boolean read  FMultiThreaded
                                         write FMultiThreaded;
    end;

{ You must define USE_SSL so that SSL code is included in the component.    }
{ Either in OverbyteIcsDefs.inc or in the project/package options.          }
{$IFDEF USE_SSL}
{*_* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:       Arno Garrels <arno.garrels@gmx.de>
              by the help of Francois PIETTE <francois.piette@overbyte.be>
              (plenty of code copied from Francois's HTTPS client)
Description:  A component adding SSL support to TSmtpCli.
              Requires OpenSSL (http://www.openssl.org).
              More details in ReadMeIcsSsl.txt and IcsSslHowTo.txt.
              SSL demo applications can be found in /Delphi/SslInternet.
              If you use Delphi 7 and later, you may want to disable warnings
              for unsage type, unsafe code and unsafe typecast in the project
              options. Those warning are intended for .NET programs. You may
              also want to turn off deprecated symbol and platform symbol
              warnings.
Features:     - Explicit SSL/TLS thru command STARTTLS.
              - Implicit SSL/TLS connections on a dedicated port (default 465).

Testing:      A nice made test server represents the free SSL/TLS capable
              mail server 'Hamster' including full Delphi source,
              available at: http://tglsoft.de/
              Also both Explicit and Implicit TLS is supported by
              googlemail/gmail.

Updates:
Dec 29, 2007  Reworked the component. After command StartTls completed you
              must issue command Ehlo again, this is of course only necessary
              when the Non-Highlevel functions are used. Property SmtpSslMode
              has been renamed to SslType, also the values have been renamed.
11 Feb 2008  V6.07  Angus SSL version now supports sync methods

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

type
    TSmtpSslType     = (smtpTlsNone,  smtpTlsImplicit,  smtpTlsExplicit);
    TSslSmtpCli = class(TSyncSmtpCli)
    protected
        FSslType                    : TSmtpSslType;
        FOnSslHandshakeDone         : TSslHandshakeDoneEvent;
        FTlsSupported               : Boolean;
        FMsg_WM_SMTP_QUIT_DELAYED   : UINT;
        function    GetSslAcceptableHosts: TStrings;
        procedure   SetSslAcceptableHosts(const Value: TStrings);
        function    GetSslCliGetSession: TSslCliGetSession;
        function    GetSslCliNewSession: TSslCliNewSession;
        function    GetSslVerifyPeer: TSslVerifyPeerEvent;
        procedure   SetSslCliGetSession(const Value: TSslCliGetSession);
        procedure   SetSslCliNewSession(const Value: TSslCliNewSession);
        procedure   SetSslVerifyPeer(const Value: TSslVerifyPeerEvent);
        function    GetSslCliCertRequest: TSslCliCertRequest;
        procedure   SetSslCliCertRequest(const Value: TSslCliCertRequest);
        procedure   SetSslContext(Value: TSslContext);
        function    GetSslContext: TSslContext;
        procedure   TransferSslHandshakeDone(Sender         : TObject;
                                             ErrCode        : Word;
                                             PeerCert       : TX509Base;
                                             var Disconnect : Boolean);
        procedure   GetSecurityExtensions(const Msg: String);
        procedure   TlsNext;
        procedure   DoHighLevelAsync; override;
        procedure   TriggerResponse(Msg : String); override;
        procedure   CreateSocket; override;
        procedure   WSocketSessionConnected(Sender  : TObject;
                                            Error   : Word); override;
        procedure   WndProc(var MsgRec: TMessage); override;
        procedure   WMSmtpQuitDelayed(var Msg: TMessage);
        function    MsgHandlersCount : Integer; override;
        procedure   AllocateMsgHandlers; override;
        procedure   FreeMsgHandlers; override;
    public
        procedure   StartTls; virtual;
        procedure   Open; override;
        procedure   Connect; override;
        procedure   Ehlo; override;
        property    SmtpTlsSupported  : Boolean     read  FTlsSupported;
        property    SslAcceptableHosts : TStrings   read  GetSslAcceptableHosts
                                                    write SetSslAcceptableHosts;
    published
        property SslType              : TSmtpSslType  read  FSslType
                                                      write FSslType;
        property SslContext           : TSslContext   read  GetSslContext
                                                      write SetSslContext;
        property OnSslVerifyPeer      : TSslVerifyPeerEvent
                                                      read  GetSslVerifyPeer
                                                      write SetSslVerifyPeer;
        property OnSslCliGetSession   : TSslCliGetSession
                                                      read  GetSslCliGetSession
                                                      write SetSslCliGetSession;
        property OnSslCliNewSession   : TSslCliNewSession
                                                      read  GetSslCliNewSession
                                                      write SetSslCliNewSession;
        property OnSslHandshakeDone   : TSslHandshakeDoneEvent
                                                      read  FOnSslHandshakeDone
                                                      write FOnSslHandshakeDone;
        property OnSslCliCertRequest  : TSslCliCertRequest
                                                      read  GetSslCliCertRequest
                                                      write SetSslCliCertRequest;
    end;
{$ENDIF} // USE_SSL

    THtmlSmtpCli = class(TSmtpCli)
    private
        FPlainText       : TStrings;
        FEmailImages     : TStrings;
        FHtmlText        : TStrings;
        FStreamArray     : TList;
        FOutsideBoundary : AnsiString;
        FInsideBoundary  : AnsiString;
        FInnerBoundary   : AnsiString;
        FMimeState       : TSmtpMimeState;
        FHtmlCharSet     : String;
        FHtmlCodePage    : Cardinal;
        FLineOffset      : Integer;
        FImageNumber     : Integer;
        FsContentType    : String;
        FsFileName       : String;
        FMsgLineCount    : Integer;
        procedure SetPlainText(const newValue: TStrings);
        procedure SetHtmlText(const newValue: TStrings);
        function  GetImageStream(Index: Integer): TStream;
        procedure SetImageStream(Index: Integer; const Value: TStream);
        function  GetImageStreamCount: Integer;
        procedure SetHtmlCharset(const Value: String);
    protected
        procedure   SetEMailImages(newValue : TStrings);
        procedure   TriggerGetData(LineNum  : Integer;
                                   MsgLine  : Pointer;
                                   MaxLen   : Integer;
                                   var More : Boolean); override;
        procedure   TriggerProcessHeader(HdrLines : TStrings); override;
        procedure   GenerateBoundaries; virtual;
        procedure   PrepareEMail; override;
    public
        constructor Create(AOwner : TComponent); override;
        destructor Destroy; override;
        procedure ClearImageStreamArray;
        { ImageStream is not completely implemented. Do not use ! }
        property ImageStream[Index : Integer] : TStream
                                       read  GetImageStream
                                       write SetImageStream;
        property ImageStreamCount : Integer   read  GetImageStreamCount;
        property HtmlCodePage : Cardinal      read  FHtmlCodePage
                                              write FHtmlCodePage;
    published
        property EmailImages : TStrings       read  FEmailImages
                                              write SetEmailImages;
        property PlainText : TStrings         read  FPlainText
                                              write SetPlainText;
        property HtmlText  : TStrings         read  FHtmlText
                                              write SetHtmlText;
        property HtmlCharSet : String         read  FHtmlCharSet
                                              write SetHtmlCharset;
    end;

{ Function to convert a TDateTime to an RFC822 timestamp string }
function Rfc822DateTime(t : TDateTime) : String;
{ Function to parse a friendly email and extract friendly name and email }
{ "Fran�ois PIETTE" <francois.piette@overbyte.be>                        }
{ The function returns as result the email address and in the var        }
{ parameter the friendly name without quote, if any.                     }
{ The function take care of various common ways to build friendly email  }
{ addresses, or even non friendly addresses.                             }
function ParseEmail(FriendlyEmail    : String;
                    var FriendlyName : String) : String;
{ function to generate a unique message ID                               }
function GenerateMessageID : String;                                  {AG}
{ Remove invalid chars and return '_' if result were empte               }
//function FixHostName(const S: String): String;                      {AG}
{ utility                                                                }
function SmtpRqTypeToStr(RqType: TSmtpRequest): ShortString;          {AG}

{ List of separators accepted between email addresses }
const
    SmtpEMailSeparators = [';', ','];


implementation

{#$B-} { Partial boolean evaluation } // Is already set, don't ask me why but this turned
                                      // partial boolean evaluation off again with current compiler {AG}


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function SmtpRqTypeToStr(RqType: TSmtpRequest): ShortString;
begin
    case RqType of
        smtpConnect   : SmtpRqTypeToStr := 'CONNECT';
        smtpHelo      : SmtpRqTypeToStr := 'HELO';
        smtpEhlo      : SmtpRqTypeToStr := 'EHLO';
        smtpAuth      : SmtpRqTypeToStr := 'AUTH';
        smtpMailFrom  : SmtpRqTypeToStr := 'MAIL FROM';
        smtpVrfy      : SmtpRqTypeToStr := 'VRFY';
        smtpRcptTo    : SmtpRqTypeToStr := 'RCPT TO';
        smtpData      : SmtpRqTypeToStr := 'DATA';
        smtpQuit      : SmtpRqTypeToStr := 'QUIT';
        smtpRset      : SmtpRqTypeToStr := 'RSET';
{$IFDEF USE_SSL}
        smtpStartTls  : SmtpRqTypeToStr := 'STARTTLS';
{$ENDIF}
        { High level stuff }
        smtpOpen      : SmtpRqTypeToStr := 'Open';
        smtpMail      : SmtpRqTypeToStr := 'Mail';
        smtpCustom    : SmtpRqTypeToStr := 'Custom';
        else
            SmtpRqTypeToStr := 'Unknown';
    end
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

{$I+}   { Activate I/O check (EInOutError exception generated) }

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpHeaderLines.AddAddrHdr(
    const HdrName   : String;
    const HdrBody   : String;
    EncType         : Char;
    const ACharset  : String;
    Allow8Bit       : Boolean;
    DoFold          : Boolean;
    ACodePage       : Cardinal);
var
    rPos, I : Integer;
    Alias, Addr, S, Res : String;
    NeedsEnc : Boolean;
begin
    rPos  := 1;
    if Allow8Bit and (not DoFold) then begin
    {$IFDEF UNICODE}
        if NeedsEncoding(HdrBody) and (IcsSystemCodePage <> ACodePage) then
            Add(UnicodeString(UnicodeToAnsi(HdrName + HdrBody,  ACodePage)))
        else
            Add(HdrName + HdrBody);
    {$ELSE}
        Add(HdrName + HdrBody);
    {$ENDIF}
        Exit;
    end;
    
    while rPos <= Length(HdrBody) do begin
        S := IcsWrapTextEx(HdrBody, #13#10, [',', ';'], 1, ['"', ''''], rPos);
        while (Length(S) > 0) and IsSpace(S[1]) do
            System.Delete(S, 1, 1);
        while (Length(S) > 0) and IsCharInSysCharSet(S[Length(S)], [',', ';']) do
            SetLength(S, Length(S) - 1);
        if Length(S) = 0 then
            Continue;
        Addr := ParseEmail(S, Alias);
        if Length(Alias) > 0 then begin
            NeedsEnc := NeedsEncoding(Alias);
        {$IFDEF UNICODE}
            if NeedsEnc and (IcsSystemCodePage <> ACodePage) then
                Alias := UnicodeString(UnicodeToAnsi(Alias, ACodePage));
        {$ENDIF}
            if (not Allow8Bit) and NeedsEnc then
                Alias := HdrEncodeInLine(Alias, SpecialsRFC822,
                                         EncType, ACharset,
                                         75 - Length(HdrName) + 1,
                                         DoFold)
            else begin
                { We have to quote some specials}
                S := '"';
                for I := 1 to Length(Alias) do
                begin
                    if (Alias[I] = '\') or (Alias[I] = '"') then
                        S := S + '\';
                    S := S + Alias[I];
                end;
                S := S + '"';
                Alias := S;
            end;
            Res := Res + Alias + ' <' + Addr + '>' + ',';
        end
        else
            Res := Res + Addr + ',';
    end;
    { Remove trailing comma }
    while (Length(Res) > 0) and (Res[Length(Res)] = ',') do
        SetLength(Res, Length(Res) -1);

    Res := Trim(HdrName) + ' ' + Trim(Res);
    if DoFold and (Length(Res) > 76) then
        FoldHdrLine(Self, Res)
    else
        Add(Res);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpHeaderLines.AddHdr(
    const HdrName   : String;
    HdrBody         : String;
    EncType         : Char;
    const ACharset  : String;
    Allow8Bit       : Boolean;
    DoFold          : Boolean;
    ACodePage       : Cardinal);
var
    NeedsEnc : Boolean;
begin
    NeedsEnc := NeedsEncoding(HdrBody);
{$IFDEF UNICODE}
    if NeedsEnc and (Integer(ACodePage) <> DefaultSystemCodePage) then
        HdrBody := UnicodeString(UnicodeToAnsi(HdrBody, ACodePage));
{$ENDIF}
    if Allow8Bit and (not DoFold) then
        Add(HdrName + HdrBody)
    else if not Allow8Bit then begin
        if NeedsEnc then
            Add(HdrName + HdrEncodeInLine(HdrBody,
                                          SpecialsRFC822,
                                          EncType,
                                          ACharset,
                                          66,
                                          DoFold))
        else
            FoldHdrLine(Self, HdrName + HdrBody);
    end
    else
        FoldHdrLine(Self, HdrName + HdrBody);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSmtpMessageText.SetText(
    const AText   : UnicodeString;
    DestinationCP : Cardinal;
    WordWrap      : Boolean = TRUE): Integer;
begin
    FText  := UnicodeToAnsi(AText, DestinationCP); // We send ansi only
    Result := Length(FText);
    if Result > 0 then begin
        FCurrentIdx := 1;
        FNeedsEncoding := OverbyteIcsMimeUtils.NeedsEncoding(FText);
    end
    else begin
        FCurrentIdx    := 0;
        FNeedsEncoding := FALSE;
    end;
    FEncoding := smtpEnc7bit;
    FWrapText := WordWrap;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSmtpMessageText.SetText(
    const AText   : AnsiString;
    DestinationCP : Cardinal;    { No effect so far }
    WordWrap      : Boolean = TRUE): Integer;
{var
    UStr : UnicodeString; }
begin
    {if Integer(DestinationCP) <> DefaultSystemCodePage then begin  ?? not yet
        UStr  := AnsiToUnicode(AText);
        FText := UnicodeToAnsi(AText, DestinationCP);
    end
    else }
        FText := AText;
    Result := Length(FText);
    if Result > 0 then begin
        FCurrentIdx := 1;
        FNeedsEncoding := OverbyteIcsMimeUtils.NeedsEncoding(FText);
    end
    else begin
        FCurrentIdx    := 0;
        FNeedsEncoding := FALSE;
    end;
    FEncoding := smtpEnc7bit;
    FWrapText := WordWrap;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSmtpMessageText.NextLineAsString: AnsiString;
begin
    case FEncoding of
        smtpEnc7bit,
        smtpEnc8bit :
            { Wrap text only }
            if FWrapText then
                Result := _Trim(IcsWrapTextEx(FText, AnsiString(#13#10),
                               [#09, #32, '.', ',', '-'], 76, [], FCurrentIdx, TRUE))
            else
                Result := _Trim(IcsWrapTextEx(FText, AnsiString(#13#10),
                               [#09, #32, '.', ',', '-'], MaxInt, [], FCurrentIdx));

        smtpEncQuotedPrintable :
            { Encode QuotedPrintable incl. soft line breaks }
            Result := StrEncodeQPEx(FText, 75, [], False, FCurrentIdx, True);

        smtpEncBase64 :
            { Encode Base64 }
            Result := Base64EncodeEx(FText, 76, FCurrentIdx);
    end; {case}

    if FCurrentIdx > Length(FText) then
        FCurrentIdx := 0;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{AG/SSL}
procedure TCustomSmtpClient.CreateSocket;
begin
    FWSocket := TWSocket.Create(nil);
end;
{End AG/SSL}


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SetShareMode(newValue: TSmtpShareMode);
begin
{$IFNDEF VER80}{$WARNINGS OFF}{$ENDIF}
    case newValue of
    smtpShareCompat    : FShareMode := fmShareCompat;
    smtpShareExclusive : FShareMode := fmShareExclusive;
    smtpShareDenyWrite : FShareMode := fmShareDenyWrite;
    smtpShareDenyRead  : FShareMode := fmShareDenyRead;
    smtpShareDenyNone  : FShareMode := fmShareDenyNone;
    else
        FShareMode := fmShareDenyWrite;
    end;
{$IFNDEF VER80}{$WARNINGS ON}{$ENDIF}
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TCustomSmtpClient.GetShareMode: TSmtpShareMode;
begin
{$IFNDEF VER80}{$WARNINGS OFF}{$ENDIF}
    case FShareMode of
    fmShareCompat    : Result := smtpShareCompat;
    fmShareExclusive : Result := smtpShareExclusive;
    fmShareDenyWrite : Result := smtpShareDenyWrite;
    fmShareDenyRead  : Result := smtpShareDenyRead;
    fmShareDenyNone  : Result := smtpShareDenyNone;
    else
        Result := smtpShareDenyWrite;
    end;
{$IFNDEF VER80}{$WARNINGS ON}{$ENDIF}
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF NOFORMS}
{ This function is a callback function. It means that it is called by       }
{ windows. This is the very low level message handler procedure setup to    }
{ handle the message sent by windows (winsock) to handle messages.          }
function SmtpClientWindowProc(
    ahWnd   : HWND;
    auMsg   : Integer;
    awParam : WPARAM;
    alParam : LPARAM): Integer; stdcall;
var
    Obj    : TObject;
    MsgRec : TMessage;
begin
    { At window creation asked windows to store a pointer to our object     }
    Obj := TObject(GetWindowLong(ahWnd, 0));

    { If the pointer doesn't represent a TCustomSmtpClient, just call the default procedure}
    if not (Obj is TCustomSmtpClient) then
        Result := DefWindowProc(ahWnd, auMsg, awParam, alParam)
    else begin
        { Delphi use a TMessage type to pass parameter to his own kind of   }
        { windows procedure. So we are doing the same...                    }
        MsgRec.Msg    := auMsg;
        MsgRec.wParam := awParam;
        MsgRec.lParam := alParam;
        { May be a try/except around next line is needed. Not sure ! }
        TCustomSmtpClient(Obj).WndProc(MsgRec);
        Result := MsgRec.Result;
    end;
end;
{$ENDIF}


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.ThreadAttach;
begin
    inherited ThreadAttach;
    FWSocket.ThreadAttach;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.ThreadDetach;
begin
    inherited ThreadDetach;
    FWSocket.ThreadDetach;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TCustomSmtpClient.Create(AOwner : TComponent);
begin
    inherited Create(AOwner);
    AllocateHWnd;
    CreateSocket;                                                     {AG/SSL}
    FWSocket.Name            := ClassName + '_Socket' + IntToStr(SafeWSocketGCount);
    FWSocket.OnSessionClosed := WSocketSessionClosed;
    FState                   := smtpReady;
    FRcptName                := TStringList.Create;
    FMailMessage             := TStringList.Create;
    FAuthTypesSupported      := TStringList.Create;
    FPort                    := 'smtp';
    FCodePage                := IcsSystemCodePage;
    FCharSet                 := CodePageToMimeCharsetString(FCodePage);
    FAuthType                := smtpAuthNone;
    FLocalAddr               := '0.0.0.0';
    SetContentType(smtpPlainText);
    FShareMode               := fmShareDenyWrite;
    FHdrPriority             := smtpPriorityNone;
    SetContentType(smtpPlainText);
    FAllow8bitChars          := True; { backwards compatibility }        {AG}
    Randomize;                                                           {AG}
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
destructor TCustomSmtpClient.Destroy;
begin
    if Assigned(FWSocket) then begin
        FWSocket.Destroy;
        FWSocket := nil;
    end;
    if Assigned(FHdrLines) then begin
        FHdrLines.Destroy;
        FHdrLines := nil;
    end;
    
    if Assigned(FAuthTypesSupported) then begin
        FAuthTypesSupported.Destroy;
        FAuthTypesSupported := nil;
    end;

    FMailMessage.Destroy;
    FRcptName.Destroy;

    if Assigned(FOutStream) then begin
        FOutStream.Free;
        FOutStream := nil;
    end;

    inherited Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TCustomSmtpClient.MsgHandlersCount : Integer;
begin
    Result := 3 + inherited MsgHandlersCount;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AllocateMsgHandlers;
begin
    inherited AllocateMsgHandlers;
    FMsg_WM_SMTP_REQUEST_DONE := FWndHandler.AllocateMsgHandler(Self);
    FMsg_WM_SMTP_DATA_NEXT    := FWndHandler.AllocateMsgHandler(Self);
    { WM_SMTP_QUIT_DELAYED is used for SSL }
    FMsg_WM_SMTP_QUIT_DELAYED := FWndHandler.AllocateMsgHandler(Self);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.FreeMsgHandlers;
begin
    if Assigned(FWndHandler) then begin
        FWndHandler.UnregisterMessage(FMsg_WM_SMTP_REQUEST_DONE);
        FWndHandler.UnregisterMessage(FMsg_WM_SMTP_DATA_NEXT);
        FWndHandler.UnregisterMessage(FMsg_WM_SMTP_QUIT_DELAYED);
    end;
    inherited FreeMsgHandlers;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WndProc(var MsgRec: TMessage);
begin
    try
         with MsgRec do begin
             if Msg = FMsg_WM_SMTP_REQUEST_DONE then
                 WMSmtpRequestDone(MsgRec)
             else if Msg = FMsg_WM_SMTP_DATA_NEXT then
                 DataNext
             else
                 inherited WndProc(MsgRec);
        end;
    except
        on E:Exception do
            HandleBackGroundException(E);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ All exceptions *MUST* be handled. If an exception is not handled, the     }
{ application will be shut down !                                           }
procedure TCustomSmtpClient.HandleBackGroundException(E: Exception);
var
    CanAbort : Boolean;
begin
    CanAbort := TRUE;
    { First call the error event handler, if any }
    if Assigned(FOnBgException) then begin
        try
            FOnBgException(Self, E, CanAbort);
        except
        end;
    end;
    { Then abort the component }
    if CanAbort then begin
        try
            Abort;
        except
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WMSmtpRequestDone(var msg: TMessage);
begin
    if Assigned(FOnRequestDone) then
        FOnRequestDone(Self, FRequestType, Msg.LParam);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function GetInteger(Data : PChar; var Number : Integer) : PChar;
var
    bSign : Boolean;
begin
    Number := 0;
    Result := StpBlk(Data);

    if (Result = nil) then
        Exit;

    { Remember the sign }
    if (Result^ = '-') or (Result^ = '+') then begin
        bSign := (Result^ = '-');
        Inc(Result);
    end
    else
        bSign  := FALSE;

    { Convert any number }
    while (Result^ <> #0) and IsDigit(Result^) do begin
        Number := Number * 10 + ord(Result^) - ord('0');
        Inc(Result);
    end;

    { Correct for sign }
    if bSign then
        Number := -Number;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.CheckReady;
begin
    if not (FState in [smtpReady, smtpInternalReady]) then
        raise SmtpException.Create('SMTP component not ready');
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerStateChange;
begin
    if Assigned(FOnStateChange) then
        FOnStateChange(Self);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerSessionConnected(ErrorCode : Word);
begin
    if Assigned(FOnSessionConnected) then
        FOnSessionConnected(Self, ErrorCode);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerSessionClosed(ErrorCode : Word);
begin
    if Assigned(FOnSessionClosed) then
        FOnSessionClosed(Self, ErrorCode);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerRequestDone(ErrorCode: Word);
begin
    if not FRequestDoneFlag then begin
        FRequestDoneFlag := TRUE;

{ --Jake Traynham, 06/12/01  Bug - removed "(ErrorCode = 0) and" because we  }
{                            want DoHighLevelAsync to handle any errors  }
{                            we get while doing a High Level function:   }
{ *bug* if (ErrorCode = 0) and Assigned(FNextRequest) then begin             }
        if Assigned(FNextRequest) then begin
            if FState <> smtpAbort then
                StateChange(smtpInternalReady);
            FNextRequest;
        end
        else begin
            StateChange(smtpReady);
            { Restore the lastresponse saved before quit command }
            if FHighLevelFlag and (FStatusCodeSave >= 0) then begin
                 FLastResponse := FLastResponseSave;
                 FStatusCode   := FStatusCodeSave;
            end;
            FHighLevelFlag := FALSE;
            PostMessage(Handle, FMsg_WM_SMTP_REQUEST_DONE, 0, ErrorCode);
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.StateChange(NewState : TSmtpState);
begin
    if FState <> NewState then begin
        FState := NewState;
        TriggerStateChange;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerDisplay(Msg : String);
begin
    if Assigned(FOnDisplay) then
        FOnDisplay(Self, Msg);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.DisplayLastResponse;
begin
     TriggerDisplay('< ' + FLastResponse);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WSocketDataAvailable(Sender: TObject; ErrorCode: Word);
var
    Len : Integer;
    I   : Integer;
    p   : PChar;
{$IFDEF COMPILER12_UP}
    TempS : AnsiString;
{$ENDIF}
begin
    Len := FWSocket.Receive(@FReceiveBuffer[FReceiveLen],
                            sizeof(FReceiveBuffer) - FReceiveLen);

    if Len <= 0 then
        Exit;

    FReceiveBuffer[FReceiveLen + Len] := #0;
    FReceiveLen := FReceiveLen + Len;

    while FReceiveLen > 0 do begin
        //I :=  Pos(AnsiString(#13#10), FReceiveBuffer);  { AG allocates a string }
        I := 0;
        while FReceiveBuffer[I] <> AnsiChar(#0) do begin
            if (FReceiveBuffer[I] = AnsiChar(#13)) and
               (FReceiveBuffer[I + 1] = AnsiChar(#10)) then begin
                Inc(I); // String index expected below
                Break;
            end;
            Inc(I);
        end;
        if I <= 0 then
            break;
        if I > FReceiveLen then
            break;
{$IFNDEF COMPILER12_UP}
        FLastResponse := Copy(FReceiveBuffer, 1, I - 1);
{$ELSE}
        SetLength(Temps, I - 1);
        Move(FReceiveBuffer[0], Pointer(Temps)^, I - 1);
        FLastResponse := String(Temps);
{$ENDIF}
        TriggerResponse(FLastResponse);

{$IFDEF DUMP}
        FDumpBuf := '>|';
        FDumpStream.WriteBuffer(FDumpBuf[1], Length(FDumpBuf));
        FDumpStream.WriteBuffer(FLastResponse[1], Length(FLastResponse));
        FDumpBuf := '|' + #13#10;
        FDumpStream.WriteBuffer(FDumpBuf[1], Length(FDumpBuf));
{$ENDIF}
        FReceiveLen := FReceiveLen - I - 1;
        if FReceiveLen > 0 then
            Move(FReceiveBuffer[I + 1], FReceiveBuffer[0], FReceiveLen + 1);

        if FState = smtpWaitingBanner then begin
            DisplayLastResponse;
            p := GetInteger(@FLastResponse[1], FStatusCode);
            if p^ = '-' then
                Continue;  { Continuation line, ignore }
            if FStatusCode <> 220 then begin
                SetErrorMessage;
                FRequestResult := FStatusCode;
                FWSocket.Close;
                Exit;
            end;

            StateChange(smtpConnected);
            TriggerSessionConnected(ErrorCode);

            if Assigned(FWhenConnected) then
                FWhenConnected
            else begin
                TriggerRequestDone(0);
            end;
        end
        else if FState = smtpWaitingResponse then begin
            if Assigned(FNext) then
                FNext
            else
                raise SmtpException.Create('Program error: FNext is nil');
        end
        else begin
            { Unexpected data received }
            DisplayLastResponse;
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WSocketSessionConnected(Sender: TObject; ErrorCode: Word);
begin
    { Do not trigger the client SessionConnected from here. We must wait }
    { to have received the server banner.                                }
    if ErrorCode <> 0 then begin
        FLastResponse := '500 ' + WSocketErrorDesc(ErrorCode) +
                         ' (Winsock error #' + IntToStr(ErrorCode) + ')';
        FStatusCode   := 500;
        FConnected    := FALSE;
{ --Jake Traynham, 06/12/01  Bug - Need to set FRequestResult so High    }
{                            Level Open will exit out. (See also         }
{                            TriggerRequestDone bug.)                    }
        FRequestResult:= 500;
        SetErrorMessage;
        TriggerRequestDone(ErrorCode);
        FWSocket.Close;
        StateChange(smtpReady);
    end
    else begin
        FConnected := TRUE;
        StateChange(smtpWaitingBanner);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WSocketDnsLookupDone(
    Sender    : TObject;
    ErrorCode : Word);
begin
    if ErrorCode <> 0 then begin
        FLastResponse := '500 ' + WSocketErrorDesc(ErrorCode) +
                         ' (Winsock error #' + IntToStr(ErrorCode) + ')';
        FStatusCode   := 500;
        SetErrorMessage;
        FRequestResult := ErrorCode;
        TriggerSessionConnected(ErrorCode); { 07/09/03 }
        TriggerSessionClosed(ErrorCode);    { 07/09/03 }
        TriggerRequestDone(ErrorCode);
    end
    else begin
        FWSocket.Addr               := FWSocket.DnsResult;
        FWSocket.LocalAddr          := FLocalAddr; {bb}
        FWSocket.Proto              := 'tcp';
        FWSocket.Port               := FPort;
        FWSocket.OnSessionConnected := WSocketSessionConnected;
        FWSocket.OnDataAvailable    := WSocketDataAvailable;
        StateChange(smtpConnecting);
        try
            FWSocket.Connect;
        except
            on E:Exception do begin
                FLastResponse  := '500 ' + E.ClassName + ': ' + E.Message;
                FStatusCode    := 500;
                FRequestResult := FStatusCode;
                SetErrorMessage;
                { TriggerRequestDone(FStatusCode); }
                TriggerRequestDone(FWSocket.LastError); { Apr 01, 2002 }
            end;
        end
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SendCommand(Cmd : String);
begin
    TriggerCommand(Cmd);
    TriggerDisplay('> ' + Cmd);
    if FWSocket.State = wsConnected then
        FWSocket.SendStr(Cmd + #13 + #10);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.ExecAsync(
    RqType      : TSmtpRequest;
    Cmd         : String;         { Command to execute                      }
    OkResponses : array of Word;  { List of responses like '200 221 342'    }
    DoneAsync   : TSmtpNextProc); { What to do when done                    }
var
    I : Integer;
begin
    CheckReady;

    if not FConnected then
        raise SmtpException.Create('SMTP component not connected');

    if not FHighLevelFlag then
        FRequestType := RqType;

    for I := 0 to High(OkResponses) do
        FOkResponses[I] := OkResponses[I];
    FOkResponses[High(OkResponses) + 1] := 0;

    FRequestDoneFlag  := FALSE;
    FNext             := NextExecAsync;
    FDoneAsync        := DoneAsync;
    StateChange(smtpWaitingResponse);
    SendCommand(Cmd);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.NextExecAsync;
var
    I : Integer;
    p : PChar;
begin
    DisplayLastResponse;
    p := GetInteger(@FLastResponse[1], FStatusCode);
    if p^ = '-' then
        Exit; { Continuation line, nothing to do }
    
    { Invalid RFC response ! }
    if FStatusCode = 0 then               {AG}
        FStatusCode := smtpProtocolError; {AG}
    
    if FOkResponses[0] = 0 then begin
        { The list of ok responses is empty }
        if FStatusCode >= 500 then begin
            { Not a good response }
            FRequestResult := FStatusCode;
            SetErrorMessage;
        end
        else
            FRequestResult := 0;
    end
    else begin
        { We have a list of ok response codes }
        for I := 0 to High(FOkResponses) do begin
            if FOkResponses[I] = 0 then begin
                { No good response found }
                FRequestResult := FStatusCode;
                SetErrorMessage;
                break;
            end;
            if FOkResponses[I] = FStatusCode then begin
                { Good response found }
                FRequestResult := 0;
                Break;
            end;
        end;
    end;

    if Assigned(FDoneAsync) then
        FDoneAsync
    else if (FRequestType <> smtpQuit) or (FConnected = FALSE) then
        TriggerRequestDone(FRequestResult)
    else begin
        { We have to wait until remote host close connection before }
        { calling TriggerRequestDone. See WSocketSessionClosed.     }
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Helo;
var
    I   : Integer;
    Buf : String;
begin
    FSizeExt := FALSE;
    FMaxMsgSize := 0;
    FFctPrv := smtpFctHelo;
    if FSignOn = '' then
        Buf := String(LocalHostName)
    else
        Buf := FSignOn;
    { Replace any space by underscore }
    for I := 1 to Length(Buf) do begin
        if Buf[I] = ' ' then
            Buf[I] := '_';
    end;
    ExecAsync(smtpHelo, 'HELO ' + Buf, [250], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Ehlo;
var
    I   : Integer;
    Buf : String;
begin
    FAuthTypesSupported.Clear;
    FSizeExt := FALSE;
    FMaxMsgSize := 0;
    FFctPrv := smtpFctEhlo;
    if FSignOn = '' then
        Buf := String(LocalHostName)
    else
        Buf := FSignOn;
    { Replace any space by underscore }
    for I := 1 to Length(Buf) do begin
        if Buf[I] = ' ' then
            Buf[I] := '_';
    end;
    ExecAsync(smtpEhlo, 'EHLO ' + Buf, [250], EhloNext);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.EhloNext;
begin
    { It's possible that some really old mail servers will disconnect you }
    { if you use the 'EHLO' command.  If we've been disconnected, then do }
    { nothing. RequestDone event handler is called from socket            }
    { SessionClose event.                                                 }
    if not FConnected
      then Exit;

    if (FRequestResult = 0)
      then FESmtpSupported := TRUE;

    TriggerRequestDone(FRequestResult);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.DoAuthPlain;
var
    AuthPlain : String;
begin
    AuthPlain := FUserName;
    AuthPlain := AuthPlain + #0;
    if FFromName <> '' then { FromName should be set before calling Auth }
        AuthPlain := AuthPlain + FFromName
    else
        AuthPlain := AuthPlain + FUserName;
    AuthPlain := AuthPlain + #0;
    AuthPlain := AuthPlain + FPassword;
    AuthPlain := Base64Encode(AuthPlain);
    ExecAsync(smtpAuth, 'AUTH PLAIN ' + AuthPlain, [235], AuthNextPlain);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Auth;
var
    tmpAuthType: TSmtpAuthType;
begin
    { If ESMTP is not supported, or if we didn't start with EHLO, then we }
    { can't use the AUTH command.                                         }
    if not FESmtpSupported then begin
        FLastResponse := '500 ESMTP not supported.';
        SetErrorMessage;
        if not FHighLevelFlag then begin
            FRequestDoneFlag := FALSE;
            FRequestType     := smtpAuth;
        end;
        TriggerRequestDone(500);
        Exit;
    end;

    FFctPrv := smtpFctAuth;

    tmpAuthType := FAuthType;
    if FAuthType = smtpAuthAutoSelect then begin
        tmpAuthType := smtpAuthNone;
        if FAuthTypesSupported.IndexOf('PLAIN')    <> -1 then
            tmpAuthType := smtpAuthPlain;
        if FAuthTypesSupported.IndexOf('LOGIN')    <> -1 then
            tmpAuthType := smtpAuthLogin;
{$IFDEF DELPHI3_UP}
        if FAuthTypesSupported.IndexOf('CRAM-SHA1') <> -1 then {HLX}
            tmpAuthType := smtpAuthCramSHA1;
{$ENDIF}            
        if FAuthTypesSupported.IndexOf('CRAM-MD5') <> -1 then
            tmpAuthType := smtpAuthCramMD5;
        { NTLM authentication provided by Exchange. This is a proprietary }
        { MS extension used with the SMTP AUTH command.                   }
        if (FAuthTypesSupported.IndexOf('NTLM') <> -1) or
           (FAuthTypesSupported.IndexOf('GSSAPI NTLM') <> -1) then
            tmpAuthType := smtpAuthNtlm;
        { RFC2554: If an AUTH command fails, the client may try another }
        { authentication mechanism by issuing another AUTH command.     }
        { If an AUTH command fails, the server MUST behave the same as  }
        { if the client had not issued the AUTH command.                }
        { We start first probe with most secure CRAM-MD5 even           }
        { though the AuthType could not be determined.}
        { Or should we start probing at smtpAuthNtlm?                   }
        if tmpAuthType = smtpAuthNone then
            tmpAuthType := smtpAuthCramMD5;
    end;

    case tmpAuthType of
    smtpAuthNone :
        begin
            { shouldn't happen }
            FLastResponse := '500 No Authentication Type Selected.';
            SetErrorMessage;
            if not FHighLevelFlag then begin
                FNextRequest     := nil;
                FRequestType     := smtpAuth;
            end;
            FRequestDoneFlag := FALSE;
            TriggerRequestDone(500);
            Exit;
        end;
    smtpAuthPlain :
        DoAuthPlain;
    smtpAuthLogin :
        ExecAsync(smtpAuth, 'AUTH LOGIN',     [334], AuthNextLogin);
    smtpAuthCramMD5 :
        ExecAsync(smtpAuth, 'AUTH CRAM-MD5',  [334], AuthNextCramMD5);
    smtpAuthCramSHA1: {HLX}
        ExecAsync(smtpAuth, 'AUTH CRAM-SHA1', [334], AuthNextCramSHA1);
    smtpAuthNtlm :                                              {AG}
        ExecAsync(smtpAuth, 'AUTH NTLM ' + NtlmGetMessage1('', ''), [334], AuthNextNtlm);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthNextPlain;
begin
    if (FAuthType = smtpAuthAutoSelect) and (FRequestResult <> 0) then
        if FRequestResult <> 504 then
            FErrorMessage := '500 Authentication Type could not be determined.';

    TriggerRequestDone(FRequestResult);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthNextLogin;
begin
    if FRequestResult <> 0 then begin
        if FAuthType = smtpAuthAutoSelect then begin
            { OK, AUTH LOGIN failed we'll try AUTH PLAIN.                   }
            if FRequestResult = 504 then begin
                //TriggerRequestDone(FRequestResult);
                FState := smtpInternalReady;
                DoAuthPlain;
                Exit;
            end;
            FErrorMessage  := '500 Authentication Type could not be determined.';
        end;
        TriggerRequestDone(FRequestResult);
        Exit;
    end;

    FState := smtpInternalReady;
    ExecAsync(smtpAuth, Base64Encode(FUsername), [334], AuthNextLoginNext);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthNextLoginNext;
begin
    { If there was an error, tell the user and exit.                      }
    if FRequestResult <> 0 then begin
        TriggerRequestDone(FRequestResult);
        Exit;
    end;

    FState := smtpInternalReady;
    ExecAsync(smtpAuth, Base64Encode(FPassword), [235], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthNextCramMD5;
var
    Challenge  : AnsiString;
    Response   : String;
    HexDigits  : AnsiString;
    MD5Digest  : TMD5Digest;
    MD5Context : TMD5Context;
    Count      : Integer;
    IPAD       : array[0..63] of Byte;
    OPAD       : array[0..63] of Byte;
begin
    if FRequestResult <> 0 then begin
        if (FAuthType = smtpAuthAutoSelect) then begin
           { We fall back to AUTH CRAM-SHA1 and see whether we succeed. }
           if FRequestResult = 504 then begin
               //TriggerRequestDone(FRequestResult);
               FState := smtpInternalReady;
               ExecAsync(smtpAuth, 'AUTH CRAM-SHA1', [334], AuthNextCramSHA1);
           end
           else begin
               FErrorMessage  := '500 Authentication Type could not be determined.';
               TriggerRequestDone(FRequestResult);
           end;
        end
        else
            TriggerRequestDone(FRequestResult);
        Exit;
    end;

    { Server should be returning something like                           }
    {   334 PDEyMzc5MTU3NTAtNjMwNTcxMzRAZm9vLmJhci5jb20+                  }
    { If it does not, then exit.                                          }
    if Length(FLastResponse) < 5 then begin
        FLastResponse := '500 Malformed MD5 Challege: ' + FLastResponse;
        SetErrorMessage;
        TriggerRequestDone(500);
        Exit;
    end;
    Challenge := AnsiString(Copy(FLastResponse, 5, Length(FLastResponse) - 4));
    Challenge := Base64Decode(Challenge);

    { See RFC2104 }
    for Count := 0 to 63 do begin
        if ((Count+1) <= Length(FPassword)) then begin
            IPAD[Count] := Byte(FPassword[Count+1]) xor $36;
            OPAD[Count] := Byte(FPassword[Count+1]) xor $5C;
        end
        else begin
            IPAD[Count] := 0 xor $36;
            OPAD[Count] := 0 xor $5C;
        end;
    end;

    MD5Init(MD5Context);
    MD5Update(MD5Context, IPAD, 64);
    MD5UpdateBuffer(MD5Context, @Challenge[1], Length(Challenge));
    MD5Final(MD5Digest, MD5Context);

    MD5Init(MD5Context);
    MD5Update(MD5Context, OPAD, 64);
    MD5Update(MD5Context, MD5Digest, 16);
    MD5Final(MD5Digest, MD5Context);

    HexDigits := '0123456789abcdef';
    Response := FUsername;
    Response := Response + ' ';
    for Count := 0 to 15 do begin
        Response := Response + Char(HexDigits[((Byte(MD5Digest[Count]) and $F0) shr 4)+1]);
        Response := Response + Char(HexDigits[(Byte(MD5Digest[Count]) and $0F)+1]);
    end;

    FState := smtpInternalReady;
    ExecAsync(smtpAuth, Base64Encode(Response), [235], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthNextCramSHA1; {HLX}
const
    HexDigits : array[0..15] of Char = ('0','1','2','3','4','5','6','7',
                                        '8', '9','a','b','c','d','e','f');
var
    Challenge  : AnsiString;
    Response   : String;
    Digest     : SHA1Digest;
    Count      : Integer;
begin
    if FRequestResult <> 0 then begin                                   {<= AG}
        if (FAuthType = smtpAuthAutoSelect) then begin
           { We fall back to AUTH LOGIN and see whether we succeed.        }
           if FRequestResult = 504 then begin
               //TriggerRequestDone(FRequestResult);
               FState := smtpInternalReady;
               ExecAsync(smtpAuth, 'AUTH LOGIN', [334], AuthNextLogin);
           end
           else begin
               FErrorMessage  := '500 Authentication Type could not be determined.';
               TriggerRequestDone(FRequestResult);
           end;
        end
        else
	        TriggerRequestDone(FRequestResult);
	    Exit;
    end;
    {if (FRequestResult <> 0) then begin                                 => AG
        TriggerRequestDone(FRequestResult);
        Exit;
    end;}
    if (Length(FLastResponse) < 5) then begin
	      FLastResponse := '500 Malformed SHA1 Challege: ' + FLastResponse;
	      SetErrorMessage;
	      TriggerRequestDone(500);
	      Exit;
    end;
    Challenge := AnsiString(Copy(FLastResponse, 5, Length(FLastResponse) - 4));
    Challenge := Base64Decode(Challenge);
    HMAC_SHA1(Challenge[1], Length(Challenge), FPassword[1],
              Length(FPassword), Digest);
    Response := FUsername + ' ';
    for Count := 0 to SHA1HashSize - 1 do begin
        Response := Response + HexDigits[((Byte(Digest[Count]) and $F0) shr 4)];
        Response := Response + HexDigits[(Byte(Digest[Count]) and $0F)];
    end;
    FState := smtpInternalReady;
    ExecAsync(smtpAuth, Base64Encode(Response), [235], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthNextNtlm;                                {AG}
var
    NtlmMsg2Info : TNTLM_Msg2_Info;
    NtlmMsg3     : String;
begin
    if FRequestResult <> 0 then begin
        if (FAuthType = smtpAuthAutoSelect) then begin
           { We fall back to AUTH CRAM-MD5 and see whether we succeed.   }
           if FRequestResult = 504 then begin
               FState := smtpInternalReady;
               ExecAsync(smtpAuth, 'AUTH CRAM-MD5', [334], AuthNextCramMD5);
           end
           else begin
               FErrorMessage  := '500 Authentication Type could not be determined.';
               TriggerRequestDone(FRequestResult);
           end;
        end
        else
            TriggerRequestDone(FRequestResult);
        Exit;
    end;

    if (Length(FLastResponse) < 5) then begin
        FLastResponse := '500 Malformed NtlmMsg2: ' + FLastResponse;
        SetErrorMessage;
        TriggerRequestDone(500);
        Exit;
    end;

    NtlmMsg2Info := NtlmGetMessage2(Copy(FLastResponse, 5, MaxInt));
    NtlmMsg3 := NtlmGetMessage3('',
                                '',  // the Host param seems to be ignored
                                FUsername, FPassword,
                                NtlmMsg2Info.Challenge);
    FState := smtpInternalReady;
    ExecAsync(smtpAuth, NtlmMsg3, [235], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.AuthGetType;
var
    I      : Integer;
    S      : String;
    aEntry : String;
begin
    { Not sure whether UpperCase & Trims are needed or not, anyway - should }
    { not hurt. Find SmtpAuthTypes in Ehlo response lines.                  }
    { A typical EHLO response:
    250-AUTH=LOGIN CRAM-MD5 PLAIN
    250-AUTH CRAM-MD5 LOGIN PLAIN
    250-AUTH LOGIN NTLM
    250-AUTH=LOGIN NTLM
    250-AUTH GSSAPI NTLM
    }
    S := UpperCase(Trim(FLastResponse));
    if Length(S) < 10 then
        Exit;
    Delete(S, 1, 4);
    if (CompareText(Copy(S, 1, 5), 'AUTH ') = 0) or
       (CompareText(Copy(S, 1, 5), 'AUTH=') = 0) then begin
        S := Copy(S, 6, Length(S));
        for I := 1 to Length(S) do begin
            if S[I] = '=' then
                S[I] := ' ';
        end;
        while Length(S) > 0 do begin
            I := Pos(' ', S);
            if I = 0 then begin
                aEntry := Trim(S);
                if Length(aEntry) > 0 then
                    if FAuthTypesSupported.IndexOf(aEntry) = -1 then
                        FAuthTypesSupported.Add(aEntry);
                Break;
            end
            else begin
                aEntry := Trim(Copy(S, 1, I - 1));
                if Length(aEntry) > 0 then
                    if FAuthTypesSupported.IndexOf(aEntry) = -1 then
                        FAuthTypesSupported.Add(aEntry);
                Delete(S, 1, I);
            end;
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Vrfy;
begin
    FFctPrv := smtpFctVrfy;
    ExecAsync(smtpVrfy, 'VRFY ' + FHdrTo, [250], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.MailFrom;
var
    FriendlyName : String;
begin
    FFctPrv := smtpFctMailFrom;
    ExecAsync(smtpMailFrom,
              'MAIL FROM:<' + ParseEmail(FFromName, FriendlyName) + '>',
              [250], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.MailFromSIZE;
var
    FriendlyName : String;
begin
    {if not FSizeExt then
        raise SmtpException.Create('The server does not support the SIZE extension');}
                                   { Or the EHLO command was not issued }
    FFctPrv := smtpFctMailFromSIZE;
    ExecAsync(smtpMailFromSIZE,
              'MAIL FROM:<' + ParseEmail(FFromName, FriendlyName) + '> SIZE=' +
              IntToStr(FMsgSize), [250], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Rset;
begin
    FFctPrv := smtpFctRset;
    ExecAsync(smtpRset, 'RSET', [250], nil);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.RcptTo;
begin
    if FRcptName.Count <= 0 then
        raise SmtpException.Create('RcptName list is empty');

    FItemCount := -1;
    RcptToNext;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ FriendlyEmail                  FriendlyName   Result                      }
{ ----------------------------   ------------   --------------              }
{ myname <name@domain.com>       'myname'       name@domain.com             }
{ myname name@domain.com         'myname'       name@domain.com             }
{ "my name" <name@domain.com>    'my name'      name@domain.com             }
{ 'my name' <name@domain.com>    'my name'      name@domain.com             }
{ name@domain.com                empty          name@domain.com             }
{ <name@domain.com>              empty          name@domain.com             }
{ "name@domain.com"              empty          name@domain.com             }
function ParseEmail(
    FriendlyEmail    : String;
    var FriendlyName : String) : String;
var
    I, J  : Integer;
    Flag  : Boolean;
    Delim : Char;
begin
    Result       := '';
    FriendlyName := '';
    Flag         := (Pos('<', FriendlyEmail) > 0);
    { Skip spaces }
    I := 1;
    while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] = ' ') do
        Inc(I);
    if I > Length(FriendlyEmail) then
        Exit;
    { Check if quoted string }
    if (FriendlyEmail[I] = '"') or (FriendlyEmail[I] = '''') then begin
        Delim := FriendlyEmail[I];
        { Skip opening quote }
        Inc(I);
        { Go to closing quote }
        J := I;
        while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] <> Delim) do
            Inc(I);
        FriendlyName := Copy(FriendlyEmail, J, I - J);
        Inc(I);
        if Flag then begin
            { Go to less-than sign }
            while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] <> '<') do
                Inc(I);
            Inc(I);
            J := I;
            while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] <> '>') do
                Inc(I);
            Result := Copy(FriendlyEmail, J, I - J);
        end
        else
            Result := Trim(Copy(FriendlyEmail, I, Length(FriendlyEmail)));
    end
    else begin
        if Flag then begin
            { Go to less-than sign }
            J := I;
            while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] <> '<') do
                Inc(I);
            FriendlyName := Trim(Copy(FriendlyEmail, J, I - J));
            Inc(I);
            { Go to greater-than sign }
            J := I;
            while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] <> '>') do
                Inc(I);
            Result := Copy(FriendlyEmail, J, I - J);
        end
        else begin
            { No <..>, goto next space }
            J := I;
            while (I <= Length(FriendlyEmail)) and (FriendlyEmail[I] <> ' ') do
                Inc(I);
            FriendlyName := Trim(Copy(FriendlyEmail, J, I - J));
            Result       := Trim(Copy(FriendlyEmail, I + 1, Length(FriendlyEmail)));
        end;
    end;
    if (Result = '') and (Pos('@', FriendlyName) > 0) then begin
        Result       := FriendlyName;
        FriendlyName := '';
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.RcptNameAdd(
    const ToList  : String;
    const CcList  : String;
    const BccList : String);
var
    Buf  : String;
    I, J : Integer;
    n, L : Integer;
    Addr : String;
begin
    for n := 1 to 3 do begin
       { If there is a syntax error in the lists only those will fail }
        case n of
            1 : Buf := ToList;
            2 : Buf := CcList;
            else
                Buf := BccList;
        end;
        I := 1;
        L := Length(Buf);
        while (I <= L) do begin
            { Skip spaces }
            if Buf[I] = ' ' then begin
                Inc(I);
                Continue;
            end;
            J := I;
            while I <= L do begin
                if (Buf[I] = '"') and
                   (not ((I > 1) and (Buf[I - 1] = '\'))) then begin
                    { Start of quoted string, skip until end of quote }
                    Inc(I);
                    while (I <= L) and
                     ((Buf[I] <> '"') or ((Buf[I] = '"') and (Buf[I - 1] = '\'))) do
                        Inc(I);
                end;

                if (I >= L) or
                   ((I <= L) and (IsCharInSysCharSet(Buf[I], SmtpEMailSeparators))) then
                begin
                    if (I <= L) and (IsCharInSysCharSet(Buf[I], SmtpEMailSeparators)) then
                        Addr := Trim(Copy(Buf, J, I - J))
                    else
                        Addr := Trim(Copy(Buf, J, L - J + 1));
                    if Length(Addr) > 0 then
                        RcptName.Add(Addr);
                    Inc(I);
                    Break;
                end;
                Inc(I);
            end;
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This function will raise an ERangeError if the string passed contains an  }
{ opening quotation mark without a closing one at the line marked below.    }
{ Bug condition: foo" <bar@mail.com>                                        }
{ It may produce garbage upon syntax errors, however no exceptions. (AG)    }
(*
procedure TCustomSmtpClient.RcptNameAdd(
    const ToList  : String;
    const CcList  : String;
    const BccList : String);
var
    Buf  : String;
    I, J : Integer;
    Adr  : String;
begin
    Buf := ToList + ';' + CcList + ';' + BccList;
    I   := 1;
    while (I <= Length(Buf)) do begin
        { Skip spaces }
        if Buf[I] = ' ' then begin
            Inc(I);
            continue;
        end;
        J := I;
        while I <= Length(Buf) do begin
            if Buf[I] = '"' then begin
                { Start of quoted string, skip until end of quote }
                Inc(I);
                while (I <= Length(Buf)) and (Buf[I] <> '"') do
                    Inc(I);
                Inc(I);
            end;
            if (I >= Length(Buf)) or
               IsCharInSysCharSet(Buf[I], SmtpEMailSeparators) then begin  <= !!
                if IsCharInSysCharSet(Buf[I], SmtpEMailSeparators) then
                    Adr := Trim(Copy(Buf, J, I - J))
                else
                    Adr := Trim(Copy(Buf, J, I - J + 1));
                if Adr > '' then
                    RcptName.Add(Adr);
                Inc(I);
                break;
            end;
            Inc(I);
        end;
    end;
end;
*)

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.RcptToNext;
var
    WhenDone     : TSmtpNextProc;
    FriendlyName : String;
    srteAction   : TSmtpRcptToErrorAction;  {A.G. 1/3/05}
begin
    if (FItemCount >= 0) and (FRequestResult <> 0) then  {A.G. 1/3/05 start} begin
        srteAction := srteAbort; {A.G. 13/7/08}
        if Assigned(FOnRcptToError) then
            FOnRcptToError(Self, FRequestResult, FItemCount, srteAction);
        case srteAction of
            srteAbort :
                begin
                    TriggerRequestDone(FRequestResult);
                    Exit;
                end;
            srteIgnore : Inc(FItemCount);
        end;
    end
    else  {A.G. 1/3/05 end}
        Inc(FItemCount);

    if FItemCount >= (FRcptName.Count - 1) then
        WhenDone := nil
    else
        WhenDone := RcptToDone;
    FFctPrv    := smtpFctRcptTo;
    ExecAsync(smtpRcptTo,
              'RCPT TO:<' +
              ParseEmail(FRcptName.Strings[FItemCount], FriendlyName) + '>',
              [250, 251], WhenDone)
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.RcptToDone;
begin
    FState := smtpInternalReady;
    RcptToNext;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SetCharset(const Value: String);
begin
    FCharSet := _LowerCase(Value);
    { If empty set the default system codepage }
    if Length(FCharSet) = 0 then begin
        FCodePage := IcsSystemCodePage;
        FCharSet  := CodePageToMimeCharsetString(FCodePage);
    end
    else begin
        if not MimeCharsetToCodePage(FCharSet, FCodePage) then
        begin
            { Set default system codepage and charset }
            FCodePage := IcsSystemCodePage;
            FCharSet  := CodePageToMimeCharsetString(FCodePage);
            raise SmtpException.Create('Charset "' + Value + '" is not supported');
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SetContentType(newValue : TSmtpContentType);
begin
    if FContentType = newValue then
        Exit;
    FContentType := newValue;
    if FContentType = smtpPlainText then
        FContentTypeStr := 'text/plain'
    else
        FContentTypeStr := 'text/html';
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Data;
var
    EncType : Char;                                                      {AG}
begin
    FLineNum   := 0;
    if FSendMode <> smtpToStream then
        FMsgSizeFlag := FALSE;
    FMoreLines := TRUE;
    FItemCount := -1;
    if not Assigned(FHdrLines) then
        FHdrLines := TSmtpHeaderLines.Create
    else
        FHdrLines.Clear;
    if not FOwnHeaders then begin
        { Angus V2.21 - the body must contain all the headers }
        if FDefaultEncoding = smtpEncBase64 then                         {AG}
            EncType := 'B'                                               {AG}
        else                                                             {AG}
            EncType := 'Q';                                              {AG}

        FHdrReplyTo := Trim(FHdrReplyTo);
        if Length(FHdrReplyTo) > 0 then
            FHdrLines.AddAddrHdr('Reply-To: ', FHdrReplyTo, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);

        FHdrReturnPath := Trim(FHdrReturnPath);
        if Length(FHdrReturnPath) > 0 then
            FHdrLines.AddAddrHdr('Return-Path: ', FHdrReturnPath, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);

        FHdrFrom := Trim(FHdrFrom);
        if Length(FHdrFrom) > 0 then
            FHdrLines.AddAddrHdr('From: ', FHdrFrom, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);

        FHdrTo := Trim(FHdrTo);
        if Length(FHdrTo) > 0 then
             FHdrLines.AddAddrHdr('To: ', FHdrTo, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);

        FHdrCc := Trim(FHdrCc);
        if Length(FHdrCc) > 0 then
             FHdrLines.AddAddrHdr('Cc: ', FHdrCc, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);

        FHdrLines.AddHdr('Subject: ', Trim(FHdrSubject), EncType,
                         FCharSet, FAllow8bitChars, FFoldHeaders,
                         FCodePage);

        FHdrSender := Trim(FHdrSender);
        FHdrFrom   := Trim(FHdrFrom);
        if Length(FHdrSender) > 0 then
            FHdrLines.AddAddrHdr('Sender: ', FHdrSender, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage)
        else if Length(FHdrFrom) > 0 then
            FHdrLines.AddAddrHdr('Sender: ', FHdrFrom, EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);
        FHdrLines.Add('Mime-Version: 1.0');
        FHdrLines.Add('Content-Type: ' + FContentTypeStr +
                      '; charset="' + FCharSet + '"');
        FHdrLines.Add('Date: ' + Rfc822DateTime(Now));
        if FHdrPriority <> smtpPriorityNone then begin
            FHdrLines.Add('X-Priority: ' + IntToStr(Ord(FHdrPriority)));
            if FHdrPriority < smtpPriorityNormal then begin
                FHdrLines.Add('Priority: urgent');
                FHdrLines.Add('X-MSMail-Priority: High');
            end
            else if FHdrPriority = smtpPriorityNormal then begin
                FHdrLines.Add('Priority: Normal');
                FHdrLines.Add('X-MSMail-Priority: Normal');
            end
            else begin
                FHdrLines.Add('Priority: non-urgent');
                FHdrLines.Add('X-MSMail-Priority: Low');
            end;
        end;
        FMessageID := GenerateMessageID;        
        FHdrLines.Add('Message-ID: <' + FMessageID + '>');       
            
       if FConfirmReceipt and (Length(FHdrFrom) > 0) then
             FHdrLines.AddAddrHdr('Disposition-Notification-To: ', FHdrFrom,
                                 EncType,
                                 FCharSet, FAllow8bitChars, FFoldHeaders,
                                 FCodePage);

        FHdrLines.Add('X-Mailer: ICS SMTP Component V' +
                      IntToStr(SmtpCliVersion div 100) + '.' +
                      IntToStr(SmtpCliVersion mod 100));
        TriggerProcessHeader(FHdrLines);
        { An empty line mark the header's end }
        FHdrLines.Add('');
    end
    else
        FItemCount := 0;
    FFctPrv := smtpFctData;
    if FSendMode <> smtpToStream then
        ExecAsync(smtpData, 'DATA', [354], DataNext)
    else
        DataNext;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.DataNext;
var
    MsgLine  : array [0..1023] of AnsiChar;
    BExit : Boolean;
begin
    { If we have been disconnected, then do nothing.                      }
    { RequestDone event handler is called from socket SessionClose event. }
    if (FSendMode <> smtpToStream) and (not FConnected) then begin
        FWSocket.OnDataSent := nil;
        Exit;
    end;
    BExit := (FSendMode = smtpToStream);
    Inc(FItemCount);
    if FItemCount < FHdrLines.Count then begin
        { There are still header lines to send.                           }
        { Truncate the line if too long, or shall we raise an exception?  }
        StrPLCopy(PAnsiChar(@MsgLine), AnsiString(FHdrLines.Strings[FItemCount]),
                  Length(MsgLine) - 1);
        TriggerHeaderLine(@MsgLine, SizeOf(MsgLine));
        TriggerDisplay('> ' + String(StrPas(PAnsiChar(@MsgLine))));

        FCurrSize := StrLen(PAnsiChar(@MsgLine));
        if FSendMode <> smtpToSocket then begin
            SendLineToStream(@MsgLine, FCurrSize);
            if BExit then
                Exit;
        end;

        FWSocket.OnDataSent := WSocketDataSent;
        FWSocket.PutDataInSendBuffer(@MsgLine, FCurrSize);
        FWSocket.SendStr(AnsiString(#13#10));
        Inc(FCurrSize, 2);
    end
    else begin
        { Now we need to send data lines }
        if FMoreLines then begin
            try
                Inc(FLineNum);
                MsgLine[0] := #0;
                { Enough room for double a dot and a nul char }
                TriggerGetData(FLineNum, @MsgLine,
                              (SizeOf(MsgLine) - (SizeOf(Char) * 2)),
                               FMoreLines);
            except
                FMoreLines := FALSE;
            end;
        end;
        {AG}
        { Calling Abort in TSmtpCli.TriggerGetData returns here,
          with FConnected = False!! }
        if (FSendMode <> smtpToStream) and (not FConnected) then begin
            FWSocket.OnDataSent := nil;
            Exit;
        end;
        {AG end}

        if FMoreLines then begin
            if MsgLine[0] = '.' then
                Move(MsgLine[0], MsgLine[1], (StrLen(MsgLine) + 1)); { AG }
            TriggerDisplay('> ' + String(StrPas(PAnsiChar(@MsgLine))));

            FCurrSize := StrLen(PAnsiChar(@MsgLine));
            if FSendMode <> smtpToSocket then begin
                SendLineToStream(@MsgLine, FCurrSize);
                if BExit then
                    Exit;
            end;

            FWSocket.OnDataSent := WSocketDataSent;
            FWSocket.PutDataInSendBuffer(@MsgLine, FCurrSize);
            FWSocket.SendStr(AnsiString(#13#10));
            Inc(FCurrSize, 2);
        end
        else begin
            { Send the last message line }
            FWSocket.OnDataSent := nil;

            if FSendMode <> smtpToSocket then begin
                EndSendToStream;
                if BExit then
                    Exit;
            end;
            ExecAsync(smtpData, '.', [250], nil);
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WSocketDataSent(Sender : TObject; ErrorCode : Word);
begin
    TriggerMessageDataSent;
    FState := smtpInternalReady;
    DataNext;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Abort;
begin
    EndFileEncBase64(FStream);
    EndSendToStream;
    StateChange(smtpAbort);
    {FWSocket.CancelDnsLookup; not needed, abort does it}
    FWSocket.Abort;
    StateChange(smtpReady);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Connect;
begin
    CheckReady;
    if FConnected then
        raise SmtpException.Create('SMTP component already connected');

    if not FHighLevelFlag then
        FRequestType  := smtpConnect;   { 10/05/99 }
    FRequestDoneFlag  := FALSE;
    FReceiveLen       := 0;
    FRequestResult    := 0;
    FESmtpSupported   := FALSE;
    FErrorMessage     := '';
    FLastResponse     := '';
    StateChange(smtpDnsLookup);
    FWSocket.OnDataSent      := nil;
    FWSocket.OnDnsLookupDone := WSocketDnsLookupDone;
    FWSocket.DnsLookup(FHost);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Quit;
begin
    CheckReady;
    FFctPrv := smtpFctQuit;
    if not FConnected then begin
        { We are not connected, it's ok... }
        FRequestType     := smtpQuit;
        FRequestDoneFlag := FALSE;
        TriggerRequestDone(0);
        Exit;
    end;
    ExecAsync(smtpQuit, 'QUIT', [221], nil); { Should I force a FWSocket.Close }
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.DoHighLevelAsync;
begin
{$IFDEF TRACE} TriggerDisplay('! HighLevelAsync ' + IntToStr(FRequestResult)); {$ENDIF}
    if FState = smtpAbort then begin
        {$IFDEF TRACE} TriggerDisplay('! Abort detected'); {$ENDIF}
        FFctSet := [];
        FHighLevelResult := 426;
        FRequestResult   := 426;  { SJF }
        FErrorMessage    := '426 Operation aborted.';
    end;

    FNextRequest := DoHighLevelAsync;

    if FRequestResult <> 0 then begin
        { Previous command had errors }
        { EHLO wasn't supported, so just log in with HELO }
        if FFctPrv = smtpFctEhlo then
            FFctSet := [smtpFctHelo]
        else begin
            FHighLevelResult := FRequestResult;
            if (FFctPrv = smtpFctQuit) or (not (smtpFctQuit in FFctSet)) then
                FFctSet := []
            else
                FFctSet := [smtpFctQuit];
        end;
    end;

    try
        if smtpFctConnect in FFctSet then begin
            FFctPrv := smtpFctConnect;
            FFctSet := FFctSet - [FFctPrv];
            Connect;
            Exit;
        end;

        if smtpFctHelo in FFctSet then begin
            FFctPrv := smtpFctHelo;
            FFctSet := FFctSet - [FFctPrv];
            Helo;
            Exit;
        end;

        if smtpFctEhlo in FFctSet then begin
            FFctPrv := smtpFctEhlo;
            FFctSet := FFctSet - [FFctPrv];
            Ehlo;
            Exit;
        end;

        if smtpFctAuth in FFctSet then begin
            FFctPrv := smtpFctAuth;
            FFctSet := FFctSet - [FFctPrv];
            Auth;
            Exit;
        end;

        if smtpFctVrfy in FFctSet then begin
            FFctPrv := smtpFctVrfy;
            FFctSet := FFctSet - [FFctPrv];
            Vrfy;
            Exit;
        end;

        if smtpFctMailFrom in FFctSet then begin
            FFctPrv := smtpFctMailFrom;
            FFctSet := FFctSet - [FFctPrv];
            MailFrom;
            Exit;
        end;

        if smtpFctRcptTo in FFctSet then begin
            FFctPrv := smtpFctRcptTo;
            FFctSet := FFctSet - [FFctPrv];
            RcptTo;
            Exit;
        end;

        if smtpFctData in FFctSet then begin
            FFctPrv := smtpFctData;
            FFctSet := FFctSet - [FFctPrv];
            Data;
            Exit;
        end;

        if smtpFctQuit in FFctSet then begin
            FFctPrv := smtpFctQuit;
            FFctSet := FFctSet - [FFctPrv];
            Quit;
            Exit;
        end;

        if smtpFctCalcMsgSize in FFctSet then begin
            FFctPrv := smtpFctCalcMsgSize;
            FFctSet := FFctSet - [FFctPrv];
            CalcMsgSize;
            Exit;
        end;

        if smtpFctMailFromSIZE in FFctSet then begin
            FFctPrv := smtpFctMailFromSIZE;
            FFctSet := FFctSet - [FFctPrv];
            MailFromSIZE;
            Exit;
        end;
        
    except
        on E : Exception do begin
          {$IFDEF TRACE}
            TriggerDisplay('! ' + E.ClassName + ': "' + E.Message + '"');
          {$ENDIF}
            FHighLevelResult := 500;
            FRequestResult   := 500;
            FErrorMessage    := '500 Internal client error ' +
                                E.ClassName + ': "' + E.Message + '"';
        end;
    end;
    
    {$IFDEF TRACE} TriggerDisplay('! HighLevelAsync done'); {$ENDIF}
    FFctSet          := [];
    FNextRequest     := nil;
    FRequestDoneFlag := FALSE;
    TriggerRequestDone(FHighLevelResult);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.HighLevelAsync(
    RqType : TSmtpRequest; Fcts : TSmtpFctSet);
begin
    if FConnected and (smtpFctConnect in Fcts) then
        raise SmtpException.Create('SMTP component already connected');
    CheckReady;
    FLastResponseSave := FLastResponse;
    FStatusCodeSave   := -1;
    FRequestType      := RqType;
    FRequestResult    := 0;
    FFctSet           := Fcts;
    FFctPrv           := smtpFctNone;
    FHighLevelResult  := 0;
    FHighLevelFlag    := TRUE;
    FLastResponse     := '';
    FErrorMessage     := '';
    FRestartFlag      := FALSE;
    DoHighLevelAsync;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Open;
begin
    if FAuthType <> smtpAuthNone then
        HighLevelAsync(smtpOpen, [smtpFctConnect, smtpFctEhlo, smtpFctAuth])
    else
        HighLevelAsync(smtpOpen, [smtpFctConnect, smtpFctHelo]);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.Mail;
begin
    HighLevelAsync(smtpMail, [smtpFctMailFrom, smtpFctRcptTo, smtpFctData]);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.WSocketSessionClosed(Sender : TObject; ErrorCode : WORD);
begin
    FConnected := FALSE;
    TriggerSessionClosed(ErrorCode);
    if FRequestType = smtpQuit then
        TriggerRequestDone(0)           { We where just waiting for close }
    else
        TriggerRequestDone(WSAEINTR);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerHeaderLine(Line : Pointer; Size : Integer);
begin
    if Assigned(FOnHeaderLine) then
        FOnHeaderLine(Self, Line, Size);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerMessageDataSent;
begin
    if Assigned(FOnMessageDataSent) then begin
        FOnMessageDataSent(Self, FCurrSize);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerGetData(
    LineNum  : Integer;
    MsgLine  : Pointer;
    MaxLen   : Integer;
    var More : Boolean);
begin
    if not Assigned(FOnGetData) then
        More := FALSE
    else
        FOnGetData(Self, LineNum, MsgLine, MaxLen, More);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SetRcptName(newValue : TStrings);
var
    I : Integer;
begin
    FRcptName.Clear;
    for I := 0 to newValue.Count - 1 do
        FRcptName.Add(newValue.Strings[I]);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SetMailMessage(newValue : TStrings);
var
    I : Integer;
begin
    FMailMessage.Clear;
    for I := 0 to newValue.Count - 1 do
        FMailMessage.Add(newValue.Strings[I]);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TimeZoneBiasDT : TDateTime;
const
    Time_Zone_ID_DayLight = 2;
var
    TZI       : tTimeZoneInformation;
    TZIResult : Integer;
    aBias     : Integer;         { Minutes }
begin
    TZIResult := GetTimeZoneInformation(TZI);
    if TZIResult = -1 then
        Result := 0
    else begin
         if TZIResult = Time_Zone_ID_DayLight then
             aBias := TZI.Bias + TZI.DayLightBias
         else
             aBias := TZI.Bias + TZI.StandardBias;
         Result := EncodeTime(Abs(aBias) div 60, Abs(aBias) mod 60, 0, 0);
         if aBias < 0 then
             Result := -Result;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF NEVER}
function Rfc822DateTime(t : TDateTime) : String;
var
    Year, Month, Day     : WORD;
    Hour, Min, Sec, MSec : WORD;
    Gmt                  : TDateTime;
const
    Days : array [1..7] of string =
        ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
    Months : array [1..12] of string =
        ('Jan', 'Feb', 'Mar', 'Apr',
         'May', 'Jun', 'Jul', 'Aug',
         'Sep', 'Oct', 'Nov', 'Dec');
begin
    Gmt := T + TimeZoneBias;
    DecodeDate(Gmt, Year, Month, Day);
    DecodeTime(Gmt, Hour, Min, Sec, MSec);
    { Format is 'ddd, d mmm yyyy hh:mm:ss GMT' with english names }
    Result := Format('%s, %d %s %4d %02.2d:%02.2d:%02.2d GMT',
                     [Days[DayOfWeek(Gmt)],
                      Day, Months[Month], Year,
                      Hour, Min, Sec]);
end;

{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TimeZoneBias : String;
const
    Time_Zone_ID_DayLight = 2;
var
    TZI       : tTimeZoneInformation;
    TZIResult : Integer;
    aBias     : Integer;
begin
    TZIResult := GetTimeZoneInformation(TZI);
    if TZIResult = -1 then
        Result := '-0000'
    else begin
         if TZIResult = Time_Zone_ID_DayLight then   { 10/05/99 }
             aBias := TZI.Bias + TZI.DayLightBias
         else
             aBias := TZI.Bias + TZI.StandardBias;
         Result := Format('-%.2d%.2d', [Abs(aBias) div 60, Abs(aBias) mod 60]);
         if aBias < 0 then
             Result[1] := '+';
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function Rfc822DateTime(t : TDateTime) : String;
var
    I                   : Integer;
    SaveShortDayNames   : array[1..7] of string;
    SaveShortMonthNames : array[1..12] of string;
const
    MyShortDayNames: array[1..7] of string =
        ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
    MyShortMonthNames: array[1..12] of string =
        ('Jan', 'Feb', 'Mar', 'Apr',
         'May', 'Jun', 'Jul', 'Aug',
         'Sep', 'Oct', 'Nov', 'Dec');
begin
    if ShortDayNames[1] = MyShortDayNames[1] then
        Result := FormatDateTime('ddd, d mmm yyyy hh":"mm":"ss', t) +
                  ' ' + TimeZoneBias
    else begin
        { We used a localized Delphi version, the day and month names are no }
        { more english names ! We need to save and replace them              }
        for I := Low(ShortDayNames) to High(ShortDayNames) do begin
            SaveShortDayNames[I] := ShortDayNames[I];
            ShortDayNames[I]     := MyShortDayNames[I];
        end;

        for I := Low(ShortMonthNames) to High(ShortMonthNames) do begin
            SaveShortMonthNames[I] := ShortMonthNames[I];
            ShortMonthNames[I]     := MyShortMonthNames[I];
        end;

        Result := FormatDateTime('ddd, d mmm yyyy hh":"mm":"ss', t) +
                  ' ' + TimeZoneBias;

        for I := Low(ShortDayNames) to High(ShortDayNames) do
            ShortDayNames[I] := SaveShortDayNames[I];
        for I := Low(ShortMonthNames) to High(ShortMonthNames) do
            ShortMonthNames[I] := SaveShortMonthNames[I];
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function GenerateMessageID : String;                                     {AG}
begin
    Result := FormatDateTime('yyyymmddhhnnsszzz', Now + TimeZoneBiasDT) + '.' +
              IntToHex(Random(32767), 4) + IntToHex(Random(32767), 4) +
              IntToHex(Random(32767), 4) + IntToHex(Random(32767), 4) +
              '@' + String(LocalHostName);

end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.EndSendToStream;
begin
    if FMsgSizeFlag then begin
        FMsgSizeFlag  := FALSE;
        FSendMode     := FOldSendMode;
        FOnDisplay    := FOldOnDisplay;
        FLastResponse := '200 MessageSize=' + IntToStr(FMsgSize);
        FStatusCode   := 200;
        TriggerResponse(FLastResponse);
        TriggerRequestDone(0);
    end
    else begin
        if Assigned(FOutStream) then
        try
            if Assigned(FOnBeforeOutStreamFree) then
                FOnBeforeOutStreamFree(Self);
        finally
            if Assigned(FOutStream) then begin
                FOutStream.Free;
                FOutStream := nil;
            end;
        end;
        if FRequestType = smtpToFile then begin
            if FRequestResult = 0 then begin
                FLastResponse := '200 Message sent to file';
                FStatusCode   := 200;
            end
            else
                SetErrorMessage;
            TriggerResponse(FLastResponse);
            TriggerRequestDone(FRequestResult);
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SendLineToStream(Data: Pointer; Len: Integer);
begin
    if (not FMsgSizeFlag) and Assigned(FOutStream) then
    try
        // raise SmtpException.Create('Test SendLineToStream');
        if (Len > 1) and (PAnsiChar(Data)[0] = '.') and
           (PAnsiChar(Data)[1] = '.') then
            FOutStream.Write(PAnsiChar(Data)[1], Len - 1)
        else
            FOutStream.Write(Data^, Len);
        FOutStream.Write(PAnsiChar(#13#10)^, 2);
    except
        on E: Exception do begin
            FLastResponse   := '500 ' + E.ClassName + ' ' + E.Message;
            FStatusCode     := 500;
            FRequestResult  := 500;
            EndSendToStream;
            if FSendMode = smtpCopyToStream then begin
                EndFileEncBase64(FStream);
                SetErrorMessage;
                TriggerResponse(FLastResponse);
                TriggerRequestDone(FRequestResult);
                FWSocket.Abort;
            end;

            Exit;
        end;
    end;
    if FSendMode = smtpToStream then begin
        Inc(FCurrSize, 2);
        if FMsgSizeFlag then
            Inc(FMsgSize, FCurrSize)
        else
            TriggerMessageDataSent;
        PostMessage(Handle, FMsg_WM_SMTP_DATA_NEXT, 0 , 0);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SendToFile(
    const FileName  : String);
const
    Msg = 'SendToFile';
begin
    if FState <> smtpReady then
        raise SmtpException.Create('SMTP component not ready');
    if FSendMode <> smtpToStream then
        raise Exception.Create('SendToFile requires SendMode smtpToStream');
    if Length(FileName) = 0 then
        raise Exception.Create('File name not specified');
    if Assigned(FOutStream) then
        FOutStream.Free;
{$IFDEF USE_BUFFERED_STREAM}
    FOutStream := TBufferedFileStream.Create(FileName, fmCreate, MAX_BUFSIZE);
{$ELSE}
    FOutStream := TFileStream.Create(FileName, fmCreate);
{$ENDIF}

    FRequestType := smtpToFile;
    FOkResponses[0] := 200;
    FOkResponses[1] := 0;
    FRequestDoneFlag := FALSE;
    FLastResponse  := '';
    FStatusCode    := 0;
    FRequestResult := 0;
    FMsgSizeFlag   := FALSE;
    StateChange(smtpInternalBusy);
    TriggerCommand(Msg);
    TriggerDisplay('> ' + Msg);
    Data;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerProcessHeader(HdrLines : TStrings);
begin
    if Assigned(FOnProcessHeader) then
        FOnProcessHeader(Self, HdrLines);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerCommand(Msg : String);
begin
    if Assigned(FOnCommand) then
        FOnCommand(Self, Msg);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.TriggerResponse(Msg : String);
begin
    { Catch multi-line Ehlo response, parse it for AuthTypes supported}
    if FFctPrv = smtpFctEhlo then begin
      AuthGetType;
      if not FSizeExt then begin
          FSizeExt := Pos('SIZE', Msg) = 5;
          if FSizeExt and (Length(Msg) > 9) then
              FMaxMsgSize := StrToIntDef(Copy(Msg, 9, 1000), 0);
      end;
    end;

    if Assigned(FOnResponse) then
        FOnResponse(Self, Msg);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.ClearErrorMessage;
begin
    FErrorMessage := '';
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TCustomSmtpClient.SetErrorMessage;
begin
    if FErrorMessage = '' then
        FErrorMessage := FLastResponse;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TSmtpCli.Create(AOwner : TComponent);
begin
    inherited Create(AOwner);
    FEmailBody   := TStringList.Create;
    FEmailFiles  := TStringList.Create;
    FMailMsgText := TSmtpMessageText.Create;
    FAttachmentEncoding := smtpEncodeBase64;                        {AG}
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
destructor TSmtpCli.Destroy;
begin
    if Assigned(FEmailBody) then begin
        FEMailBody.Destroy;
        FEMailBody := nil;
    end;
    if Assigned(FEmailFiles) then begin
        FEmailFiles.Destroy;
        FEmailFiles := nil;
    end;
    FreeAndNil(FMailMsgText);
    inherited Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.TriggerAttachContentType(
    FileNumber      : Integer;
    var FileName    : String;
    var ContentType : String);
begin
    if Assigned(FOnAttachContentType) then
        FOnAttachContentType(Self, FileNumber, FileName, ContentType);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.TriggerAttachContentTypeEh(                           {AG}
    FileNumber      : Integer;
    var FileName    : String;
    var ContentType : String);
begin
    if FAttachmentEncoding <> smtpEncodeBase64 then
        FAttachmentEncoding := smtpEncodeBase64;  // revert to default Base64
    if Assigned(FOnAttachContentTypeEh) then
        FOnAttachContentTypeEh(Self, FileNumber, FileName, ContentType,
                               FAttachmentEncoding);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.TriggerAttachHeader(
    FileNumber : Integer;
    FileName   : String;
    HdrLines   : TStrings);
begin
    if Assigned(FOnAttachHeader) then
        FOnAttachHeader(Self, FileNumber, FileName, HdrLines);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.TriggerGetData(
    LineNum  : Integer;
    MsgLine  : Pointer;
    MaxLen   : Integer;
    var More : Boolean);
var
    sLine        : AnsiString;
    FileName     : String;
    sFileName    : String;
    sContentType : String;
    BAction      : TSmtpBeforeOpenFileAction;                               {AG}
    AAction      : TSmtpAfterOpenFileAction;                                {AG}
    EncType      : AnsiChar;                                                {AG}
begin
    if FEmailBody.Count > 0 then begin
        {if MaxLen > (1022 * SizeOf(Char)) then // already checked in DataNext
            MaxLen := (1022 * SizeOf(Char));  { RFC say 1024 char max, including nul char }
        StrPLCopy(PAnsiChar(MsgLine), AnsiString(FEmailBody[0]), MaxLen);
        FEmailBody.Delete(0);
        More := TRUE;
        Exit;
    end;

    if FBodyFlag then begin
        {AG start}
        if FMailMsgText.CurrentIdx > 0 then begin
            sLine := FMailMsgText.NextLineAsString;
            StrPLCopy(PAnsiChar(MsgLine), SLine, MaxLen);
            Exit;
        end;
        {AG end}
        Inc(FBodyLine);
        inherited TriggerGetData(FBodyLine, MsgLine, MaxLen, More);
        if More then
            Exit;
        FBodyFlag := FALSE;
    end;

    if not FFileStarted then begin
        if (not Assigned(FEMailFiles)) or
           (FEmailFiles.Count <= FCurrentFile) then begin
            { No file to send }
            More := FALSE;
            Exit;
        end;

        StrPCopy(PAnsiChar(MsgLine), '');
        FileName := FEmailFiles[FCurrentFile];

        {AG start}
        BAction := smtpBeforeOpenFileNone;
        if Assigned(FOnBeforeFileOpen) then begin
            FOnBeforeFileOpen(Self, FCurrentFile, FileName, BAction);
            case BAction of
                smtpBeforeOpenFileNext  : begin
                                              Inc(FCurrentFile);
                                              More := TRUE;
                                              Exit
                                          end;
                smtpBeforeOpenFileAbort : begin
                                              More := FALSE;
                                              Abort;
                                              { See TCustomSmtpClient.DataNext,
                                               calling Abort here made prob. }
                                              Exit
                                          end;
            end;
        end;

        AAction := smtpAfterOpenFileNone;
        try
            FStream := InitFileEncBase64(FileName, FShareMode);
            if Assigned(FOnAfterFileOpen) then begin
                FOnAfterFileOpen(Self, FCurrentFile, FileName, nil, AAction);
                case AAction of
                    smtpAfterOpenFileNext  : begin
                                                 EndFileEncBase64(FStream);
                                                 Inc(FCurrentFile);
                                                 More := TRUE;
                                                 Exit
                                             end;
                    smtpAfterOpenFileRetry : begin
                                                 EndFileEncBase64(FStream);
                                                 More := TRUE;
                                                 Exit
                                             end;
                    smtpAfterOpenFileAbort : begin
                                                 EndFileEncBase64(FStream);
                                                 More := FALSE;
                                                 Abort;
                                                 Exit
                                             end;
                end;
            end;
        except
            on E:Exception do begin
                if Assigned(FOnAfterFileOpen) then begin
                    FOnAfterFileOpen(Self, FCurrentFile, FileName, E, AAction);
                    case AAction of
                        smtpAfterOpenFileNone  : raise;
                        smtpAfterOpenFileNext  : begin
                                                     Inc(FCurrentFile);
                                                     More := TRUE;
                                                     Exit
                                                 end;
                        smtpAfterOpenFileRetry : begin
                                                     More := TRUE;
                                                     Exit;
                                                 end;
                        smtpAfterOpenFileAbort : begin
                                                     More := FALSE;
                                                     Abort;
                                                     Exit
                                                 end;
                    end;
                end
                else
                    raise;
            end;
        end;
        {AG end}

        sFileName    := ExtractFileName(FileName);
        sContentType := FilenameToContentType(sFileName);
        TriggerAttachContentType(FCurrentFile, sFileName, sContentType);
        TriggerAttachContentTypeEh(FCurrentFile, sFileName, sContentType);
        FEmailBody.Add('--' + String(FMimeBoundary));
        FEmailBody.Add('Content-Type: ' + sContentType + ';');
        {AG start}
        { In order to not TriggerAttachHeader with a modified filename we add }
        { inline encoding and folding to a copy.                              }
        if not FAllow8bitChars and NeedsEncoding(sFileName) then begin
            if (FEncoding = smtpEncBase64) then
                EncType := 'B'
            else
                EncType := 'Q';
           { Length of (#9'filename=""') equals 12 }
        {$IFDEF UNICODE}
            sLine := AnsiString(HdrEncodeInline(UnicodeToAnsi(sFileName, FCodePage),
                                     SpecialsRFC822,
                                     EncType, AnsiString(FCharSet),
                                     75 - 12,
                                     FFoldHeaders));
        {$ELSE}
            sLine := HdrEncodeInline(sFileName, SpecialsRFC822,
                                     EncType, FCharSet,
                                     75 - 12,
                                     FFoldHeaders);
        {$ENDIF}
        end
        else begin
        {$IFDEF UNICODE}
            sLine := UnicodeToAnsi(sFileName, FCodePage);
        {$ELSE}
            sLine := sFileName;
        {$ENDIF}
            if FFoldHeaders and (Length(sLine) + 12 > 76) then
                sLine := FoldString(sLine,
                                    [#32, 'A'..'Z', 'a'..'z', '0'..'9'],
                                    75 - 12);
        end;
        {AG end}
        FEmailBody.Add(#9'name="' + String(sLine) + '"');                  {AG}
        if FAttachmentEncoding = smtpEncodeBase64 then                     {AG}
            FEmailBody.Add('Content-Transfer-Encoding: base64')            {AG}
        else if FAttachmentEncoding = smtpEncodeQP then                    {AG}
            FEmailBody.Add('Content-Transfer-Encoding: quoted-printable')  {AG}
        else
            FEmailBody.Add('Content-Transfer-Encoding: 7bit');             {AG}
        FEmailBody.Add('Content-Disposition: attachment;');
        FEmailBody.Add(#9'filename="' + String(sLine) + '"');              {AG}
        TriggerAttachHeader(FCurrentFile, sFileName, FEmailBody);
        FEmailBody.Add('');
        FFileStarted := TRUE;
        More         := TRUE;
        Exit;
    end;
    if FAttachmentEncoding = smtpEncodeBase64 then begin                   {AG}
        if not FMsgSizeFlag then                                           {AG}
            sLine := DoFileEncBase64(FStream, More)
        else begin { Just calculate the B64 size including CRLFs }         {AG}
            if FStream.Size > 0 then                                       {AG}
                Inc(FMsgSize, CalcBase64AttachmentGrow(FStream.Size) -2);  {AG}
            More := FALSE;                                                 {AG}
        end;                                                               {AG}
    end
    else if FAttachmentEncoding = smtpEncodeQP then                        {AG}
        sLine := DoFileEncQuotedPrintable(FStream, More)                   {AG}                                                                   {AG}
    else
        sLine := DoTextFileReadNoEncoding(FStream, More);                  {AG}

    StrPLCopy(PAnsiChar(MsgLine), sLine, MaxLen);
    if not More then begin  { we hit the end of file. }
        EndFileEncBase64(FStream);
        FFileStarted := FALSE;
        Inc(FCurrentFile);
        if (FEmailFiles.Count <= FCurrentFile) then begin
            { Next line outcommented due to recent fix in DoFileEncBase64 }
            //if sLine <> '' then    { Avoid two blank lines after attachment AG }
            FEmailBody.Add('');
            FEmailBody.Add('--' + String(FMimeBoundary) + '--');
        end;
        More := TRUE;
        Exit;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.TriggerHeaderLine(Line : Pointer; Size : Integer);
begin
    { if we have a MIME type message, then replace the content-type }
    { header with the proper MIME content-type.                     }
    if FMimeBoundary <> '' then begin
        if (StrLen(PAnsiChar(Line)) > 0) and
           (StrLIComp(PAnsiChar('CONTENT-TYPE:'), PAnsiChar(Line), 13) = 0) then
            StrPCopy(PAnsiChar(Line), 'Content-Type: multipart/mixed;'#13#10#9'boundary="'
                     + FMimeBoundary + '"');
    end
    else if (StrLen(PAnsiChar(Line)) > 0) and
            (StrLIComp('CONTENT-TYPE: TEXT', Line, 18) = 0) then           {AG}
        if FEncoding <> smtpEnc7bit then begin                             {AG}
            StrCat(PAnsiChar(Line), PAnsiChar(#13#10 + 'Content-Transfer-Encoding: '));
            StrCat(PAnsiChar(Line), PAnsiChar(SmtpDefEncArray[Ord(FEncoding)]));
        end;
    inherited TriggerHeaderLine(Line, Size);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.SetEMailFiles(newValue : TStrings);
var
    I        : Integer;
    FilePath : String;
begin
    FEMailFiles.Clear;
    if not Assigned(newValue) then
        Exit;
    for I := 0 to newValue.Count - 1 do begin
        FilePath := Trim(newValue.Strings[I]);
        { Ignore any empty file name (a very common error !) }
        if FilePath > '' then begin
            { Check if file exists and raise an exception if not }
            if FileExists(FilePath) then
                FEMailFiles.Add(FilePath)
            else
                raise SmtpException.Create('File not found ''' + FilePath + '''');
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.Data;
begin
    PrepareEMail;
    inherited Data;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSmtpCli.PrepareEMail;
begin
    FBodyFlag    := TRUE;
    FCurrentFile := 0;
    FBodyLine    := 0;
    FFileStarted := FALSE;
    FEncoding    := FDefaultEncoding;                                   {AG}
    {AG start}
    { FMailMessage.Text will be encoded/wrapped later on the fly,       }
    { see also TriggerGetData and DoGetMsgTextLine                      }
    FMailMsgText.SetText(FMailMessage.Text, FCodePage, FWrapMessageText);
    { Check if we have to change Encoding.                              }
    if FMailMsgText.CurrentIdx > 0 then begin
        if (FEncoding in [smtpEnc7bit, smtpEnc8bit]) and (not FAllow8bitChars) and
           FMailMsgText.FNeedsEncoding then
            FEncoding := smtpEncQuotedPrintable
        else if (FEncoding = smtpEnc7bit) and FAllow8bitChars and
             FMailMsgText.FNeedsEncoding then
            FEncoding := smtpEnc8bit;

        FMailMsgText.Encoding := FEncoding;
    end;
    FEmailBody.Clear;
    if Assigned(FEMailFiles) and (FEmailFiles.Count > FCurrentFile) then begin
        FMimeBoundary := '= Multipart Boundary ' +
                         AnsiString(FormatDateTime('mmddyyhhnn', Now));
        FEmailBody.Add('This is a multipart MIME message.');
        FEmailBody.Add('');
        FEmailBody.Add('--' + String(FMimeBoundary));
        FEmailBody.Add('Content-Type: ' + FContentTypeStr +
                       '; charset="' + FCharSet + '"');
        FEmailBody.Add('Content-Transfer-Encoding: ' +
                        String(SmtpDefEncArray[Ord(FEncoding)]));        {AG}
        {FEmailBody.Add('Content-Transfer-Encoding: 7bit');}             {AG}
        FEmailBody.Add('');
    end
    else
        FMimeBoundary := '';
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This may take a while!                                                    }
{ Do not expect 100% exact values returned by this function, though they    }
{ are pretty exact!                                                         }
procedure TCustomSmtpClient.CalcMsgSize;
const
    Msg = 'CalcMsgSize';
begin
    FOldSendMode   := FSendMode;
    FOldOnDisplay  := FOnDisplay;

    CheckReady;

    if not FHighLevelFlag then
        FRequestType := smtpCalcMsgSize;

    FOkResponses[0]   := 200;
    FOkResponses[1]   := 0;
    FRequestDoneFlag  := FALSE;
    FFctPrv           := smtpFctCalcMsgSize;
    FMsgSizeFlag      := TRUE;
    FMsgSize          := 0;
    FSendMode         := smtpToStream; // Has to be reset later in EndSendToStream
    StateChange(smtpInternalBusy);
    TriggerCommand(Msg);
    TriggerDisplay('> ' + Msg);
    FOnDisplay     := nil;  // Has to be reset later in EndSendToStream
    Data;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This may take a while!                                                    }
{ Do not expect 100% exact values returned by this function, though they    }
{ are pretty exact!                                                         }
procedure TSmtpCli.CalcMsgSizeSync;
var
    Dummy     : THandle;
    OldState  : TSmtpState;
begin
    FOldSendMode     := FSendMode;
    FOldOnDisplay    := FOnDisplay;
    OldState         := FState;
    try
        CalcMsgSize;
        Dummy := INVALID_HANDLE_VALUE;
        while FState = smtpInternalBusy do
        begin
            if MsgWaitForMultipleObjects(0, Dummy, False, 250, QS_ALLINPUT) = WAIT_FAILED then
                raise SmtpException.Create('Wait failed in CalcMsgSizeSync');
            if FMultiThreaded then
                FWSocket.ProcessMessages
            else
            {$IFNDEF NOFORMS}
                Application.ProcessMessages;
            {$ELSE}
                FWSocket.ProcessMessages;
            {$ENDIF}
        end;
    except
        FMsgSizeFlag  := FALSE;
        FSendMode     := FOldSendMode;
        FOnDisplay    := FOldOnDisplay;
        StateChange(OldState);
        raise;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TSyncSmtpCli.Create(AOwner : TComponent);
begin
    inherited Create(AOwner);
    FTimeout := 15;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.WaitUntilReady : Boolean;
var
    DummyHandle     : THandle;
begin
    Result    := TRUE;           { Assume success }
    FTimeStop := Integer(GetTickCount) + FTimeout * 1000;
    while TRUE do begin
        if FState = smtpReady then begin
            { Back to ready state, the command is finiched }
            Result := (FRequestResult = 0);
            break;
        end;

        if  {$IFNDEF NOFORMS} Application.Terminated or {$ENDIF}
            ((FTimeout > 0) and (Integer(GetTickCount) > FTimeStop)) then begin
            { Application is terminated or timeout occured }
            inherited Abort;
            FErrorMessage := '426 Timeout';
            FStatusCode   := 426;
            Result        := FALSE; { Command failed }
            break;
        end;

        { Do not use 100% CPU }
        DummyHandle := INVALID_HANDLE_VALUE;                                           //FP
        MsgWaitForMultipleObjects(0, DummyHandle, FALSE, 1000, QS_ALLINPUT);           //FP

        if FMultiThreaded then
            FWSocket.ProcessMessages
        else
{$IFNDEF NOFORMS}
            Application.ProcessMessages;
{$ELSE}
            FWSocket.ProcessMessages;
{$ENDIF}
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.Synchronize(Proc : TSmtpNextProc) : Boolean;
begin
    try
        Proc;
        Result := WaitUntilReady;
    except
        Result := FALSE;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.ConnectSync : Boolean;
begin
    Result := Synchronize(Connect);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.HeloSync : Boolean;
begin
    Result := Synchronize(Helo);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.EhloSync : Boolean;
begin
    Result := Synchronize(Ehlo);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.AuthSync : Boolean;
begin
    Result := Synchronize(Auth);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.VrfySync : Boolean;
begin
    Result := Synchronize(Vrfy);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.OpenSync : Boolean;
begin
    Result := Synchronize(Open);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.MailFromSync : Boolean;
begin
    Result := Synchronize(MailFrom);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.RcptToSync : Boolean;
begin
    Result := Synchronize(RcptTo);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.DataSync : Boolean;
begin
    Result := Synchronize(Data);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.MailSync : Boolean;
begin
    Result := Synchronize(Mail);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.QuitSync : Boolean;
begin
    Result := Synchronize(Quit);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.RsetSync : Boolean;
begin
    Result := Synchronize(RSet);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSyncSmtpCli.AbortSync : Boolean;
begin
    Result := Synchronize(Abort);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSyncSmtpCli.TriggerGetData(
    LineNum  : Integer;
    MsgLine  : Pointer;
    MaxLen   : Integer;
    var More : Boolean);
begin
    inherited TriggerGetData(LineNum, MsgLine, MaxLen, More);
    { Evaluate the timeout period again }
    if FTimeout > 0 then
        FTimeStop := Integer(GetTickCount) + FTimeout * 1000;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor THtmlSmtpCli.Create(AOwner : TComponent);
begin
    inherited Create(AOwner);
    FPlainText    := TStringList.Create;
    FEmailImages  := TStringList.Create;
    FHtmlText     := TStringList.Create;
    FHtmlCodePage := IcsSystemCodePage;
    FHtmlCharSet  := CodePageToMimeCharsetString(FCodePage);
    SetContentType(smtpHtml);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
destructor THtmlSmtpCli.Destroy;
begin
    ClearImageStreamArray;
    if Assigned(FPlainText) then begin
        FPlainText.Destroy;
        FPlainText := nil;
    end;
    if Assigned(FHtmlText) then begin
        FHtmlText.Destroy;
        FHtmlText := nil;
    end;
    if Assigned(FEmailImages) then begin
        FEmailImages.Destroy;
        FEmailImages := nil;
    end;
    inherited Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.SetEMailImages(newValue : TStrings);
var
    I        : Integer;
    FilePath : String;
begin
    FEMailImages.Clear;
    if not Assigned(newValue) then
        Exit;
    for I := 0 to newValue.Count - 1 do begin
        FilePath := Trim(newValue.Strings[I]);
        { Ignore any empty file name (a very common error !) }
        if FilePath > '' then begin
            { Check if file exists and raise an exception if not }
            if FileExists(FilePath) then
                FEMailImages.Add(FilePath)
            else
                raise SmtpException.Create('File not found ''' + FilePath + '''');
        end;
    end;
end;
{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function THtmlSmtpCli.GetImageStreamCount: Integer;
begin
    if not Assigned(FStreamArray) then
        Result := 0
    else
        Result := FStreamArray.Count;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.ClearImageStreamArray;
begin
    if Assigned(FStreamArray) then begin
        FStreamArray.Destroy;
        FStreamArray := nil;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function THtmlSmtpCli.GetImageStream(Index: Integer): TStream;
begin
    if not Assigned(FStreamArray) then
        Result := nil
    else if Index >= FStreamArray.Count then
        Result := nil
    else
        Result := FStreamArray[Index];
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.SetImageStream(
    Index       : Integer;
    const Value : TStream);
begin
    if not Assigned(Value) then
        Exit;
    if not Assigned(FStreamArray) then
        FStreamArray := TList.Create;
    while Index >= FStreamArray.Count do
        FStreamArray.Add(nil);
    FStreamArray.Items[Index] := Value;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.SetHtmlCharset(const Value: String);
begin
    FHtmlCharSet := _LowerCase(Value);
    { If empty set the default system codepage }
    if Length(FHtmlCharSet) = 0 then begin
        FHtmlCodePage := IcsSystemCodePage;
        FHtmlCharSet  := CodePageToMimeCharsetString(FHtmlCodePage);
    end
    else begin
        if not MimeCharsetToCodePage(FHtmlCharset, FHtmlCodePage) then
        begin
            { Set default system codepage and charset }
            FHtmlCodePage := IcsSystemCodePage;
            FHtmlCharset  := CodePageToMimeCharsetString(FHtmlCodePage);
            raise SmtpException.Create('Charset "' + Value + '" is not supported');
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.SetHtmlText(const newValue: TStrings);
var
    I : Integer;
begin
    FHtmlText.Clear;
    if Assigned(newValue) then
        for I := 0 to newValue.Count - 1 do
            FHtmlText.Add(newValue.Strings[I]);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.SetPlainText(const newValue: TStrings);
var
    I : Integer;
begin
    FPlainText.Clear;
    if Assigned(newValue) then
        for I := 0 to newValue.Count - 1 do
            FPlainText.Add(newValue.Strings[I]);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.TriggerGetData(
    LineNum  : Integer;
    MsgLine  : Pointer;
    MaxLen   : Integer; // Must not be > 1022
    var More : Boolean);
var
//  Len          : Integer;
    LineBuf      : AnsiString;
    FileName     : String;
    BAction      : TSmtpBeforeOpenFileAction;
    AAction      : TSmtpAfterOpenFileAction;
begin
    if FContentType = smtpPlainText then begin
        { Strange but the user ask to send plain text message }
        if FEmailBody.Count > 0 then begin
            (*
            if MaxLen > 1022 then { Already corrected in DataNext } { AG 11/04/07 }
                MaxLen := 1022;  { RFC say 1024 char max, including nul char and room for doubled dot}
            *)
            StrPLCopy(PAnsiChar(MsgLine), AnsiString(FEmailBody[0]), MaxLen);
            FEmailBody.Delete(0);
            if FEmailBody.Count = 0 then
                FLineOffset := LineNum;
            More := TRUE;
            Exit;
        end;

        if FBodyFlag then begin
            if FMailMsgText.CurrentIdx > 0 then begin
                LineBuf := FMailMsgText.NextLineAsString;
                StrPLCopy(PAnsiChar(MsgLine), LineBuf, MaxLen);
                Exit;
            end;
            More := FALSE;
            Inc(FBodyLine);
            FBodyFlag := FALSE;     {AG 07/21/08}
            {if More then
                Exit;
             FBodyFlag := FALSE; }  {AG 07/21/08}
        end;

        inherited TriggerGetData(LineNum, MsgLine, MaxLen, More);
        Exit;
    end;

    if FMimeState = smtpMimeIntro then begin
        case LineNum of
            1: StrPCopy(PAnsiChar(MsgLine), 'This is a multipart MIME formatted message.');
            2: StrPCopy(PAnsiChar(MsgLine), '');
            3: StrPCopy(PAnsiChar(MsgLine), '--' + FOutsideBoundary);
        else

        if FEmailFiles.Count > 0 then begin
            case LineNum of
            //1: StrPCopy(PAnsiChar(MsgLine), 'This is a multipart MIME formatted message.');
            {2,} 7, 11, 15: StrPCopy(PAnsiChar(MsgLine), '');
            //3: StrPCopy(PAnsiChar(MsgLine), '--' + FOutsideBoundary);
            4: StrPCopy(PAnsiChar(MsgLine), 'Content-Type: multipart/related;');
            5: StrPCopy(PAnsiChar(MsgLine), #9'type="multipart/alternative";');
            6: StrPCopy(PAnsiChar(MsgLine), #9'boundary="' + FInsideBoundary + '"'); // Folded!

            8:  StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary);
            9:  StrPCopy(PAnsiChar(MsgLine), 'Content-Type: multipart/alternative;');
            10: StrPCopy(PAnsiChar(MsgLine), #9'boundary="' + FInnerBoundary + '"');

            12: StrPCopy(PAnsiChar(MsgLine), '--' + FInnerBoundary);
            13: StrPCopy(PAnsiChar(MsgLine), 'Content-Type: text/plain; charset="' +
                                             AnsiString(FCharSet) + '"');
            14: StrPCopy(PAnsiChar(MsgLine), 'Content-Transfer-Encoding: quoted-printable');
            16: begin
                    FMimeState  := smtpMimePlainText;
                    FLineOffset := LineNum - 1;
                    FMailMsgText.SetText(FPlainText.Text, FHtmlCodePage);
                    FEncoding := smtpEncQuotedPrintable;
                    FMailMsgText.Encoding := FEncoding;
                    FMsgLineCount := 0;
                end;
            end;
        end
        else begin
            case LineNum of
            //1: StrPCopy(PAnsiChar(MsgLine), 'This is a multipart MIME formatted message.');
            {2,} 6, 10: StrPCopy(PAnsiChar(MsgLine), '');
            //3: StrPCopy(PAnsiChar(MsgLine), '--' + FOutsideBoundary);
            4: StrPCopy(PAnsiChar(MsgLine), 'Content-Type: multipart/alternative;');
            5: StrPCopy(PAnsiChar(MsgLine), #9'boundary="' + FInsideBoundary + '"'); // Folded!

            7: StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary);
            8: StrPCopy(PAnsiChar(MsgLine), 'Content-Type: text/plain; charset="' +
                                            AnsiString(FCharSet) + '"');
            9: StrPCopy(PAnsiChar(MsgLine), 'Content-Transfer-Encoding: quoted-printable');
            11: begin
                    FMimeState  := smtpMimePlainText;
                    FLineOffset := LineNum - 1;
                    FMailMsgText.SetText(FPlainText.Text, FHtmlCodePage);
                    FEncoding := smtpEncQuotedPrintable;
                    FMailMsgText.Encoding := FEncoding;
                    FMsgLineCount := 0;
                end;
            end;
        end;
        end;
    end;
    if FMimeState = smtpMimeIntro then begin
        if Assigned(FOnGetData) then
            FOnGetData(Self, LineNum, MsgLine, MaxLen, More);
        Exit;
    end;

    if FMimeState = smtpMimePlainText then begin
        if FMailMsgText.CurrentIdx = 0 then begin
            case LineNum - FLineOffset - FMsgLineCount of
            1: StrPCopy(PAnsiChar(MsgLine), '');
            //2: StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary);
            2: if FEmailFiles.Count > 0 then
                   StrPCopy(PAnsiChar(MsgLine), '--' + FInnerBoundary)
               else
                   StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary);
            3: StrPCopy(PAnsiChar(MsgLine), 'Content-Type: text/html; charset="' +
                                 AnsiString(FHtmlCharSet) + '"');
            4: StrPCopy(PAnsiChar(MsgLine), 'Content-Transfer-Encoding: quoted-printable');
            5: StrPCopy(PAnsiChar(MsgLine), '');
            else
                FMimeState := smtpMimeHtmlText;
                FLineOffset := LineNum - 1;
                FMailMsgText.SetText(FHtmlText.Text, FCodePage);
                FEncoding := smtpEncQuotedPrintable;
                FMailMsgText.Encoding := FEncoding;
                FMsgLineCount := 0;
            end;
        end
        else begin
            if FMailMsgText.CurrentIdx > 0 then begin
                LineBuf := FMailMsgText.NextLineAsString;
                StrPLCopy(PAnsiChar(MsgLine), LineBuf, MaxLen);
                Inc(FMsgLineCount);
                Exit;
            end;
        end;
    end;
    if FMimeState = smtpMimePlainText then begin
        if Assigned(FOnGetData) then
            FOnGetData(Self, LineNum, MsgLine, MaxLen, More);
        Exit;
    end;

    if FMimeState = smtpMimeHtmlText then begin
        if FMailMsgText.CurrentIdx = 0 then begin
            case LineNum - FLineOffset - FMsgLineCount of
            1: StrPCopy(PAnsiChar(MsgLine), '');
            //2: StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary + '--');
            2: if FEmailFiles.Count > 0 then
                  StrPCopy(PAnsiChar(MsgLine), '--' + FInnerBoundary + '--')
               else
                  StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary + '--');
            3: StrPCopy(PAnsiChar(MsgLine), '');
            else
                FMimeState   := smtpMimeImages;
                FImageNumber := 1;
                FLineOffset  := LineNum - 1;
            end;
        end
        else begin
            if FMailMsgText.CurrentIdx > 0 then begin
                LineBuf := FMailMsgText.NextLineAsString;
                StrPLCopy(PAnsiChar(MsgLine), LineBuf, MaxLen);
                Inc(FMsgLineCount);
                Exit;
            end;
        end;
    end;
    if FMimeState = smtpMimeHtmlText then begin
        if Assigned(FOnGetData) then
            FOnGetData(Self, LineNum, MsgLine, MaxLen, More);
        Exit;
    end;

    if FMimeState in [smtpMimeImages, smtpMimeAttach] then begin
        if (FMimeState = smtpMimeImages) and (FEmailFiles.Count > 0) and
           (FImageNumber > FEmailImages.Count) then begin
                case LineNum - FLineOffset of
                  1:  StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary + '--');
                else
                    FMimeState := smtpMimeAttach;
                    FLineOffset  := LineNum;
                end;
        end
        else if FImageNumber > (FEmailImages.Count + FEmailFiles.Count) then begin
            case LineNum - FLineOffset of
            1:  StrPCopy(PAnsiChar(MsgLine), '--' + FOutsideBoundary + '--');
            else
                FMimeState := smtpMimeDone;
            end;
        end
        else begin
            case LineNum - FLineOffset of
            //1:  StrPCopy(PAnsiChar(MsgLine), '--' + FOutsideBoundary);
            1:  if (FMimeState = smtpMimeImages) and (FEmailFiles.Count > 0) then
                    StrPCopy(PAnsiChar(MsgLine), '--' + FInsideBoundary)
                else
                    StrPCopy(PAnsiChar(MsgLine), '--' + FOutsideBoundary);
            2:  begin
                    if FImageNumber <= FEmailImages.Count then
                        { First we send the image files }
                        FileName := ExtractFileName(
                                        FEmailImages[FImageNumber - 1])
                    else
                        { Then we send attached files }
                        FileName := ExtractFileName(FEmailFiles[FImageNumber -
                                                    FEmailImages.Count - 1]);
                    FsFileName    := ExtractFileName(FileName);
                    FsContentType := FilenameToContentType(FsFileName);
                    TriggerAttachContentType(FCurrentFile, FsFileName, FsContentType);
                    TriggerAttachContentTypeEh(FCurrentFile, FsFileName, FsContentType);
                    StrPCopy(PAnsiChar(MsgLine), 'Content-Type: ' + AnsiString(FsContentType) +
                                      ';' + #13#10#9 + 'name="' + AnsiString(FsFileName) + '"');
                end;
            3:  begin
                    if FAttachmentEncoding = smtpEncodeBase64 then          {AG}
                        StrPCopy(PAnsiChar(MsgLine), 'Content-Transfer-Encoding: base64')
                    else if FAttachmentEncoding = smtpEncodeQP then         {AG}                                         {AG}
                         StrPCopy(PAnsiChar(MsgLine), 'Content-Transfer-Encoding: quoted-printable')  {AG}                                    {AG}
                    else
                        StrPCopy(PAnsiChar(MsgLine), 'Content-Transfer-Encoding: 7bit');{AG}
                end;
            4:  begin
                    if FImageNumber <= FEmailImages.Count then
                        StrPCopy(PAnsiChar(MsgLine),
                                 'Content-Disposition: inline;' + #13#10#9 +
                                 'filename="' + AnsiString(FsFileName) + '"')
                    else
                        StrPCopy(PAnsiChar(MsgLine),
                                 'Content-Disposition: attachment;' + #13#10#9 +
                                 'filename="' + AnsiString(FsFileName) + '"');
                end;
            5:  begin
                    if FImageNumber <= FEmailImages.Count then
                        StrPCopy(PAnsiChar(MsgLine), 'Content-ID: <IMAGE' +
                                 IcsIntToStrA(FImageNumber) + '>')
                    else
                        { This line is just a place holder to avoid }
                        StrPCopy(PAnsiChar(MsgLine), 'X-File-ID: <FILE' +
                                 IcsIntToStrA(FImageNumber - FEmailImages.Count) +
                                 '>');
                    TriggerAttachHeader(FImageNumber, FsFileName, nil);
                end;
            6:  begin
                    BAction := smtpBeforeOpenFileNone;
                    if Assigned(FOnBeforeFileOpen) then begin
                        FOnBeforeFileOpen(Self, FImageNumber, FsFileName, BAction);
                        case BAction of
                            smtpBeforeOpenFileNext  : begin
                                                          Inc(FImageNumber);
                                                          More := TRUE;
                                                          Exit;
                                                      end;
                            smtpBeforeOpenFileAbort : begin
                                                          More := FALSE;
                                                          Abort;
                                                          Exit
                                                      end;
                        end;
                    end;
                    AAction := smtpAfterOpenFileNone;
                    try
                        {StrPCopy(MsgLine, ''); Do nothing, removed }
                        if FImageNumber <= FEmailImages.Count then
                            FStream := InitFileEncBase64(
                                           FEmailImages[FImageNumber - 1],
                                           FShareMode)
                        else
                            FStream := InitFileEncBase64(
                                           FEmailFiles[FImageNumber -
                                                       FEmailImages.Count - 1],
                                           FShareMode);
                        if Assigned(FOnAfterFileOpen) then begin
                            FOnAfterFileOpen(Self, FImageNumber, FsFileName, nil, AAction);
                            case AAction of
                                smtpAfterOpenFileNext  : begin
                                                             EndFileEncBase64(FStream);
                                                             Inc(FImageNumber);
                                                             More := TRUE;
                                                             Exit
                                                         end;
                                smtpAfterOpenFileRetry : begin
                                                             EndFileEncBase64(FStream);
                                                             More := TRUE;
                                                             Exit
                                                         end;
                                smtpAfterOpenFileAbort : begin
                                                             EndFileEncBase64(FStream);
                                                             More := FALSE;
                                                             Abort;
                                                             Exit
                                                         end;
                            end;
                        end;
                    except
                        on E:Exception do begin
                            if Assigned(FOnAfterFileOpen) then begin
                                FOnAfterFileOpen(Self, FImageNumber, FsFileName, E, AAction);
                                case AAction of
                                    smtpAfterOpenFileNone  : raise;
                                    smtpAfterOpenFileNext  : begin
                                                                 Inc(FImageNumber);
                                                                 More := TRUE;
                                                                 Exit
                                                             end;
                                    smtpAfterOpenFileRetry : begin
                                                                 More := TRUE;
                                                                 Exit;
                                                             end;
                                    smtpAfterOpenFileAbort : begin
                                                                 More := FALSE;
                                                                 Abort;
                                                                 Exit
                                                             end;
                                end;
                            end
                            else
                                raise;
                        end;
                    end;
                end;
            else
                if Assigned(FStream) then begin
                    if FAttachmentEncoding = smtpEncodeBase64 then begin    {AG}
                        if not FMsgSizeFlag then                            {AG}
                            LineBuf := DoFileEncBase64(FStream, More)
                        else begin                                          {AG}
                            if FStream.Size > 0 then                        {AG}
                                Inc(FMsgSize, CalcBase64AttachmentGrow(FStream.Size) - 2);{AG}
                            More := FALSE;                                  {AG}
                        end;
                    end
                    else if FAttachmentEncoding = smtpEncodeQP then         {AG}
                        LineBuf := DoFileEncQuotedPrintable(FStream, More)  {AG}
                    else
                        LineBuf := DoTextFileReadNoEncoding(FStream, More); {AG}
                    StrPCopy(PAnsiChar(MsgLine), LineBuf);
                    if not More then begin
                        { We hit the end-of-file }
                        EndFileEncBase64(FStream);
                        More := TRUE;
                    end;
                end
                else begin
                    { We hit the end of image file }
                    FLineOffset  := LineNum;
                    FImageNumber := FImageNumber + 1;
                    {StrPCopy(MsgLine, '');  Do nothing, removed }
                end
            end;
        end;
    end;
    if FMimeState in [smtpMimeImages, smtpMimeAttach] then begin
        if Assigned(FOnGetData) then
            FOnGetData(Self, LineNum, MsgLine, MaxLen, More);
        Exit;
    end;

    More := FALSE;
    if Assigned(FOnGetData) then
        FOnGetData(Self, LineNum, MsgLine, MaxLen, More);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.TriggerProcessHeader(HdrLines: TStrings);
var
    I : Integer;
begin
    if FContentType = smtpPlainText then begin
        { Strange but the user ask to send plain text message }
        inherited TriggerProcessHeader(HdrLines);
        Exit;
    end;

    FMimeState := smtpMimeIntro;
    GenerateBoundaries;
    { We must replace the Content-Type from parent component to our own }
    for I := 0 to HdrLines.Count - 1 do begin
        if CompareText(Copy(HdrLines[I], 1, 13), 'Content-Type:') = 0 then begin
            if FEmailFiles.Count = 0 then
                HdrLines[I] := 'Content-Type: multipart/related; ' +
                               'type="multipart/alternative";'  
            else
                HdrLines[I] := 'Content-Type: multipart/mixed;';
                
            HdrLines.Insert(I + 1, #9'boundary="' + String(FOutsideBoundary) + '"');
            break;
        end;
    end;
    inherited TriggerProcessHeader(HdrLines);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.GenerateBoundaries;
var
    TickPart : AnsiString;
    RandPart : AnsiString;
begin
    TickPart := '----=_NextPart_000_' + IcsIntToHexA(LongInt(GetTickCount), 8);
    RandPart := IcsIntToHexA(Random(High(Integer)), 8);
    FOutsideBoundary := TickPart + '_0.' + RandPart;
    FInsideBoundary  := TickPart + '_1.' + RandPart;
    FInnerBoundary   := TickPart + '_2.' + RandPart;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure THtmlSmtpCli.PrepareEMail;
begin
    if FContentType = smtpPlainText then begin
        // FLineOffset was not reset properly after a mail with    {AG 07/11/07}
        // attachment has been sent and current mail had no attachment.
        // To be sure initialize FLineOffset to zero.
        FLineOffset := 0;
        { Strange but the user ask to send plain text message }
        inherited PrepareEMail;
        FMailMsgText.SetText(FPlainText.Text, FCodePage);
        if FMailMsgText.CurrentIdx > 0 then begin
            if (FEncoding in [smtpEnc7bit, smtpEnc8bit]) and
               (not FAllow8bitChars) and FMailMsgText.NeedsEncoding then
                FEncoding := smtpEncQuotedPrintable
            else if (FEncoding = smtpEnc7bit) and FAllow8bitChars and
                     FMailMsgText.FNeedsEncoding then
                FEncoding := smtpEnc8bit;
            FMailMsgText.Encoding := FEncoding;
        end;
    end;
    { Nothing to do here }
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ You must define USE_SSL so that SSL code is included in the component.    }
{ Either in OverbyteIcsDefs.inc or in the project/package options.          }
{$IFDEF USE_SSL}
{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.CreateSocket;
begin
    FWSocket         := TSslWSocket.Create(nil);
    FWSocket.SslMode := sslModeClient;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.GetSslAcceptableHosts: TStrings;
begin
    if Assigned(FWSocket) then
        Result := FWSocket.SslAcceptableHosts
    else
        Result := nil;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.SetSslAcceptableHosts(const Value: TStrings);
begin
    if Assigned(FWSocket) then
        FWSocket.SslAcceptableHosts.Assign(Value);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.GetSslContext: TSslContext;
begin
    if Assigned(FWSocket) then
        Result := FWSocket.SslContext
    else
        Result := nil;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.SetSslContext(Value: TSslContext);
begin
    if Assigned(FWSocket) then
        FWSocket.SslContext := Value
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.GetSslCliNewSession: TSslCliNewSession;
begin
    if Assigned(FWSocket) then
        Result := FWSocket.OnSslCliNewSession
    else
        Result := nil;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.GetSslCliGetSession: TSslCliGetSession;
begin
    if Assigned(FWSocket) then
        Result := FWSocket.OnSslCliGetSession
    else
        Result := nil;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.GetSslVerifyPeer: TSslVerifyPeerEvent;
begin
    if Assigned(FWSocket) then
        Result := FWSocket.OnSslVerifyPeer
    else
        Result := nil;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.SetSslCliGetSession(const Value: TSslCliGetSession);
begin
    if Assigned(FWSocket) then
        FWSocket.OnSslCliGetSession := Value;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.SetSslCliNewSession(const Value: TSslCliNewSession);
begin
    if Assigned(FWSocket) then
        FWSocket.OnSslCliNewSession := Value;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.SetSslVerifyPeer(const Value: TSslVerifyPeerEvent);
begin
    if Assigned(FWSocket) then
        FWSocket.OnSslVerifyPeer := Value;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.GetSslCliCertRequest: TSslCliCertRequest;
begin
    if Assigned(FWSocket) then
        Result := FWSocket.OnSslCliCertRequest
    else
        Result := nil;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.SetSslCliCertRequest(
  const Value: TSslCliCertRequest);
begin
    if Assigned(FWSocket) then
        FWSocket.OnSslCliCertRequest := Value;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.GetSecurityExtensions(const Msg: String);
var
    S : String;
begin
    S := UpperCase(Trim(FLastResponse));
    if CompareText(Copy(S, 5, 12), 'STARTTLS') = 0 then
        FTlsSupported := TRUE;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.TransferSslHandshakeDone(
    Sender         : TObject;
    ErrCode        : Word;
    PeerCert       : TX509Base;
    var Disconnect : Boolean);
begin
    if Assigned(FOnSslHandShakeDone) then
        FOnSslHandShakeDone(Sender, ErrCode, PeerCert, Disconnect);

    if (ErrCode = 0) and (not Disconnect) and
       (FWSocket.State = wsConnected) then
    begin
        with (Sender as TSslWSocket) do
            TriggerDisplay(Format('Secure connection with %s, cipher %s, ' +
                             '%d secret bits (%d total)',
                             [SslVersion, SslCipher, SslSecretBits,
                             SslTotalBits]));
        if FSslType = smtpTlsImplicit then
            StateChange(smtpWaitingBanner)
        else
            TriggerRequestDone(0); // EHLO command has to be issued again
    end
    else begin
        if (FWSocket.State = wsConnected) then begin
            { Temporarily disable RequestDone }
            FRequestDoneFlag := TRUE;
            FWSocket.Abort;
            FRequestDoneFlag := FALSE;
        end;
        FStatusCode    := 500;
        FRequestResult := FStatusCode;
        //FHighLevelResult := 500;
        FErrorMessage    := 'SSL Handshake failed';
        TriggerDisplay(FErrorMessage);
        FNextRequest := nil;
        TriggerRequestDone(FRequestResult);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.TlsNext;
begin
    if FRequestResult <> 0 then begin
        TriggerRequestDone(FRequestResult);
        Exit;
    end;
    FWSocket.OnSslHandshakeDone := TransferSslHandshakeDone;
    TriggerDisplay('Starting SSL handshake');
    try
        //raise Exception.Create('Test');
        FWSocket.SslEnable := TRUE;
        FWSocket.StartSslHandshake;
    except
        on E: Exception do begin
            FWSocket.SslEnable := FALSE;
            FStatusCode    := 500;
            FRequestResult := FStatusCode;
            FLastResponse  := E.Classname + ' ' + E.Message;
            SetErrorMessage;
            { Temporarily disable RequestDone }
            FRequestDoneFlag := TRUE;
            FWSocket.Abort; { here we must not abort, however it's more secure }
            FRequestDoneFlag := FALSE;
            FNextRequest := nil;
            TriggerRequestDone(FStatusCode)
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.StartTls;  // RFC 2487
var
     ErrMsg : String;
begin
     if not FESmtpSupported then
         ErrMsg := '500 ESMTP not supported.';
     if (not FTlsSupported) and (ErrMsg = '') then
         ErrMsg := '500 STARTTLS is not available.';
     if (FSslType = smtpTlsImplicit) and (ErrMsg = '') then
         ErrMsg := '500 STARTTLS is not supported with a implicite SSL connection';
     if ErrMsg <> '' then begin
         FLastResponse := ErrMsg;
         FErrorMessage := ErrMsg;
         FStatusCode    := 500;
         FRequestResult := FStatusCode;
         FRequestDoneFlag := FALSE;
         FNextRequest := nil;
         TriggerRequestDone(FStatusCode);
         Exit;//***
     end;
     FFctPrv := smtpFctStartTls;
     ExecAsync(smtpStartTls, 'STARTTLS', [220], TlsNext);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.WSocketSessionConnected(Sender: TObject; Error: Word);
begin
    if (FSslType <> smtpTlsImplicit) or (Error <> 0) then
        inherited WSocketSessionConnected(Sender, Error)
    else begin
        FConnected := TRUE;
        TriggerDisplay('! Starting SSL handshake');
        FWSocket.OnSslHandshakeDone := TransferSslHandShakeDone;
        FWSocket.SslEnable := TRUE;
        try
            //raise Exception.Create('Test');
            FWSocket.StartSslHandshake;
        except
            on E: Exception do begin
                FWSocket.SslEnable := FALSE;
                FErrorMessage  := 'SSL Handshake failed ' + E.Classname + ' ' +
                                  E.Message; 
                FStatusCode    := 500;
                FRequestResult := FStatusCode;
                { Temporarily disable RequestDone }
                FRequestDoneFlag := TRUE;
                FWSocket.Abort;
                FRequestDoneFlag := FALSE;
                FNextRequest := nil;
                TriggerRequestDone(FRequestResult);
            end;
        end;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.TriggerResponse(Msg : String);
begin
    { Search for "STARTTLS" in multiline EHLO response }
    if FFctPrv = smtpFctEhlo then
        GetSecurityExtensions(Msg);
    inherited TriggerResponse(Msg);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.DoHighLevelAsync;
begin
{$IFDEF TRACE} TriggerDisplay('! HighLevelAsync ' + IntToStr(FRequestResult)); {$ENDIF}
    if FState = smtpAbort then begin
        {$IFDEF TRACE} TriggerDisplay('! Abort detected'); {$ENDIF}
        FFctSet := [];
        FHighLevelResult := 426;
        FRequestResult   := 426;  { SJF }
        FErrorMessage    := '426 Operation aborted.';
    end;

    FNextRequest := DoHighLevelAsync;

    if FRequestResult <> 0 then begin
        { Previous command had errors }
        { EHLO wasn't supported, so just log in with HELO }
        if FFctPrv = smtpFctEhlo then
            FFctSet := [smtpFctHelo]
        else begin
            FHighLevelResult := FRequestResult;
            if (FFctPrv = smtpFctQuit) or (not (smtpFctQuit in FFctSet)) then
                FFctSet := []
            else
                FFctSet := [smtpFctQuit];
        end;
    end;

    try
        if smtpFctConnect in FFctSet then begin
            FFctPrv := smtpFctConnect;
            FFctSet := FFctSet - [FFctPrv];
            Connect;
            Exit;
        end;

        if smtpFctHelo in FFctSet then begin
            FFctPrv := smtpFctHelo;
            FFctSet := FFctSet - [FFctPrv];
            Helo;
            Exit;
        end;

        if smtpFctEhlo in FFctSet then begin
            FFctPrv := smtpFctEhlo;
            FFctSet := FFctSet - [FFctPrv];
            Ehlo;
            Exit;
        end;

        if smtpFctStartTls in FFctSet then begin
            FFctPrv := smtpFctStartTls;
            FFctSet := FFctSet - [FFctPrv];
            { Add Ehlo to the set it has to be re-issued after STARTTLS }
            FFctSet := FFctSet + [smtpFctEhlo];
            StartTls;
            Exit;
        end;

        if smtpFctAuth in FFctSet then begin
            FFctPrv := smtpFctAuth;
            FFctSet := FFctSet - [FFctPrv];
            Auth;
            Exit;
        end;

        if smtpFctVrfy in FFctSet then begin
            FFctPrv := smtpFctVrfy;
            FFctSet := FFctSet - [FFctPrv];
            Vrfy;
            Exit;
        end;

        if smtpFctMailFrom in FFctSet then begin
            FFctPrv := smtpFctMailFrom;
            FFctSet := FFctSet - [FFctPrv];
            MailFrom;
            Exit;
        end;

        if smtpFctRcptTo in FFctSet then begin
            FFctPrv := smtpFctRcptTo;
            FFctSet := FFctSet - [FFctPrv];
            RcptTo;
            Exit;
        end;

        if smtpFctData in FFctSet then begin
            FFctPrv := smtpFctData;
            FFctSet := FFctSet - [FFctPrv];
            Data;
            Exit;
        end;

        if smtpFctQuit in FFctSet then begin
            FFctPrv := smtpFctQuit;
            FFctSet := FFctSet - [FFctPrv];
            Quit;
            Exit;
        end;

        if smtpFctCalcMsgSize in FFctSet then begin
            FFctPrv := smtpFctCalcMsgSize;
            FFctSet := FFctSet - [FFctPrv];
            CalcMsgSize;
            Exit;
        end;

        if smtpFctMailFromSIZE in FFctSet then begin
            FFctPrv := smtpFctMailFromSIZE;
            FFctSet := FFctSet - [FFctPrv];
            MailFromSIZE;
            Exit;
        end;
        
    except
        on E : Exception do begin
          {$IFDEF TRACE}
            TriggerDisplay('! ' + E.ClassName + ': "' + E.Message + '"');
          {$ENDIF}
            FHighLevelResult := 500;
            FRequestResult   := 500;
            FErrorMessage    := '500 Internal client error ' +
                                E.ClassName + ': "' + E.Message + '"';
        end;
    end;
    {$IFDEF TRACE} TriggerDisplay('! HighLevelAsync done'); {$ENDIF}
    FFctSet          := [];
    FNextRequest     := nil;
    FRequestDoneFlag := FALSE;
    TriggerRequestDone(FHighLevelResult);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.Open;
begin
    if FSslType = smtpTlsExplicit then begin
        if FAuthType <> smtpAuthNone then
            HighLevelAsync(smtpOpen, [smtpFctConnect, smtpFctEhlo,
                                      smtpFctStartTls, smtpFctAuth])
        else
            HighLevelAsync(smtpOpen, [smtpFctConnect, smtpFctEhlo,
                                      smtpFctStartTls]);
    end
    else
        inherited Open;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.Connect;
begin
    FTlsSupported      := FALSE;
    FWSocket.SslEnable := FALSE; // We handle everything in code
    inherited Connect;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.Ehlo;
begin
    FTlsSupported := FALSE;
    inherited Ehlo;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.WndProc(var MsgRec: TMessage);
begin
    try
        with MsgRec do begin
            if Msg = FMsg_WM_SMTP_QUIT_DELAYED then
                WMSmtpQuitDelayed(MsgRec)
            else
                inherited WndProc(MsgRec);
        end;
    except
        on E:Exception do
            HandleBackGroundException(E);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.WMSmtpQuitDelayed(var Msg: TMessage);
begin
    Quit;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TSslSmtpCli.MsgHandlersCount : Integer;
begin
    Result := 1 + inherited MsgHandlersCount;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.AllocateMsgHandlers;
begin
    inherited AllocateMsgHandlers;
    FMsg_WM_SMTP_QUIT_DELAYED  := FWndHandler.AllocateMsgHandler(Self);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TSslSmtpCli.FreeMsgHandlers;
begin
    if Assigned(FWndHandler) then
        FWndHandler.UnregisterMessage(FMsg_WM_SMTP_QUIT_DELAYED);
    inherited FreeMsgHandlers;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$ENDIF} // USE_SSL


end.

