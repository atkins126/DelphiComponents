//------------------------------------------------------------------------------
//  Apprehend Version     : 5.1
//  Copyright � 1986-2011 : Adirondack Software & Graphics
//  Created               : 1-09-1992
//  Last Modification     : 08-08-2011
//  Compiler              : Delphi 2010
//  Description           : CaptureIcon Unit
// This file is copyright (C) W W Miller, 1986-2011.
// It may be used without restriction. This code distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
//------------------------------------------------------------------------------

unit CaptureIcon;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, PixelFormatFix;

type
  TCaptureIconForm = class ( TForm )
    Timer1: TTimer;
    procedure FormCreate ( Sender: TObject );
    procedure FormMouseDown ( Sender: TObject;Button: TMouseButton;
      Shift: TShiftState;X, Y: Integer );
    procedure FormMouseMove ( Sender: TObject;Shift: TShiftState;X,
      Y: Integer );
    procedure FormMouseUp ( Sender: TObject;Button: TMouseButton;
      Shift: TShiftState;X, Y: Integer );
    procedure FormPaint ( Sender: TObject );
    procedure FormDestroy ( Sender: TObject );
    procedure Timer1Timer ( Sender: TObject );
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
      { Private declarations }
    X1, Y1, X2, Y2: Integer;
    procedure RemoveTheRect;
    procedure DrawTheRect;
    procedure WMEraseBkGnd ( var Msg: TWMEraseBkGnd ); message WM_ERASEBKGND;
  public
      { Public declarations }
    fRect: TRect;
    fBmp: TBitmap;
    RectBitmap: TBitmap;
    M: Integer; // Which monitor are we on?
  end;

var
  CaptureIconForm: TCaptureIconForm;
  Counter: Byte;
  CounterStart: Byte;
  Looper: LongInt;
  ForceMonitorNum: Integer;

implementation

uses promptdialog;

{$R *.DFM}

{ Animated Rubbanding }
procedure MovingDots ( X, Y: Integer;TheCanvas: TCanvas ); stdcall;
begin
  Inc ( Looper );
  Counter := Counter shl 1; // Shift the bit left one
  if Counter = 0 then Counter := 1; // If it shifts off left, reset it
  if ( Counter and 224 ) > 0 then // Are any of the left 3 bits set?
    TheCanvas.Pixels [ X, Y ] := clRed // Erase the pixel
  else
    TheCanvas.Pixels [ X, Y ] := clWhite; // Draw the pixel
end;

{ Animated Rubbanding }
function NormalizeRect ( R: TRect ): TRect;
begin
  // This routine normalizes a rectangle. It makes sure that the Left,Top
  // coords are always above and to the left of the Bottom,Right coords.
  with R do
    if Left > Right then
      if Top > Bottom then
        Result := Rect ( Right, Bottom, Left, Top )
      else
        Result := Rect ( Right, Top, Left, Bottom )
    else
      if Top > Bottom then
        Result := Rect ( Left, Bottom, Right, Top )
      else
        Result := Rect ( Left, Top, Right, Bottom );
end;

{ Animated Rubbanding }
procedure TCaptureIconForm.RemoveTheRect;
var
  R: TRect;
begin
  R := NormalizeRect ( Rect ( X1, Y1, X2, Y2 ) ); // Rectangle might be flipped
  InflateRect ( R, 1, 1 ); // Make the rectangle 1 pixel larger
  InvalidateRect ( Handle, @R, True ); // Mark the area as invalid
  InflateRect ( R, -2, -2 ); // Now shrink the rectangle 2 pixels
  ValidateRect ( Handle, @R ); // And validate this new rectangle.
  // This leaves a 2 pixel band all the way around
  // the rectangle that will be erased & redrawn
  UpdateWindow ( Handle );
end;

{ Animated Rubbanding }
procedure TCaptureIconForm.DrawTheRect;
begin
  // Determines starting pixel color of Rect
  Counter := CounterStart;
  // Use LineDDA to draw each of the 4 edges of the rectangle
  LineDDA ( X1, Y1, X2, Y1, @MovingDots, LongInt ( Canvas ) );
  LineDDA ( X2, Y1, X2, Y2, @MovingDots, LongInt ( Canvas ) );
  LineDDA ( X2, Y2, X1, Y2, @MovingDots, LongInt ( Canvas ) );
  LineDDA ( X1, Y2, X1, Y1, @MovingDots, LongInt ( Canvas ) );
