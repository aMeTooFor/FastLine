unit U_OK;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ShellAPI, OleCtrls,
  ComCtrls, jpeg, Button, dxGDIPlusClasses;

type
  TF_OK = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    RichEdit1: TRichEdit;
    Image1: TImage;
    Image2: TImage;
    Memo2: TMemo;
    BitBtn1: TBitBtn;
    RichEdit2: TRichEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initdata();
  end;

var
  F_OK: TF_OK;

implementation
 uses U_Main;
{$R *.dfm}

procedure TF_OK.initdata;
begin


end;

procedure TF_OK.Button1Click(Sender: TObject);
begin

end;

procedure TF_OK.Button2Click(Sender: TObject);
begin

end;

procedure TF_OK.FormResize(Sender: TObject);
begin

end;

procedure TF_OK.FormShow(Sender: TObject);
var
  w:trect;
begin

end;

end.

