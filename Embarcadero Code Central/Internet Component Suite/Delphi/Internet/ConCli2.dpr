{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:       Fran�ois PIETTE
Description:  ConCli2 shows how to use TWSocket in a console mode application.
              For Delphi 2, 3 or 4 only. ConCli2 use a thread to make the
              socket run in the program background while the foreground is
              busy with the user interface (for simplicity here we just wait
              for the user to hit the enter key).
EMail:        francois.piette@pophost.eunet.be  http://www.rtfm.be/fpiette
Creation:     Nov 20, 1997
Version:      1.01
WebSite:      http://www.rtfm.be/fpiette/indexuk.htm
Support:      Use the mailing list twsocket@rtfm.be See website for details.
Legal issues: Copyright (C) 1997, 1998 by Fran�ois PIETTE
              Rue de Grady 24, 4053 Embourg, Belgium. Fax: +32-4-365.74.56
              <francois.piette@pophost.eunet.be>

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

Updates:
Dec 05, 1998 V1.01 Don't use TWait object anymore.


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$APPTYPE CONSOLE}
program ConCli2;

uses
    Windows, Classes, WSocket;

const
    ServerHostName = 'localhost';
    ServerPort     = 'telnet';

type
    TWSocketThread = class(TThread)
    protected
        FWSocket : TWsocket;
        FRcvBuf  : array [0..1023] of char;
        procedure Execute; override;
        procedure   FWSocketDataAvailable(Sender : TObject; Error : Word);
        procedure   FWSocketSessionConnected(Sender : TObject; Error : Word);
        procedure   FWSocketSessionClosed(Sender : TObject; Error : Word);
    public
        constructor Create; virtual;
    end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TWSocketThread.Create;
begin
    inherited Create(TRUE);
    FreeOnTerminate := TRUE;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TWSocketThread.Execute;
begin
    // Let's the user know what we are doing
    Writeln('Connecting to server ''', ServerHostName,
            ''' on port ''', ServerPort, '''');

    // Create the TWSocket we will use to communicate with the server
    FWSocket                    := TWsocket.Create(nil);

    // Assign the event handler for the TWSocket events we care of
    FWSocket.OnDataAvailable    := FWSocketDataAvailable;
    FWSocket.OnSessionClosed    := FWSocketSessionClosed;
    FWSocket.OnSessionConnected := FWSocketSessionConnected;

    // Connect to the server
    FWSocket.Addr     := ServerHostName;
    FWSocket.Port     := ServerPort;
    FWSocket.Proto    := 'tcp';
    FWSocket.Connect;

    // Let the TWSocket component makes his work
    FWSocket.MessageLoop;

    // We are done, destroy the objects we created
    FWSocket.Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This event handler is called by the TWSocket when some data has been      }
{ received by the lower level.                                              }
procedure TWSocketThread.FWSocketDataAvailable(Sender : TObject; Error : Word);
var
    Len : Integer;
begin
    // Get the received data
    Len := FWSocket.Receive(@FRcvBuf[0], SizeOf(FRcvBuf) - 1);
    if Len <= 0 then
        Exit;

    // Add a terminating nul byte to allow display using standard I/O
    FRcvBuf[Len] := #0;
    Write(FRcvBuf);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This event handler is called by TWSocket when the connection is           }
{ established with the remote host                                          }
procedure TWSocketThread.FWSocketSessionConnected(Sender : TObject; Error : Word);
begin
    Writeln('Connected');
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This event handler is called by TWSocket when the connection is broken    }
procedure TWSocketThread.FWSocketSessionClosed(Sender : TObject; Error : Word);
begin
    Writeln('Server has diconnected');
    FWSocket.Close;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This is the main program.                                                 }
var
    WSocketThread : TWSocketThread;
begin
    Writeln('Hit enter to stop the program');
    Writeln;
    // Create the socket working thread (suspended)
    WSocketThread := TWSocketThread.Create;

    // Start the thread
    WSocketThread.Resume;

    // The main thread continue here. Process user request here.
    Readln;

    // We are done, quit the program
    Writeln('Ok.');
end.

