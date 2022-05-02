program Seteerros;

uses
  System.StartUpCopy,
  FMX.Forms,
  uInicial in 'uInicial.pas' {F_Inicio},
  uPrincipal in 'uPrincipal.pas' {F_TelaJogo},
  uTela02 in 'uTela02.pas' {F_Tela02},
  Globais in 'classes\Globais.pas',
  uPermissions in 'classes\uPermissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Inicio, F_Inicio);
  Application.Run;
end.
