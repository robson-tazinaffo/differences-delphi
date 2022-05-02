unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, FMX.Media

    {$IFDEF MSWINDOWS}
//        ,FMX.Controls.
    ,DateUtils
    {$ENDIF}


  {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
  ,System.IOUtils
  {$ENDIF}

  ;

type
  TF_TelaJogo = class(TForm)
    ActionList1: TActionList;
    actSair: TAction;
    Timer1: TTimer;
    lblPontos: TLabel;
    lblTempo: TLabel;
    lyt04: TLayout;
    Layout3D4: TLayout3D;
    MediaPlayerfundo: TMediaPlayer;
    MediaPlayerAplausos: TMediaPlayer;
    lytParabens: TLayout;
    Image1: TImage;
    ImageGeral: TImage;
    circle1: TCircle;
    lytHeader: TLayout;
    rectHeader: TRectangle;
    lytGeral: TLayout;
    Circle2: TCircle;
    Circle3: TCircle;
    Circle4: TCircle;
    Circle5: TCircle;
    MediaPlayerAcerto: TMediaPlayer;
    lytFooter: TLayout;
    rectFooter: TRectangle;
    lblCursor: TLabel;
    MediaPlayerErro: TMediaPlayer;
    Timer2: TTimer;
    TimerClock: TTimer;
    procedure actSairExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure circle1Click(Sender: TObject);
    procedure ImageGeralClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    pontoIni: integer;
    Segundo: integer;
    Minuto: integer;
//    procedure CalcularAcerto(tag: integer);
//    procedure CalcularAcerto(Sender: TObject);
    procedure CalcularAcerto(Sender: TObject; tag: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_TelaJogo: TF_TelaJogo;

implementation

{$R *.fmx}

//procedure TF_TelaJogo.CalcularAcerto(Sender: TObject);
procedure TF_TelaJogo.CalcularAcerto(Sender: TObject; tag: Integer);
var
    Componente: TComponent;
    oCircle : TCircle;
    oImage  : TImage;
begin
    oCircle := TCircle(Sender);
    oImage  := TImage(Sender);

    if tag = 99 then
    begin
       {$IFDEF MSWINDOWS}
       MediaPlayerErro.Play;
       {$ENDIF}
       lblCursor.Text := 'Erro - Posição: ' + 'X: ' + trunc(oImage.Position.X).ToString + '  Y: ' + trunc(oImage.Position.Y).ToString;
    end;

    if (tag > 0) and (tag < 99) then
    begin
       pontoIni := pontoIni + 1;
       lblPontos.Text := pontoIni.ToString;
       {$IFDEF MSWINDOWS}
        MediaPlayerAcerto.Play;
       {$ENDIF}
        oCircle.Stroke.Thickness := 3;
       lblCursor.Text := 'Acerto - Posição: ' + 'X: ' + trunc(oCircle.Position.X).ToString + '  Y: ' + trunc(oCircle.Position.Y).ToString;
    end;


    if pontoIni = 5 then
    begin
        {$IFDEF MSWINDOWS}
            MediaPlayerAplausos.Play;
        {$ENDIF}

        lytParabens.Visible := true;
        MediaPlayerfundo.Stop;
        Sleep(100);
        Timer1.Enabled := false;
    end;


end;


procedure TF_TelaJogo.circle1Click(Sender: TObject);
begin
//    CalcularAcerto(circle1.Tag);
//    CalcularAcerto((Sender as TCircle).Tag);
    CalcularAcerto(Sender, (Sender as TCircle).Tag );

end;

procedure TF_TelaJogo.actSairExecute(Sender: TObject);
begin
    Timer1.Enabled := false;
    close;
end;

procedure TF_TelaJogo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MediaPlayerfundo.Stop;
    MediaPlayerAplausos.Stop;
    lytParabens.Visible := false;
    Timer1.Enabled := false;

end;

procedure TF_TelaJogo.FormCreate(Sender: TObject);
begin
    pontoIni := 0;
    Segundo  := 0;
    Minuto   := 0;
    Timer1.Enabled := true;
    lytParabens.Visible := false;

//C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\fundo.mp3

//C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\aplausos.mp3

    {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
//     MediaPlayerfundo.FileName    := TPath.Combine(TPath.GetDocumentsPath,'sound.wav');
//     MediaPlayerAplausos.FileName := TPath.Combine(TPath.GetDocumentsPath,'aplausos.mp3');
//     MediaPlayerAcerto.FileName   := 'C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\acerto.wav';
//       MediaPlayerfundo.Play;
     {$ENDIF}

    {$IFDEF MSWINDOWS}
     MediaPlayerfundo.FileName    := 'C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\fundo.mp3';
     MediaPlayerAplausos.FileName := 'C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\aplausos.mp3';
     MediaPlayerAcerto.FileName   := 'C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\acerto.wav';
     MediaPlayerErro.FileName     := 'C:\univesp\PI II\Jogos\Delphi\Meus\Teste 01\audios\erro.wav';
//     MediaPlayerfundo.Play;

//     lblCursor.Text := 'X: ' + IntToStr(Mouse.CursorPos.X) + '   Y: ' + IntToStr(Mouse.CursorPos.Y);
//      CheckBox1.Checked := Mouse.MousePresent;
//      CheckBox2.Checked := Mouse.WheelPresent;
//      Edit1.Text := IntToStr(Mouse.WheelScrollLines);
//      Edit2.Text :=
//      Edit3.Text := IntToStr(Mouse.CursorPos.Y);
    {$ENDIF}







end;

procedure TF_TelaJogo.ImageGeralClick(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
//  CalcularAcerto(Sender);
    MediaPlayerErro.Stop;
    CalcularAcerto(Sender, (Sender as TImage).Tag );
  {$ENDIF}

  {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
//  CalcularAcerto(Sender);
//  lblCursor.Text := 'Posição:    X: ' + IntToStr(ImageGeral.Position.X) + '   Y: ' + IntToStr(ImageGeral.Position.Y);
    MediaPlayerErro.Stop;
    CalcularAcerto(Sender, (Sender as TImage).Tag );
  {$ENDIF}

end;

procedure TF_TelaJogo.Timer1Timer(Sender: TObject);
var
    HoraStr, MinStr, SegStr : string ;
    Thread: TThread;

begin
    lblTempo.Text := '00:00';
    Segundo := Segundo + 1 ;

    if Segundo >= 59 then begin
        Segundo := 0 ;
        Minuto := Minuto + 1;
    end ;

    lblTempo.Text := Format('%2.2d',[Minuto]) + ':' + Format('%2.2d',[Segundo]) ;

//    Hora    := 0;
//
//    Thread := TThread.CreateAnonymousThread(procedure
//    begin
//        try
//          TThread.Synchronize(nil, procedure
//          begin
//                lblTempo.Text := '00:00';
//          end);
//
//            Segundo := Segundo + 1 ;
//
//            if Segundo >= 59 then begin
//            Segundo := 0 ;
//            Minuto := Minuto + 1;
//            end ;
//
//            if Minuto >= 59 then begin
//            Minuto := 0 ;
//            Hora := Hora + 1;
//            end ;
//
////            //formata hora, min e seg
////            if Hora < 10 then
////            HoraStr := '0'+Inttostr(Hora)
////            else
////            HoraStr := Inttostr(Hora) ;
//
////            if Minuto < 10 then
////            MinStr :='0'+inttostr(Minuto)
////            else
////            MinStr := inttostr(Minuto);
////
////            if Segundo < 10 then
////            SegStr := '0'+inttostr(Segundo)
////            else
////            SegStr := inttostr(Segundo) ;
//
//          TThread.Synchronize(nil, procedure
//          begin
//                //mostra Hora, Minuto e segundo na StatusBar, primeiro Panel
////                lblTempo.Text := HoraStr+':'+MinStr+':'+SegStr ;
//                lblTempo.Text := Minuto.ToString+':'+Segundo.ToString ;
//          end);
//
//        finally
//
//          if not TThread.CheckTerminated then
//            TThread.Synchronize(nil, procedure
//            begin
//                //mostra Hora, Minuto e segundo na StatusBar, primeiro Panel
////                lblTempo.Text := HoraStr+':'+MinStr+':'+SegStr ;
//           end);
//
//        end;
//    end);
//    Thread.Start;

end;

procedure TF_TelaJogo.Timer2Timer(Sender: TObject);
var
 pt: TPoint;
begin
  {$IFDEF MSWINDOWS}
//  GetCursorPos(pt); // Pega a posição atual do mouse;
//Mostra os valores das coordenadas do mouse
//  lblCursor.caption := IntToStr(pt.x) + ',' + IntToStr(pt.y);
//  lblCursor.Text := 'Posição:    X: ' + IntToStr(FMX.Controls.TMouse.CursorPos.X) + '   Y: ' + IntToStr(Mouse.CursorPos.Y);
  {$ENDIF}

  {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
//  lblCursor.Text := 'Posição:    X: ' + IntToStr(F_TelaJogo.Position.X) + '   Y: ' + IntToStr(F_TelaJogo.Position.Y);
  {$ENDIF}
end;

end.
