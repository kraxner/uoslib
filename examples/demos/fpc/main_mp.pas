
/////////////////// Demo how to use United Openlib of Sound ////////////////////


unit main_mp;

{$mode objfpc}{$H+}

interface

uses
uoslib_h, Forms, Dialogs, SysUtils, Graphics,
 StdCtrls, ComCtrls, ExtCtrls, Classes, Controls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;

    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);


  private
    { private declarations }
  public

    { public declarations }
  end;

procedure uos_logo();


var
  Form1: TForm1;
  BufferBMP: TBitmap;
  PlayerIndex0, PlayerIndex1, PlayerIndex2, PlayerIndex3: cardinal;
   uoslibFilename : string ;

implementation

{$R *.lfm}

{ TForm1 }

procedure ClosePlayer0;
begin
  form1.button16.Enabled := False;
  form1.button15.Enabled := False;
  form1.button3.Enabled := False;
end;

procedure ClosePlayer1;
begin
  form1.button17.Enabled := False;
  form1.button18.Enabled := False;
  form1.button6.Enabled := False;
end;

procedure ClosePlayer2;
begin
  form1.button19.Enabled := False;
  form1.button20.Enabled := False;
  form1.button9.Enabled := False;
end;

procedure ClosePlayer3;
begin
  form1.button21.Enabled := False;
  form1.button22.Enabled := False;
  form1.button12.Enabled := False;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  ordir: string;
{$IFDEF Darwin}
  opath: string;
            {$ENDIF}
begin

  ordir := application.Location;
   uos_logo();
                  {$IFDEF Windows}
     {$if defined(cpu64)}
    uoslibfilename  := ordir + 'Libuos.dll';
  Edit1.Text := ordir + 'lib\Windows\64bit\LibPortaudio-64.dll';
  Edit2.Text := ordir + 'lib\Windows\64bit\LibSndFile-64.dll';
  Edit3.Text := ordir + 'lib\Windows\64bit\LibMpg123-64.dll';
   {$else}
     uoslibfilename  := ordir + 'Libuos.dll';
  Edit1.Text := ordir + 'lib\Windows\32bit\LibPortaudio-32.dll';
  Edit2.Text := ordir + 'lib\Windows\32bit\LibSndFile-32.dll';
  Edit3.Text := ordir + 'lib\Windows\32bit\LibMpg123-32.dll';
   {$endif}
  {$ENDIF}

  {$IFDEF Darwin}
  opath := ordir;
  opath := copy(opath, 1, Pos('/uos', opath) - 1);
  uoslibfilename  := opath + '/lib/Mac/32bit/Libuos-32.dylib';
  Edit1.Text := opath + '/lib/Mac/32bit/LibPortaudio-32.dylib';
  Edit2.Text := opath + '/lib/Mac/32bit/LibSndFile-32.dylib';
  Edit3.Text := opath + '/lib/Mac/32bit/LibMpg123-32.dylib';
           {$ENDIF}

   {$IFDEF linux}
    {$if defined(cpu64)}
  uoslibfilename  := ordir + 'libuoslib.so';
  Edit1.Text := ordir + 'lib/Linux/64bit/LibPortaudio-64.so';
  Edit2.Text := ordir + 'lib/Linux/64bit/LibSndFile-64.so';
  Edit3.Text := ordir + 'lib/Linux/64bit/LibMpg123-64.so';
  {$else}
     uoslibfilename  := ordir + 'libuoslib.so';
  Edit1.Text := ordir + 'lib/Linux/32bit/LibPortaudio-32.so';
  Edit2.Text := ordir + 'lib/Linux/32bit/LibSndFile-32.so';
  Edit3.Text := ordir + 'lib/Linux/32bit/LibMpg123-32.so';
 {$endif}
    {$ENDIF}

  opendialog1.Initialdir := application.Location + 'sound';

  Edit4.Text := application.Location + 'sound' + directoryseparator + 'test.mp3';
  Edit5.Text := application.Location + 'sound' + directoryseparator + 'test.ogg';
  Edit6.Text := application.Location + 'sound' + directoryseparator + 'test.wav';
  Edit7.Text := application.Location + 'sound' + directoryseparator + 'test.flac';

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if   button1.Enabled = false then
 uos_UnloadLibs();
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  PaintBox1.Canvas.Draw(0, 0, BufferBMP);
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  // Load the libraries
  // function uos_LoadLibs(uoslibFilename : Pchar; PortAudioFileName: Pchar; SndFileFileName: Pchar; Mpg123FileName: Pchar; SoundTouchFileName: Pchar) : integer;
  if uos_LoadLibs(Pchar(uoslibFilename), Pchar(edit1.Text), Pchar(edit2.Text), Pchar(edit3.Text), nil) then
  begin
    form1.hide;
    form1.Position := podefault;
    button1.Caption := 'uos, PortAudio, SndFile and Mpg123 libraries are loaded...';
    button1.Enabled := False;
    edit1.ReadOnly := True;
    edit2.ReadOnly := True;
    edit3.ReadOnly := True;
    form1.Height := 478;
    form1.Position := poScreenCenter;
    form1.Show;
  end else MessageDlg('A Library does not load...', mtWarning, [mbYes], 0);

