unit showPathTree;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls;

type

  { TshowMSG }

  { TshowPathTree }

  TshowPathTree = class(TForm)
    Button1: TButton;
    Button2: TButton;
     Memo1: TMemo;
     Panel1: TPanel;
     StatusBar1: TStatusBar;
     TreeView1: TTreeView;
     procedure Button1Click(Sender: TObject);
     procedure Button2Click(Sender: TObject);
  private

  public
     procedure init(filename:string);
     procedure initshow(sss:string);
  end;

var
  PathTreeshow: TshowPathTree;

implementation

{$R *.lfm}

{ TshowMSG }

procedure TshowPathTree.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TshowPathTree.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TshowPathTree.init(filename: string);
begin
  memo1.Lines.Clear;
   //showmessage(filename);
  if FileExists(filename) then
    memo1.Lines.LoadFromFile(filename);
  application.ProcessMessages;
  self.ShowModal;
end;

procedure TshowPathTree.initshow(sss: string);
begin
   memo1.Lines.Clear;
   memo1.Lines.Text:=sss;
   self.Show;
end;

end.

