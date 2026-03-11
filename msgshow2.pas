unit msgshow2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons,math;

type

  { TshowMSG2 }

  TshowMSG2 = class(TForm)
    BitBtn1: TBitBtn;
     image1:Timage;
     procedure FormShow(Sender: TObject);
  private

  public
     procedure init(filename:string);
     procedure initshow(sss:string);
  end;

var
  showMSG2: TshowMSG2;

implementation

{$R *.lfm}

{ TshowMSG2 }

procedure TshowMSG2.FormShow(Sender: TObject);
var
  w,h:integer;
begin
   w:=image1.Width;
   h:=image1.Height;
   w:=math.Max(w,h);
   h:=w;


end;

procedure TshowMSG2.init(filename: string);
begin

end;

procedure TshowMSG2.initshow(sss: string);
begin

end;

end.