end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  uos_RePlay(PlayerIndex2);
  button20.Enabled := False;
  button19.Enabled := True;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  uos_Pause(PlayerIndex3);
  button22.Enabled := True;
  button21.Enabled := False;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  uos_RePlay(PlayerIndex3);
  button22.Enabled := False;
  button21.Enabled := True;
end;


procedure TForm1.Button10Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit6.Text := opendialog1.FileName;
end;

procedure TForm1.Button11Click(Sender: TObject);

begin
  PlayerIndex3 := 3;

  uos_CreatePlayer(PlayerIndex3);

  uos_AddIntoDevOut(PlayerIndex3, -1, -1, -1, -1, 0, -1);
    //// add a Output into device with custom parameters
  //////////// PlayerIndex : Index of a existing Player
  //////////// Device ( -1 is default Output device )
  //////////// Latency  ( -1 is latency suggested ) )
  //////////// SampleRate : delault : -1 (44100)
  //////////// Channels : delault : -1 (2:stereo) (0: no channels, 1:mono, 2:stereo, ...)
  //////////// SampleFormat : -1 default : Int16 : (0: Float32, 1:Int32, 2:Int16)
  //////////// FramesCount : default : -1 (65536)
  //  result : -1 nothing created, otherwise Output Index in array

  uos_AddFromFile(PlayerIndex3, Pchar(Edit7.Text), -1, 0, -1);
  //// add input from audio file with custom parameters
  ////////// FileName : filename of audio file
  //////////// PlayerIndex : Index of a existing Player
  ////////// OutputIndex : OutputIndex of existing Output // -1 : all output, -2: no output, other integer : existing output)
  ////////// SampleFormat : -1 default : Int16 : (0: Float32, 1:Int32, 2:Int16) SampleFormat of Input can be <= SampleFormat float of Output
  //////////// FramesCount : default : -1 (65536)
  //  result : -1 nothing created, otherwise Input Index in array

 uos_EndProc(PlayerIndex3,@ClosePlayer3);

 uos_Play(PlayerIndex3);
  ////// Ok let start it

//  button22.Enabled := False;
  button21.Enabled := True;
  button12.Enabled := True;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  uos_Stop(PlayerIndex3);
   button21.Enabled:=false;
   button22.Enabled:=false;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit7.Text := opendialog1.FileName;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Button2.Click;
  Button5.Click;
  Button8.Click;
  Button11.Click;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  uos_Pause(PlayerIndex0);
  button16.Enabled := True;
  button15.Enabled := False;
end;