end;

procedure TCaptureIconForm.FormCreate ( Sender: TObject );
var
  aDC: HDC;
  P1: TPoint;
  P: TPoint; // Where is the mouse now?
begin
  GetCursorPos ( P ); // Where am I?
  if ( ForceMonitorNum >= 0 ) and ( ForceMonitorNum <= Screen.MonitorCount - 1 ) then
    M := ForceMonitorNum {Override}
  else
    M := Screen.MonitorFromPoint ( P, mdNearest ).MonitorNum; // Here I am!  Monitors[M]

   // Setup to capture image
  fBMP := TBitmap.Create;
  RectBitmap := TBitmap.Create;
  fBMP.Width := Screen.Width;
  fBMP.Height := Screen.Height;
  fBMP.PixelFormat := pfDevice;
  aDC := GetDC ( 0 );
  BitBlt ( fBMP.Canvas.handle, 0, 0, Screen.Width, Screen.Height, aDC, 0, 0, GetBitBlt_RopMode() );
  ReleaseDC ( 0, aDC );
  SetBounds ( 0, 0, Screen.Width, Screen.Height );
   // Setup Animated Rubberband
  X1 := 0; Y1 := 32;
  X2 := 0; Y2 := 32;
  Canvas.Pen.Color := clRed;
  Canvas.Brush.Color := clWhite;
  CounterStart := 128;
  Timer1.Interval := 100;
  Timer1.Enabled := True;
  Looper := 0;
  RemoveTheRect; // Erase any existing rectangle
  GetCursorPos ( P1 );
  X1 := P1.x;
  y1 := P1.y;
  X2 := X1+32; Y2 := Y1+32;
  DrawTheRect;
end;

procedure TCaptureIconForm.FormMouseDown ( Sender: TObject;Button: TMouseButton;
  Shift: TShiftState;X, Y: Integer );
begin
  RemoveTheRect; // Erase any existing rectangle
  X1 := X; Y1 := Y;
  X2 := X1+32; Y2 := Y1+32;
  DrawTheRect;
  SetRect ( fRect, X, Y, X2, Y2 ); // Set initial rectangle position
end;

procedure TCaptureIconForm.FormMouseMove ( Sender: TObject;Shift: TShiftState;X,
  Y: Integer );
begin
  RemoveTheRect; // Erase any existing rectangle
  X1 := X; Y1 := Y;
  X2 := X1+32; Y2 := Y1+32;
  DrawTheRect; // Draw the Rect now... don't wait for the timer!
  if ssLeft in Shift then
  begin
    RemoveTheRect; // Erase any existing rectangle
    X1 := X; Y1 := Y; // Save the new cornerS where the mouse is
    X2 := X1+32; Y2 := Y1+32;
    DrawTheRect; // Draw the Rect now... don't wait for the timer!
    fRect.Left := X;
    fRect.Top := Y;
    fRect.Right := X+32; // Set the position of the rectangle to capture
    fRect.Bottom := Y+32;
  end;
end;

procedure TCaptureIconForm.FormMouseUp ( Sender: TObject;Button: TMouseButton;
  Shift: TShiftState;X, Y: Integer );
var
  ScreenDC: HDC;
  Bitmap: TBitmap;
begin
  if Button = mbLeft then begin
    Bitmap := TBitmap.Create;
   // Set fRect
    fRect.Left := X1;
    fRect.Top := Y1;
    fRect.Right := X2;
    fRect.Bottom := Y2;
   // Exit if improper rectangle drawn
    if ( fRect.Right > fRect.Left ) and ( fRect.Bottom > fRect.Top ) then
    begin
      Bitmap.Width := fRect.Right - fRect.Left;
      Bitmap.Height := fRect.Bottom - fRect.Top;
      Bitmap.PixelFormat := pfDevice;
      RemoveTheRect;
      ScreenDC := GetDC ( 0 );
      try
        BitBlt ( Bitmap.Canvas.Handle, 0, 0, Bitmap.Width, Bitmap.Height, ScreenDC, fRect.Left, fRect.Top, GetBitBlt_RopMode() );
        RectBitmap.Assign ( Bitmap );
      finally
        ReleaseDC ( 0, ScreenDC );
        Bitmap.Free;
      end;
    end; // if
    ModalResult := mrOK;
  end;
