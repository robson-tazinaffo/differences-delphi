unit uInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TF_Inicio = class(TForm)
    lytBackground: TLayout;
    rectInicio: TRectangle;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image1: TImage;
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Inicio: TF_Inicio;

implementation

{$R *.fmx}

uses Globais, uPrincipal, uPermissions;


procedure TF_Inicio.FormCreate(Sender: TObject);
begin
    {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
    TMyPermissions.RequestMyPermission(
    [
       TMyPermissions.Camera,
       TMyPermissions.WifiState,
       TMyPermissions.ReadExternalStorage,
       TMyPermissions.WriteExternalStorage
    ]
    );
    {$ENDIF}

end;

procedure TF_Inicio.Label1Click(Sender: TObject);
begin
    try
        F_TelaJogo := TF_TelaJogo.Create(self);
        F_TelaJogo.Show;
    finally
//        F_TelaJogo.DisposeOf;
    end;

end;

end.