procedure TForm1.Button16Click(Sender: TObject);
begin
  uos_RePlay(PlayerIndex0);
  button16.Enabled := False;
  button15.Enabled := True;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  uos_Pause(PlayerIndex1);
  button18.Enabled := True;
  button17.Enabled := False;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  uos_RePlay(PlayerIndex1);
  button18.Enabled := False;
  button17.Enabled := True;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  uos_Pause(PlayerIndex2);
  button20.Enabled := True;
  button19.Enabled := False;
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
  PlayerIndex0 := 0;

  uos_CreatePlayer(PlayerIndex0);

  uos_AddIntoDevOutDef(PlayerIndex0);
  //// add a Output with dfault parameters
   //////////// PlayerIndex : Index of a existing Player
  //////////// Device ( -1 is default Output device )
   //  result : -1 nothing created, otherwise Output Index in array

  uos_AddFromFileDef(PlayerIndex0, Pchar(Edit4.Text));
  //// add input from audio file with default parameters
  //////////// PlayerIndex : Index of a existing Player
   ////////// FileName : filename of audio file
  //  result : -1 nothing created, otherwise Input Index in array

  uos_EndProc(PlayerIndex0,@ClosePlayer0);

   uos_Play(PlayerIndex0);
  ////// Ok let start it

  button15.Enabled := True;
  button3.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  uos_Stop(PlayerIndex0);
  button16.Enabled:=false;
   button15.Enabled:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit4.Text := opendialog1.FileName;
end;

procedure TForm1.Button5Click(Sender: TObject);

begin
  PlayerIndex1 := 1;

  uos_CreatePlayer(PlayerIndex1);

  uos_AddIntoDevOut(PlayerIndex1, -1, -1, -1, -1, 0, -1);
  //// add a Output with custom parameters
  //// add a Output into device with custom parameters
  //////////// PlayerIndex : Index of a existing Player
  //////////// Device ( -1 is default Output device )
  //////////// Latency  ( -1 is latency suggested ) )
  //////////// SampleRate : delault : -1 (44100)
  //////////// Channels : delault : -1 (2:stereo) (0: no channels, 1:mono, 2:stereo, ...)
  //////////// SampleFormat : -1 default : Int16 : (0: Float32, 1:Int32, 2:Int16)
  //////////// FramesCount : default : -1 (65536)
  //  result : -1 nothing created, otherwise Output Index in array

  uos_AddFromFile(PlayerIndex1, Pchar(Edit5.Text), -1, 0, -1);
  //// add input from audio file with custom parameters
  ////////// FileName : filename of audio file
  //////////// PlayerIndex : Index of a existing Player
  ////////// OutputIndex : OutputIndex of existing Output // -1 : all output, -2: no output, other integer : existing output)
  ////////// SampleFormat : -1 default : Int16 : (0: Float32, 1:Int32, 2:Int16) SampleFormat of Input can be <= SampleFormat float of Output
  //////////// FramesCount : default : -1 (65536)
  //  result : -1 nothing created, otherwise Input Index in array

  uos_EndProc(PlayerIndex1,@ClosePlayer1);

  uos_Play(PlayerIndex1);
  ////// Ok let start it

  button17.Enabled := True;
  button6.Enabled := True;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  uos_Stop(PlayerIndex1);
   button18.Enabled:=false;
   button17.Enabled:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit5.Text := opendialog1.FileName;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  PlayerIndex2 := 2;

  uos_CreatePlayer(PlayerIndex2);

  uos_AddIntoDevOut(PlayerIndex2, -1, -1, -1, -1, 0, -1);
  //// add a Output with custom parameters
  //// add a Output into device with custom parameters
  //////////// PlayerIndex : Index of a existing Player
  //////////// Device ( -1 is default Output device )
  //////////// Latency  ( -1 is latency suggested ) )
  //////////// SampleRate : delault : -1 (44100)
  //////////// Channels : delault : -1 (2:stereo) (0: no channels, 1:mono, 2:stereo, ...)
  //////////// SampleFormat : -1 default : Int16 : (0: Float32, 1:Int32, 2:Int16)
  //////////// FramesCount : default : -1 (65536)
  //  result : -1 nothing created, otherwise Output Index in array

  uos_AddFromFile(PlayerIndex2, Pchar(Edit6.Text), -1, 0, -1);
  //// add input from audio file with custom parameters
  ////////// FileName : filename of audio file
  //////////// PlayerIndex : Index of a existing Player
  ////////// OutputIndex : OutputIndex of existing Output // -1 : all output, -2: no output, other integer : existing output)
  ////////// SampleFormat : -1 default : Int16 : (0: Float32, 1:Int32, 2:Int16) SampleFormat of Input can be <= SampleFormat float of Output
  //////////// FramesCount : default : -1 (65536)
  //  result : -1 nothing created, otherwise Input Index in array

  uos_EndProc(PlayerIndex2,@ClosePlayer2);

   uos_Play(PlayerIndex2);
  ////// Ok let start it

  button19.Enabled := True;
  button9.Enabled := True;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  uos_Stop(PlayerIndex2);
   button19.Enabled:=false;
   button20.Enabled:=false;