end;

procedure TCaptureIconForm.FormPaint ( Sender: TObject );
begin
  Canvas.Draw ( 0, 0, fBMP );
end;

procedure TCaptureIconForm.FormDestroy ( Sender: TObject );
begin
  fBMP.Free;
  RectBitmap.Free;
end;

procedure TCaptureIconForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ScreenDC: HDC;
  Bitmap: TBitmap;
  iPoint: TPoint;
begin
  case Key of
    VK_DOWN:
      begin
        RemoveTheRect; // Erase any existing rectangle
        Y1 := Y1 + 1;
        X2 := X1 + 32;
        Y2 := Y1 + 32;
        DrawTheRect; // Draw the Rect now... don't wait for the timer!
        iPoint.X := Mouse.CursorPos.X;
        iPoint.Y := Mouse.CursorPos.Y + 1;
        SetCursorPos( iPoint.X, iPoint.Y );
      end;
    VK_UP:
      begin
        RemoveTheRect; // Erase any existing rectangle
        Y1 := Y1 - 1;
        X2 := X1 + 32;
        Y2 := Y1 + 32;
        DrawTheRect; // Draw the Rect now... don't wait for the timer!
        iPoint.X := Mouse.CursorPos.X;
        iPoint.Y := Mouse.CursorPos.Y - 1;
        SetCursorPos( iPoint.X, iPoint.Y );
      end;
    VK_LEFT:
      begin
        RemoveTheRect; // Erase any existing rectangle
        X1 := X1 - 1;
        X2 := X1 + 32;
        DrawTheRect; // Draw the Rect now... don't wait for the timer!
        iPoint.X := Mouse.CursorPos.X - 1;
        iPoint.Y := Mouse.CursorPos.Y;
        SetCursorPos( iPoint.X, iPoint.Y );
      end;
    VK_RIGHT:
      begin
        RemoveTheRect; // Erase any existing rectangle
        X1 := X1 + 1;
        X2 := X1 + 32;
        DrawTheRect; // Draw the Rect now... don't wait for the timer!
        iPoint.X := Mouse.CursorPos.X + 1;
        iPoint.Y := Mouse.CursorPos.Y;
        SetCursorPos( iPoint.X, iPoint.Y );
      end;
    VK_RETURN:
      begin
        Bitmap := TBitmap.Create;
        // Set fRect
        fRect.Left := X1;
        fRect.Top := Y1;
        fRect.Right := X2;
        fRect.Bottom := Y2;
        // Exit if improper rectangle drawn
        if ( fRect.Right > fRect.Left ) and ( fRect.Bottom > fRect.Top ) then
        begin
          Bitmap.Width := fRect.Right - fRect.Left;
          Bitmap.Height := fRect.Bottom - fRect.Top;
          Bitmap.PixelFormat := pfDevice;
          RemoveTheRect;
          ScreenDC := GetDC( 0 );
          try
            BitBlt( Bitmap.Canvas.Handle, 0, 0, Bitmap.Width, Bitmap.Height, ScreenDC, fRect.Left, fRect.Top,
              GetBitBlt_RopMode( ) );
            RectBitmap.Assign( Bitmap );
          finally
            ReleaseDC( 0, ScreenDC );
            Bitmap.Free;
          end;
        end; // if
        CaptureIconForm.ModalResult := mrOK;
      end;
    VK_F8:
      if Assigned( frmPosition ) then
        frmPosition.Free;
  end;
end;

procedure TCaptureIconForm.WMEraseBkGnd ( var Msg: TWMEraseBkGnd );
begin
  Msg.Result := 1;
end;

{ Animated Rubbanding }
procedure TCaptureIconForm.Timer1Timer ( Sender: TObject );
begin
  CounterStart := CounterStart shr 2; // Shl 1 will move rect slower
  if CounterStart = 0 then CounterStart := 128; // If bit is lost, reset it
  DrawTheRect; // Draw the rectangle
end;

end.

