program FastLine;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  fl,
  msgshow,
  U_points,
  msgshow2,
  U_edges,
  showPathTree;

  {$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(Tfrmpoints, frmpoints);
  Application.CreateForm(TshowMSG, showMSG);
  Application.CreateForm(TshowMSG2, showMSG2);
  Application.CreateForm(Tfrmedges, frmedges);
  Application.CreateForm(TshowPathTree, PathTreeshow);
  Application.Run;
end.