end;

procedure uos_logo();
var
  xpos, ypos: integer;
  ratio: double;
begin
  xpos := 0;
  ypos := 0;
  ratio := 1;
  BufferBMP := TBitmap.Create;
  with form1 do
  begin
    form1.PaintBox1.Parent.DoubleBuffered := True;
    PaintBox1.Height := round(ratio * 116);
    PaintBox1.Width := round(ratio * 100);
    BufferBMP.Height := PaintBox1.Height;
    BufferBMP.Width := PaintBox1.Width;
    BufferBMP.Canvas.AntialiasingMode := amOn;
    BufferBMP.Canvas.Pen.Width := round(ratio * 6);
    BufferBMP.Canvas.brush.Color := clmoneygreen;
    BufferBMP.Canvas.FillRect(0, 0, PaintBox1.Width, PaintBox1.Height);
    BufferBMP.Canvas.Pen.Color := clblack;
    BufferBMP.Canvas.brush.Color := $70FF70;
    BufferBMP.Canvas.Ellipse(round(ratio * (22) + xpos),
      round(ratio * (30) + ypos), round(ratio * (72) + xpos),
      round(ratio * (80) + ypos));
    BufferBMP.Canvas.brush.Color := clmoneygreen;
    BufferBMP.Canvas.Arc(round(ratio * (34) + xpos), round(ratio * (8) + ypos),
      round(ratio * (58) + xpos), round(ratio * (32) + ypos), round(ratio * (58) + xpos),
      round(ratio * (20) + ypos), round(ratio * (46) + xpos),
      round(ratio * (32) + xpos));
    BufferBMP.Canvas.Arc(round(ratio * (34) + xpos), round(ratio * (32) + ypos),
      round(ratio * (58) + xpos), round(ratio * (60) + ypos), round(ratio * (34) + xpos),
      round(ratio * (48) + ypos), round(ratio * (46) + xpos),
      round(ratio * (32) + ypos));
    BufferBMP.Canvas.Arc(round(ratio * (-28) + xpos), round(ratio * (18) + ypos),
      round(ratio * (23) + xpos), round(ratio * (80) + ypos), round(ratio * (20) + xpos),
      round(ratio * (50) + ypos), round(ratio * (3) + xpos), round(ratio * (38) + ypos));
    BufferBMP.Canvas.Arc(round(ratio * (70) + xpos), round(ratio * (18) + ypos),
      round(ratio * (122) + xpos), round(ratio * (80) + ypos),
      round(ratio * (90 - xpos)),
      round(ratio * (38) + ypos), round(ratio * (72) + xpos),
      round(ratio * (50) + ypos));
    BufferBMP.Canvas.Font.Name := 'Arial';
    BufferBMP.Canvas.Font.Size := round(ratio * 10);
    BufferBMP.Canvas.TextOut(round(ratio * (4) + xpos),
      round(ratio * (83) + ypos), 'United Openlib');
    BufferBMP.Canvas.Font.Size := round(ratio * 7);
    BufferBMP.Canvas.TextOut(round(ratio * (20) + xpos),
      round(ratio * (101) + ypos), 'of');
    BufferBMP.Canvas.Font.Size := round(ratio * 10);
    BufferBMP.Canvas.TextOut(round(ratio * (32) + xpos),
      round(ratio * (98) + ypos), 'Sound');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  form1.Height := 148;
end;

end.
