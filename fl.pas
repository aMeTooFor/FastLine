{%RunFlags MESSAGES+}
unit fl;

{$mode objfpc}{$H+}
//{$I lcl_defines.inc}
interface

uses
  Types, Math, StrUtils, DateUtils,
  LazFileUtils, LazUTF8,
  LResources, LCLStrConsts,
  Classes, SysUtils, DB, SQLDB, SQLite3Conn, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, LCLType, Menus,//,files;//System;
  lMessages, Variants, ButtonPanel;

type

  { TMain }

  TMain = class(TForm)
    addOnePoint: TButton;
    btn_about: TButton;
    Btn_about_spfa: TButton;
    Btn_about_way1: TButton;
    Btn_about_way2: TButton;
    Btn_about_way3: TButton;
    Btn_about_way111: TButton;
    Btn_edges: TButton;
    Btn_end: TButton;
    btn_info: TButton;
    btn_run: TButton;
    Btn_start: TButton;
    Button11: TButton;
    Button3: TButton;
    Button5: TButton;
    CheckBox_showhint: TCheckBox;
    Edit1: TEdit;
    emptyfree: TButton;
    GroupBox1: TGroupBox;
    hintPoint: TMenuItem;
    Label1: TLabel;
    Label4: TLabel;
    memoPoint: TMenuItem;
    lineMenu: TPopupMenu;
    lineBeginEnd: TMenuItem;
    PageControl1: TPageControl;
    Panel_right: TPanel;
    pointsXYpos: TButton;
    RadioBtn_calc: TRadioButton;
    RadioBtn_input: TRadioButton;
    RadioBtn_spfa: TRadioButton;
    RadioBtn_way1: TRadioButton;
    RadioBtn_way2: TRadioButton;
    RadioBtn_way3: TRadioButton;
    RadioBtn_way4: TRadioButton;
    RadioBtn_wayWeightLine: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup3: TRadioGroup;
    refrash: TButton;
    setpoints: TButton;
    shiftEdges: TToggleBox;
    shiftPoints: TToggleBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    updateMemo: TMenuItem;
    Linememo: TMenuItem;
    SQLTransaction2: TSQLTransaction;
    SQLTransaction3: TSQLTransaction;
    Image1: TImage;
    pMenu: TPopupMenu;
    ScrollBox1: TScrollBox;
    DataSource1: TDataSource;
    Memo_SaveToTxT: TMemo;
    Memo3: TMemo;
    ProgressBar1: TProgressBar;
    Shape1: TShape;
    Splitter1: TSplitter;
    SQLConnector1: TSQLConnector;
    SQLConnector2: TSQLConnector;
    SQLConnector3: TSQLConnector;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLtemp: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    OpenDialog1: Topendialog;
    delOnePoint: TMenuItem;
    procedure Btn_about_spfaClick(Sender: TObject);
    procedure Btn_about_way111Click(Sender: TObject);
    procedure Btn_about_way1Click(Sender: TObject);
    procedure Btn_about_way2Click(Sender: TObject);
    procedure Btn_about_way3Click(Sender: TObject);
    procedure btn_infoClick(Sender: TObject);
    procedure btn_runClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure delOnePointClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Label3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure shiftPointsChange(Sender: TObject);
    procedure shiftPointsClick(Sender: TObject);
    procedure shiftEdgesClick(Sender: TObject);

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure addOnePointClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure refreshClick(Sender: TObject);
    procedure emptyfreeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pointsXYposClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure setpointsClick(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Shape1Paint(Sender: TObject);

    procedure shiftEdgesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure shiftPointsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure updateMemoClick(Sender: TObject);

  private

  public
    isdebug: integer;
    alreadyLength: double;
    beginp, endp, FFF, ALLPATH2, MEMO2, ALLLength2: string;
    PPP: TStringList;
    ResultPathEdgesRed: TStringList;
    oriP: Tpoint;
    userclick: boolean;
    LabelsCaptions: TStringList;
    function islink(): boolean;
    function link(vpa: string): boolean;
    function AllTree(curp, treePath: string; SQLConnector: TSQLConnector;
      Transaction: TSQLTransaction): boolean;
    function getFromTo(ecodePP, dirPP, pcode1PP, pcode2PP: string;
      var fromPP, toPP: string): boolean;
    function getFromTo_Li(ecodePP, dirPP, pcode1PP, pcode2PP: string;
      var fromPP, toPP: string; TTag: integer): boolean;

    function getLong(pa, pb: string): integer;
    function getECode(pa, pb: string): string;


    function getPcode(pcode: string): tshape;
    procedure refreshoneP(ccolor: string; pcode: string; iitime1000: integer;
      ccclred: TColor);
    procedure fromLabelcaption;
    procedure fromLabelcaptionC(onlyc: TColor);
    procedure AutorefreshALLP;
    procedure looktime(iitime1000: integer);
    procedure savetoLabelcaption;
    procedure groupcount;
    function DrawArrowAI(bpoint, epoint: tpoint): integer;  // 箭头在目标方
    function DrawArrow(bpoint, epoint: tpoint): integer;  // 箭头在目标方
    function Fill3poit(onep, twop, threep: tpoint): integer;  // 箭头在目标方
    function GetRecordCount(query: TSQLQuery): integer;
    function LocateOneField(query: TSQLQuery; oneField, fieldValue: string): integer;
    function LocateTwoField(query: TSQLQuery;
      Field1, Field2, value1, value2: string): integer;
    function GetTableAllString(query: TSQLQuery): string;



    function LightLine_Li_000(): integer;
    function LightLine_Li_001_flow(): integer; //relax,,,flow

    function LightLine_Li_002(): integer;
    function LightLine_Li_wayWeightLine(): integer;
    //燃线法权重算法，内含直接读path表，显示结果
    function SPFA(): integer;

    function DistForPathTable(distADO: TSQLQuery; distFieldName: string): integer;
    //以点距来定路径的。path表有方向，从pcode到subcode，path表从islink表来的，这表如双向则同一边有两条记录

    function SPFA_Points(): integer;
    function SPFA_Edges(): integer;
    function LightLine_Li_001(): integer;
    function LightLine_Li_001_relax(): integer; //relax,,,flow

  end;

type
  //   TSmallPoint =
  //{$ifndef FPC_REQUIRES_PROPER_ALIGNMENT}
  //  packed
  //{$endif FPC_REQUIRES_PROPER_ALIGNMENT}
  //  record
  //      X,
  //      Y : SmallInt;
  //      end;
  //TlinePoint =
  //  {$ifndef FPC_REQUIRES_PROPER_ALIGNMENT}
  //  packed
  //  {$endif FPC_REQUIRES_PROPER_ALIGNMENT}
  //  record
  //  beginPcode: string;
  //  endPcode: string;
  //  direction: string;
  //  beginPoint: tpoint;
  //  endPoint: tpoint;
  //end;
  //PlinePoint =^TlinePoint;
  TlinePoint = class(TComponent)
  type


















  private
  protected
  public
    beginPcode: string;
    endPcode: string;
    direction: string;
    weightLine: string;
    beginPoint: tpoint;
    endPoint: tpoint;
  end;

  { TPsubpPoint }

  TPsubpPoint = class(TComponent)
  type


















  private
  protected
  public
    Pcode: string;
    subPcode: TStringList;
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Main: TMain;
  // FC: TFC;
  userid: string;
  demoid: string;
  dprid: string;
  AllPath, AllPath_: TStringList;
  tempList: TStringList;
  Origin: Tpoint;
  LineBeforeColor, LableBeforeColor, MyLineColor: TColor;
  mouseMoveCount, PCount, curPcount: integer;
  wwwname: string;
  shiftPointsB, shiftEdgesB: boolean;
  shiftPointsL, shiftEdgesL: TStringList;
  exitOut: boolean;
  isTest5Chain: integer; // 实例且改代码才可测五环肯普链涟漪
  isTest5ChainReturnOK: integer; // 实例且改代码才可测五环肯普链涟漪
  shapeList: TFPList;//TPointerList;//TList;
  // shapeList: TList;//TPointerList;//TList;
  LineList: TFPList;//TPointerList;//TList;
  TPsubpPointList: TFPList;
  OnPainNoPainColor: boolean;


  online: TlinePoint;

implementation

uses  msgshow, u_points, msgshow2, u_edges, showPathTree;

  {$R *.lfm}

  // {$R MessageDialogs.inc}   // 这种.inc，不是pas，不知如何直接引用

{ TMain }
function chineseCharToInt10(const w: string): integer;
var
  i, len: integer;
  cur: integer;
  ws: widestring;
begin
  Result := 0;
  ws := WideString(w);
  len := Length(ws);
  i := 1;
  while i <= len do
  begin
    cur := Ord(ws[i]);
    Result := Result + cur;
    Inc(i);
  end;

end;


function Int10TochineseChar(int10: string): string;
var
  i, len: integer;
  ws: widestring;
begin
  ws := '';
  i := 1;
  len := Length(int10);
  while i < len do
  begin
    ws := ws + widechar(StrToInt(int10));
    i := i + 4;
  end;
  Result := ansistring(ws);
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
begin
  Result.x := Canvas.TextWidth('X');
  Result.y := Canvas.TextHeight('X');
end;

type
  TDummyEditList = array of TEdit;
  PDummyEditList = ^TDummyEditList;

  TDummyForInput = class(TForm)
  public
    FEditsPtr: PDummyEditList;
    FOnCloseEvent: TInputCloseQueryEvent;
    procedure FOnClick(Sender: TObject);
  end;

procedure TDummyForInput.FOnClick(Sender: TObject);
var
  Cfm: boolean;
  Str: array of string;
  i: integer;
begin
  Cfm := True;
  if Assigned(FOnCloseEvent) then
  begin
    SetLength(Str, Length(FEditsPtr^));
    for i := 0 to Length(Str) - 1 do
      Str[i] := FEditsPtr^[i].Text;
    FOnCloseEvent(nil, Str, Cfm);
  end;
  if Cfm then
    ModalResult := mrOk;
end;

function _InputQueryActiveMonitor: TMonitor;
begin
  if Screen.ActiveCustomForm <> nil then
    Result := Screen.ActiveCustomForm.Monitor
  else
  if Application.MainForm <> nil then
    Result := Application.MainForm.Monitor
  else
    Result := Screen.PrimaryMonitor;
end;
//function InputQuery(const ACaption, APrompt : string; var Value : string) : Boolean;
function InputQueryLi(const ACaption: string; const APrompts: array of string;
  var AValues: array of string; ACloseEvent: TInputCloseQueryEvent): boolean;
var
  FPanels: array of TPanel;
  FEdits: array of TEdit;
  FLabels: array of TPanel;
  FButtons: TButtonPanel;
  FForm: TDummyForInput;
  Len, NSpacing, NEditWidth, i: integer;

  function GetPromptCaption(const APrompt: string): string;
  begin
    Result := APrompt;
    if (Result <> '') and (Result[1] < ' ') then
      Delete(Result, 1, 1);
  end;

  function GetPasswordChar(const APrompt: string): char;
  begin
    if (APrompt <> '') and (APrompt[1] < ' ') then
      Result := '*'
    else
      Result := #0;
  end;

begin
  Result := False;
  if Length(APrompts) < 1 then
    raise EInvalidOperation.Create('InputQuery: prompt array cannot be empty');
  if Length(APrompts) > Length(AValues) then
    raise EInvalidOperation.Create(
      'InputQuery: prompt array length must be <= value array length');

  Len := Length(AValues);
  SetLength(FPanels, Len);
  SetLength(FLabels, Len);
  SetLength(FEdits, Len);

  FForm := TDummyForInput.CreateNew(nil);
  try
    //FForm.Width:= FForm.Scale96ToForm(600);
    FForm.Width := FForm.Scale96ToForm(800);
    FForm.Height := FForm.Scale96ToForm(400);
    FForm.BorderStyle := bsDialog;
    FForm.Position := poScreenCenter;
    FForm.Caption := ACaption;
    FForm.FOnCloseEvent := ACloseEvent;

    NSpacing := FForm.Scale96ToForm(cInputQuerySpacingSize);
    NEditWidth := Max(FForm.Scale96ToForm(cInputQueryEditSizePixels),
      _InputQueryActiveMonitor.Width * cInputQueryEditSizePercents div 100);

    FButtons := TButtonPanel.Create(FForm);
    FButtons.Parent := FForm;
    FButtons.ShowButtons := [pbOK, pbCancel];
    FButtons.ShowBevel := False;
    FButtons.OKButton.OnClick := @FForm.FOnClick;
    FButtons.OKButton.ModalResult := mrNone;

    for i := 0 to Len - 1 do
    begin
      FPanels[i] := TPanel.Create(FForm);
      FPanels[i].Parent := FForm;
      FPanels[i].Align := alTop;
      FPanels[i].BevelInner := bvNone;
      FPanels[i].BevelOuter := bvNone;
      FPanels[i].AutoSize := True;
      FPanels[i].BorderSpacing.Around := NSpacing;

      //fix order of panels
      if i > 0 then
        FPanels[i].Top := FPanels[i - 1].Top + 10;

      FEdits[i] := TEdit.Create(FForm);
      FEdits[i].Parent := FPanels[i];
      FEdits[i].Align := alRight;
      FEdits[i].Width := NEditWidth;
      FEdits[i].Text := AValues[i];
      if i < Length(APrompts) then
        FEdits[i].PasswordChar := GetPasswordChar(APrompts[i]);

      FLabels[i] := TPanel.Create(FForm);
      FLabels[i].Parent := FPanels[i];
      FLabels[i].Align := alRight;
      FLabels[i].BevelInner := bvNone;
      FLabels[i].BevelOuter := bvNone;
      if i < Length(APrompts) then
        FLabels[i].Caption := GetPromptCaption(APrompts[i]);
      FLabels[i].BorderSpacing.Right := NSpacing;
      FLabels[i].Width := FLabels[i].Canvas.TextWidth(FLabels[i].Caption);

      FEdits[i].Left := FForm.Width; // place edits to right
    end;

    FButtons.Align := alTop;
    FButtons.Top := FPanels[Len - 1].Top + 10; // place buttons to bottom

    FForm.AutoSize := True;
    FForm.ActiveControl := FEdits[0];
    FForm.FEditsPtr := @FEdits;

    Result := FForm.ShowModal = mrOk;
    if Result then
      for i := 0 to Len - 1 do
        AValues[i] := FEdits[i].Text;
  finally
    FreeAndNil(FForm);
  end;
end;

function InputQueryLiMemo(const ACaption: string; const APrompts: string;
  ACloseEvent: TInputCloseQueryEvent): boolean;
var
  Fmemo: Tmemo;
  FButtons: TButtonPanel;
  FForm: TDummyForInput;
  Len, NSpacing, NEditWidth, i: integer;
  FPanel: TPanel;

  function GetPromptCaption(const APrompt: string): string;
  begin
    Result := APrompt;
    if (Result <> '') and (Result[1] < ' ') then
      Delete(Result, 1, 1);
  end;

begin
  Result := False;


  FForm := TDummyForInput.CreateNew(nil);
  try
    //FForm.Width:= FForm.Scale96ToForm(600);
    FForm.Width := 600;//FForm.Scale96ToForm(800);
    FForm.Height := 400;//FForm.Scale96ToForm(400);
    FForm.BorderStyle := bsDialog;
    FForm.Position := poScreenCenter;
    FForm.Caption := ACaption;
    FForm.FOnCloseEvent := ACloseEvent;

    //NSpacing:= FForm.Scale96ToForm(cInputQuerySpacingSize);
    //NEditWidth:= Max(
    //  FForm.Scale96ToForm(cInputQueryEditSizePixels),
    //  _InputQueryActiveMonitor.Width * cInputQueryEditSizePercents div 100);

    FButtons := TButtonPanel.Create(FForm);
    FButtons.Parent := FForm;
    FButtons.ShowButtons := [pbOK, pbCancel];
    FButtons.ShowBevel := False;
    FButtons.OKButton.OnClick := @FForm.FOnClick;
    FButtons.OKButton.ModalResult := mrNone;

    FPanel := TPanel.Create(FForm);
    FPanel.Parent := FForm;
    FPanel.Align := alClient;//alTop;
    FPanel.BevelInner := bvNone;
    FPanel.BevelOuter := bvNone;
    //FPanel.AutoSize:= true;
    //FPanel.BorderSpacing.Around:= NSpacing;

    Fmemo := tmemo.Create(FForm);
    Fmemo.Parent := FPanel;
    Fmemo.Align := alClient;
    //Fmemo.Width:= NEditWidth;
    Fmemo.Text := APrompts;
    //Fmemo.Height:= 100;
    Fmemo.ScrollBars := ssBoth;
    //Fmemo.Left:= FForm.Width; // place edits to right


    FButtons.Align := alBottom;//alTop;
    FButtons.Top := FForm.Top + 10; // place buttons to bottom
    //FButtons.Height:= 80;
    //FForm.AutoSize:= true;
    FForm.ActiveControl := Fmemo;
    //FForm.FEditsPtr:= @FEdits;

    Result := FForm.ShowModal = mrOk;

  finally
    FreeAndNil(FForm);
  end;
end;

function InputQueryLiImage(const ACaption: string; const APrompts: string;
  imgFileName: string; ACloseEvent: TInputCloseQueryEvent): boolean;
var
  Fmemo: Tmemo;
  FButtons: TButtonPanel;
  FForm: TDummyForInput;
  Len, NSpacing, NEditWidth, i: integer;
  FPanel, FPanelimage: TPanel;
  img: Timage;

  function GetPromptCaption(const APrompt: string): string;
  begin
    Result := APrompt;
    if (Result <> '') and (Result[1] < ' ') then
      Delete(Result, 1, 1);
  end;

begin
  Result := False;


  FForm := TDummyForInput.CreateNew(nil);
  try
    //FForm.Width:= FForm.Scale96ToForm(600);
    FForm.Width := 500;//600;//FForm.Scale96ToForm(800);
    FForm.Height := 800;//FForm.Scale96ToForm(400);
    FForm.BorderStyle := bsDialog;
    FForm.Position := poScreenCenter;
    FForm.Caption := ACaption;
    FForm.FOnCloseEvent := ACloseEvent;

    //NSpacing:= FForm.Scale96ToForm(cInputQuerySpacingSize);
    //NEditWidth:= Max(
    //  FForm.Scale96ToForm(cInputQueryEditSizePixels),
    //  _InputQueryActiveMonitor.Width * cInputQueryEditSizePercents div 100);

    FButtons := TButtonPanel.Create(FForm);
    FButtons.Parent := FForm;
    FButtons.ShowButtons := [pbOK, pbCancel];
    FButtons.ShowBevel := False;
    FButtons.OKButton.OnClick := @FForm.FOnClick;
    FButtons.OKButton.ModalResult := mrNone;
    FPanelimage := TPanel.Create(FForm);
    FPanelimage.Parent := FForm;
    FPanelimage.Align := alTop;
    FPanelimage.BevelInner := bvNone;
    FPanelimage.BevelOuter := bvNone;
    FPanelimage.AutoSize := True;
    //FPanelimage.BorderSpacing.Around:= NSpacing;
    //image1.Parent:= FPanelimage;
    //image1.Align:= alClient;//alTop;
    img := Timage.Create(FForm);
    //img.Picture.Bitmap.LoadFromFile(imgFileName);
    img.Parent := FPanelimage;
    img.Picture.LoadFromFile(imgFileName);
    img.AutoSize := True;
    FPanelimage.Height := img.Height;
    //FPanelimage.Height:=300;

    FPanel := TPanel.Create(FForm);
    FPanel.Parent := FForm;
    FPanel.Align := alClient;//alTop;
    FPanel.BevelInner := bvNone;
    FPanel.BevelOuter := bvNone;
    //FPanel.AutoSize:= true;
    //FPanel.BorderSpacing.Around:= NSpacing;

    Fmemo := tmemo.Create(FForm);
    Fmemo.Parent := FPanel;
    Fmemo.Align := alClient;
    //Fmemo.Width:= NEditWidth;
    Fmemo.Text := APrompts;
    //Fmemo.Height:= 100;
    Fmemo.ScrollBars := ssBoth;
    //Fmemo.Left:= FForm.Width; // place edits to right


    FButtons.Align := alBottom;//alTop;
    FButtons.Top := FForm.Top + 10; // place buttons to bottom
    //FButtons.Height:= 80;
    //FForm.AutoSize:= true;
    FForm.ActiveControl := Fmemo;
    //FForm.FEditsPtr:= @FEdits;

    Result := FForm.ShowModal = mrOk;

  finally
    FreeAndNil(FForm);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
var
  ii: integer;
begin
  wwwname := '开发者：无人知/路人知/反枝苋/茼蒿/开源盛世 ';
  // wwwname := '作者：无人知/无人不知/街知巷闻/路人知/路人皆知';
  // wwwname := '作者：FastLine/快来/快线';
  // wwwname := '作者：反枝苋/茼蒿/开源盛世/阴汁成世';
  wwwname := wwwname + ' https://github.com/aMeTooFor/FourColour';
  wwwname := wwwname + ' 广东吴川梅菉';
  self.Caption := '最快路径算法小软件FastLine V6.0  2018年6月 ' + wwwname;
  Application.Title := self.Caption;
  // 四色定理染色算法小软件Version1.11        2025.6.13     开发者：不是我/不是我干的，和我无关/与我无关，身无分文/心无罣碍，路人甲/打酱油
  userid := '1';
  demoid := '2';
  dprid := userid;

   self.Hint:='OnShow'+self.Hint;
  main.SQLConnector1.connected := True;
  main.SQLTransaction1.Active := True;
  frmpoints.SQLConnector1.connected := False;
  frmpoints.SQLTransaction1.Active := False;
  frmedges.SQLConnector1.connected := False;
  frmedges.SQLTransaction1.Active := False;
  image1.Picture.LoadFromFile(extractfilepath(ParamStr(0)) + '用户地图.jpg');
  //又是怪事，如果不存在“用户地图”，不是提示找不到的报错，而是不知报什么错
  //self.WindowState:=wsMaximized;
  //application.ProcessMessages;
  //  首先在Lazarus的lfm中设置窗体的WindowState:= wsFullScreen;//   wsMaximized;
  //再代码在form.show中如下写，才可以象正常的wsMaximized;
  //如此怪诞，只能讲是经验，找不到如何解释，映像人生，为何会怪，因为正路无法正常，就会怪了，非代码不正也
  //  底图要自拍照天空大海，勿用网上的，以免到时出～～～～
  // self.WindowState:=wsFullScreen;
  // ii := GetTickCount64;
  // while ((GetTickCount64 - ii) < 2500) do
  //   Application.ProcessMessages;
  //self.WindowState:=wsMaximized;
  // application.ProcessMessages;
  // refrash.Click;

  //self.WindowState:=wsMaximized;
  //application.ProcessMessages;
end;

procedure TMain.RadioButton1Click(Sender: TObject);
begin
  dprid := demoid;
end;

procedure TMain.RadioButton2Click(Sender: TObject);
begin
  dprid := userid;
end;

procedure TMain.setpointsClick(Sender: TObject);
begin
  u_points.frmPoints.ShowModal;
  refrash.Click;
end;

procedure TMain.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TMain.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  //if ((x> tshape(Sender).Left) and (x<(tshape(Sender).Left+tshape(Sender).Width))) then
  // if ((y> tshape(Sender).top) and (y<(tshape(Sender).top+tshape(Sender).Height))) then
  tshape(Sender).Tag := (x) * 100000 + (y);
end;

procedure TMain.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  x0, y0, L0, T0: integer;
  i, j, k: integer;
  //www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;
begin
  if tshape(Sender).Tag < 100000 then exit;
  x0 := trunc(tshape(Sender).Tag div 100000);
  y0 := tshape(Sender).Tag - x0 * 100000;
  L0 := tshape(Sender).left;
  T0 := tshape(Sender).top;
  tshape(Sender).Left := tshape(Sender).left + x - x0;
  //tshape(Sender).Left :=  x - x0;
  tshape(Sender).top := tshape(Sender).top + y - y0;
  //tshape(Sender).top := y - y0;
  //tshape(Sender).Tag := x * 100000 + y;

  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'select * from edges where relation=1 and (pcode1=''' +
  //  tshape(Sender).Name + ''' or pcode2=''' + tshape(Sender).Name +
  //  ''') and dprid=' + dprid;
  //self.SQLQuery1.Open;
  //SQLQuery1.First;
  //while not SQLQuery1.EOF do
  //begin
  //  pcode1 := SQLQuery1.FieldByName('pcode1').AsString;
  //  pcode2 := SQLQuery1.FieldByName('pcode2').AsString;
  //  if pcode1 = tshape(Sender).Name then
  //    pcode1Shape := tshape(Sender)
  //  else
  //    pcode1Shape := getpcode(pcode1);
  //  if pcode2 = tshape(Sender).Name then
  //    pcode2Shape := tshape(Sender)
  //  else
  //    pcode2Shape := getpcode(pcode2);
  //  pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
  //  pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
  //  pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
  //  pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
  //  //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);
  //  self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
  //  pline := TlinePoint.Create(nil);
  //  pline.beginPcode := pcode1;
  //  pline.endPcode := pcode2;
  //  pline.direction := 'from1to2';
  //  pline.beginPoint := pcode1Pointer;
  //  pline.endPoint := pcode2Pointer;
  //  linelist.Add(pline);
  //  SQLQuery1.Next;
  //end;
  ////SQLQuery1.Close;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        if TPsubpPoint(TPsubpPointList.Items[i]).Pcode = tshape(Sender).Name then
        begin

          for j := 0 to TPsubpPoint(TPsubpPointList.Items[i]).subPcode.Count - 1 do
          begin
            pcode1 := tshape(Sender).Name;
            pcode2 := TPsubpPoint(TPsubpPointList.Items[i]).subPcode[j];
            pcode1Shape := tshape(Sender);
            pcode2Shape := getpcode(pcode2);

            pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
            pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
            //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

            pcode1Pointer.x := L0 + (pcode1Shape.Width div 2);
            pcode1Pointer.y := T0 + (pcode1Shape.Height div 2);
            //ScrollBox1.Canvas.Brush.Color := clred;//clForm;//ScrollBox1.Color;
            ScrollBox1.Canvas.pen.Color := clForm;//clForm;//clblack;  clDefault
            ScrollBox1.Canvas.pen.Mode := pmMerge;
            self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok

            pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
            pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);

            //ScrollBox1.Canvas.Brush.Color := clwhite;//clblack;
            ScrollBox1.Canvas.pen.Color := clblack;//clblack;
            ScrollBox1.Canvas.pen.Mode := pmCopy;
            self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok




            pline := TlinePoint.Create(nil);
            pline.beginPcode := pcode1;
            pline.endPcode := pcode2;
            pline.direction := 'from1to2';
            pline.beginPoint := pcode1Pointer;
            pline.endPoint := pcode2Pointer;
            linelist.Add(pline);
            if 1 = 2 then
              for k := 0 to linelist.Count - 1 do
              begin
                if ((TlinePoint(linelist.Items[k]).beginPcode = tshape(Sender).Name) or
                  (TlinePoint(linelist.Items[k]).endPcode = tshape(Sender).Name)) then
                begin
                  if not ((TlinePoint(linelist.Items[k]).beginPoint =
                    pline.beginPoint) and
                    (TlinePoint(linelist.Items[k]).endPoint = pline.endPoint)) then
                  begin
                    self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
                    self.ScrollBox1.Canvas.Line(TlinePoint(linelist.Items[k]).beginPoint,
                      TlinePoint(linelist.Items[k]).endPoint);  //ok

                  end;
                end;

              end;
          end;
          break;
        end;
      end;
    except
    end;
    application.ProcessMessages;
  end;
end;

procedure TMain.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  x0, y0, xycenter: integer;
  p, t: tpoint;
  ii: integer;
  cc: tcolor;
begin
  if tshape(Sender).Tag < 100000 then exit;
  application.ProcessMessages;
  x0 := trunc(tshape(Sender).Tag div 100000);
  y0 := tshape(Sender).Tag - x0 * 100000;
  xycenter := StrToInt(edit1.Text) div 2;   //15
  tshape(Sender).Tag := 0;
  SQLTransaction1.Active := True;
  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'select * from points where pcode=''' + tshape(
  //  Sender).Name + ''' and dprid=' + dprid;
  //self.SQLQuery1.Open;
  //if SQLQuery1.RecordCount = 1 then
  //begin
  //  SQLQuery1.edit;
  //  //SQLQuery1.FieldByName('dprid').AsString := dprid;
  //  //SQLQuery1.FieldByName('pcode').AsString := 'P' + IntToStr(I);
  //  //SQLQuery1.FieldByName('pname').AsString := 'P' + IntToStr(I);
  //  SQLQuery1.FieldByName('px').AsInteger := tshape(Sender).Left + x - xycenter;
  //  //tshape(Sender).Left + x0;
  //  SQLQuery1.FieldByName('py').AsInteger := tshape(Sender).top + y - xycenter;
  //  //tshape(Sender).top + y0;
  //  SQLQuery1.Post;   /////////////////////////
  //  SQLQuery1.ApplyUpdates();

  SQLtemp.Close;
  SQLtemp.SQL.Text := 'update points set px=' +
    IntToStr(tshape(Sender).Left + x - xycenter) + ',py=' +
    IntToStr(tshape(Sender).top + y - xycenter) + ' where dprid=' +
    dprid + ' and pcode=''' + TShape(Sender).Name + '''';
  SQLtemp.ExecSQL;

  SQLTransaction1.Commit;
  SQLTransaction1.Active := True;
  /////////////////////////////////////////
  if shiftEdges.Caption = '正在shift边......' then
  begin
    cc := TShape(Sender).Brush.Color;
    TShape(Sender).Brush.Color := clred;
    ii := GetTickCount64;
    while ((GetTickCount64 - ii) < 250) do
      Application.ProcessMessages;
    // 这个常没反应，不灵，所以要这样，不顺
    //if Shift = [ssShift] then
    if ssShift in Shift then
    begin
      shiftEdgesL.Add(TShape(Sender).Name);
    end;
    //if Shift = [ssCtrl] then
    if ssCtrl in Shift then
    begin
      shiftEdgesL[shiftEdgesL.Count - 1] :=
        shiftEdgesL[shiftEdgesL.Count - 1] + ':' + TShape(Sender).Name;
      // 这个常可以星形，一个中心，其余多个，但分割时亦不顺

    end;
    TShape(Sender).Brush.Color := cc;

    exit;
  end;



  ///////////////////////////////////////////////////
  if Button = mbRight then
  begin
    p.X := X;
    p.Y := Y;
    t := TShape(Sender).clienttoscreen(p);
    delOnePoint.Hint := TShape(Sender).Name;
    hintPoint.Hint := TShape(Sender).hint;
    hintPoint.Caption := '提示：' + hintPoint.Hint;
    updateMemo.Hint := TShape(Sender).Name;
    sqltemp.Close;
    sqltemp.SQL.Text := 'select memo from points where dprid=' +
      dprid + ' and pcode=''' + TShape(Sender).Name + '''';
    sqltemp.Open;
    if GetRecordCount(sqltemp) > 0 then
    begin
      memoPoint.Caption := '备注：' + sqltemp.FieldByName('memo').AsString;
      memoPoint.hint := sqltemp.FieldByName('memo').AsString;
    end;
    sqltemp.Close;
    pMenu.Popup(t.X, t.Y);

    exit;
  end;
  if not (ssShift in Shift) then
    refreshClick(nil);
end;

procedure TMain.Shape1Paint(Sender: TObject);
var
  p, c, cap: string;
  www: tpoint;
  ccolor: string;
  ccclred, brushcolor: tcolor;
  ii, kk, w: integer;
begin
  //   if TShape(Sender).Name=application.Hint then
  //  application.ProcessMessages;
  if Sender = nil then exit;
  cap := TShape(Sender).Caption;
  p := cap.Substring(0, cap.IndexOf(';'));
  c := cap.Substring(cap.IndexOf(';') + 1);
  // TShape(Sender).Canvas.TextOut(-10,-10,p);
  www.X := -20;
  www.y := -20;
  www := TShape(Sender).ClientToParent(www, Tscrollbox(TShape(Sender).parent));
  if CheckBox_showhint.Checked then
    Tscrollbox(TShape(Sender).parent).Canvas.TextOut(www.x, www.y, p);
  //image1.Canvas.TextOut(www.x, www.y, p);
  //  self.ScrollBox1.Canvas.TextOut(www.x, www.y, p);
  w := StrToInt(edit1.Text);
  //TShape(Sender).Canvas.TextOut(w div 2, w div 2, c);
  TShape(Sender).Canvas.TextOut((w div 3), (w div 3) - 2, c);

  if c <> '0' then
    ccolor := c;
  //application.ProcessMessages;
  ccolor := c;
  if ccolor = '0' then
    ccclred := clwhite;
  if ccolor = '1' then
    ccclred := cllime;
  if ccolor = '2' then
    ccclred := clFuchsia;
  if ccolor = '3' then
    ccclred := clyellow;
  if ccolor = '4' then
    ccclred := clskyblue;
  if ccolor = '5' then
    ccclred := clsilver;
  //TShape(Sender).Color := ccclred;
  ////////////////////////////////  TShape(Sender).Brush.Color := ccclred;
  //if not OnPainNoPainColor then
  //application.ProcessMessages;
  if Sender = nil then exit;
  brushcolor := TShape(Sender).Brush.Color;




  // iitime1000 := trunc(strtoint(stepTime.text));
  ii := GetTickCount64;
  //now0f:= time() ;
  // while ((now()-now0f)<( (0.1)/24*3600) ) do
  // while ((GetTickCount64 - ii) < 100) do
  Application.ProcessMessages;
end;

function TMain.getPcode(pcode: string): tshape;
var
  i: integer;
begin
  Result := nil;
  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
        if tshape(shapeList.Items[i]).Name = pcode then
        begin
          Result := tshape(shapeList.Items[i]);
          break;
          application.ProcessMessages;
        end;
    except
    end;
    application.ProcessMessages;
  end;
end;

procedure TMain.refreshoneP(ccolor: string; pcode: string; iitime1000: integer;
  ccclred: TColor);
var
  ijk, ii: integer;
  www: string;
  ooo: tshape;
  nowf, now0f: real;
  w: Tdatetime;
begin
  //  if pcode=application.Hint then
  //   application.ProcessMessages;
  //if ccclred <> clred then
  //  // 没有现成的橙色orange，事先自备才可
  //  if not ((ccclred = clAqua) or (ccclred = clHighLight) or (ccclred = clmedgray) or
  //    (ccclred = clblue) or (ccclred = clwindowFrame)) then




  ooo := getpcode(pcode);
  if ooo <> nil then
  begin
    www := ooo.Caption;
    // getpcode(pcode).Caption:= www.Substring(www.IndexOf(';'));
    ooo.Caption := www.Substring(0, www.IndexOf(';')) + ';' + ccolor;
    // if not OnPainNoPainColor then exit;
    //if not OnPainNoPainColor then
    begin

    end;
    //    GetTickCount
    //iitime1000 := trunc(StrToInt(stepTime.Text));
    //ii := GetTickCount64;
    ////now0f:= time() ;
    //// while ((now()-now0f)<( (0.1)/24*3600) ) do
    //while ((GetTickCount64 - ii) < iitime1000) do
    Application.ProcessMessages;
    //  looktime(-1);

  end;
  exit;




  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TLabel)) then
    begin
      if (uppercase(self.Components[ijk].Name) = uppercase('FC' + pcode)) then
      begin
        TLabel(self.Components[ijk]).Caption := ccolor;
        if not (ccclred = clwhite) then
        begin
          TLabel(self.Components[ijk]).Color := ccclred; // clred;
          TLabel(self.Components[ijk]).Transparent := False;
        end;
        Application.ProcessMessages;
        break;
      end;
    end;
  end;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TShape)) then
    begin
      //showmessage(self.Components[ijk].Name); //shape1
      if (uppercase(self.Components[ijk].Name) = uppercase(pcode)) then
      begin

        if not (ccclred = clwhite) then
        begin
          TShape(self.Components[ijk]).Brush.Color := ccclred; // clred;

        end;
        Application.ProcessMessages;
        break;
      end;
    end;
  end;
  // iitime1000 := 0;
  //iitime1000 := trunc(strtoint(stepTime.text));
  //ii := Winapi.Windows.GetTickCount;
  //while ((Winapi.Windows.GetTickCount - ii) < iitime1000) do
  //  Application.ProcessMessages;
  //looktime(-1);
  if ccolor = '5' then
    Application.ProcessMessages;

end;

procedure TMain.fromLabelcaption;
var
  ijk, ii: integer;
  p, c, cap, ccolor: string;
  ccclred: tcolor;
begin
  // LabelsCaptions.Clear;
  //OnPainNoPainColor := False;
  application.ProcessMessages;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TShape)) then
      // if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)]<>nil then
      if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)] <> '' then
      begin
        TShape(self.Components[ijk]).Caption :=
          LabelsCaptions.Values[uppercase(self.Components[ijk].Name)];

      end;
  end;
  //ii := gettickcount64;
  //while (gettickcount64 - ii) < 100 do
  //  application.ProcessMessages;
  //OnPainNoPainColor := True;
  //application.ProcessMessages;
end;

procedure TMain.fromLabelcaptionC(onlyc: TColor);
var
  ijk, ii: integer;
  p, c, cap, ccolor: string;
  ccclred: tcolor;
begin
  // LabelsCaptions.Clear;
  //OnPainNoPainColor := False;
  //    fromLabelcaption;
  //  exit;


  application.ProcessMessages;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TShape)) then
      //    if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)]<>nil then
      if LabelsCaptions.Values[uppercase(self.Components[ijk].Name)] <> '' then
      begin
        if self.Components[ijk].Name = application.hint then
          application.ProcessMessages;
        // LabelsCaptions.Add(uppercase(self.Components[ijk].Name)+'='+TLabel(self.Components[ijk]).Caption);
        //if TShape(self.Components[ijk]).Color = onlyc then
        //if not ((ccclred = clAqua) or (ccclred = clHighLight) or (ccclred = clmedgray) or
        //  (ccclred = clblue) or (ccclred = clwindowFrame)) then
        //if ((TShape(self.Components[ijk]).Brush.Color = onlyc ) or
        //    (TShape(self.Components[ijk]).Brush.Color = clAqua ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clHighLight ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clmedgray ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clblue ) or
        //     (TShape(self.Components[ijk]).Brush.Color = clwindowFrame ) ) then
        if TShape(self.Components[ijk]).Brush.Color = onlyc then
          //if TShape(self.Components[ijk]).Brush.Color = clblue then
        begin
          //if TShape(self.Components[ijk]).Brush.Color = clblue then
          //  application.ProcessMessages;
          //if TShape(self.Components[ijk]).Brush.Color = onlyc then
          //  application.ProcessMessages;
          //if TShape(self.Components[ijk]).Brush.Color = clred then
          //  application.ProcessMessages;
          TShape(self.Components[ijk]).Caption :=
            LabelsCaptions.Values[uppercase(self.Components[ijk].Name)];

        end;

      end;
  end;
  //ii := gettickcount64;
  //while (gettickcount64 - ii) < 500 do
  //  application.ProcessMessages;
  //OnPainNoPainColor := True;
  //application.ProcessMessages;
end;

procedure TMain.AutorefreshALLP;
var
  ijk, ii: integer;
  ccolor: string;
  ccclred: TColor;
begin
  // 没有现成的橙色orange，事先自备才可
  if 1 = 2 then
    if ((ccclred = clFuchsia) or (ccclred = cllime) or (ccclred = clyellow) or
      (ccclred = clskyblue) or (ccclred = clsilver)) then
    begin
      if ccolor = '1' then
        ccclred := cllime;
      if ccolor = '2' then
        ccclred := clFuchsia;
      if ccolor = '3' then
        ccclred := clyellow;
      if ccolor = '4' then
        ccclred := clskyblue;
      if ccolor = '5' then
        ccclred := clsilver;

    end;

  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is TLabel)) then
      if ((uppercase(TLabel(self.Components[ijk]).Name)[1] +
        uppercase(TLabel(self.Components[ijk]).Name)[2]) = 'FC') then
      begin
        ccolor := TLabel(self.Components[ijk]).Caption;
        ccclred := clOlive;
        if ccolor = '1' then
          ccclred := cllime;
        if ccolor = '2' then
          ccclred := clFuchsia;
        if ccolor = '3' then
          ccclred := clyellow;
        if ccolor = '4' then
          ccclred := clskyblue;
        if ccolor = '5' then
          ccclred := clsilver;

        TLabel(self.Components[ijk]).Color := ccclred; // clred;
        TLabel(self.Components[ijk]).Transparent := False;
        for ii := self.ComponentCount - 1 downto 0 do
        begin
          if ((self.Components[ii] is TShape)) then
          begin
            if uppercase(TLabel(self.Components[ijk]).Name) = 'FC' +
              uppercase(self.Components[ii].Name) then
              TShape(self.Components[ii]).Brush.Color := ccclred; // clred;
          end;
        end;
        Application.ProcessMessages;

      end;
  end;

end;

procedure TMain.looktime(iitime1000: integer);
var
  ii: integer;
  sqltemp1: TSQLQuery;
begin
  userclick := True;
  ii := GetTickCount64;
  if iitime1000 > -1 then
    while ((GetTickCount64 - ii) < iitime1000) do
      Application.ProcessMessages;
  if iitime1000 = -1 then
  begin
    while userclick do
      Application.ProcessMessages;
    sqltemp1 := TSQLQuery.Create(self);
    sqltemp1.DataBase := sqltemp.DataBase;
    sqltemp1.Transaction := sqltemp.Transaction;
    Application.ProcessMessages;
    sqltemp1.Close;
    sqltemp1.SQL.Text := 'select * from points where dprid=' + dprid;
    sqltemp1.Open;
    sqltemp1.First;
    while not sqltemp1.EOF do
    begin
      LabelsCaptions.Values[uppercase(sqltemp1.FieldByName('pcode').AsString)] :=
        sqltemp1.FieldByName('fc').AsString;
      sqltemp1.Next;
    end;

    self.fromLabelcaptionC(clred);
    sqltemp1.Free;
  end;

end;

procedure TMain.savetoLabelcaption;
var
  ijk, ii: integer;
begin
  LabelsCaptions.Clear;
  for ijk := self.ComponentCount - 1 downto 0 do
  begin
    if ((self.Components[ijk] is tshape)) then
    begin

      LabelsCaptions.Add(uppercase(self.Components[ijk].Name) +
        '=' + tshape(self.Components[ijk]).Caption);
      //tshape(self.Components[ijk]).OnPaint(tshape(self.Components[ijk]));
    end;
  end;

end;



procedure TMain.groupcount;
var
  ccc: string;
begin

  sqltemp.Close;
  sqltemp.SQL.Text := 'select  count(1) as c  from points where dprid=' + dprid;
  sqltemp.Open;
  ccc := sqltemp.FieldByName('c').AsString;
  sqltemp.Close;
  sqltemp.SQL.Text := 'select  fc ,count(1) as c  from points where dprid=' +
    dprid + ' group by fc order by fc ';
  sqltemp.Open;
  sqltemp.First;

end;



//function TMain.DrawArrow(bpoint, epoint: tpoint): integer;   //    箭头在目标方
//var
//  upp,downp:tpoint;
//begin
//  //self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok
//  if bpoint.X=epoint.X  then
//  if bpoint.y>epoint.y  then   //  向下的
//  begin

//  end;
//  if bpoint.X=epoint.X  then
//  if bpoint.y<epoint.y  then    // 向上的
//  begin

//  end;
//    if bpoint.X>epoint.X  then
//  if bpoint.y=epoint.y  then    //  向左的
//  begin

//  end;
//    if bpoint.X<epoint.X  then
//    if bpoint.y=epoint.y  then   //向右的
//    begin

//    end;
//   ///////////////////////////////////////
//     if bpoint.X>epoint.X  then
//  if bpoint.y>epoint.y  then      //  正方形指向左下角
//  begin

//  end;
//  if bpoint.X>epoint.X  then
//  if bpoint.y<epoint.y  then  //   正方形指向左上角
//  begin

//  end;
//    if bpoint.X<epoint.X  then
//  if bpoint.y<epoint.y  then   //    正方形指向右上角
//  begin
//    //upp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//    //upp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.3);
//    //self.ScrollBox1.Canvas.Line(upp, epoint);
//    // downp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//    //downp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.8);
//    //self.ScrollBox1.Canvas.Line(downp, epoint);
//  end;
//    if bpoint.X<epoint.X  then
//    if bpoint.y>epoint.y  then  //   正方形指向右下角   //p1p2  test
//    begin
//      //upp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//      //upp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.8);
//      //self.ScrollBox1.Canvas.Line(upp, epoint);
//      // downp.X:=  trunc(bpoint.X+  (epoint.X-bpoint.X)*0.5);
//      //downp.Y:=trunc(bpoint.y+  (epoint.y-bpoint.y)*0.3);
//      //self.ScrollBox1.Canvas.Line(downp, epoint);

//    end;


//  result:=1;
//end;

function TMain.DrawArrowAI(bpoint, epoint: tpoint): integer;
  /////已证实，这个由网页AI生成的函数，放入我的工程立即生效，确实有用，第一次有用，是在
  ////https://5abdow.smartapps.baidu.com/?_chatParams=%7B%22from%22%3A%22q2a%22%2C%22token%22%3A%22mJ8FUfwNIGn6OllPY1scwUX4SsgYhdxnlZPxN7X5PZE8WNouBI5C8TV9Wt0o1aaJ7wn5VdvUwQemkCr4fUXuK6MLW22XuDSGIIJCDXZgAemRu4YMggJDfZteN7ZbLAeQV5PU8d%2BBfPR4%2Bccb5j%2FfHsAL1cA%3D%22%2C%22chat_no_login%22%3Atrue%2C%22agent_id%22%3A%229kxXMX3IJQTdOLEOLWJPGu1Fgfq7Fco9%22%7D&searchid=bc93b91500946bc2&tplname=ai_agent_qa_recommend&srcid=61446&order=8&lid=bc93b91500946bc2&_swebScene=3711001210000000
  ////deepseek数学助手上生成的代码
var
  arrowSize: integer;
  angle: double;
  arrowP1, arrowP2: TPoint;
  lineAngle: double;
  dx, dy: integer;
begin
  arrowSize := 30;//10; // 箭头大小
  dx := epoint.X - bpoint.X;
  dy := epoint.Y - bpoint.Y;

  // 计算线段角度
  if dx = 0 then
  begin
    if dy > 0 then lineAngle := Pi / 2
    else
      lineAngle := -Pi / 2;
  end
  else
  begin
    lineAngle := ArcTan2(dy, dx);
  end;

  // 计算箭头两个点的位置
  arrowP1.X := epoint.X - Round(arrowSize * Cos(lineAngle + Pi / 6));
  arrowP1.Y := epoint.Y - Round(arrowSize * Sin(lineAngle + Pi / 6));

  arrowP2.X := epoint.X - Round(arrowSize * Cos(lineAngle - Pi / 6));
  arrowP2.Y := epoint.Y - Round(arrowSize * Sin(lineAngle - Pi / 6));

  // 绘制箭头线
  Self.ScrollBox1.Canvas.Line(bpoint, epoint);  // 主线段
  Self.ScrollBox1.Canvas.Line(epoint, arrowP1); // 箭头线1
  Self.ScrollBox1.Canvas.Line(epoint, arrowP2); // 箭头线2

  Result := 1;
end;

function TMain.DrawArrow(bpoint, epoint: tpoint): integer;
var
  arrowSize, arrowSizeHead: integer;
  angle: double;
  arrowP1, arrowP2, arrowHead: TPoint;
  lineAngle, distlength: double;
  dx, dy: integer;
  Points: array[0..3] of TPoint;  // 创建一个包含4个点的数组
  cc: Tcolor;
begin
  arrowSize := 20;//10; // 箭头大小
  arrowSizeHead := 10;   //箭头簇大小
  dx := epoint.X - bpoint.X;
  dy := epoint.Y - bpoint.Y;

  // 计算线段角度
  if dx = 0 then
  begin
    if dy > 0 then lineAngle := Pi / 2
    else
      lineAngle := -Pi / 2;
  end
  else
  begin
    lineAngle := ArcTan2(dy, dx);
  end;

  // 计算箭头两个点的位置
  arrowP1.X := epoint.X - Round(arrowSize * Cos(lineAngle + Pi / 6));
  arrowP1.Y := epoint.Y - Round(arrowSize * Sin(lineAngle + Pi / 6));

  arrowP2.X := epoint.X - Round(arrowSize * Cos(lineAngle - Pi / 6));
  arrowP2.Y := epoint.Y - Round(arrowSize * Sin(lineAngle - Pi / 6));

  distlength := sqrt((epoint.X - bpoint.X) * (epoint.X - bpoint.X) +
    (epoint.Y - bpoint.Y) * (epoint.Y - bpoint.Y));
  arrowHead.x := epoint.X - Round((arrowSizeHead / distlength) * (epoint.X - bpoint.X));
  arrowHead.y := epoint.y - Round((arrowSizeHead / distlength) * (epoint.y - bpoint.y));

  self.ScrollBox1.Canvas.pen.Width := 2;
  // 绘制箭头线
  Self.ScrollBox1.Canvas.Line(bpoint, epoint);  // 主线段

  Points[0] := epoint;
  Points[1] := arrowP1;
  Points[2] := arrowHead;
  Points[3] := arrowP2;
  self.ScrollBox1.Canvas.Brush.Color := self.ScrollBox1.Canvas.pen.Color;
  // 设置为填充
  Self.ScrollBox1.Canvas.Polygon(Points);

  //cc:=self.ScrollBox1.Canvas.pen.Color;
  //self.ScrollBox1.Canvas.pen.Color:=clblack;
  Self.ScrollBox1.Canvas.Line(epoint, arrowP1); // 箭头线1
  Self.ScrollBox1.Canvas.Line(epoint, arrowP2); // 箭头线2
  //self.ScrollBox1.Canvas.pen.Color:=cc;
  Result := 1;
end;

function TMain.Fill3poit(onep, twop, threep: tpoint): integer;
var    //Self.ScrollBox1.Canvas.FillRect();
  Points: array[0..2] of TPoint;  // 创建一个包含3个点的数组
begin
  // 将三个点存入数组
  Points[0] := onep;
  Points[1] := twop;
  Points[2] := threep;

  // 使用Canvas的Polygon方法填充三角形
  Self.ScrollBox1.Canvas.Polygon(Points);

  Result := 0; // 你可以根据需要返回有意义的值
end;

function TMain.LightLine_Li_000: integer;
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  ////算法一
  //边长为0或负数应该也是可以的，测试下
  // 边长为0或负数是不行的！！！
  //////////////////////////////////////
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update points set status=2 where dprid=' +
    dprid + ' and pcode=''' + curp + '''';
  SQLQuery2.ExecSQL; //起点为2
  // SQLQuery2.Close;
  //  SQLQuery2.SQL.Text:='insert into path (pcode,subpcode)  values ('''+curp+''','''+curp+''')';
  //  SQLQuery2.ExecSQL;
  SQLtemp.Close;
  //SQLtemp.Connection := self.ADOConnection1;
  SQLtemp.DataBase := self.SQLConnector1;
  SQLtemp.Transaction := self.SQLTransaction1;
  {
  SQLtemp.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid +
    ' and (pcode1=''' + curp + ''' or pcode2=''' + curp +
    ''') and status<>2 and (direct is null or ' +
    '(direct is not null and direct<>"序号从小指向大 -->" and direct<>"序号从大指向小 <--"))' +
    'union  select * from edges where Relation=True and dprid= ' + dprid +
    ' and pcode1=''' + curp + '''  and status<>2 and ' +
    ' direct="序号从小指向大 -->" ' +
    'union  select * from edges where Relation=True and dprid= ' + dprid +
    ' and pcode2=''' + curp + '''  and status<>2 and ' +
    ' direct="序号从大指向小 <--" ';
  SQLtemp.open;  //起点能到的边。反方向不算   ，这里出错，反向也要处理的！！！
  }
  SQLtemp.SQL.Text := 'select * from edges where Relation=True and dprid= ' +
    dprid + ' and (pcode1=''' + curp + ''' or pcode2=''' + curp +
    ''') and status<>2 ';
  SQLtemp.Open;
  //起点能到的边。反方向不算   ，这里出错，反向也要处理的！！！

  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where dprid=' + dprid + ' ';
  SQLQuery2.Open;
  //if SQLtemp.RecordCount <> 0 then
  if self.GetRecordCount(SQLtemp) <> 0 then
  begin
    SQLtemp.First;
    ProgressBar1.Visible := True;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := GetRecordCount(SQLtemp);
    ProgressBar1.Position := 0;
    while not SQLtemp.EOF do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      // SQLQuery2.Locate('id;ecode',
      //   VarArrayOf([SQLtemp.FieldByName('id').AsString,
      //   SQLtemp.FieldByName('ecode').AsString]), [loCaseInsensitive]);
      self.LocateTwoField(SQLQuery2, 'id', 'ecode', SQLtemp.FieldByName(
        'id').AsString, SQLtemp.FieldByName('ecode').AsString);

      getfromto(SQLtemp.FieldByName('ecode').AsString,
        SQLtemp.FieldByName('direct').AsString,
        SQLtemp.FieldByName('pcode1').AsString, SQLtemp.FieldByName('pcode2').AsString,
        from_P,
        to_P);

      if SQLQuery2.FieldByName('status').AsInteger = 0 then
      begin //起点边中，必全此情况  status=0；

        SQLQuery2.Edit;
        if ((from_P = '') or (from_P = curp)) then
          SQLQuery2.FieldByName('status').AsInteger := 1;
        if (to_P = curp) then
          SQLQuery2.FieldByName('status').AsInteger := 2;
        //起点中，反向者必 status=2；
        SQLQuery2.Post;

      end
      else if SQLQuery2.FieldByName('status').AsInteger = 1 then
      begin //起点边中，必没有此情况  status=1；
        SQLQuery2.Edit;
        SQLQuery2.FieldByName('status').AsInteger := 2;
        SQLQuery2.Post;
      end;
      SQLtemp.Next;
    end;
  end; //起点的边为1，反方向不算。
  SQLQuery2.ApplyUpdates();
  self.Hint := IntToStr(self.Tag);
  self.Tag := 0;
  ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := 100;
  ProgressBar1.Position := 0;
  while 1 = 1 do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if ProgressBar1.Position = 100 then
      ProgressBar1.Position := 1;
    if self.tag = -1 then
      break;
    self.Tag := self.Tag + 1;

    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'select * from points where  dprid=' +
      dprid + ' and pcode=''' + endp + ''' and status=2';
    SQLQuery2.Open; //and isend=True
    //if SQLQuery2.RecordCount = 1 then
    if self.GetRecordCount(SQLQuery2) = 1 then
    begin
      self.Tag := -1;
      break;
    end;

    //不能以到达终点为判断，以所有边全历尽为标志？如果有不连通的点，又非起点终点
    //仍不可以，因为中点成了终点，一样原理。
    //P1--P2:1
    //P2--P3:1
    //P3--P4:-1
    //P1--P5:3
    //P5--P3:-100
    //这样，负数很难处理的！！！
    //OK，终于想到了，所有边，都加上最大负数！！！天才！！！否，网上讲是错的。
    //确是错的。因为多节与一节是不同样的。
    //终点连续几节为0值，本应也是最短路，会认为不是最短路
    //0与负权未解决，慢慢来，要注意不要留下测试时的BUG
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'select min(lengthDy) as www from edges where dprid=' +
      dprid + ' and Relation=True and status=1';
    SQLQuery2.Open;
    mind := SQLQuery2.FieldByName('www').AsString; //2.1199999999999999
    if ((mind = '') or (mind = '0.00')) then
    begin
      self.Tag := -1;
      break;
    end;

    mind := format('%f', [SQLQuery2.FieldByName('www').AsFloat]);
    if ((mind = '') or (mind = '0.00')) then
      //边长为0或负数应该也是可以的，测试下，但不可以为空
      //终于发现了BUG，边长为负时，会有逻辑BUG。
      //可以为0，不可以为负数，因为如果最近一条边为负1000，将会成为最短路，但别人已到达终点了！！！
      //if ((mind = '') ) then
    begin
      self.Tag := -1;
      break;
    end;

    SQLQuery2.Close;
    {
    if mind='' then
    begin
      mind:='0';
      application.ProcessMessages;
      self.Caption:=inttostr(self.Tag);

      end;
     }
    //SQLQuery2.SQL.Text:='update edges set lengthDy=lengthDy-1 where dprid='+dprid+' and Relation=True and status=1';
    SQLQuery2.SQL.Text := 'update edges set lengthDy=lengthDy-' +
      mind + ' where dprid=' + dprid + ' and Relation=True and status=1';
    //在这出错，此是双向时的
    SQLQuery2.ExecSQL;

    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from  edges where  abs(lengthDy)<0.01 and dprid=' +
      dprid +
      //SQLQuery1.SQL.Text := 'select * from  edges where  lengthDy=0 and dprid=' + dprid +
      ' and Relation=True and status=1';
    SQLQuery1.Open; ///理解这个SQL最重要

    if SQLQuery1.RecordCount <= 0 then
    begin
      self.Tag := -1;
      break;
    end
    else
    begin
      SQLQuery1.First;
      while not SQLQuery1.EOF do
      begin
        {   ////////////////////////////// BUG 2018.05.28
               if ((SQLQuery1.FieldByName('pcode1').AsString=endp) or (SQLQuery1.FieldByName('pcode2').AsString=endp)) then
                begin
                      if SQLQuery1.FieldByName('pcode1').AsString=endp then
                      begin
                          curp:=endp;
                          parentp:=SQLQuery1.FieldByName('pcode2').AsString;
                      end
                      else
                      begin
                         curp:=endp;
                          parentp:=SQLQuery1.FieldByName('pcode1').AsString;

                      end;

                      SQLQuery2.Close;
                      SQLQuery2.SQL.Text:='insert into path (pcode,subpcode,ecode)  select '''+curp+''',subpcode,ecode  from path where pcode='''+parentp+''' order by id';
                      SQLQuery2.ExecSQL;
                      SQLQuery2.Close;
                      SQLQuery2.SQL.Text:='insert into path (pcode,subpcode,ecode)  values ('''+curp+''','''+parentp+''','''+SQLQuery1.FieldByName('ecode').AsString+''')';
                      SQLQuery2.ExecSQL;
                      SQLQuery2.Close;
                      SQLQuery2.SQL.Text:='insert into path (pcode,subpcode,ecode)  values ('''+curp+''','''+curp+''','''+curp+curp+''')';
                      SQLQuery2.ExecSQL;
                     self.Tag:=-1;
                      break;
                     //第一个已退出了，不理第二个相同长度者也。

                 end;
            //if self.tag=1 then break;
           ///////////////////////////// BUG
     }
        getfromto(SQLQuery1.FieldByName('ecode').AsString,
          SQLQuery1.FieldByName('direct').AsString,
          SQLQuery1.FieldByName('pcode1').AsString,
          SQLQuery1.FieldByName('pcode2').AsString,
          from_P,
          to_P);
        if pos('P', from_P) > 0 then
        begin
          parentp := from_P;
          curp := to_P;
        end
        else
        begin
          //showmessage('运算出错，请联系作者,QQ:165442523。');
          //abort;
          {
            ///可能下面这段代码块无用到的。
            ////////这是双向的，BUG在此产生！！！有单向后，这里不同样了，很复杂。
            SQLQuery2.Close;
            SQLQuery2.SQL.Text := 'select * from  points where  dprid=' + dprid +
              '  and status=0 and pcode=''' + SQLQuery1.FieldByName('pcode1').AsString + '''';
            SQLQuery2.open;
            //P3=2,P4=1,P3-->P4 NOT,,,P4-->P3  OOKK
            if SQLQuery2.RecordCount = 0 then
            begin
              SQLQuery2.Close;
              SQLQuery2.SQL.Text := 'select * from  points where  dprid=' + dprid +
                '  and status=0 and pcode=''' + SQLQuery1.FieldByName('pcode2').AsString +
                '''';
              SQLQuery2.open;
              if SQLQuery2.RecordCount = 0 then
              begin

              end
              else
              begin

                curp := SQLQuery1.FieldByName('pcode2').AsString;
                parentp := SQLQuery1.FieldByName('pcode1').AsString;
              end;
            end
            else
            begin
              curp := SQLQuery1.FieldByName('pcode1').AsString;
              parentp := SQLQuery1.FieldByName('pcode2').AsString;
            end;
          end;
          }
        end;

        //查了很久，才发现此BUG//ACCESS的筛选功能也很重要的
        {
        SQLQuery2.Close; //lengthDy=0  此为BUG乎！
        SQLQuery2.SQL.Text := 'update edges set status=4 where  abs(lengthDy)<0.01 and dprid='
          + dprid
          +
          ' and Relation=True and status=1';
        SQLQuery2.ExecSQL;
        }
        //查了很久，才发现此BUG//ACCESS的筛选功能也很重要的
        //这里UPDATE后，再有相同路径长时，也会不理了。所以不用下面DELETE了。//相同长度者，只取第一个，否则一个树形列表又烦也。
        //SQLQuery2.Close;
        // SQLQuery2.SQL.Text:='insert into path (pcode,subpcode,ecode)  select '''+curp+''',subpcode,ecode  from path where pcode='''+parentp+''' order by id';
        // SQLQuery2.ExecSQL;
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'insert into path (pcode,subpcode,ecode)  values (''' +
          curp + ''',''' + parentp + ''',''' +
          SQLQuery1.FieldByName('ecode').AsString + ''')';
        SQLQuery2.ExecSQL;
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'update points set status=1 where dprid=' +
          dprid + ' and pcode=''' + curp + '''';
        SQLQuery2.ExecSQL;
        //SQLQuery2.Close;
        //SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid +
        //  ' and (pcode1=''' + curp + ''' or pcode2=''' + curp + ''') and status<>3 ';
        SQLtemp.Close;
        //SQLtemp.Connection := self.ADOConnection1;
        SQLtemp.DataBase := self.SQLConnector1;
        SQLtemp.Transaction := self.SQLTransaction1;
        {
        SQLtemp.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid +
          ' and (pcode1=''' + curp + ''' or pcode2=''' + curp +
          ''') and status<>3 and (direct is null or ' +
          '(direct is not null and direct<>"序号从小指向大 -->" and direct<>"序号从大指向小 <--"))' +
          'union  select * from edges where Relation=True and dprid= ' + dprid +
          ' and pcode1=''' + curp + '''  and status<>3 and ' +
          ' direct="序号从小指向大 -->" ' +
          'union  select * from edges where Relation=True and dprid= ' + dprid +
          ' and pcode2=''' + curp + '''  and status<>3 and ' +
          ' direct="序号从大指向小 <--" ';
        }
        SQLtemp.SQL.Text := 'select * from edges where Relation=True and dprid= ' +
          dprid + ' and (pcode1=''' + curp + ''' or pcode2=''' +
          curp + ''') and status<>3 '; //0=NO,1=curr,2=temp is 1;3=OK,4=temp is 3
        SQLtemp.Open;
        //curp  set status=1
        //curp,来源两种。一是有向来，二是无向来，去向两种，一是有向去，二是无向去。
        //来与去，都可能同时有不止一条的。
        //来分析：两条有向来，同时到达CURP，两条有向来，未到达，
        //两条无向来，同时到达，两条无向来，未到达
        //去分析：两条有向去，是当前前线，两条有向去，对方已无路，
        //两条无向去，是当前前线，两条无向去，对方已无路
        //这才是核心算法所在，暂无法
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'select * from edges where dprid=' + dprid + ' ';
        SQLQuery2.Open;

        if SQLtemp.RecordCount <> 0 then
        begin
          SQLtemp.First;
          while not SQLtemp.EOF do
          begin
            // SQLQuery2.Locate('id;ecode',
            //   VarArrayOf([SQLtemp.FieldByName('id').AsString,
            // SQLtemp.FieldByName('ecode').AsString]), [loCaseInsensitive]);
            self.LocateTwoField(SQLQuery2, 'id', 'ecode', SQLtemp.FieldByName(
              'id').AsString, SQLtemp.FieldByName('ecode').AsString);
            getfromto(SQLtemp.FieldByName('ecode').AsString,
              SQLtemp.FieldByName('direct').AsString,
              SQLtemp.FieldByName('pcode1').AsString,
              SQLtemp.FieldByName('pcode2').AsString,
              from_P,
              to_P);

            if SQLQuery2.FieldByName('status').AsInteger = 3 then
            begin
              SQLtemp.Next;
              continue;
            end;
            if to_P = curp then
            begin
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('status').AsInteger := 3;
              SQLQuery2.Post;
            end;
            if SQLQuery2.FieldByName('status').AsInteger = 1 then
            begin
              SQLQuery2.Edit;
              //if format('%f', [SQLQuery2.FieldByName('lengthDy').asfloat])='0.00' then
              SQLQuery2.FieldByName('status').AsInteger := 3;
              SQLQuery2.Post;
            end;
            if SQLQuery2.FieldByName('status').AsInteger = 0 then
            begin
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('status').AsInteger := 2;
              SQLQuery2.Post;
              //P3--P4,P8--P4,同时到达，对P4运行两次P4--P5，X 形的，只能临时为2
              //同时到达一点
            end;
            //else if SQLQuery2.FieldByName('status').AsInteger = 1 then
            begin
              //SQLQuery2.Edit;
              //SQLQuery2.FieldByName('status').AsInteger := 4;
              //SQLQuery2.Post;
            end;
            if from_P <> '' then
              if pos('P', from_P) <= 0 then //同时到达两点
              begin
                SQLQuery2.Edit;
                SQLQuery2.FieldByName('status').AsInteger := 3;
                SQLQuery2.Post;

              end;
            SQLtemp.Next;
          end;

        end;
        SQLQuery1.Next;
      end;

    end; //while 1=1 do
    SQLQuery2.ApplyUpdates();
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update points set status=2 where dprid=' +
      dprid + ' and status=1';
    SQLQuery2.ExecSQL;
    //这里UPDATE后，再有相同路径长时，也会不理了。所以不用下面DELETE了。//相同长度者，只取第一个，否则一个树形列表又烦也。

    SQLQuery2.SQL.Text := 'update edges set status=3 where  abs(lengthDy)<0.01 and dprid='
      + dprid + ' and Relation=True and status=1';
    SQLQuery2.ExecSQL;

    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update edges set status=1 where dprid=' +
      dprid + ' and status=2';
    SQLQuery2.ExecSQL;
    //SQLQuery2.Close;
    //SQLQuery2.SQL.Text := 'update edges set status=3 where dprid=' + dprid + ' and status=4';

    //SQLQuery2.ExecSQL;
  end;
  self.tag := StrToInt(self.hint);
  ShowMessage('OK');
end;

function TMain.LightLine_Li_001: integer;
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  //以下是自创的新算法，燃线法的扩展
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;

  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp_li ';
  //'truncate xpp_li ';// 'delete  from xpp_li ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'alter table  xpp_li alter column [id] counter(1,1)';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges_li ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'alter table  edges_li alter column [id] counter(1,1)';
  SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  while not SQLQuery2.EOF do
  begin

    if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    begin //这个常为空，草

    end;
    if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=Int(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  //exit;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp_li(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text :=
    'insert into edges_li select e.*,e.lengthDy100 as lengthDy200,0 as CCount,0 as LLevel,null as dist from edges as e where e.Relation=True and e.dprid= ' + dprid + ' ';
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp_li order by id';
  SQLQuery2.Open; //xpp_li
  PCount := GetRecordCount(SQLQuery2);
  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
  SQLQuery3.Open; //edges_li
  // exit;

  SQLQuery2.Locate('pcode', beginp, []);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.FieldByName('AllPoints').AsString := beginp;
  SQLQuery2.FieldByName('AllEdges').AsString := '';
  SQLQuery2.FieldByName('Dist').AsInteger := 0;
  SQLQuery2.Post;
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  curpa := beginp;
  while not SQLtemp.EOF do
  begin

    curpb := SQLtemp.FieldByName('pb').AsString;
    curecode := getecode(curpa, curpb);
    SQLQuery3.Locate('ecode', curecode, []);
    SQLQuery3.Edit;
    SQLQuery3.FieldByName('LLevel').AsInteger := 1;
    SQLQuery3.FieldByName('dist').AsInteger := 0;
    SQLQuery3.Post;
    SQLQuery3.ApplyUpdates();
    SQLtemp.Next;
  end;

  SQLQuery1.Tag := 1;
  while 1 = 1 do
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select min(lengthDy200) as www from edges_Li where LLevel=1';
    SQLQuery1.Open;
    minlong := SQLQuery1.FieldByName('www').AsInteger;
    //怪。debug时，minlong显示为0
    mind := SQLQuery1.FieldByName('www').AsString;
    //if ((mind = '') or (mind = '0')) then
    if ((mind = '')) then
    begin
      //   self.Tag := -1;
      break;
    end;

    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set lengthDy200=lengthDy200-' +
      mind + ' where LLevel=1';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set dist=dist+' + mind +
      ' where LLevel=1';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from  edges_Li where  lengthDy200=0 and LLevel=1';
    SQLQuery1.Open;
    //SQLQuery3.Requery();
    SQLQuery3.Close; //select p.pcode,0,0  OOKK
    SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
    SQLQuery3.Open; //edges_li


    //草，这里会改变要requery
    ////这里，总是分不清方向
    SQLQuery1.Tag := SQLQuery1.Tag + 1;
    if SQLQuery1.RecordCount <= 0 then
    begin
      //self.Tag := -1;
      break;
    end
    else
    begin // SQLQuery1.RecordCount>0
      SQLQuery1.First;

      while not SQLQuery1.EOF do
      begin
        //草，这里会改变要requery
        {
        SQLQuery1.Edit;
        SQLQuery1.FieldByName('CCount').AsInteger := 1;
        SQLQuery1.FieldByName('LLevel').AsInteger := -1;
        //SQLQuery1.FieldByName('Dist').AsInteger := SQLQuery1.FieldByName('Dist').AsInteger +
        //  minlong;
        SQLQuery1.Post;
        }
        SQLQuery3.Locate('ecode', SQLQuery1.FieldByName('ecode').AsString, []);
        SQLQuery3.Edit;
        SQLQuery3.FieldByName('CCount').AsInteger := 1;
        SQLQuery3.FieldByName('LLevel').AsInteger := -1;
        //SQLQuery1.FieldByName('Dist').AsInteger := SQLQuery1.FieldByName('Dist').AsInteger +
        //  minlong;
        SQLQuery3.Post;

        //SQLQuery3.Requery();
        getfromto_Li(SQLQuery1.FieldByName('ecode').AsString,
          SQLQuery1.FieldByName('direct').AsString,
          SQLQuery1.FieldByName('pcode1').AsString,
          SQLQuery1.FieldByName('pcode2').AsString,
          from_P,
          to_P, SQLQuery1.Tag);
        if pos('P', from_P) > 0 then
        begin
          curpa := from_P;
          curpb := to_P;
        end
        else
        begin
          ShowMessage('运算出错，请联系作者,QQ:165442523。');
          abort;

        end;

        //curpa := SQLQuery1.FieldByName('pcode1').AsString;
        //curpb := SQLQuery1.FieldByName('pcode2').AsString;

        //if curpb = 'P8' then
        //  application.ProcessMessages;

        {
        if SQLQuery2.FieldByName('CCount').AsInteger = 0 then
        begin
          curp := curpb;
          curpb := curpa;
          curpa := curp;
        end
        else
        begin
          SQLQuery2.Locate('pcode', curpb, []);
          if SQLQuery2.FieldByName('CCount').AsInteger = 0 then
          begin

          end
          else
          begin
             showmessage('数据出错，联系作者');
          end;

        end;
        }
        {
        SQLQuery2.Locate('pcode', curpa, []);
        ppp.Values['CCount_a'] := SQLQuery2.FieldByName('CCount').AsString;
        SQLQuery2.Locate('pcode', curpb, []);
        ppp.Values['CCount_b'] := SQLQuery2.FieldByName('CCount').AsString;
        if strtoint(ppp.Values['CCount_a']) = strtoint(ppp.Values['CCount_b']) then
        begin
          showmessage('数据出错，联系作者');

        end;
        if strtoint(ppp.Values['CCount_a']) > strtoint(ppp.Values['CCount_b']) then
        else
        begin
          curp := curpb;
          curpb := curpa;
          curpa := curp;

        end;
        }
        SQLQuery2.Locate('pcode', curpa, []);
        ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
        ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
        ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;

        SQLQuery2.Locate('pcode', curpb, []);
        ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
        ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
        ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
        SQLQuery2.Tag := 0;
        //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
        begin
          //SQLQuery3.Requery();
          curlong := getlong(curpa, curpb);
          ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
          if SQLQuery2.FieldByName('Dist').IsNull then
            SQLQuery2.Tag := 1
          else
          begin
            if ppp.Values['Dist_a'] <> '' then
            begin
              if SQLQuery2.FieldByName('Dist').AsInteger >
                StrToInt(ppp.Values['Dist_a']) + curlong then
                SQLQuery2.Tag := 1;
              if SQLQuery2.FieldByName('Dist').AsInteger =
                StrToInt(ppp.Values['Dist_a']) + curlong then
                SQLQuery2.Tag := 2;
            end;
          end;
        end;

        if SQLQuery2.Tag = 1 then
        begin
          SQLQuery2.Tag := 0;
          if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
            ',') = 0 then

          begin
            SQLQuery2.Tag := 1;
            SQLQuery2.Edit;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              ppp.Values['AllPoints_a'] + ',' + curpb;

            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' +
                SQLQuery1.FieldByName('ecode').AsString;

            SQLQuery2.FieldByName('Dist').AsInteger :=
              StrToInt(ppp.Values['Dist_a']) + curlong;
            SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
            SQLQuery2.Post;
          end;
        end;
        if SQLQuery2.Tag = 2 then
        begin
          SQLQuery2.Tag := 0;
          if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
            ',') = 0 then

          begin
            SQLQuery2.Tag := 2;
            SQLQuery2.Edit;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              SQLQuery2.FieldByName('AllPoints').AsString + ',' +
              ppp.Values['AllPoints_a'] + ',' + curpb;
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
              SQLQuery2.FieldByName('AllEdges').AsString :=
                SQLQuery2.FieldByName('AllEdges').AsString +
                ppp.Values['AllEdges_a'] + ',' +
                SQLQuery1.FieldByName('ecode').AsString;

            //SQLQuery2.FieldByName('Dist').AsInteger := strtoint(ppp.Values['Dist_a']) +
            //  curlong;
            SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
            SQLQuery2.Post;
          end;
        end;
        if SQLQuery2.Tag > 0 then
        begin ///debug 真烦
          curpaa := curpb;
          if curpaa = endp then
          begin
            SQLQuery1.Next;
            continue;
          end;
          SQLtemp.Close;
          SQLtemp.SQL.Text := 'select  pa,pb   from islink ' +
            '  where pa=''' + curpaa + ''' ';
          SQLtemp.Open;
          SQLtemp.First;
          //SQLQuery3.Requery();

          SQLQuery2.Locate('pcode', curpaa, []);
          ppp.Values['AllPoints_aa'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_aa'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_aa'] := SQLQuery2.FieldByName('Dist').AsString;

          while not SQLtemp.EOF do
          begin

            curpbb := SQLtemp.FieldByName('pb').AsString;

            curecode := getecode(curpaa, curpbb);

            if pos(',' + curpbb + ',', ',' + ppp.Values['AllPoints_aa'] +
              ',') = 0 then

            begin
              //curlong := getlong(curpaa, curpbb);
              //SQLQuery3.Locate('ecode', curecode, []);
              //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
              SQLQuery2.Tag := 0;
              SQLQuery2.Locate('pcode', curpbb, []);
              if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
              begin
                curlong := getlong(curpaa, curpbb);
                if SQLQuery2.FieldByName('Dist').IsNull then
                  SQLQuery2.Tag := 1
                else
                begin
                  if ppp.Values['Dist_aa'] <> '' then
                  begin
                    if SQLQuery2.FieldByName('Dist').AsInteger >
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 1;
                    if SQLQuery2.FieldByName('Dist').AsInteger =
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 2;
                  end;
                end;
              end;

              if SQLQuery2.Tag > 0 then
              begin
                SQLQuery3.Locate('ecode', curecode, []);
                //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
                begin
                  SQLQuery3.Edit;
                  SQLQuery3.FieldByName('LLevel').AsInteger := -2;
                  SQLQuery3.FieldByName('lengthDy200').AsInteger :=
                    SQLQuery3.FieldByName('lengthDy100').AsInteger;
                  //同时到达交汇于同一点时，其发出去者有为0者时
                  if SQLQuery3.FieldByName('dist').IsNull then
                    SQLQuery3.FieldByName('dist').AsInteger :=
                      SQLQuery2.FieldByName('Dist').AsInteger
                  else if SQLQuery3.FieldByName('dist').AsInteger >
                    SQLQuery2.FieldByName('Dist').AsInteger then
                    SQLQuery3.FieldByName('dist').AsInteger :=
                      SQLQuery2.FieldByName('Dist').AsInteger;
                  SQLQuery3.Post;
                end;
              end;
            end;
            SQLtemp.Next;
          end; //while not SQLtemp.Eof do
        end;
        SQLQuery1.Next;
      end; //while not SQLQuery1.Eof do
      //curpa := curpb;
    end; /// SQLQuery1.RecordCount>0
    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update  edges_Li as www set www.llevel=-1 where   www.LLevel=1 and ' +
      '(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode1)=(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode2)';
    SQLQuery1.ExecSQL; //同时到过两点时
    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update edges_Li set llevel=-1 where  lengthDy200=0 and LLevel=1';
    SQLQuery1.ExecSQL;
    //这里，使0边没有经历过就没有了
    // V型与Y型，同点到达两点与同点到达一点与同点出发。。。
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set llevel=1 where   LLevel=-2';
    SQLQuery1.ExecSQL;
    //SQLQuery3.Requery();
  end; //while 1 = 1 do
  ShowMessage('OKOK');
  //以上是自创的新算法，燃线法的扩展
  //以下从SPFA中直接COPY来就可以用了。
  DistForPathTable(SQLQuery2, 'dist');

  // { //TEST
  if isdebug = 0 then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
  end;
  //}
end;

function TMain.LightLine_Li_002: integer;
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  //以下是自创的新算法，燃线法的扩展
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;

  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp_li ';
  //'truncate xpp_li ';// 'delete  from xpp_li ';
  SQLQuery1.ExecSQL;
  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'alter table  xpp_li alter column [id] counter(1,1)';
  //SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges_li ';
  SQLQuery1.ExecSQL;
  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'alter table  edges_li alter column [id] counter(1,1)';
  //SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := GetRecordCount(SQLQuery2);
  ProgressBar1.Position := 0;
  while not SQLQuery2.EOF do
  begin

    if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    begin //这个常为空，草

    end;
    if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  SQLQuery1.ApplyUpdates();
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=trunc(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  //exit;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp_li(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text :=
    'insert into edges_li select e.*,e.lengthDy100 as lengthDy200,0 as CCount,0 as LLevel,null as dist from edges as e where e.Relation=True and e.dprid= ' + dprid + ' ';
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp_li order by id';
  SQLQuery2.Open; //xpp_li
  PCount := GetRecordCount(SQLQuery2);
  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
  SQLQuery3.Open; //edges_li
  // exit;
  self.LocateOneField(SQLQuery2, 'pcode', beginp);
  //SQLQuery2.Locate('pcode', beginp, []);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.FieldByName('AllPoints').AsString := beginp;
  SQLQuery2.FieldByName('AllEdges').AsString := '';
  SQLQuery2.FieldByName('Dist').AsInteger := 0;
  SQLQuery2.Post;
  SQLQuery2.ApplyUpdates();
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  curpa := beginp;
  while not SQLtemp.EOF do
  begin

    curpb := SQLtemp.FieldByName('pb').AsString;
    curecode := getecode(curpa, curpb);
    self.LocateOneField(SQLQuery3, 'ecode', curecode);
    // SQLQuery3.Locate('ecode', curecode, []);
    SQLQuery3.Edit;
    SQLQuery3.FieldByName('LLevel').AsInteger := 1;
    SQLQuery3.FieldByName('dist').AsInteger := 0;
    SQLQuery3.Post;

    SQLtemp.Next;
  end;
  SQLQuery3.ApplyUpdates();
  SQLQuery1.Tag := 1;
  while 1 = 1 do
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select min(lengthDy200) as www from edges_Li where LLevel=1';
    SQLQuery1.Open;
    mind := SQLQuery1.FieldByName('www').AsString;
    //if ((mind = '') or (mind = '0')) then
    if ((mind = '')) then
    begin
      //   self.Tag := -1;
      break;
    end;
    minlong := SQLQuery1.FieldByName('www').AsInteger;
    //怪。debug时，minlong显示为0


    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set lengthDy200=lengthDy200-' +
      mind + ' where LLevel=1';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set dist=dist+' + mind +
      ' where LLevel=1';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from  edges_Li where  lengthDy200=0 and LLevel=1';
    SQLQuery1.Open;
    //SQLQuery3.Requery();
    SQLQuery3.Close; //select p.pcode,0,0  OOKK
    SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
    SQLQuery3.Open; //edges_li

    //草，这里会改变要requery
    ////这里，总是分不清方向
    SQLQuery1.Tag := SQLQuery1.Tag + 1;
    if GetRecordCount(SQLQuery1) <= 0 then
    begin
      //self.Tag := -1;
      break;
    end
    else
    begin // SQLQuery1.RecordCount>0
      SQLQuery1.First;

      while not SQLQuery1.EOF do
      begin
        //草，这里会改变要requery
        self.LocateOneField(SQLQuery3, 'ecode', SQLQuery1.FieldByName('ecode').AsString);
        //SQLQuery3.Locate('ecode', SQLQuery1.FieldByName('ecode').AsString, []);
        SQLQuery3.Edit;
        SQLQuery3.FieldByName('CCount').AsInteger := 1;
        SQLQuery3.FieldByName('LLevel').AsInteger := -1;
        //SQLQuery1.FieldByName('Dist').AsInteger := SQLQuery1.FieldByName('Dist').AsInteger +
        //  minlong;
        SQLQuery3.Post;
        //if ((SQLQuery1.FieldByName('pcode1').AsString = 'P16') or
        //  (SQLQuery1.FieldByName('pcode2').AsString = 'P16')) then
        //  application.ProcessMessages;
        //循环中，别人已SQLQuery1.Tag
        //SQLQuery3.Requery();
        //if  SQLQuery1.FieldByName('ecode').AsString ='P17P20' then
        //application.ProcessMessages;
        getfromto_Li(SQLQuery1.FieldByName('ecode').AsString,
          SQLQuery1.FieldByName('direct').AsString,
          SQLQuery1.FieldByName('pcode1').AsString,
          SQLQuery1.FieldByName('pcode2').AsString,
          from_P,
          to_P, SQLQuery1.Tag);
        ///这里出错，来与去在0边双向时错。
        if pos('P', from_P) > 0 then
        begin
          curpa := from_P;
          curpb := to_P;
        end
        else
        begin
          //showmessage('运算出错，请联系作者,QQ:165442523。');
          //abort;

        end;
        if pos('P', from_P) > 0 then
        begin
          //SQLQuery2.Locate('pcode', curpa, []);
          self.LocateOneField(SQLQuery2, 'pcode', curpa);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;
          self.LocateOneField(SQLQuery2, 'pcode', curpb);
          //SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          SQLQuery2.Tag := 0;
          //if ((ppp.Values['Dist_a'] = '') or (ppp.Values['Dist_b'] = '')) then
          //  application.ProcessMessages;
          //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
          begin
            //SQLQuery3.Requery();
            curlong := getlong(curpa, curpb);
            ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
            if SQLQuery2.FieldByName('Dist').IsNull then
              SQLQuery2.Tag := 1
            else
            begin
              if ppp.Values['Dist_a'] <> '' then
              begin
                if SQLQuery2.FieldByName('Dist').AsInteger >
                  StrToInt(ppp.Values['Dist_a']) + curlong then
                  SQLQuery2.Tag := 1;
                if SQLQuery2.FieldByName('Dist').AsInteger =
                  StrToInt(ppp.Values['Dist_a']) + curlong then
                  SQLQuery2.Tag := 2;
              end;
            end;
          end;

          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Tag := 0;
            //if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] + ',')
            //  = 0 then
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
            begin
              SQLQuery2.Tag := 1;
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('AllPoints').AsString :=
                ppp.Values['AllPoints_a'] + ',' + curpb;

              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' + SQLQuery1.FieldByName('ecode').AsString;
              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;
              if ppp.Values['Dist_a'] = '' then
                application.ProcessMessages;
              SQLQuery2.FieldByName('Dist').AsInteger :=
                StrToInt(ppp.Values['Dist_a']) + curlong;
              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
          if SQLQuery2.Tag = 2 then
          begin
            SQLQuery2.Tag := 0;
            //if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] + ',')
            //  = 0 then
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
            begin
              SQLQuery2.Tag := 2;
              // SQLQuery2.Edit;
               { SQLQuery2.FieldByName('AllPoints').AsString :=
                  SQLQuery2.FieldByName('AllPoints').AsString + ',' + ppp.Values['AllPoints_a']
                  +
                  ',' + curpb;

               SQLQuery2.FieldByName('AllEdges').AsString :=
                 SQLQuery2.FieldByName('AllEdges').AsString +
                 ppp.Values['AllEdges_a'] + ',' +
                 SQLQuery1.FieldByName('ecode').AsString;
               if pos(',' + SQLQuery1.FieldByName('ecode').AsString + ',', ',' +
                 ppp.Values['AllEdges_a'] + ',') = 0 then
                 SQLQuery2.FieldByName('AllEdges').AsString :=
                   SQLQuery2.FieldByName('AllEdges').AsString +
                   ppp.Values['AllEdges_a'] + ',' +
                   SQLQuery1.FieldByName('ecode').AsString;
                }
              //SQLQuery2.FieldByName('Dist').AsInteger := strtoint(ppp.Values['Dist_a']) +
              //  curlong;
              //SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              // SQLQuery2.Post;
              SQLQuery2.Edit; /////否则不能0边
              SQLQuery2.FieldByName('AllPoints').AsString :=
                ppp.Values['AllPoints_a'] + ',' + curpb;

              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' + SQLQuery1.FieldByName('ecode').AsString;
              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;
              if ppp.Values['Dist_a'] = '' then
                application.ProcessMessages;
              SQLQuery2.FieldByName('Dist').AsInteger :=
                StrToInt(ppp.Values['Dist_a']) + curlong;
              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
        end;
        if pos('P', from_P) <= 0 then
        begin
          curpa := SQLQuery1.FieldByName('pcode1').AsString;
          curpb := SQLQuery1.FieldByName('pcode2').AsString;
          //SQLQuery2.Locate('pcode', curpa, []);
          self.LocateOneField(SQLQuery2, 'pcode', curpa);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;
          self.LocateOneField(SQLQuery2, 'pcode', curpb);
          //SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          SQLQuery2.Tag := 0;
          //if ((ppp.Values['Dist_a'] = '') or (ppp.Values['Dist_b'] = '')) then
          //  application.ProcessMessages;
          //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
          begin
            //SQLQuery3.Requery();
            curlong := getlong(curpa, curpb);
            ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
            if ppp.Values['Dist_a'] = '' then
              application.ProcessMessages;
            if SQLQuery2.FieldByName('Dist').AsInteger >
              StrToInt(ppp.Values['Dist_a']) + curlong then
            begin
              SQLQuery2.Tag := 1;

            end;
            if SQLQuery2.FieldByName('Dist').AsInteger =
              StrToInt(ppp.Values['Dist_a']) + curlong then
            begin
              SQLQuery2.Tag := 2;

            end;
            if ppp.Values['Dist_b'] = '' then
              application.ProcessMessages;
            if StrToInt(ppp.Values['Dist_a']) > StrToInt(ppp.Values['Dist_b']) +
            curlong then
            begin
              SQLQuery2.Tag := 1;
              curpa := SQLQuery1.FieldByName('pcode2').AsString;
              curpb := SQLQuery1.FieldByName('pcode1').AsString;

            end;
            if StrToInt(ppp.Values['Dist_a']) = StrToInt(ppp.Values['Dist_b']) +
            curlong then
            begin
              SQLQuery2.Tag := 2;
              curpa := SQLQuery1.FieldByName('pcode2').AsString;
              curpb := SQLQuery1.FieldByName('pcode1').AsString;

            end;
          end;
          //SQLQuery2.Locate('pcode', curpa, []);
          self.LocateOneField(SQLQuery2, 'pcode', curpa);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;
          self.LocateOneField(SQLQuery2, 'pcode', curpb);
          //SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Tag := 0;
            //if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] + ',')
            //  = 0 then
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
            begin
              SQLQuery2.Tag := 1;
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('AllPoints').AsString :=
                ppp.Values['AllPoints_a'] + ',' + curpb;

              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' + SQLQuery1.FieldByName('ecode').AsString;
              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;

              SQLQuery2.FieldByName('Dist').AsInteger :=
                StrToInt(ppp.Values['Dist_a']) + curlong;
              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
          if SQLQuery2.Tag = 2 then
          begin
            SQLQuery2.Tag := 0;
            //if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] + ',')
            //  = 0 then
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
            begin
              SQLQuery2.Tag := 2;
              // SQLQuery2.Edit;
               { SQLQuery2.FieldByName('AllPoints').AsString :=
                  SQLQuery2.FieldByName('AllPoints').AsString + ',' + ppp.Values['AllPoints_a']
                  +
                  ',' + curpb;

               SQLQuery2.FieldByName('AllEdges').AsString :=
                 SQLQuery2.FieldByName('AllEdges').AsString +
                 ppp.Values['AllEdges_a'] + ',' +
                 SQLQuery1.FieldByName('ecode').AsString;
               if pos(',' + SQLQuery1.FieldByName('ecode').AsString + ',', ',' +
                 ppp.Values['AllEdges_a'] + ',') = 0 then
                 SQLQuery2.FieldByName('AllEdges').AsString :=
                   SQLQuery2.FieldByName('AllEdges').AsString +
                   ppp.Values['AllEdges_a'] + ',' +
                   SQLQuery1.FieldByName('ecode').AsString;
                }
              //SQLQuery2.FieldByName('Dist').AsInteger := strtoint(ppp.Values['Dist_a']) +
              //  curlong;
              //SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              // SQLQuery2.Post;
              SQLQuery2.Edit; /////否则不能0边
              SQLQuery2.FieldByName('AllPoints').AsString :=
                ppp.Values['AllPoints_a'] + ',' + curpb;

              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' + SQLQuery1.FieldByName('ecode').AsString;
              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;

              SQLQuery2.FieldByName('Dist').AsInteger :=
                StrToInt(ppp.Values['Dist_a']) + curlong;
              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
        end;
        if SQLQuery2.Tag > 0 then
        begin ///debug 真烦
          if 1 = 2 then
          begin
            SQLtemp.Close;
            SQLtemp.SQL.Text :=
              'insert into path (pcode,subpcode,ecode)  values (''' +
              curpb + ''',''' + curpa + ''',''' + SQLQuery1.FieldByName(
              'ecode').AsString + ''')';
            SQLtemp.ExecSQL;
            //0环时一样死循环。
            //证实这样求路径，对多个负环是错的。
          end;
          curpaa := curpb;
          if curpaa = endp then
          begin
            SQLQuery1.Next;
            continue;
          end;

          SQLtemp.Close;
          SQLtemp.SQL.Text := 'select  pa,pb   from islink ' +
            '  where pa=''' + curpaa + ''' ';
          SQLtemp.Open;
          SQLtemp.First;
          //SQLQuery3.Requery();
          self.LocateOneField(SQLQuery2, 'pcode', curpaa);
          //SQLQuery2.Locate('pcode', curpaa, []);
          ppp.Values['AllPoints_aa'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_aa'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_aa'] := SQLQuery2.FieldByName('Dist').AsString;

          while not SQLtemp.EOF do
          begin

            curpbb := SQLtemp.FieldByName('pb').AsString;

            curecode := getecode(curpaa, curpbb);

            //if pos(',' + curpbb + ',', ',' + ppp.Values['AllPoints_aa'] + ',')
            //  = 0 then
            if pos(',' + curecode + ',', ',' + ppp.Values['AllEdges_aa'] +
              ',') = 0 then
            begin
              //curlong := getlong(curpaa, curpbb);
              //SQLQuery3.Locate('ecode', curecode, []);
              //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
              SQLQuery2.Tag := 0;
              //SQLQuery2.Locate('pcode', curpbb, []);
              self.LocateOneField(SQLQuery2, 'pcode', curpbb);
              if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
              begin
                curlong := getlong(curpaa, curpbb);
                if SQLQuery2.FieldByName('Dist').IsNull then
                  SQLQuery2.Tag := 1
                else
                begin
                  if ppp.Values['Dist_aa'] <> '' then
                  begin
                    if SQLQuery2.FieldByName('Dist').AsInteger >
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 1;
                    if SQLQuery2.FieldByName('Dist').AsInteger =
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 2;
                  end;
                end;
              end;

              if SQLQuery2.Tag > 0 then
              begin
                //SQLQuery3.Locate('ecode', curecode, []);
                self.LocateOneField(SQLQuery3, 'ecode', curecode);
                //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
                begin
                  SQLQuery3.Edit;
                  SQLQuery3.FieldByName('LLevel').AsInteger := -2;
                  SQLQuery3.FieldByName('lengthDy200').AsInteger :=
                    SQLQuery3.FieldByName('lengthDy100').AsInteger;
                  //同时到达交汇于同一点时，其发出去者有为0者时
                  if SQLQuery3.FieldByName('dist').IsNull then
                    SQLQuery3.FieldByName('dist').AsInteger :=
                      SQLQuery2.FieldByName('Dist').AsInteger
                  else if SQLQuery3.FieldByName('dist').AsInteger >
                    SQLQuery2.FieldByName('Dist').AsInteger then
                    SQLQuery3.FieldByName('dist').AsInteger :=
                      SQLQuery2.FieldByName('Dist').AsInteger;
                  SQLQuery3.Post;
                end;
              end;
            end;
            SQLtemp.Next;
          end; //while not SQLtemp.Eof do
        end;
        SQLQuery1.Next;
      end; //while not SQLQuery1.Eof do
      //curpa := curpb;
    end; /// SQLQuery1.RecordCount>0
    SQLQuery2.ApplyUpdates();
    SQLQuery3.ApplyUpdates();

    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update  edges_Li as www set llevel=-1 where   LLevel=1 and ' +
      '(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode1)=(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode2)';
    SQLQuery1.ExecSQL; //同时到过两点时
    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update edges_Li set llevel=-1 where  lengthDy200=0 and LLevel=1';
    SQLQuery1.ExecSQL;
    //这里，使0边没有经历过就没有了
    // V型与Y型，同点到达两点与同点到达一点与同点出发。。。
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set llevel=1 where   LLevel=-2';
    SQLQuery1.ExecSQL;
    //SQLQuery3.Requery();
  end; //while 1 = 1 do
  ShowMessage('OKOK');
  //以上是自创的新算法，燃线法的扩展
  SQLtemp.Close; //select p.pcode,0,0  OOKK
  SQLtemp.SQL.Text := 'select * from xpp_li  where pcode=''' + endp + ''' ';
  SQLtemp.Open;
  alllength := SQLtemp.FieldByName('dist').AsFloat / 100;
  alreadylength := SQLtemp.FieldByName('dist').AsFloat / 100;
  PPP.Values['LightLine_Li_002_endp_AllPoints'] :=
    SQLtemp.FieldByName('AllPoints').AsString;



  if isdebug = 0 then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp_inner ';
    SQLQuery1.ExecSQL;
  end;

end;

function TMain.LightLine_Li_wayWeightLine(): integer;  //燃线法权重算法说明
var  //燃线法权重算法说明
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal, onelength: double;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, oneline: string;
  iii, jjj, kkk, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
  ado: TSQLQuery;
  s, pstr, lstr, calstr: string;
  i: integer;
  bpoint, epoint: tpoint;
  weightPoints, weightLines: TStringList;
  zero: float;
begin
  //燃线法权重算法说明
  //边长为0或负数应该也是可以的，测试下
  // 边长为0或负数是不行的！！！
  //////////////////////////////////////
  /////if 1 = 2 then  //直接测试读取path表，两条或以上路径时
  begin
    weightPoints := TStringList.Create;
    weightLines := TStringList.Create;

    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from path ';
    SQLQuery1.ExecSQL;

    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update points set weightPoint=0.0 where dprid=' +
      dprid + ' and weightPoint is NULL';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges set weightLine=1.0 where dprid=' +
      dprid + ' and weightLine is NULL';
    SQLQuery1.ExecSQL;
    self.SQLTransaction1.Commit;
    self.SQLTransaction1.Active := True;

    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update edges set lengthDy=lengthDy*weightLine' +
      '  where Relation=True and dprid=' + dprid;
    SQLQuery2.ExecSQL;

    curp := beginp;
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update points set status=2 where dprid=' +
      dprid + ' and pcode=''' + curp + '''';
    SQLQuery2.ExecSQL; //起点status为2


    weightPoints.Clear;
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'select * from points where dprid=' + dprid + ' ';
    SQLQuery2.Open;
    SQLQuery2.First;
    while not SQLQuery2.EOF do
    begin
      weightPoints.Add(SQLQuery2.FieldByName('pcode').AsString + '=' +
        SQLQuery2.FieldByName('weightPoint').AsString);
      SQLQuery2.Next;
    end;

    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'select * from edges where dprid=' + dprid + ' ';
    SQLQuery2.Open;
    SQLQuery2.First;
    //while not SQLQuery2.EOF do
    //begin
    //  weightLines.Add(SQLQuery2.FieldByName('ecode').AsString + '=' +
    //    SQLQuery2.FieldByName('weightLine').AsString);
    //  SQLQuery2.Next;
    //end;
    SQLtemp.Close;
    SQLtemp.DataBase := self.SQLConnector1;
    SQLtemp.Transaction := self.SQLTransaction1;
    SQLtemp.SQL.Text := 'select * from edges where Relation=True and dprid= ' +
      dprid + ' and (pcode1=''' + curp + ''' or pcode2=''' + curp +
    ''') and status<>2 ';
    SQLtemp.Open;
    //起点能到的边。反方向不算   ，这里出错，反向也要处理的！！！
    SQLQuery2.First;
    if self.GetRecordCount(SQLtemp) <> 0 then
    begin
      SQLtemp.First;
      ProgressBar1.Visible := True;
      ProgressBar1.Min := 0;
      ProgressBar1.Max := GetRecordCount(SQLtemp);
      ProgressBar1.Position := 0;
      while not SQLtemp.EOF do
      begin
        ProgressBar1.Position := ProgressBar1.Position + 1;

        self.LocateTwoField(SQLQuery2, 'id', 'ecode', SQLtemp.FieldByName(
          'id').AsString, SQLtemp.FieldByName('ecode').AsString);

        getfromto(SQLtemp.FieldByName('ecode').AsString,
          SQLtemp.FieldByName('direct').AsString,
          SQLtemp.FieldByName('pcode1').AsString, SQLtemp.FieldByName('pcode2').AsString,
          from_P,
          to_P);

        if SQLQuery2.FieldByName('status').AsInteger = 0 then
        begin //起点边中，必全此情况  status=0；

          SQLQuery2.Edit;
          if ((from_P = '') or (from_P = curp)) then
            SQLQuery2.FieldByName('status').AsInteger := 1;
          if (to_P = curp) then
            SQLQuery2.FieldByName('status').AsInteger := 2;
          //起点中，反向者必 status=2；
          SQLQuery2.Post;

        end
        else if SQLQuery2.FieldByName('status').AsInteger = 1 then
        begin //起点边中，必没有此情况  status=1；
          SQLQuery2.Edit;
          SQLQuery2.FieldByName('status').AsInteger := 2;
          SQLQuery2.Post;
        end;
        SQLtemp.Next;
      end;
    end; //起点的边为1，反方向不算。
    SQLQuery2.ApplyUpdates();
    self.Hint := IntToStr(self.Tag);
    self.Tag := 0;
    ProgressBar1.Visible := True;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := 100;
    ProgressBar1.Position := 0;
    while 1 = 1 do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if ProgressBar1.Position = 100 then
        ProgressBar1.Position := 1;
      if self.tag = -1 then
        break;
      self.Tag := self.Tag + 1;

      SQLQuery2.Close;
      SQLQuery2.SQL.Text := 'select * from points where  dprid=' +
        dprid + ' and pcode=''' + endp + ''' and status=2';
      SQLQuery2.Open; //and isend=True

      if self.GetRecordCount(SQLQuery2) = 1 then
      begin
        self.Tag := -1;
        break;
      end;

      //不能以到达终点为判断，以所有边全历尽为标志？如果有不连通的点，又非起点终点
      //仍不可以，因为中点成了终点，一样原理。
      //P1--P2:1
      //P2--P3:1
      //P3--P4:-1
      //P1--P5:3
      //P5--P3:-100
      //这样，负数很难处理的！！！
      //OK，终于想到了，所有边，都加上最大负数！！！天才！！！否，网上讲是错的。
      //确是错的。因为多节与一节是不同样的。
      //终点连续几节为0值，本应也是最短路，会认为不是最短路
      //0与负权未解决，慢慢来，要注意不要留下测试时的BUG
      SQLQuery2.Close;
      SQLQuery2.SQL.Text := 'select min(lengthDy) as www from edges where dprid=' +
        dprid + ' and Relation=True and status=1';
      SQLQuery2.Open;
      mind := SQLQuery2.FieldByName('www').AsString; //2.1199999999999999
      //mind := format('%f', [SQLQuery2.FieldByName('www').AsFloat]);
      // zero := SQLQuery2.FieldByName('www').AsFloat;
      if ((mind = '') or (mind = '0.00')) then
      begin
        self.Tag := -1;
        break;
      end;

      //mind := format('%f', [SQLQuery2.FieldByName('www').AsFloat]);
      mind := SQLQuery2.FieldByName('www').AsString;
      if ((mind = '') or (mind = '0.00')) then
        //边长为0或负数应该也是可以的，测试下，但不可以为空
        //终于发现了BUG，边长为负时，会有逻辑BUG。
        //可以为0，不可以为负数，因为如果最近一条边为负1000，将会成为最短路，但别人已到达终点了！！！
        //if ((mind = '') ) then
      begin
        self.Tag := -1;
        break;
      end;
      zero := SQLQuery2.FieldByName('www').AsFloat;
      if zero < 0.0001 then
      begin
        self.Tag := -1;
        break;
      end;

      //     SQLQuery2.Close;
      //SQLQuery2.SQL.Text :=
      //  'select * from edges where  Relation=True and dprid= ' + dprid;
      //SQLQuery2.Open;
      //showmessage( GetTableAllString(SQLQuery2));




      SQLQuery2.Close;
      //SQLQuery2.SQL.Text:='update edges set lengthDy=lengthDy-1 where dprid='+dprid+' and Relation=True and status=1';
      SQLQuery2.SQL.Text := 'update edges set lengthDy=round(lengthDy-' +
        mind + ') where dprid=' + dprid + ' and Relation=True and status=1';
      //在这出错，此是双向时的
      SQLQuery2.ExecSQL;
      // showmessage(SQLQuery2.SQL.Text);
      if 1 = 2 then
      begin
        SQLQuery2.Close;
        SQLQuery2.SQL.Text :=
          'select * from edges where  Relation=True and dprid= ' + dprid;
        SQLQuery2.Open;
        ShowMessage(GetTableAllString(SQLQuery2));
      end;

      SQLQuery1.Close;
      SQLQuery1.SQL.Text := 'select * from  edges where  abs(lengthDy)<0.01 and dprid='
        + dprid +
        //SQLQuery1.SQL.Text := 'select * from  edges where  lengthDy=0 and dprid=' + dprid +
        ' and Relation=True and status=1';
      SQLQuery1.Open; ///理解这个SQL最重要
      //点的权重，动态加入到当前边界的边权重中，lengthDY，动态有方向矢量，
      //不是静态加到边中乎？？？静态加到边中？两个端点一齐加？
      //如果两个端点一齐静态加到边中去，会造成端点被重复相？则加一半？也不行？可能行？？？
      //如果作为起点与止点或孤点，则不可加一半，改成加全部点权重到边中？

      if GetRecordCount(SQLQuery1) <= 0 then
      begin
        self.Tag := -1;
        break;
      end
      else
      begin
        SQLQuery1.First;
        while not SQLQuery1.EOF do
        begin
          getfromto(SQLQuery1.FieldByName('ecode').AsString,
            SQLQuery1.FieldByName('direct').AsString,
            SQLQuery1.FieldByName('pcode1').AsString,
            SQLQuery1.FieldByName('pcode2').AsString,
            from_P,
            to_P);
          if pos('P', from_P) > 0 then
          begin
            parentp := from_P;
            curp := to_P;
          end
          else
          begin

          end;

          //if weightPoints.Values[curp] <> '' then
          if weightLines.IndexOf(SQLQuery1.FieldByName('ecode').AsString) <= 0 then
          begin
            if round(strtofloat(weightPoints.Values[curp])) <> 0 then
            begin
              SQLQuery2.Close;
              SQLQuery2.SQL.Text :=
                'update edges set lengthDy=round(lengthDy+' +
                weightPoints.Values[curp] + ')  where Relation=True and dprid=' +
                dprid + ' and ecode="' + SQLQuery1.FieldByName('ecode').AsString + '"';
              SQLQuery2.ExecSQL;
              //showmessage(SQLQuery2.SQL.Text);
              //SQLQuery1.Edit;
              //SQLQuery1.FieldByName('lengthDy').AsFloat:=SQLQuery1.FieldByName('lengthDy').AsFloat+strtofloat(weightPoints.Values[curp]);
              //SQLQuery1.Post;
              //SQLQuery1.ApplyUpdates();
              //weightPoints.Values[curp] := '';
              weightLines.Add(SQLQuery1.FieldByName('ecode').AsString);

              //SQLQuery2.Close;
              //SQLQuery2.SQL.Text :=
              //  'select * from edges where  Relation=True and dprid= ' + dprid;
              //SQLQuery2.Open;
              //ShowMessage(GetTableAllString(SQLQuery2));

              SQLQuery1.Next;
              continue;

            end;
          end;


          SQLQuery2.Close;
          SQLQuery2.SQL.Text :=
            'insert into path (pcode,subpcode,ecode)  values (''' +
            curp + ''',''' + parentp + ''',''' + SQLQuery1.FieldByName(
            'ecode').AsString + ''')';
          SQLQuery2.ExecSQL;
          SQLQuery2.Close;
          SQLQuery2.SQL.Text :=
            'update points set status=1 where dprid=' + dprid +
            ' and pcode=''' + curp + '''';
          SQLQuery2.ExecSQL;
          SQLtemp.Close;

          SQLtemp.DataBase := self.SQLConnector1;
          SQLtemp.Transaction := self.SQLTransaction1;

          SQLtemp.SQL.Text := 'select * from edges where Relation=True and dprid= ' +
            dprid + ' and (pcode1=''' + curp + ''' or pcode2=''' +
            curp + ''') and status<>3 '; //0=NO,1=curr,2=temp is 1;3=OK,4=temp is 3
          SQLtemp.Open;
          //curp  set status=1
          //curp,来源两种。一是有向来，二是无向来，去向两种，一是有向去，二是无向去。
          //来与去，都可能同时有不止一条的。
          //来分析：两条有向来，同时到达CURP，两条有向来，未到达，
          //两条无向来，同时到达，两条无向来，未到达
          //去分析：两条有向去，是当前前线，两条有向去，对方已无路，
          //两条无向去，是当前前线，两条无向去，对方已无路
          //这才是核心算法所在，暂无法
          SQLQuery2.Close;
          SQLQuery2.SQL.Text := 'select * from edges where dprid=' + dprid + ' ';
          SQLQuery2.Open;

          if SQLtemp.RecordCount <> 0 then
          begin
            SQLtemp.First;
            while not SQLtemp.EOF do
            begin

              self.LocateTwoField(SQLQuery2, 'id', 'ecode', SQLtemp.FieldByName(
                'id').AsString, SQLtemp.FieldByName('ecode').AsString);
              getfromto(SQLtemp.FieldByName('ecode').AsString,
                SQLtemp.FieldByName('direct').AsString,
                SQLtemp.FieldByName('pcode1').AsString,
                SQLtemp.FieldByName('pcode2').AsString,
                from_P,
                to_P);

              if SQLQuery2.FieldByName('status').AsInteger = 3 then
              begin
                SQLtemp.Next;
                continue;
              end;
              if to_P = curp then
              begin
                SQLQuery2.Edit;
                SQLQuery2.FieldByName('status').AsInteger := 3;
                SQLQuery2.Post;
              end;
              if SQLQuery2.FieldByName('status').AsInteger = 1 then
              begin
                SQLQuery2.Edit;
                //if format('%f', [SQLQuery2.FieldByName('lengthDy').asfloat])='0.00' then
                SQLQuery2.FieldByName('status').AsInteger := 3;
                SQLQuery2.Post;
              end;
              if SQLQuery2.FieldByName('status').AsInteger = 0 then
              begin
                SQLQuery2.Edit;
                SQLQuery2.FieldByName('status').AsInteger := 2;
                SQLQuery2.Post;
                //P3--P4,P8--P4,同时到达，对P4运行两次P4--P5，X 形的，只能临时为2
                //同时到达一点
              end;
              //else if SQLQuery2.FieldByName('status').AsInteger = 1 then
              begin
                //SQLQuery2.Edit;
                //SQLQuery2.FieldByName('status').AsInteger := 4;
                //SQLQuery2.Post;
              end;
              if from_P <> '' then
                if pos('P', from_P) <= 0 then //同时到达两点
                begin
                  SQLQuery2.Edit;
                  SQLQuery2.FieldByName('status').AsInteger := 3;
                  SQLQuery2.Post;

                end;
              SQLtemp.Next;
            end;
            SQLQuery2.ApplyUpdates();
          end;
          SQLQuery1.Next;
        end;

      end; //while 1=1 do
      //SQLQuery2.ApplyUpdates();
      SQLQuery2.Close;
      SQLQuery2.SQL.Text := 'update points set status=2 where dprid=' +
        dprid + ' and status=1';
      SQLQuery2.ExecSQL;
      //这里UPDATE后，再有相同路径长时，也会不理了。所以不用下面DELETE了。//相同长度者，只取第一个，否则一个树形列表又烦也。

      SQLQuery2.SQL.Text :=
        'update edges set status=3 where  abs(lengthDy)<0.01 and dprid=' +
        dprid + ' and Relation=True and status=1';
      SQLQuery2.ExecSQL;

      SQLQuery2.Close;
      SQLQuery2.SQL.Text := 'update edges set status=1 where dprid=' +
        dprid + ' and status=2';
      SQLQuery2.ExecSQL;

    end;
    //self.tag := StrToInt(self.hint);
    weightPoints.Free;
    weightLines.Free;

    //SQLQuery2.Close;
    //SQLQuery2.SQL.Text := 'select * from path ';
    //SQLQuery2.Open;
    //ShowMessage(GetTableAllString(SQLQuery2));
    ////self.SQLTransaction1.Commit;
    ////SQLTransaction1.Active := True;
  end;//直接测试读取path表，两条或以上路径时
  ShowMessage('燃线法权重算法OK');

  //燃线法权重算法，内含直接读path表，显示结果
  if RadioBtn_input.Checked then   //RadioBtn_input
    truelength := 'length'
  else  //RadioBtn_calc
    truelength := 'lengthCal';

  path := '';
  alllength := 0;
  ResultPathEdgesRed.Clear;
  AllPath.Clear;
  AllPath_.Clear;
  tempList.Clear;
  //AllTree(endp, endp);
  AllTree(endp, '', self.SQLConnector1, self.SQLTransaction1);
  //NewString := '总长度：' + format('%f', [alllength]) + #10#13 + '路径如下：(共' +
  //  inttostr(AllPath.Count) + '条最短路径)';
  //原来PATH表中，是由pcode指向subcode，如果想由subcode指向pcode,测试不行，这未知如何改动
  alllength := 0;
  NewString := '';
  onelength := 0;
  oneline := '';
  ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := AllPath.Count;
  ProgressBar1.Position := 0;
  kkk := 0;
  //showmessage(AllPath.text);
  for iii := 0 to AllPath.Count - 1 do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    tempList.Clear;
    tempList.Delimiter := ',';
    tempList.DelimitedText := AllPath[iii];
    onepath := '';
    oneline := '';
    onep := '';
    twop := '';
    onelength := 0;
    pstr := '';
    lstr := '';
    calstr := '';
    for jjj := tempList.Count - 1 downto 0 do
    begin
      onep := tempList[jjj];
      if onep = '' then
        continue; //此BUG又烦人
      SQLQuery3.Close;
      SQLQuery3.SQL.Text :=
        'select *  from points  where dprid=' + dprid + ' and pcode="' +
        onep + '"';
      SQLQuery3.Open;
      onelength := onelength + SQLQuery3.FieldByName('weightPoint').AsFloat;
      NewString := NewString + #13#10 + '点：' + onep + '：    权重：' +
        SQLQuery3.FieldByName('weightPoint').AsString;
      if calstr = '' then
        calstr := SQLQuery3.FieldByName('weightPoint').AsString
      else
        calstr := calstr + '+' + SQLQuery3.FieldByName('weightPoint').AsString;
      onepname := SQLQuery3.FieldByName('pname').AsString;
      if onepath = '' then
        onepath := onepname
      else
        onepath := onepath + '-->' + onepname;
      if oneline = '' then
        oneline := onep
      else
        oneline := oneline + ',' + onep;
      if twop = '' then
        twop := onep
      else
      begin
        onep := stringreplace(onep, 'P', '', []);
        twop := stringreplace(twop, 'P', '', []);
        if StrToInt(onep) > StrToInt(twop) then
          oneedge := 'P' + twop + 'P' + onep //+'E'
        else
          oneedge := 'P' + onep + 'P' + twop {+'E'};

        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
        bpoint.x := getPcode('P' + onep).Left + (getPcode('P' + onep).Width div 2);
        bpoint.y := getPcode('P' + onep).top + (getPcode('P' + onep).Height div 2);
        epoint.x := getPcode('P' + twop).Left + (getPcode('P' + twop).Width div 2);
        epoint.y := getPcode('P' + twop).top + (getPcode('P' + twop).Height div 2);
        self.ScrollBox1.Canvas.Line(bpoint, epoint);

        ResultPathEdgesRed.Add('P' + twop + 'P' + onep);
        ResultPathEdgesRed.Add('P' + onep + 'P' + twop);



        SQLQuery2.Close;
        SQLQuery2.SQL.Text :=
          'select *,' + truelength +
          '*weightLine  as len from edges as e where e.ecode=''' +
          oneedge + ''' and dprid=' + dprid;
        SQLQuery2.Open;

        onelength := onelength + SQLQuery2.FieldByName('len').AsFloat;
        NewString := NewString + #13#10 + '边：' + SQLQuery2.FieldByName(
          'ecode').AsString + '：边长：' + SQLQuery2.FieldByName(
          truelength).AsString + '  权重：' + SQLQuery2.FieldByName(
          'weightLine').AsString;
        if calstr = '' then
          calstr := SQLQuery2.FieldByName(truelength).AsString + '*' +
            SQLQuery2.FieldByName('weightLine').AsString
        else
          calstr := calstr + '+' + SQLQuery2.FieldByName(truelength).AsString +
            '*' + SQLQuery2.FieldByName('weightLine').AsString;
        twop := 'P' + onep;
      end;
    end; // onelength := 'OK';

    SQLQuery2.Close;
    SQLQuery2.SQL.Text :=
      'select (' + calstr + ') as calstr  from points  where pcode="P1" and dprid='
      + dprid;
    SQLQuery2.Open;


    //NewString := NewString + #13#10 + 'NO.'+inttostr(iii+1) + ' : ' + AllPath[iii];
    NewString := NewString + #13#10 + '算式：' + calstr + '=' +
      SQLQuery2.FieldByName('calstr').AsString + #13#10 + 'NO.' +
      IntToStr(iii + 1) + ' : ' + onepath + '   路径长度：' + floattostr(onelength);
    if iii < (AllPath.Count - 1) then
      NewString := NewString + #13#10 + '------------------------------------';
    alllength := alllength + onelength;
  end;
  NewString := '"燃线法权重算法"总长度：' + format('%f', [alllength]) +
    #13#10 + '路径如下：(共' + IntToStr(AllPath.Count) +
    '条最短路径)' + #13#10 + '------------------------------------' + NewString;
  ProgressBar1.Visible := False;
  showPathTree.PathTreeshow.initshow(NewString);

  //直接测试读取path表，两条或以上路径时
  //"燃线法权重算法"总长度：3374.98
  //  "燃线法权重算法"总长度：3115.44
  //路径如下：(共2条最短路径)
  //------------------------------------
  //点：P1：    权重：11
  //点：P4：    权重：1
  //边：P1P4：边长：367.21  权重：3.33
  //点：P7：    权重：1
  //边：P4P7：边长：321.91  权重：1
  //算式：11+1+367.21*3.33+1+321.91*1=1557.7193
  //NO.1 : P1-->P4-->P7   路径长度：1557.7193
  //------------------------------------
  //点：P1：    权重：11
  //点：P3：    权重：833.1993
  //边：P1P3：边长：176.23  权重：2
  //点：P19：    权重：1
  //边：P3P19：边长：85  权重：1
  //点：P6：    权重：1
  //边：P6P19：边长：65  权重：1
  //点：P7：    权重：1
  //边：P6P7：边长：208.06  权重：1
  //算式：11+833.1993+176.23*2+1+85*1+1+65*1+1+208.06*1=1557.7193
  //NO.2 : P1-->P3-->P19-->P6-->P7   路径长度：1557.7193


  //BEGIN TRANSACTION;
  //CREATE TABLE IF NOT EXISTS "path" (
  //  "id"  INTEGER,
  //  "pcode"  TEXT,
  //  "subpcode"  TEXT,
  //  "ecode"  TEXT,
  //  PRIMARY KEY("id")
  //);
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (1,'P3','P1','P1P3');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (2,'P19','P3','P3P19');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (3,'P6','P19','P6P19');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (4,'P2','P3','P2P3');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (5,'P8','P3','P3P8');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (6,'P9','P3','P3P9');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (7,'P7','P6','P6P7');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (8,'P6','P4','P4P6');
  //INSERT INTO "path" ("id","pcode","subpcode","ecode") VALUES (9,'P4','P1','P1P4');
  //COMMIT;
end;



function TMain.SPFA(): integer;
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
  ado: TSQLQuery;
  s: string;
  i: integer;
begin
  //if not (SQLQuery1.UpdateStatus  in [usUnmodified]) then   SQLQuery1.applyupdates();
  //算法二，SPFA，测试OK，无0环无负环下已OK
  //注意，SPFA，负边不可以双向或无向，一定要单向！！！
  self.btn_run.Tag := 0;
  SQLTransaction1.Active := True;



  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';  //access have * ,sql have no *
  SQLQuery1.ExecSQL;




  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xp ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp ';
  SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := GetRecordCount(SQLQuery2);
  ProgressBar1.Position := 0;




  while not SQLQuery2.EOF do
  begin
    if ((pos('双向', SQLQuery2.FieldByName('direct').AsString) > 0) or
      (pos('无', SQLQuery2.FieldByName('direct').AsString) > 0)) then
      // if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    begin //这个常为空，草

    end;
    if (pos('序号从小指向大', SQLQuery2.FieldByName('direct').AsString) > 0) then
      //if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if (pos('序号从大指向小', SQLQuery2.FieldByName(
        'direct').AsString) > 0) then
        //if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;

  //if not (SQLQuery1.UpdateStatus  in [usUnmodified]) then
  SQLQuery1.ApplyUpdates();

  SQLQuery2.Close;          //int  trunc
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=trunc(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp ';
  SQLQuery2.Open;
  PCount := GetRecordCount(SQLQuery2);

  ///这里有BUG，应是连通子图中的点数，不是全局点数！！！

  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges where dprid= ' + dprid + ' order by id';
  SQLQuery3.Open;
  SQLQuery1.Close; //select p.pcode,0,0  OOKK
  SQLQuery1.SQL.Text := 'select * from xp order by id';
  SQLQuery1.Open;

  //SQLQuery1.Append;
  //SQLQuery1.FieldByName('pcode').AsString := beginp;
  //SQLQuery1.FieldByName('llong').AsInteger := 0;
  //SQLQuery1.Post;
  //TOPid := SQLQuery1.FieldByName('id').AsInteger;

  //SQLtemp.Close;
  //SQLtemp.SQL.Text := 'update xpp set LLong=0,CCount=1 '
  //  + '  where pcode=''' + beginp + ''' ';
  //SQLtemp.ExecSQL;
  //SQLQuery2.Locate('pcode', beginp, []);
  self.LocateOneField(SQLQuery2, 'pcode', beginp);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.Post;

  //if not (SQLQuery2.UpdateStatus in [usUnmodified]) then
  SQLQuery2.ApplyUpdates();

  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  while not SQLtemp.EOF do
  begin
    SQLQuery1.Append;
    curp := SQLtemp.FieldByName('pb').AsString;
    SQLQuery1.FieldByName('pcode').AsString := curp;
    // SQLQuery1.FieldByName('llong').AsInteger := getLong(pa,pb);
    //SQLQuery2.Locate('pcode', curp, []);
    self.LocateOneField(SQLQuery2, 'pcode', curp);
    SQLQuery2.Edit;
    SQLQuery2.FieldByName('llong').AsInteger := getLong(beginp, curp);
    SQLQuery2.FieldByName('CCount').AsInteger := 1;
    SQLQuery2.Post;
    SQLQuery1.Post;

    SQLtemp.Next;
  end;
  //if not (SQLQuery1.UpdateStatus in [usUnmodified]) then
  SQLQuery1.ApplyUpdates();
  //if not (SQLQuery2.UpdateStatus in [usUnmodified]) then
  SQLQuery2.ApplyUpdates();
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    SQLQuery1.First;
    if SQLQuery1.RecordCount = 0 then
      break;
    curpa := SQLQuery1.FieldByName('pcode').AsString;
    //SQLQuery2.Locate('pcode', curpa, []);
    self.LocateOneField(SQLQuery2, 'pcode', curpa);
    curalong := SQLQuery2.FieldByName('llong').AsInteger;
    SQLtemp.Close;
    SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
      curpa + ''' ';
    SQLtemp.Open;
    SQLtemp.First;
    while not SQLtemp.EOF do
    begin

      curpb := SQLtemp.FieldByName('pb').AsString;
      //if ((curpa='P8') and  (curpb='P17')) then
      //application.ProcessMessages;
      curblong := getLong(curpa, curpb);
      // SQLQuery1.FieldByName('llong').AsInteger := getLong(pa,pb);
      //SQLQuery2.Locate('pcode', curpb, []);
      self.LocateOneField(SQLQuery2, 'pcode', curpb);
      if SQLQuery2.FieldByName('llong').IsNull then
      begin
        SQLQuery2.Edit;
        SQLQuery2.FieldByName('llong').AsInteger := curalong + curblong;
        SQLQuery2.FieldByName('CCount').AsInteger := 1;
        SQLQuery2.Post;
        //if not SQLQuery1.Locate('pcode', curpb, []) then
        if self.LocateOneField(SQLQuery1, 'pcode', curpb) = 0 then
        begin
          SQLQuery1.Append;
          SQLQuery1.FieldByName('pcode').AsString := curpb;
          SQLQuery1.Post;
        end;
      end
      else
      begin
        if (curalong + curblong) < SQLQuery2.FieldByName('llong').AsInteger then
        begin
          SQLQuery2.Edit;
          SQLQuery2.FieldByName('llong').AsInteger := curalong + curblong;
          SQLQuery2.FieldByName('CCount').AsInteger :=
            SQLQuery2.FieldByName('CCount').AsInteger + 1;
          SQLQuery2.Post;
          if SQLQuery2.FieldByName('CCount').AsInteger > PCount then
            break; //这里设断点则变青色无效，实际运行是生效的，怪
          //if not SQLQuery1.Locate('pcode', curpb, []) then
          if self.LocateOneField(SQLQuery1, 'pcode', curpb) = 0 then
          begin
            SQLQuery1.Append;
            SQLQuery1.FieldByName('pcode').AsString := curpb;
            SQLQuery1.Post;
          end;

        end;
      end;
      SQLtemp.Next;
    end;
    if SQLQuery2.FieldByName('CCount').AsInteger > PCount then
      break; //这里设断点则变青色无效，实际运行是生效的，怪
    SQLQuery1.First;
    SQLQuery1.Delete;
  end;
  //if not (SQLQuery1.UpdateStatus in [usUnmodified]) then
  SQLQuery1.ApplyUpdates();
  //if not (SQLQuery2.UpdateStatus in [usUnmodified]) then
  SQLQuery2.ApplyUpdates();

  DistForPathTable(SQLQuery2, 'llong');
  //标准的SPFA算法，已实现OK，但是不可以0环或负环的。
  //TEST
  if isdebug = 0 then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp_inner ';
    SQLQuery1.ExecSQL;
  end;
  //标准的SPFA算法，已实现OK，但是不可以0环或负环的。
end;

function TMain.SPFA_Points: integer;
  // //如果负边指定方向，此法也似是对的！
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  ////证实此法求出来的最短路径逻辑上是错的。
  /// //如果负边指定方向，此法也似是对的！
  self.Button11.Tag := 0;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xp ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp_Li ';
  SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  while not SQLQuery2.EOF do
  begin

    if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    begin //这个常为空，草

    end;
    if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=Int(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp_Li(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp_Li order by id';
  SQLQuery2.Open;
  PCount := GetRecordCount(SQLQuery2);
  ///这里有BUG，应是连通子图中的点数，不是全局点数！！！
  ///连通后就计算子图点数，不能先delete.
  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges where dprid= ' + dprid + ' order by id';
  SQLQuery3.Open;
  SQLQuery1.Close; //select p.pcode,0,0  OOKK
  SQLQuery1.SQL.Text := 'select * from xp order by id';
  SQLQuery1.Open;

  SQLQuery2.Locate('pcode', beginp, []);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.FieldByName('AllPoints').AsString := beginp;
  SQLQuery2.Post;
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  while not SQLtemp.EOF do
  begin
    SQLQuery1.Append;
    curp := SQLtemp.FieldByName('pb').AsString;
    SQLQuery1.FieldByName('pcode').AsString := curp;
    // SQLQuery1.FieldByName('llong').AsInteger := getLong(pa,pb);
    SQLQuery2.Locate('pcode', curp, []);
    SQLQuery2.Edit;
    SQLQuery2.FieldByName('llong').AsInteger := getLong(beginp, curp);
    SQLQuery2.FieldByName('CCount').AsInteger := 1;
    SQLQuery2.FieldByName('AllPoints').AsString := beginp + ',' + curp;
    SQLQuery2.Post;
    SQLQuery1.Post;

    SQLtemp.Next;
  end;
  //SQLQuery1.Locate('id',topid,[]);
  //SQLQuery1.Next;
  //TOPid := SQLQuery1.FieldByName('id').AsInteger;
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    SQLQuery1.First;
    if SQLQuery1.RecordCount = 0 then
      break;
    curpa := SQLQuery1.FieldByName('pcode').AsString;
    SQLQuery2.Locate('pcode', curpa, []);
    curalong := SQLQuery2.FieldByName('llong').AsInteger;
    PPP.Values['SPFA_points_AllPoints_curpa'] :=
      SQLQuery2.FieldByName('AllPoints').AsString;
    SQLtemp.Close;
    SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
      curpa + ''' ';
    SQLtemp.Open;
    SQLtemp.First;
    while not SQLtemp.EOF do
    begin

      curpb := SQLtemp.FieldByName('pb').AsString;
      //if ((curpa='P8') and  (curpb='P17')) then
      //application.ProcessMessages;
      curblong := getLong(curpa, curpb);
      // SQLQuery1.FieldByName('llong').AsInteger := getLong(pa,pb);
      SQLQuery2.Locate('pcode', curpb, []);
      if SQLQuery2.FieldByName('llong').IsNull then
      begin
        SQLQuery2.Edit;
        SQLQuery2.FieldByName('llong').AsInteger := curalong + curblong;
        SQLQuery2.FieldByName('CCount').AsInteger := 1;
        SQLQuery2.FieldByName('AllPoints').AsString :=
          PPP.Values['SPFA_points_AllPoints_curpa'] + ',' + curpb;
        SQLQuery2.Post;
        if not SQLQuery1.Locate('pcode', curpb, []) then
        begin
          SQLQuery1.Append;
          SQLQuery1.FieldByName('pcode').AsString := curpb;
          SQLQuery1.Post;
        end;
      end
      else
      begin
        if (curalong + curblong) < SQLQuery2.FieldByName('llong').AsInteger then
        begin
          if pos(',' + curpb + ',', ',' + PPP.Values['SPFA_points_AllPoints_curpa'] +
            ',') <= 0 then
          begin
            SQLQuery2.Edit;
            SQLQuery2.FieldByName('llong').AsInteger := curalong + curblong;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              PPP.Values['SPFA_points_AllPoints_curpa'] + ',' + curpb;
            SQLQuery2.FieldByName('CCount').AsInteger :=
              SQLQuery2.FieldByName('CCount').AsInteger + 1;
            SQLQuery2.Post;
            if SQLQuery2.FieldByName('CCount').AsInteger > PCount then
              break; //这里设断点则变青色无效，实际运行是生效的，怪
            if not SQLQuery1.Locate('pcode', curpb, []) then
            begin
              SQLQuery1.Append;
              SQLQuery1.FieldByName('pcode').AsString := curpb;
              SQLQuery1.Post;
            end;
          end;
        end;
      end;
      SQLtemp.Next;
    end;
    if SQLQuery2.FieldByName('CCount').AsInteger > PCount then
      break; //这里设断点则变青色无效，实际运行是生效的，怪
    SQLQuery1.First;
    SQLQuery1.Delete;
  end;
  DistForPathTable(SQLQuery2, 'llong');
  //标准的SPFA算法，已实现OK，但是不可以0环或负环的。
  //TEST
  if isdebug = 0 then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp_inner ';
    SQLQuery1.ExecSQL;
  end;
  //标准的SPFA算法，已实现OK，但是不可以0环或负环的。
end;

function TMain.SPFA_Edges: integer;
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  ////
  /// //如果负边指定方向，此法也似是对的！
  self.Button11.Tag := 0;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xp ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp_Li ';
  SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  while not SQLQuery2.EOF do
  begin

    if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    begin //这个常为空，草

    end;
    if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=Int(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp_Li(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp_Li order by id';
  SQLQuery2.Open;
  PCount := GetRecordCount(SQLQuery2);
  ///这里有BUG，应是连通子图中的点数，不是全局点数！！！
  ///连通后就计算子图点数，不能先delete.
  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges where dprid= ' + dprid + ' order by id';
  SQLQuery3.Open;
  SQLQuery1.Close; //select p.pcode,0,0  OOKK
  SQLQuery1.SQL.Text := 'select * from xp order by id';
  SQLQuery1.Open;

  SQLQuery2.Locate('pcode', beginp, []);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.FieldByName('AllPoints').AsString := beginp;
  SQLQuery2.FieldByName('AllEdges').AsString := '';
  SQLQuery2.Post;
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  while not SQLtemp.EOF do
  begin
    SQLQuery1.Append;
    curp := SQLtemp.FieldByName('pb').AsString;
    SQLQuery1.FieldByName('pcode').AsString := curp;
    // SQLQuery1.FieldByName('llong').AsInteger := getLong(pa,pb);
    SQLQuery2.Locate('pcode', curp, []);
    SQLQuery2.Edit;
    SQLQuery2.FieldByName('dist').AsInteger := getLong(beginp, curp);
    SQLQuery2.FieldByName('CCount').AsInteger := 1;
    SQLQuery2.FieldByName('AllPoints').AsString := beginp + ',' + curp;
    SQLQuery2.FieldByName('AllEdges').AsString := getECode(beginp, curp);
    SQLQuery2.Post;
    SQLQuery1.Post;

    SQLtemp.Next;
  end;
  //SQLQuery1.Locate('id',topid,[]);
  //SQLQuery1.Next;
  //TOPid := SQLQuery1.FieldByName('id').AsInteger;
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    SQLQuery1.First;
    if SQLQuery1.RecordCount = 0 then
      break;
    curpa := SQLQuery1.FieldByName('pcode').AsString;
    //if 1=2 then //按理，终点也可重复，应更小值 ，实测更大，设终点不可以重复，才可以。
    //起点一样不可重复？否？
    if curpa = endp then
    begin
      SQLQuery1.First;
      SQLQuery1.Delete;
      continue;
    end;
    SQLQuery2.Locate('pcode', curpa, []);
    curalong := SQLQuery2.FieldByName('dist').AsInteger;
    PPP.Values['SPFA_points_AllPoints_curpa'] :=
      SQLQuery2.FieldByName('AllPoints').AsString;
    PPP.Values['SPFA_points_AllEdges_curpa'] :=
      SQLQuery2.FieldByName('AllEdges').AsString;
    SQLtemp.Close;
    SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
      curpa + ''' ';
    SQLtemp.Open;
    SQLtemp.First;
    while not SQLtemp.EOF do
    begin

      curpb := SQLtemp.FieldByName('pb').AsString;
      //if ((curpa='P8') and  (curpb='P17')) then
      //application.ProcessMessages;
      curblong := getLong(curpa, curpb);
      // SQLQuery1.FieldByName('llong').AsInteger := getLong(pa,pb);
      SQLQuery2.Locate('pcode', curpb, []);
      if SQLQuery2.FieldByName('dist').IsNull then
      begin
        SQLQuery2.Edit;
        SQLQuery2.FieldByName('dist').AsInteger := curalong + curblong;
        SQLQuery2.FieldByName('CCount').AsInteger := 1;
        SQLQuery2.FieldByName('AllPoints').AsString :=
          PPP.Values['SPFA_points_AllPoints_curpa'] + ',' + curpb;
        SQLQuery2.FieldByName('AllEdges').AsString :=
          PPP.Values['SPFA_points_AllEdges_curpa'] + ',' + getEcode(curpa, curpb);
        SQLQuery2.Post;
        if not SQLQuery1.Locate('pcode', curpb, []) then
        begin
          SQLQuery1.Append;
          SQLQuery1.FieldByName('pcode').AsString := curpb;
          SQLQuery1.Post;
        end;
      end
      else
      begin
        if (curalong + curblong) < SQLQuery2.FieldByName('dist').AsInteger then
        begin
          if pos(',' + getEcode(curpa, curpb) + ',', ',' +
            PPP.Values['SPFA_points_AllEdges_curpa'] + ',') <= 0 then
          begin
            SQLQuery2.Edit;
            SQLQuery2.FieldByName('dist').AsInteger := curalong + curblong;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              PPP.Values['SPFA_points_AllPoints_curpa'] + ',' + curpb;
            SQLQuery2.FieldByName('AllEdges').AsString :=
              PPP.Values['SPFA_points_AllEdges_curpa'] + ',' + getEcode(curpa, curpb);
            SQLQuery2.FieldByName('CCount').AsInteger :=
              SQLQuery2.FieldByName('CCount').AsInteger + 1;
            SQLQuery2.Post;
            if SQLQuery2.FieldByName('CCount').AsInteger > PCount then
              break; //这里设断点则变青色无效，实际运行是生效的，怪
            if not SQLQuery1.Locate('pcode', curpb, []) then
            begin
              SQLQuery1.Append;
              SQLQuery1.FieldByName('pcode').AsString := curpb;
              SQLQuery1.Post;
            end;
          end;
        end;
      end;
      SQLtemp.Next;
    end;
    if SQLQuery2.FieldByName('CCount').AsInteger > PCount then
      break; //这里设断点则变青色无效，实际运行是生效的，怪
    SQLQuery1.First;
    SQLQuery1.Delete;
  end;
  //DistForPathTable(SQLQuery2, 'llong');
  //标准的SPFA算法，已实现OK，但是不可以0环或负环的。
  //TEST
  if 1 = 2 then
    if isdebug = 0 then
    begin
      SQLQuery1.Close;
      SQLQuery1.SQL.Text := 'delete  from islink ';
      SQLQuery1.ExecSQL;
      SQLQuery1.Close;
      SQLQuery1.SQL.Text := 'delete  from xp ';
      SQLQuery1.ExecSQL;
      SQLQuery1.Close;
      SQLQuery1.SQL.Text := 'delete  from xpp ';
      SQLQuery1.ExecSQL;
      SQLQuery1.Close;
      SQLQuery1.SQL.Text := 'delete  from xp_inner ';
      SQLQuery1.ExecSQL;
    end;
  //标准的SPFA算法，已实现OK，但是不可以0环或负环的。
  SQLtemp.Close; //select p.pcode,0,0  OOKK
  SQLtemp.SQL.Text := 'select * from xpp_li  where pcode=''' + endp + ''' ';
  SQLtemp.Open;
  alllength := SQLtemp.FieldByName('dist').AsFloat / 100;
  alreadylength := SQLtemp.FieldByName('dist').AsFloat / 100;
  PPP.Values['LightLine_Li_002_endp_AllPoints'] :=
    SQLtemp.FieldByName('AllPoints').AsString;
end;

function TMain.DistForPathTable(distADO: TSQLQuery; distFieldName: string): integer;
var    //path表有方向，从pcode到subcode，path表从islink表来的，这表如双向则同一边有两条记录
  curpb, curpa: string;
  curalong, minlong: integer;
begin
  SQLtemp.Close; //select p.pcode,0,0  OOKK
  SQLtemp.SQL.Text := 'select * from path ';
  SQLtemp.Open;

  //curpb := endp;

  distADO.First;
  while not distADO.EOF do
  begin
    curpb := distADO.FieldByName('pcode').AsString;
    //SQLQuery2.Locate('pcode', curpb, []);
    //if curpb = 'P7' then
    //  application.ProcessMessages;
    minlong := distADO.FieldByName(distFieldName).AsInteger;
    // SQLQuery2.Locate('pcode', curpa, []);
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select  *   from islink  ' + '  where pb="' + curpb + '" ';
    //    SQLQuery1.SQL.Text := 'select  *   from islink  ' + '  where pb=''' +
    //  curpb + ''' ';
    SQLQuery1.Open;

    //'insert into path (pcode,subpcode,ecode)  values (''' + curp +
    //    ''',''' + parentp + ''',''' + SQLQuery1.FieldByName('ecode').AsString + ''')';
    SQLQuery1.First;
    while not SQLQuery1.EOF do
    begin
      curpa := SQLQuery1.FieldByName('pa').AsString;
      //distADO.Locate('pcode', curpa, []);
      LocateOneField(distADO, 'pcode', curpa);
      curalong := distADO.FieldByName(distFieldName).AsInteger;
      if (curalong + getlong(curpa, curpb)) = minlong then
      begin
        SQLtemp.Append;
        SQLtemp.FieldByName('pcode').AsString := curpb;
        SQLtemp.FieldByName('subpcode').AsString := curpa;
        SQLtemp.FieldByName('ecode').AsString := getECode(curpa, curpb);
        //getECode  no have write code
        SQLtemp.Post;
        //if not (SQLtemp.UpdateStatus  in [usUnmodified]) then
        SQLtemp.ApplyUpdates();

      end;
      SQLQuery1.Next;
    end;
    //distADO.Locate('pcode', curpb, []);
    LocateOneField(distADO, 'pcode', curpb);
    distADO.Next;
  end;


  //ShowMessage(GetTableAllString(SQLtemp));
  if 1 = 2 then   //这段代码可以将path表静态保存到sqlite3文件中
  begin
    SQLtemp.ApplyUpdates();
    self.SQLTransaction1.Commit;
    self.SQLTransaction1.Active := True;

    //InputQueryLiMemo('SPFA算法说明', s, nil);
    ShowMessage(GetTableAllString(SQLtemp));
  end;
end;


function TMain.LightLine_Li_001_relax: integer;
  // //如果负边指定方向，此法也似是对的！
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  //以下是自创的新算法，燃线法的扩展
  //此法证明是错的 ，整个边来relax，是不行的，必须流量法乎
  //AB=8,BC=3;AD=15,CD=-10;  这法会令C点无出路，DE=-10，实际A--B--C--D--E才正确。
  //如果负边指定方向，此法也似是对的！
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xp_inner ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp_li ';
  //'truncate xpp_li ';// 'delete  from xpp_li ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'alter table  xpp_li alter column [id] counter(1,1)';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges_li ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'alter table  edges_li alter column [id] counter(1,1)';
  SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  while not SQLQuery2.EOF do
  begin

    if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    begin //这个常为空，草

    end;
    if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=Int(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  //exit;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp_li(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text :=
    'insert into edges_li select e.*,e.lengthDy100 as lengthDy200,0 as CCount,0 as LLevel,null as dist from edges as e where e.Relation=True and e.dprid= ' + dprid + ' ';
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp_li order by id';
  SQLQuery2.Open; //xpp_li
  PCount := GetRecordCount(SQLQuery2);
  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
  SQLQuery3.Open; //edges_li
  // exit;

  SQLQuery2.Locate('pcode', beginp, []);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.FieldByName('AllPoints').AsString := beginp;
  SQLQuery2.FieldByName('AllEdges').AsString := '';
  SQLQuery2.FieldByName('Dist').AsInteger := 0;
  SQLQuery2.Post;
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  curpa := beginp;
  while not SQLtemp.EOF do
  begin

    curpb := SQLtemp.FieldByName('pb').AsString;
    curecode := getecode(curpa, curpb);
    SQLQuery3.Locate('ecode', curecode, []);
    SQLQuery3.Edit;
    SQLQuery3.FieldByName('LLevel').AsInteger := 1;
    SQLQuery3.FieldByName('dist').AsInteger := 0;
    SQLQuery3.Post;
    SQLtemp.Next;
  end;

  SQLQuery1.Tag := 1;
  while 1 = 1 do
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from edges_Li where LLevel=1';
    SQLQuery1.Open;

    if SQLQuery1.RecordCount <= 0 then
    begin
      break;
    end;

    //草，这里会改变要requery
    ////这里，总是分不清方向
    SQLQuery1.Tag := SQLQuery1.Tag + 1;

    begin // SQLQuery1.RecordCount>0
      SQLQuery1.First;

      while not SQLQuery1.EOF do
      begin
        //草，这里会改变要requery

        SQLQuery3.Locate('ecode', SQLQuery1.FieldByName('ecode').AsString, []);
        SQLQuery3.Edit;
        SQLQuery3.FieldByName('CCount').AsInteger := 1;
        SQLQuery3.FieldByName('LLevel').AsInteger := -1;
        SQLQuery3.Post;

        //SQLQuery3.Requery();
        SQLQuery3.Close; //select p.pcode,0,0  OOKK
        SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
        SQLQuery3.Open; //edges_li


        getfromto_Li(SQLQuery1.FieldByName('ecode').AsString,
          SQLQuery1.FieldByName('direct').AsString,
          SQLQuery1.FieldByName('pcode1').AsString,
          SQLQuery1.FieldByName('pcode2').AsString,
          from_P,
          to_P, SQLQuery1.Tag);
        if pos('P', from_P) > 0 then
        begin
          curpa := from_P;
          curpb := to_P;
        end
        else
        begin
          //showmessage('运算出错，请联系作者,QQ:165442523。');
          //abort;

        end;
        if pos('P', from_P) > 0 then
        begin
          SQLQuery2.Locate('pcode', curpa, []);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;

          SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          SQLQuery2.Tag := 0;
          //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
          begin
            //SQLQuery3.Requery();
            curlong := getlong(curpa, curpb);
            ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
            if SQLQuery2.FieldByName('Dist').IsNull then
              SQLQuery2.Tag := 1
            else
            begin
              if ppp.Values['Dist_a'] <> '' then
              begin
                if SQLQuery2.FieldByName('Dist').AsInteger >
                  StrToInt(ppp.Values['Dist_a']) + curlong then
                  SQLQuery2.Tag := 1;
                if SQLQuery2.FieldByName('Dist').AsInteger =
                  StrToInt(ppp.Values['Dist_a']) + curlong then
                  SQLQuery2.Tag := 2;
              end;
            end;
          end;

          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then

            begin
              SQLQuery2.Tag := 1;
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('AllPoints').AsString :=
                ppp.Values['AllPoints_a'] + ',' + curpb;

              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;

              SQLQuery2.FieldByName('Dist').AsInteger :=
                StrToInt(ppp.Values['Dist_a']) + curlong;
              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
          if SQLQuery2.Tag = 2 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then

            begin
              SQLQuery2.Tag := 2;
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('AllPoints').AsString :=
                SQLQuery2.FieldByName('AllPoints').AsString + ',' +
                ppp.Values['AllPoints_a'] + ',' + curpb;
              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  SQLQuery2.FieldByName('AllEdges').AsString +
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;

              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
        end;
        if pos('P', from_P) <= 0 then
        begin
          curpa := SQLQuery1.FieldByName('pcode1').AsString;
          curpb := SQLQuery1.FieldByName('pcode2').AsString;
          SQLQuery2.Locate('pcode', curpa, []);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;

          SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          SQLQuery2.Tag := 0;
          //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
          begin
            //SQLQuery3.Requery();
            curlong := getlong(curpa, curpb);
            ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
            if StrToInt(ppp.Values['Dist_b']) > StrToInt(ppp.Values['Dist_a']) +
            curlong then
              SQLQuery2.Tag := 1;
            if StrToInt(ppp.Values['Dist_b']) = StrToInt(ppp.Values['Dist_a']) +
            curlong then
              SQLQuery2.Tag := 2;
            if StrToInt(ppp.Values['Dist_a']) > StrToInt(ppp.Values['Dist_b']) +
            curlong then
            begin
              SQLQuery2.Tag := 1;
              curpa := SQLQuery1.FieldByName('pcode2').AsString;
              curpb := SQLQuery1.FieldByName('pcode1').AsString;

            end;
            if StrToInt(ppp.Values['Dist_a']) = StrToInt(ppp.Values['Dist_b']) +
            curlong then
            begin
              SQLQuery2.Tag := 2;
              curpa := SQLQuery1.FieldByName('pcode2').AsString;
              curpb := SQLQuery1.FieldByName('pcode1').AsString;

            end;
          end;
          SQLQuery2.Locate('pcode', curpa, []);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;

          SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then

            begin
              SQLQuery2.Tag := 1;
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('AllPoints').AsString :=
                ppp.Values['AllPoints_a'] + ',' + curpb;

              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;

              SQLQuery2.FieldByName('Dist').AsInteger :=
                StrToInt(ppp.Values['Dist_a']) + curlong;
              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
          if SQLQuery2.Tag = 2 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then

            begin
              SQLQuery2.Tag := 2;
              SQLQuery2.Edit;
              SQLQuery2.FieldByName('AllPoints').AsString :=
                SQLQuery2.FieldByName('AllPoints').AsString + ',' +
                ppp.Values['AllPoints_a'] + ',' + curpb;
              if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
                ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
                SQLQuery2.FieldByName('AllEdges').AsString :=
                  SQLQuery2.FieldByName('AllEdges').AsString +
                  ppp.Values['AllEdges_a'] + ',' +
                  SQLQuery1.FieldByName('ecode').AsString;

              SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
              SQLQuery2.Post;
            end;
          end;
        end;
        if SQLQuery2.Tag > 0 then
        begin ///debug 真烦

          SQLtemp.Close;
          SQLtemp.SQL.Text := 'insert into path (pcode,subpcode,ecode)  values (''' +
            curpb + ''',''' + curpa + ''',''' +
            SQLQuery1.FieldByName('ecode').AsString + ''')';
          SQLtemp.ExecSQL;
          //0环时一样死循环。

          curpaa := curpb;
          if curpaa = endp then
          begin
            SQLQuery1.Next;
            continue;
          end;
          SQLtemp.Close;
          SQLtemp.SQL.Text := 'select  pa,pb   from islink ' +
            '  where pa=''' + curpaa + ''' ';
          SQLtemp.Open;
          SQLtemp.First;
          //SQLQuery3.Requery();
          SQLQuery3.Close; //select p.pcode,0,0  OOKK
          SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
          SQLQuery3.Open; //edges_li
          SQLQuery2.Locate('pcode', curpaa, []);
          ppp.Values['AllPoints_aa'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_aa'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_aa'] := SQLQuery2.FieldByName('Dist').AsString;

          while not SQLtemp.EOF do
          begin

            curpbb := SQLtemp.FieldByName('pb').AsString;

            curecode := getecode(curpaa, curpbb);

            if pos(',' + curpbb + ',', ',' + ppp.Values['AllPoints_aa'] +
              ',') = 0 then

            begin
              //curlong := getlong(curpaa, curpbb);
              //SQLQuery3.Locate('ecode', curecode, []);
              //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
              SQLQuery2.Tag := 0;
              SQLQuery2.Locate('pcode', curpbb, []);
              if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
              begin
                curlong := getlong(curpaa, curpbb);
                if SQLQuery2.FieldByName('Dist').IsNull then
                  SQLQuery2.Tag := 1
                else
                begin
                  if ppp.Values['Dist_aa'] <> '' then
                  begin
                    if SQLQuery2.FieldByName('Dist').AsInteger >
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 1;
                    if SQLQuery2.FieldByName('Dist').AsInteger =
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 2;
                  end;
                end;
              end;

              if SQLQuery2.Tag > 0 then
              begin
                SQLQuery3.Locate('ecode', curecode, []);
                //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
                begin
                  SQLQuery3.Edit;
                  SQLQuery3.FieldByName('LLevel').AsInteger := -2;

                  //同时到达交汇于同一点时，其发出去者有为0者时

                  SQLQuery3.Post;
                end;
              end;
            end;
            SQLtemp.Next;
          end; //while not SQLtemp.Eof do
        end;
        SQLQuery1.Next;
      end; //while not SQLQuery1.Eof do
      //curpa := curpb;
    end; /// SQLQuery1.RecordCount>0
    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update  edges_Li as www set www.llevel=-1 where   www.LLevel=1 and ' +
      '(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode1)=(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode2)';
    SQLQuery1.ExecSQL; //同时到过两点时
    SQLQuery1.Close;

    //这里，使0边没有经历过就没有了
    // V型与Y型，同点到达两点与同点到达一点与同点出发。。。
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set llevel=1 where   LLevel=-2';
    SQLQuery1.ExecSQL;
    //SQLQuery3.Requery();

  end; //while 1 = 1 do
  SQLQuery2.Locate('pcode', endp, []);
  alreadylength := SQLQuery2.FieldByName('dist').AsFloat / 100;
  ShowMessage('OKOK');
  //以上是自创的新算法，燃线法的扩展
  //以下从SPFA中直接COPY来就可以用了。

  //DistForPathTable(SQLQuery2, 'dist');
  //0环时一样死循环。
  // { //TEST
  if isdebug = 0 then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp_inner ';
    SQLQuery1.ExecSQL;
  end;
  //}
end;

function TMain.LightLine_Li_001_flow: integer;
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: real;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
begin
  //以下是自创的新算法，燃线法的扩展
  //此法测试时总是对的，但理论上未能证明，会不会有时出错未定。
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from path ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xp_inner ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from xpp_li ';
  //'truncate xpp_li ';// 'delete * from xpp_li ';
  SQLQuery1.ExecSQL;
  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'alter table  xpp_li alter column [id] counter(1,1)';
  //SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges_li ';
  SQLQuery1.ExecSQL;
  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text := 'alter table  edges_li alter column [id] counter(1,1)';
  //SQLQuery1.ExecSQL;
  curp := beginp;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  while not SQLQuery2.EOF do
  begin

    //if SQLQuery2.FieldByName('direct').AsString = '双向或者无方向<-->' then
    //begin //这个常为空，草

    //end;
    if pos('序号从小指向大', SQLQuery2.FieldByName('direct').AsString) > 0 then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      if pos('序号从大指向小', SQLQuery2.FieldByName('direct').AsString) > 0 then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  SQLQuery1.ApplyUpdates();
  //showmessage(GetTableAllString(SQLQuery1));
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'update edges set lengthDy100=trunc(Round(lengthDy*100))' +
    '  where Relation=True and dprid=' + dprid;

  SQLQuery2.ExecSQL;
  //exit;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text :=
    'insert into xpp_li(pcode,LLong,CCount) select p.pcode,null,0 from points as p where p.dprid= '
    + dprid + '';
  //怪，为何这句SQL无结果？？？草，原来null可OK，NULL不可OK                          //select p.pcode,NULL,0   NONO  //select p.pcode,null,0   OOKK
  SQLQuery2.ExecSQL;

  SQLQuery2.Close;
  SQLQuery2.SQL.Text :=
    'insert into edges_li select e.*,e.lengthDy100 as lengthDy200,0 as CCount,0 as LLevel,null as dist from edges as e where e.Relation=True and e.dprid= ' + dprid + ' ';
  SQLQuery2.ExecSQL;
  SQLQuery2.Close; //select p.pcode,0,0  OOKK
  SQLQuery2.SQL.Text := 'select * from xpp_li order by id';
  SQLQuery2.Open; //xpp_li
  PCount := GetRecordCount(SQLQuery2);
  //showmessage(GetTableAllString(SQLQuery2));
  SQLQuery3.Close; //select p.pcode,0,0  OOKK
  SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
  SQLQuery3.Open; //edges_li
  //showmessage(GetTableAllString(SQLQuery3));
  // exit;
  LocateOneField(SQLQuery2, 'pcode', beginp);
  //SQLQuery2.Locate('pcode', beginp, []);
  SQLQuery2.Edit;
  SQLQuery2.FieldByName('llong').AsInteger := 0;
  SQLQuery2.FieldByName('CCount').AsInteger := 1;
  SQLQuery2.FieldByName('AllPoints').AsString := beginp;
  SQLQuery2.FieldByName('AllEdges').AsString := '';
  SQLQuery2.FieldByName('Dist').AsInteger := 0;
  SQLQuery2.Post;
  SQLQuery2.ApplyUpdates();
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select  pa,pb   from islink ' + '  where pa=''' +
    beginp + ''' ';
  SQLtemp.Open;
  SQLtemp.First;
  curpa := beginp;
  while not SQLtemp.EOF do
  begin

    curpb := SQLtemp.FieldByName('pb').AsString;
    curecode := getecode(curpa, curpb);
    //SQLQuery3.Locate('ecode', curecode, []);
    LocateOneField(SQLQuery3, 'ecode', curecode);
    SQLQuery3.Edit;
    SQLQuery3.FieldByName('LLevel').AsInteger := 1;
    SQLQuery3.FieldByName('dist').AsInteger := 0;
    SQLQuery3.Post;
    SQLtemp.Next;
  end;
  SQLQuery3.ApplyUpdates();
  //showmessage(GetTableAllString(SQLQuery3));
  SQLQuery1.Tag := 1;
  while 1 = 1 do
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select min(lengthDy200) as www from edges_Li where LLevel=1';
    SQLQuery1.Open;


    mind := SQLQuery1.FieldByName('www').AsString;
    //if ((mind = '') or (mind = '0')) then
    if ((mind = '')) then
    begin
      //   self.Tag := -1;
      break;
    end;
    minlong := SQLQuery1.FieldByName('www').AsInteger;
    //怪。debug时，minlong显示为0
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set lengthDy200=lengthDy200-' +
      mind + ' where LLevel=1';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set dist=dist+' + mind +
      ' where LLevel=1';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from  edges_Li where  lengthDy200=0 and LLevel=1';
    SQLQuery1.Open;
    // SQLQuery3.Requery();
    SQLQuery3.Close; //select p.pcode,0,0  OOKK
    SQLQuery3.SQL.Text := 'select * from edges_li  order by id';
    SQLQuery3.Open; //edges_li
    //showmessage(GetTableAllString(SQLQuery3));
    //草，这里会改变要requery
    ////这里，总是分不清方向
    SQLQuery1.Tag := SQLQuery1.Tag + 1;
    if GetRecordCount(SQLQuery1) <= 0 then
    begin
      //self.Tag := -1;
      break;
    end
    else
    begin // SQLQuery1.RecordCount>0
      SQLQuery1.First;

      while not SQLQuery1.EOF do
      begin
        //草，这里会改变要requery
        LocateOneField(SQLQuery3, 'ecode', SQLQuery1.FieldByName('ecode').AsString);
        //SQLQuery3.Locate('ecode', SQLQuery1.FieldByName('ecode').AsString, []);
        SQLQuery3.Edit;
        SQLQuery3.FieldByName('CCount').AsInteger := 1;
        SQLQuery3.FieldByName('LLevel').AsInteger := -1;
        //SQLQuery1.FieldByName('Dist').AsInteger := SQLQuery1.FieldByName('Dist').AsInteger +
        //  minlong;
        SQLQuery3.Post;

        //SQLQuery3.Requery();
        getfromto_Li(SQLQuery1.FieldByName('ecode').AsString,
          SQLQuery1.FieldByName('direct').AsString,
          SQLQuery1.FieldByName('pcode1').AsString,
          SQLQuery1.FieldByName('pcode2').AsString,
          from_P,
          to_P, SQLQuery1.Tag);
        if pos('P', from_P) > 0 then
        begin
          curpa := from_P;
          curpb := to_P;
        end
        else
        begin

        end;
        if pos('P', from_P) > 0 then
        begin
          //SQLQuery2.Locate('pcode', curpa, []);
          LocateOneField(SQLQuery2, 'pcode', curpa);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;
          LocateOneField(SQLQuery2, 'pcode', curpb);
          //SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          SQLQuery2.Tag := 0;
          //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
          begin
            //SQLQuery3.Requery();
            curlong := getlong(curpa, curpb);
            ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
            if SQLQuery2.FieldByName('Dist').IsNull then
              SQLQuery2.Tag := 1
            else
            begin
              if ppp.Values['Dist_a'] <> '' then
              begin
                if SQLQuery2.FieldByName('Dist').AsInteger >
                  StrToInt(ppp.Values['Dist_a']) + curlong then
                  SQLQuery2.Tag := 1;
                if SQLQuery2.FieldByName('Dist').AsInteger =
                  StrToInt(ppp.Values['Dist_a']) + curlong then
                  SQLQuery2.Tag := 2;
              end;
            end;
          end;

          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then
            begin
              SQLQuery2.Tag := 1;
            end;
          end;
          if SQLQuery2.Tag = 2 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then
            begin
              SQLQuery2.Tag := 2;
            end;
          end;
          if SQLQuery2.Tag > 0 then
          begin

          end;
          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Edit;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              ppp.Values['AllPoints_a'] + ',' + curpb;

            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' +
                SQLQuery1.FieldByName('ecode').AsString;

            SQLQuery2.FieldByName('Dist').AsInteger :=
              StrToInt(ppp.Values['Dist_a']) + curlong;
            SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
            SQLQuery2.Post;

          end;
          if SQLQuery2.Tag = 2 then
          begin

            SQLQuery2.Edit;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              SQLQuery2.FieldByName('AllPoints').AsString + ',' +
              ppp.Values['AllPoints_a'] + ',' + curpb;
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
              SQLQuery2.FieldByName('AllEdges').AsString :=
                SQLQuery2.FieldByName('AllEdges').AsString +
                ppp.Values['AllEdges_a'] + ',' +
                SQLQuery1.FieldByName('ecode').AsString;

            //SQLQuery2.FieldByName('Dist').AsInteger := strtoint(ppp.Values['Dist_a']) +
            //  curlong;
            SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
            SQLQuery2.Post;

          end;
        end;
        if pos('P', from_P) <= 0 then
        begin
          curpa := SQLQuery1.FieldByName('pcode1').AsString;
          curpb := SQLQuery1.FieldByName('pcode2').AsString;
          //SQLQuery2.Locate('pcode', curpa, []);
          LocateOneField(SQLQuery2, 'pcode', curpa);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;
          LocateOneField(SQLQuery2, 'pcode', curpb);
          //SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          SQLQuery2.Tag := 0;
          //if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
          begin
            //SQLQuery3.Requery();
            curlong := getlong(curpa, curpb);
            ////发现BUG了，这是负边时会出错了。但负边不允许双向则无事
            if StrToInt(ppp.Values['Dist_b']) > StrToInt(ppp.Values['Dist_a']) +
            curlong then
              SQLQuery2.Tag := 1;
            if StrToInt(ppp.Values['Dist_b']) = StrToInt(ppp.Values['Dist_a']) +
            curlong then
              SQLQuery2.Tag := 2;
            if StrToInt(ppp.Values['Dist_a']) > StrToInt(ppp.Values['Dist_b']) +
            curlong then
            begin
              SQLQuery2.Tag := 1;
              curpa := SQLQuery1.FieldByName('pcode2').AsString;
              curpb := SQLQuery1.FieldByName('pcode1').AsString;

            end;
            if StrToInt(ppp.Values['Dist_a']) = StrToInt(ppp.Values['Dist_b']) +
            curlong then
            begin
              SQLQuery2.Tag := 2;
              curpa := SQLQuery1.FieldByName('pcode2').AsString;
              curpb := SQLQuery1.FieldByName('pcode1').AsString;

            end;
          end;
          //SQLQuery2.Locate('pcode', curpa, []);
          LocateOneField(SQLQuery2, 'pcode', curpa);
          ppp.Values['AllPoints_a'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_a'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_a'] := SQLQuery2.FieldByName('Dist').AsString;
          LocateOneField(SQLQuery2, 'pcode', curpb);
          //SQLQuery2.Locate('pcode', curpb, []);
          ppp.Values['AllPoints_b'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_b'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_b'] := SQLQuery2.FieldByName('Dist').AsString;
          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then
            begin
              SQLQuery2.Tag := 1;
            end;
          end;
          if SQLQuery2.Tag = 2 then
          begin
            SQLQuery2.Tag := 0;
            if pos(',' + curpb + ',', ',' + ppp.Values['AllPoints_a'] +
              ',') = 0 then
            begin
              SQLQuery2.Tag := 2;
            end;
          end;
          if SQLQuery2.Tag > 0 then
          begin

          end;
          if SQLQuery2.Tag = 1 then
          begin
            SQLQuery2.Edit;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              ppp.Values['AllPoints_a'] + ',' + curpb;

            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
              SQLQuery2.FieldByName('AllEdges').AsString :=
                ppp.Values['AllEdges_a'] + ',' +
                SQLQuery1.FieldByName('ecode').AsString;

            SQLQuery2.FieldByName('Dist').AsInteger :=
              StrToInt(ppp.Values['Dist_a']) + curlong;
            SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
            SQLQuery2.Post;

          end;
          if SQLQuery2.Tag = 2 then
          begin

            SQLQuery2.Edit;
            SQLQuery2.FieldByName('AllPoints').AsString :=
              SQLQuery2.FieldByName('AllPoints').AsString + ',' +
              ppp.Values['AllPoints_a'] + ',' + curpb;
            if pos(',' + SQLQuery1.FieldByName('ecode').AsString +
              ',', ',' + ppp.Values['AllEdges_a'] + ',') = 0 then
              SQLQuery2.FieldByName('AllEdges').AsString :=
                SQLQuery2.FieldByName('AllEdges').AsString +
                ppp.Values['AllEdges_a'] + ',' +
                SQLQuery1.FieldByName('ecode').AsString;

            //SQLQuery2.FieldByName('Dist').AsInteger := strtoint(ppp.Values['Dist_a']) +
            //  curlong;
            SQLQuery2.FieldByName('CCount').AsInteger := SQLQuery1.Tag;
            SQLQuery2.Post;

          end;
        end;
        if SQLQuery2.Tag > 0 then
        begin ///debug 真烦
          SQLtemp.Close;
          SQLtemp.SQL.Text := 'insert into path (pcode,subpcode,ecode)  values (''' +
            curpb + ''',''' + curpa + ''',''' +
            SQLQuery1.FieldByName('ecode').AsString + ''')';
          SQLtemp.ExecSQL;
          //0环时一样死循环。
          curpaa := curpb;
          if curpaa = endp then
          begin
            SQLQuery1.Next;
            continue;
          end;
          SQLtemp.Close;
          SQLtemp.SQL.Text := 'select  pa,pb   from islink ' +
            '  where pa=''' + curpaa + ''' ';
          SQLtemp.Open;
          SQLtemp.First;
          //SQLQuery3.Requery();
          LocateOneField(SQLQuery2, 'pcode', curpaa);
          //SQLQuery2.Locate('pcode', curpaa, []);
          ppp.Values['AllPoints_aa'] := SQLQuery2.FieldByName('AllPoints').AsString;
          ppp.Values['AllEdges_aa'] := SQLQuery2.FieldByName('AllEdges').AsString;
          ppp.Values['Dist_aa'] := SQLQuery2.FieldByName('Dist').AsString;

          while not SQLtemp.EOF do
          begin

            curpbb := SQLtemp.FieldByName('pb').AsString;
            curecode := getecode(curpaa, curpbb);

            if pos(',' + curpbb + ',', ',' + ppp.Values['AllPoints_aa'] +
              ',') = 0 then

            begin
              //curlong := getlong(curpaa, curpbb);
              //SQLQuery3.Locate('ecode', curecode, []);
              //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
              SQLQuery2.Tag := 0;
              //SQLQuery2.Locate('pcode', curpbb, []);
              LocateOneField(SQLQuery2, 'pcode', curpbb);
              if SQLQuery2.FieldByName('CCount').AsInteger <> SQLQuery1.Tag then
                ////这一句总是怪怪的，不太明白了。不是同时到达两点？
                ////深入下去，真的多事！！！
              begin
                curlong := getlong(curpaa, curpbb);
                if SQLQuery2.FieldByName('Dist').IsNull then
                  SQLQuery2.Tag := 1
                else
                begin
                  if ppp.Values['Dist_aa'] <> '' then
                  begin
                    if SQLQuery2.FieldByName('Dist').AsInteger >
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 1;
                    if SQLQuery2.FieldByName('Dist').AsInteger =
                      StrToInt(ppp.Values['Dist_aa']) + curlong then
                      SQLQuery2.Tag := 2;
                  end;
                end;
              end;

              if SQLQuery2.Tag > 0 then
              begin
                LocateOneField(SQLQuery3, 'ecode', curecode);
                //SQLQuery3.Locate('ecode', curecode, []);
                //if SQLQuery3.FieldByName('LLevel').AsInteger <> -1 then
                begin
                  SQLQuery3.Edit;
                  SQLQuery3.FieldByName('LLevel').AsInteger := -2;
                  SQLQuery3.FieldByName('lengthDy200').AsInteger :=
                    SQLQuery3.FieldByName('lengthDy100').AsInteger;
                  //同时到达交汇于同一点时，其发出去者有为0者时
                  if SQLQuery3.FieldByName('dist').IsNull then
                    SQLQuery3.FieldByName('dist').AsInteger :=
                      SQLQuery2.FieldByName('Dist').AsInteger
                  else if SQLQuery3.FieldByName('dist').AsInteger >
                    SQLQuery2.FieldByName('Dist').AsInteger then
                    SQLQuery3.FieldByName('dist').AsInteger :=
                      SQLQuery2.FieldByName('Dist').AsInteger;
                  SQLQuery3.Post;
                end;
              end;
            end;
            SQLtemp.Next;
          end; //while not SQLtemp.Eof do
        end;
        SQLQuery1.Next;
      end; //while not SQLQuery1.Eof do
      //curpa := curpb;
    end; /// SQLQuery1.RecordCount>0
    SQLQuery1.ApplyUpdates();
    SQLQuery2.ApplyUpdates();
    SQLQuery3.ApplyUpdates();
    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update  edges_Li as www set llevel=-1 where   LLevel=1 and ' +
      '(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode1)=(select aa.ccount  from xpp_li as aa where aa.pcode=www.pcode2)';
    SQLQuery1.ExecSQL; //同时到过两点时
    SQLQuery1.Close;
    SQLQuery1.SQL.Text :=
      'update edges_Li set llevel=-1 where  lengthDy200=0 and LLevel=1';
    SQLQuery1.ExecSQL;
    //这里，使0边没有经历过就没有了
    // V型与Y型，同点到达两点与同点到达一点与同点出发。。。
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'update edges_Li set llevel=1 where   LLevel=-2';
    SQLQuery1.ExecSQL;
    //SQLQuery3.Requery();
  end; //while 1 = 1 do
  //SQLQuery2.Locate('pcode', endp, []);
  LocateOneField(SQLQuery2, 'pcode', endp);
  alreadylength := SQLQuery2.FieldByName('dist').AsFloat / 100;
  ShowMessage('OKOK');
  //以上是自创的新算法，燃线法的扩展
  //以下从SPFA中直接COPY来就可以用了。
  //DistForPathTable(SQLQuery2, 'dist');

  // { //TEST
  if isdebug = 0 then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xp_inner ';
    SQLQuery1.ExecSQL;
  end;
  //}
end;

function TMain.GetRecordCount(query: TSQLQuery): integer;
var
  i: integer;
  ii: TBookmark;
  s: string;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  //s:= query.FieldByName('pcode').AsString;
  while not query.EOF do
  begin
    i := i + 1;
    query.Next;
  end;
  query.GotoBookmark(ii);
  query.EnableControls;
  Result := i;
end;

function TMain.LocateOneField(query: TSQLQuery; oneField, fieldValue: string): integer;
var
  i: integer;
  ii: TBookmark;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  while not query.EOF do
  begin
    if query.FieldByName(oneField).AsString = fieldValue then
    begin
      i := 1;
      break;
    end;
    query.Next;
  end;
  if i = 0 then
    query.GotoBookmark(ii);
  query.EnableControls;
  Result := i;
end;

function TMain.LocateTwoField(query: TSQLQuery;
  Field1, Field2, value1, value2: string): integer;
var
  i: integer;
  ii: TBookmark;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  while not query.EOF do
  begin
    if query.FieldByName(Field1).AsString = value1 then
      if query.FieldByName(Field2).AsString = value2 then
      begin
        i := 1;
        break;
      end;
    query.Next;
  end;
  if i = 0 then
    query.GotoBookmark(ii);
  query.EnableControls;
  Result := i;
end;

function TMain.GetTableAllString(query: TSQLQuery): string;
var
  i: integer;
  ii: TBookmark;
  s: string;
begin
  i := 0;
  ii := query.GetBookmark;
  query.DisableControls;
  query.First;
  s := '';
  //s:= query.FieldByName('pcode').AsString;
  for i := 0 to query.Fields.Count - 1 do
    s := s + query.Fields[i].FieldName + ';';

  s := s + #13#10;

  while not query.EOF do
  begin

    for i := 0 to query.Fields.Count - 1 do
    begin
      s := s + query.FieldByName(query.Fields[i].FieldName).AsString + ';';
    end;
    s := s + #13#10;

    query.Next;
  end;
  query.GotoBookmark(ii);
  query.EnableControls;
  Result := s;
end;



procedure TMain.pointsXYposClick(Sender: TObject);
var
  NewString: string;
  ClickedOK: boolean;
  I: integer;
begin
  if Application.MessageBox('是否清空用户项目数据？',
    '是否继续？', MB_YESNO) <> idYes then
    exit;
  SQLTransaction1.Active := True;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from points where dprid=' + dprid;
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges where dprid=' + dprid + '';
  SQLQuery1.ExecSQL;
  // SQLQuery1.ApplyUpdates();
  SQLTransaction1.Commit;
  SQLTransaction1.Active := True;
  FFF := '';
  self.Tag := 0;

  if dprid = userid then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
    self.SQLQuery1.Open;
    if GetRecordCount(SQLQuery1) = 0 then
    begin
      NewString := '';
      ClickedOK := InputQuery('总质点个数不能小于6个',
        '请输入总的质点个数', NewString);
      if ClickedOK then
      begin
        if StrToInt(NewString) < 6 then
          exit;
        ProgressBar1.Visible := True;
        ProgressBar1.Min := 0; // ：=1，结果出错于0时。
        ProgressBar1.Max := StrToInt(NewString);
        SQLTransaction1.Active := True;
        // SQLQuery1.Close;
        //SQLQuery1.SQL.Text := 'delete from  linesxy where linetext=''-1''';
        //SQLQuery1.ExecSQL;SQLTransaction1.Commit;
        ////SQLQuery1.ApplyUpdates();
        for I := 1 to StrToInt(NewString) do
        begin

          SQLQuery1.Append;
          //SQLQuery1.Insert;
          SQLQuery1.FieldByName('dprid').AsString := dprid;
          SQLQuery1.FieldByName('pcode').AsString := 'P' + IntToStr(I);
          SQLQuery1.FieldByName('pname').AsString := 'P' + IntToStr(I);
          SQLQuery1.FieldByName('px').AsInteger := 100 + I * 10;
          SQLQuery1.FieldByName('py').AsInteger := 100 + I * 10;
          SQLQuery1.Post;
          SQLQuery1.ApplyUpdates();

          ProgressBar1.Position := I;
        end;
        ProgressBar1.Visible := False;
        SQLQuery1.ApplyUpdates();
        SQLTransaction1.Commit;
        SQLTransaction1.Active := True;

      end;
    end;
  end;
  if dprid = userid then
  begin
    SQLTransaction1.Active := True;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from edges where dprid=' + dprid;
    self.SQLQuery1.Open;
    if GetRecordCount(SQLQuery1) = 0 then
    begin
      SQLQuery3.Close;
      SQLQuery3.SQL.Text :=
        'select * from points where dprid=' + dprid + '  order by id';
      SQLQuery3.Open;
      SQLQuery2.Close;
      SQLQuery2.SQL.Text :=
        'select * from points where dprid=' + dprid + '  order by id';
      SQLQuery2.Open;
      SQLQuery2.First;
      ProgressBar1.Visible := True;
      ProgressBar1.Min := 0;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := GetRecordCount(SQLQuery3) * GetRecordCount(SQLQuery2);
      while not SQLQuery2.EOF do
      begin
        SQLQuery3.First;
        while not SQLQuery3.EOF do
        begin
          ProgressBar1.Position := ProgressBar1.Position + 1;
          if SQLQuery3.FieldByName('id').AsInteger <=
            SQLQuery2.FieldByName('id').AsInteger then
          begin
            SQLQuery3.Next;
            continue;
          end;
          SQLQuery1.Append;
          SQLQuery1.FieldByName('dprid').AsString := dprid;
          SQLQuery1.FieldByName('ecode').AsString :=
            SQLQuery2.FieldByName('pcode').AsString +
            SQLQuery3.FieldByName('pcode').AsString;
          SQLQuery1.FieldByName('pcode1').AsString :=
            SQLQuery2.FieldByName('pcode').AsString;
          SQLQuery1.FieldByName('pcode2').AsString :=
            SQLQuery3.FieldByName('pcode').AsString;
          SQLQuery1.FieldByName('pname1').AsString :=
            SQLQuery2.FieldByName('pname').AsString;
          SQLQuery1.FieldByName('pname2').AsString :=
            SQLQuery3.FieldByName('pname').AsString;
          SQLQuery1.FieldByName('Relation').AsBoolean := False;
          // SQLQuery1.FieldByName('direct').AsString := '双向或者无方向<-->';
          SQLQuery1.Post;
          SQLQuery3.Next;
        end;
        SQLQuery2.Next;
      end;
    end;
    SQLQuery1.ApplyUpdates();

    SQLTransaction1.Commit;
    SQLTransaction1.Active := True;
    ProgressBar1.Visible := False;
  end;
end;

procedure TMain.FormCreate(Sender: TObject);
begin

  MyLineColor := clGrayText; // clSilver;
  // refreshhClick(nil);
  AllPath := TStringList.Create;
  AllPath_ := TStringList.Create;
  tempList := TStringList.Create;
  PPP := TStringList.Create;

  shiftPointsB := False;
  shiftEdgesB := False;
  shiftPointsL := TStringList.Create;
  shiftEdgesL := TStringList.Create;
  LabelsCaptions := TStringList.Create;


  shapeList := TFPList.Create;
  LineList := TFPList.Create;
  TPsubpPointList := TFPList.Create;
  OnPainNoPainColor := False;
  ResultPathEdgesRed := TStringList.Create;
end;

procedure TMain.Button11Click(Sender: TObject);
begin
  exitOut := True;
  Close;
end;

procedure TMain.Button5Click(Sender: TObject);
var
  www, w: TStringList;
  i, j: integer;
  wstr: string;
begin
  ShowMessage(IntToStr(chineseCharToInt10('刷'))); // 21047    Button3
  //ShowMessage(Int10TochineseChar('28436')); //演
  // wstr:='www#28436#123';
  // stringreplace(wstr,'#'+www[i],Int10TochineseChar('28436'),[rfReplaceAll]);


  if self.OpenDialog1.Execute then
  begin
    www := TStringList.Create;
    w := TStringList.Create;
    www.LoadFromFile(self.OpenDialog1.FileName);
    w.LoadFromFile(self.OpenDialog1.FileName);
    www.Delimiter := '#';
    www.DelimitedText := www.Text;
    for i := 0 to www.Count - 1 do
    begin
      try
        wstr := (Int10TochineseChar(www[i]));
        w.Text := stringreplace(w.Text, '#' + www[i], wstr, []);  //rfReplaceAll
        //w.Add((Int10TochineseChar(www[i])));
        //www[i]:=wstr;
        // for j:=0 to w.count-1 do
        //   w[j]:= stringreplace(w[j],'#'+www[i],wstr,[]);


      except
        //w.Add((www[i]));
      end;
    end;
    //www.Clear;
    //www.text:=stringreplace(w.Text,#13,'',[rfReplaceAll]);
    //www.text:=stringreplace(w.Text,#10,'',[rfReplaceAll]);
    w.SaveToFile(self.OpenDialog1.FileName + '.txt');
    //www.SaveToFile(self.OpenDialog1.FileName+'www.txt');
    www.Free;
    // w.Free;;
  end;


  ShowMessage(Int10TochineseChar('28436')); //演

end;

procedure TMain.delOnePointClick(Sender: TObject);
var
  pcode: string;
begin
  if application.MessageBox('删除此质点？', PChar(Tmenuitem(Sender).Hint),
    MB_OKCANCEL) = ID_OK then
  begin
    pcode := delonepoint.Hint;
    sqltemp.Close;
    sqltemp.SQL.Text := 'delete from points where dprid=' + dprid +
      ' and pcode=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltemp.Close;
    sqltemp.SQL.Text := 'delete from edges where dprid=' + dprid +
      ' and pcode1=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltemp.Close;
    sqltemp.SQL.Text := 'delete from edges where dprid=' + dprid +
      ' and pcode2=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltransaction1.Commit;

    refrash.Click;
  end;
end;

procedure TMain.FormActivate(Sender: TObject);
var
  ii: integer;
begin
  // self.WindowState:=wsFullScreen;
  //ii := GetTickCount64;
  //while ((GetTickCount64 - ii) < 2500) do
  //  Application.ProcessMessages;
  if pos('OnShow',self.Hint)>0 then
  begin
    self.Hint:=stringreplace(self.Hint,'OnShow','',[]);
    self.WindowState := wsMaximized;
    application.ProcessMessages;
    refrash.Click;
  end;

end;

procedure TMain.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  p, t, aaa, bbb, ccc: tpoint;
  ii: integer;
  ab, ac, bc, L, minL, H, minH, Sabc, pp: real;
  Cap, minLCaption, minHCaption: string;
  p1, p2: string;
  curline: TlinePoint;
  c: tcolor;
begin

  //exit;
  ////测试正确
  //   海伦公式是通过三角形三边长度直接计算面积的公式，表达式为S=sqrt(p(p−a)(p−b)(p−c))
  //，其中p=(a+b+c)/2 为半周长。
  //online    三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也


  p.X := X;
  p.Y := Y;
  t := TImage(Sender).clienttoscreen(p);
  //ccc:=p;
  ccc := TImage(Sender).ClientToParent(p);

  minL := 1000000000;
  minH := 1000000000;
  for ii := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[ii] <> nil then
      begin
        aaa := TlinePoint(lineList.Items[ii]).beginPoint;
        bbb := TlinePoint(lineList.Items[ii]).endPoint;

        ab := sqrt((aaa.X - bbb.X) * (aaa.X - bbb.X) + (aaa.y - bbb.y) *
          (aaa.y - bbb.y));
        ac := sqrt((aaa.X - ccc.X) * (aaa.X - ccc.X) + (aaa.y - ccc.y) *
          (aaa.y - ccc.y));
        bc := sqrt((ccc.X - bbb.X) * (ccc.X - bbb.X) + (ccc.y - bbb.y) *
          (ccc.y - bbb.y));

        pp := (ab + ac + bc) / 2;
        Sabc := sqrt(pp * (pp - ab) * (pp - bc) * (pp - ac));
        H := Sabc / ab;
        //三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也
        //if H < minH then
        //begin
        //  minH := H;
        //  minHCaption := Cap;
        //end;
        L := sqrt(((ab) - (ac) - (bc)) * ((ab) - (ac) - (bc)));
        Cap := TlinePoint(lineList.Items[ii]).beginPcode + ' <--> ' +
          TlinePoint(lineList.Items[ii]).endPcode;//+ '=' + floattostr(L);
        //  p1 := TlinePoint(lineList.Items[ii]).beginPcode;
        //  p2 := TlinePoint(lineList.Items[ii]).endPcode;
        if L < minL then
        begin
          minL := L;
          minLCaption := Cap;
          p1 := TlinePoint(lineList.Items[ii]).beginPcode;
          p2 := TlinePoint(lineList.Items[ii]).endPcode;
          curline := TlinePoint(lineList.Items[ii]);
          minH := H;
        end;

        if L < -1 then
        begin
          linememo.Caption :=
            TlinePoint(lineList.Items[ii]).beginPcode +
            TlinePoint(lineList.Items[ii]).endPcode;
          linemenu.PopUp(t.x, t.y);
          break;
        end;
        if minL < 2 then
          if minH < 5 then
            break;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;

  //if ii = 0 then
  begin
    //if minLcaption = minHcaption then
    if minL < 2 then
      if minH < 5 then
      begin

        if online <> nil then
        begin
          ScrollBox1.Canvas.Pen.Width := 2;
          ScrollBox1.Canvas.Pen.Color := clgrayText;
          ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        end;
        online := curline;
        c := ScrollBox1.Canvas.Pen.Color;
        ScrollBox1.Canvas.Pen.Color := clblue;
        ScrollBox1.Canvas.Pen.Width := 2;
        ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        ScrollBox1.Canvas.Pen.Width := 1;
        ScrollBox1.Canvas.Pen.Color := c;
        image1.ShowHint := False;
        application.ProcessMessages;
        image1.Hint := online.beginPcode + '::' + online.endPcode +
          '::' + '权' + online.weightLine;
        image1.ShowHint := True;
        application.ProcessMessages;
      end;

    if ((minL >= 2) or (minH >= 5)) then
      //if minL >= 2 then
      //  if minH>10 then
    begin
      if online <> nil then
      begin
        ScrollBox1.Canvas.Pen.Width := 2;
        ScrollBox1.Canvas.Pen.Color := clgrayText;
        ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        //getpcode(online.beginPcode).OnPaint(getpcode(online.beginPcode));
        //getpcode(online.endPcode).OnPaint(getpcode(online.endPcode));
        //getpcode(online.beginPcode).BringToFront;
        //getpcode(online.endPcode).BringToFront;
      end;
      online := nil;
    end;
  end;

end;

procedure TMain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  p, t, aaa, bbb, ccc: tpoint;
  ii: integer;
  ab, ac, bc, L, minL, H, minH, Sabc, pp: real;
  Cap, minLCaption, minHCaption: string;
  p1, p2: string;
  curline: TlinePoint;
  c: tcolor;
begin
  //if shiftPointsB then
  if shiftPoints.Caption = '正在shift点......' then
    //if (Shift = [ssShift]) then
    if ssShift in Shift then
      shiftPointsL.Add(IntToStr(X) + ':' + IntToStr(Y));

  if Button = mbRight then
  begin

    //exit;
    ////测试正确
    //   海伦公式是通过三角形三边长度直接计算面积的公式，表达式为S=sqrt(p(p−a)(p−b)(p−c))
    //，其中p=(a+b+c)/2 为半周长。
    //online  三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也


    p.X := X;
    p.Y := Y;
    t := TImage(Sender).clienttoscreen(p);
    //ccc:=p;
    ccc := TImage(Sender).ClientToParent(p);

    minL := 1000000000;
    minH := 1000000000;
    for ii := lineList.Count - 1 downto 0 do
    begin
      try
        //if tobject(shapeList.Items[i]) is TlinePoint then
        if lineList.Items[ii] <> nil then
        begin
          aaa := TlinePoint(lineList.Items[ii]).beginPoint;
          bbb := TlinePoint(lineList.Items[ii]).endPoint;

          ab := sqrt((aaa.X - bbb.X) * (aaa.X - bbb.X) + (aaa.y - bbb.y) *
            (aaa.y - bbb.y));
          ac := sqrt((aaa.X - ccc.X) * (aaa.X - ccc.X) + (aaa.y - ccc.y) *
            (aaa.y - ccc.y));
          bc := sqrt((ccc.X - bbb.X) * (ccc.X - bbb.X) + (ccc.y - bbb.y) *
            (ccc.y - bbb.y));
          L := sqrt(((ab) - (ac) - (bc)) * ((ab) - (ac) - (bc)));
          Cap := TlinePoint(lineList.Items[ii]).beginPcode + ' <--> ' +
            TlinePoint(lineList.Items[ii]).endPcode;//+ '=' + floattostr(L);
          //  p1 := TlinePoint(lineList.Items[ii]).beginPcode;
          //  p2 := TlinePoint(lineList.Items[ii]).endPcode;
          if L < minL then
          begin
            minL := L;
            minLCaption := Cap;
            p1 := TlinePoint(lineList.Items[ii]).beginPcode;
            p2 := TlinePoint(lineList.Items[ii]).endPcode;
            curline := TlinePoint(lineList.Items[ii]);
          end;
          //pp := (ab + ac + bc) / 2;
          //Sabc := sqrt(pp * (pp - ab) * (pp - bc) * (pp - ac));
          //H := Sabc / ab; 三角形海伦面积公式，求得点到各边之高之距离，不仅最小高，还要诸高排序，取一个最小范围，这样不足取也
          //if H < minH then
          //begin
          //  minH := H;
          //  minHCaption := Cap;
          //end;
          if L < -1 then
          begin
            linememo.Caption :=
              TlinePoint(lineList.Items[ii]).beginPcode +
              TlinePoint(lineList.Items[ii]).endPcode;
            linemenu.PopUp(t.x, t.y);
            break;
          end;
          application.ProcessMessages;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    //linemenu.PopUp(t.x, t.y);
    if ii = 0 then
    begin
      //if minLcaption = minHcaption then
      if minL < 2 then
        //  if minH<10 then
      begin
        sqltemp.Close;
        sqltemp.SQL.Text := 'select memo from edges where dprid=' +
          dprid + ' and ((pcode1=''' + p1 + ''' and pcode2=''' + p2 +
          ''' ) or (pcode1=''' + p2 + ''' and pcode2=''' + p1 + ''' ))';
        sqltemp.Open;
        if GetRecordCount(SQLtemp) > 0 then
        begin
          linememo.Caption := '备注：' + sqltemp.FieldByName('memo').AsString;
          linememo.hint := sqltemp.FieldByName('memo').AsString;
        end;
        sqltemp.Close;
        //linememo.Caption := minLCaption;
        lineBeginEnd.Caption := minLCaption;

        if online <> nil then
        begin
          ScrollBox1.Canvas.Pen.Width := 2;
          ScrollBox1.Canvas.Pen.Color := clgrayText;
          ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        end;
        online := curline;
        c := ScrollBox1.Canvas.Pen.Color;
        ScrollBox1.Canvas.Pen.Color := clblue;
        ScrollBox1.Canvas.Pen.Width := 2;
        ScrollBox1.Canvas.Line(online.beginPoint, online.endPoint);  //ok
        ScrollBox1.Canvas.Pen.Width := 1;
        ScrollBox1.Canvas.Pen.Color := c;
        linemenu.PopUp(t.x, t.y);
        //linemenu.PopUp(500, 500);
      end;
    end;
  end;
end;

procedure TMain.Label3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if (Button = mbRight) then
    ShowMessage('自思肯普法时，动态染色时，可以设置每步每点时长（毫秒），以利于观察也');
end;

procedure TMain.shiftPointsChange(Sender: TObject);
begin

end;

procedure TMain.shiftPointsClick(Sender: TObject);
//var
//  i: integer;
//begin
//  //shiftPoints.Caption := 'www';
//  //
//  //i := gettickcount64;
//  //while (gettickcount64 - i) < 3000 do
//  //  //application.ProcessMessages;
//  //  sleep(111);
//end;
var
  I, ccc: integer;
  c: longint;
  pcode, pname, px, py: string;
begin
  //if shiftPointsB then
  if shiftPoints.Caption = '正在shift点......' then
  begin
    //shiftPointsB := False;
    shiftPoints.Caption := 'shift点(看右键)';
    shiftPoints.Checked := False;
    if dprid = userid then
    begin
      SQLtemp.Close;
      //SQLtemp.SQL.Text := 'select * from points where dprid=' + userid;
      SQLtemp.SQL.Text := 'select count(1) as ccc from points where dprid=' + dprid;
      SQLtemp.Open;
      //SQLtemp.Refresh;
      // if SQLtemp.RecordCount = 0 then
      ccc := 0;
      ccc := SQLtemp.FieldByName('ccc').AsInteger;
      //if SQLtemp.RecordCount >0 then
      if ccc > 0 then
      begin
        //  c := 0
        // else
        //  ccc := SQLtemp.RecordCount;    //????  SQLQuery1.RecordCount实际不止10，但返回值竟为10，怪
        for I := 0 to shiftPointsL.Count - 1 do
        begin
          //SQLtemp.Append;
          //SQLtemp.FieldByName('dprid').AsString := dprid;
          //SQLtemp.FieldByName('pcode').AsString := 'P' + inttostr(I + ccc);
          //SQLtemp.FieldByName('pname').AsString := 'P' + inttostr(I + ccc);
          //SQLtemp.FieldByName('px').AsInteger :=
          //  strtoint(leftstr(shiftPointsL[I], pos(':', shiftPointsL[I]) - 1));
          //SQLtemp.FieldByName('py').AsInteger :=
          //  strtoint(copy(shiftPointsL[I], pos(':', shiftPointsL[I]) + 1,
          //  length(shiftPointsL[I]) - pos(':', shiftPointsL[I])));
          //SQLtemp.Post;
          //SQLtemp.ApplyUpdates();
          pcode := 'P' + IntToStr(I + ccc + 1);
          pname := 'P' + IntToStr(I + ccc + 1);
          px := leftstr(shiftPointsL[I], pos(':', shiftPointsL[I]) - 1);
          py := copy(shiftPointsL[I], pos(':', shiftPointsL[I]) + 1,
            length(shiftPointsL[I]) - pos(':', shiftPointsL[I]));
          SQLtemp.Close;
          SQLtemp.SQL.Text := 'insert into points (dprid,pcode,pname,px,py) values(' +
            dprid + ' , ''' + pcode + ''' ,''' + pname + ''',' + px + ',' + py + ')';
          SQLtemp.ExecSQL;


          SQLQuery2.Close;
          SQLQuery2.SQL.Text :=
            'select * from points where dprid=' + userid + '  order by id';
          SQLQuery2.Open;
          //SQLQuery1.Append;
          //SQLQuery1.FieldByName('dprid').AsString := dprid;
          //SQLQuery1.FieldByName('pcode').AsString :=
          //  'P' + IntToStr(SQLQuery1.RecordCount + 1);
          //SQLQuery1.FieldByName('pname').AsString :=
          //  'P' + IntToStr(SQLQuery1.RecordCount + 1);
          //SQLQuery1.FieldByName('px').AsInteger := 500;
          //SQLQuery1.FieldByName('py').AsInteger := 500;
          //SQLQuery1.Post;
          //SQLQuery1.ApplyUpdates();
          SQLQuery3.Close;
          SQLQuery3.SQL.Text := 'select * from edges where dprid=' + userid;
          SQLQuery3.Open;
          SQLQuery2.First;
          while not SQLQuery2.EOF do
          begin
            if SQLQuery2.FieldByName('pcode').AsString = pcode then
            begin
              SQLQuery2.Next;
              continue;
            end;
            SQLQuery3.Append;
            SQLQuery3.FieldByName('dprid').AsString := userid;
            SQLQuery3.FieldByName('ecode').AsString :=
              SQLQuery2.FieldByName('pcode').AsString + pcode;
            SQLQuery3.FieldByName('pcode1').AsString :=
              SQLQuery2.FieldByName('pcode').AsString;
            SQLQuery3.FieldByName('pcode2').AsString :=
              pcode;
            SQLQuery3.FieldByName('pname1').AsString :=
              SQLQuery2.FieldByName('pname').AsString;
            SQLQuery3.FieldByName('pname2').AsString :=
              pname;
            SQLQuery3.FieldByName('Relation').AsBoolean := False;
            SQLQuery3.Post;
            SQLQuery3.ApplyUpdates();
            SQLQuery2.Next;
          end;
        end;
        ProgressBar1.Visible := False;
      end;
    end;

    sqltransaction1.Commit;
    sqltransaction1.Active := True;
    refreshClick(nil);
    u_points.frmPoints.ShowModal;
    u_edges.frmEdges.Show;
    refreshClick(nil);

  end // ;
  else // if not shiftPointsB then
  begin
    // Button4Click(nil); //手工清空点
    //shiftPointsB := True;
    shiftPoints.Caption := '正在shift点......';
    shiftPoints.Checked := True;
    shiftPointsL.Clear;

  end;
end;

procedure TMain.shiftEdgesClick(Sender: TObject);
//begin
//showmessage('www');
//application.MessageBox('w','ccc',MB_OK);
// application.ProcessMessages;
// application.MessageBox('ok','ok',MB_OK);
//application.ProcessMessages;
//application.MessageBox('ok', 'ok', MB_OKCANCEL);
//end;
var
  I: integer;
  LLine, star, ends: string;
begin
  if shiftEdges.Caption = '正在shift边......' then
  begin
    //shiftEdgesB := False;
    shiftEdges.Caption := 'shift边(看右键)';

    /// 手工创建全部边
    for I := 0 to shiftEdgesL.Count - 1 do
    begin
      LLine := shiftEdgesL[I] + ':';
      star := leftstr(LLine, pos(':', LLine) - 1);
      ends := stringreplace(LLine, star, '', []);
      ends := stringreplace(ends, ':', '', []);
      while ends <> '' do
      begin
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'update edges set relation=true' +
          ' where dprid=' + userid + ' and  pcode1=''' + star +
          ''' and pcode2=''' + leftstr(ends, pos(':', ends) - 1) + '''';
        SQLQuery2.ExecSQL;
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'update edges set relation=true' +
          ' where dprid=' + userid + ' and  pcode2=''' + star +
          ''' and pcode1=''' + leftstr(ends, pos(':', ends) - 1) + '''';
        SQLQuery2.ExecSQL;

        ends := stringreplace(ends, leftstr(ends, pos(':', ends) - 1), '', []);
        ends := stringreplace(ends, ':', '', []);
      end;
    end;
    ProgressBar1.Visible := False;
    sqltransaction1.Commit;
    sqltransaction1.Active := True;
    refreshClick(nil);
    u_points.frmPoints.ShowModal;
    u_edges.frmEdges.Show;
    refreshClick(nil);

  end // ;
  else // if not shiftPointsB then
  begin
    // edgesssClick(nil);
    //shiftEdgesB := True;
    shiftEdges.Caption := '正在shift边......';
    shiftEdges.Checked := True;
    shiftEdgesL.Clear;

  end;
end;



procedure TMain.btn_infoClick(Sender: TObject);
begin
  if not FileExists('说明.txt') then
  begin
    Memo_SaveToTxT.Lines.SaveToFile('说明.txt');
  end;
  if FileExists('说明.txt') then
  begin

    msgshow.showMSG.init(ExtractFilePath(ParamStr(0)) + '说明.txt');

  end
  else
    ShowMessage('找不到说明文件');
end;

procedure TMain.Btn_about_way1Click(Sender: TObject);
var
  s: array[0..4] of string;
  v: array[0..4] of string;
begin
  s[0] := '1';
  s[1] := '2';
  s[2] := '3';
  s[3] := '4';
  s[4] := '5';
  v[0] := 'A-Star算法边长只能为正数,不可以为0或负数';
  v[1] := '理论上此算法运算速度最快,有时边长为0或负数';
  v[2] := 'A-Star算法一样可以得到正确结果,但这不是它';
  v[3] := '普遍具有的功能。一般情况下，如果边长为0';
  v[4] := '或负数时,应改用SPFA算法或算法二或算法三';
  InputQueryLi('A-Star算法说明', s, v, nil);
end;

procedure TMain.Btn_about_way2Click(Sender: TObject);
var
  s: string;      // Caption = 算法二
  v: timage;
  //     Caption = 注意：此算法点和边都不允许重复历遍二次。即点与边最多只可以历一遍。
begin
  s := '算法二说明：         ' + #13#10 +
    '算法二可以0边环负边负环。是作者自创法。' +
    #13#10 + '如果SPFA算法无解时，可以用此法解。' +
    #13#10 + '' + #13#10 + '注意：' + #13#10 +
    '此算法点和边都不允许重复历遍二次。即点边最多只可以历一遍。'
    + #13#10 + '这正是算法二与算法三不同之处！' +
    #13#10 + '' + #13#10 +
    '此算法如果是负边，最好不是双向或无向，边最好也一样有单向方向。'
    + #13#10 +
    '有时，此算法在负边为双向或无向下，仍可出正确解。但这个不能保证总是正确的。'
    + #13#10 + '测试表明，当SPFA有解时，此算法二基本上和SPFA一致的。'
    + #13#10 +
    '但在对称图中，有“0"边"0"环时，此算法二有求出对称解中对称性中的一半。'
    + #13#10 +
    '如有多条负边双向或无向时，可取值两个单向。如此组合出所有负边求解。再取其中最小值';

  //v:=timage.Create(self);
  //v.Picture.LoadFromFile('A2.jpg');
  InputQueryLiImage('算法二说明', s, 'A2.jpg', nil);
  //v.Free;
end;

procedure TMain.Btn_about_way3Click(Sender: TObject);
var
  s: string;      // Caption = 算法三
  v: timage;
  // Caption = 注意：此算法点允许重复历遍多次。但是边最多只可以历一遍。
begin
  s := '算法三说明：' + #13#10 +
    '算法三可以0边0环负边负环。也是作者自创的算法。 ' +
    #13#10 + '如果SPFA算法无解时，可以用此法尝试能否有解。' +
    #13#10 + '注意：' + #13#10 +
    '此算法点允许重复历遍多次。但是边最多只可以历一遍。' +
    #13#10 + '这正是算法二与算法三不同之处！' + #13#10 +
    '此算法如果是负边，最好不是双向或无向，负边最好也一样有单向方向。'
    + #13#10 +
    '有时，此算法在负边为双向或无向下，仍可求出正确解。但这个不能保证总是正确的。'
    + #13#10 +
    '算法三目前暂时只能找到一条最短路径，不能找到所有全部的最短路径。'
    + #13#10 + '' + #13#10 +
    '算法三在正常下，有负环时的运行效果图，参看上边的图示。' +
    #13#10 + '' + #13#10 +
    '当有多条负边双向或无向时，可以每边负边取值两个单向。如此组合出所有负边，每个组合求解。再取其中最小值';
  //v:=timage.Create(self);
  //v.Picture.LoadFromFile('A3.jpg');
  InputQueryLiImage('算法三说明', s, 'A3.jpg', nil);
  //v.Free;
end;

procedure TMain.Btn_about_spfaClick(Sender: TObject);
var
  s: string;
begin
  s := 'SPFA算法说明' + #13#10 + '此算法边长可以边长为0或负数' +
    #13#10 + '如果边长为负数，不可以双向或无向，一定要有方向单向。'
    + #13#10 + '如果边长为0，可以双向或无向。' + #13#10 +
    '此算法在有负环的情况下无解。不了解此算法的人可以百度了解下。'
    + #13#10 +
    '有负环时，可以参考使用作者自创的算法二或算法三，或许有解';
  InputQueryLiMemo('SPFA算法说明', s, nil);
end;

procedure TMain.Btn_about_way111Click(Sender: TObject);
var
  s: string;
  //只在作者自创的燃线法添加权重功能，别的算法暂没空去做了，以后再理
begin
  s := '燃线法权重算法说明' + #13#10 +
    '这其实是作者自创的燃线法，' + #13#10 +
    '燃线法，就是设想，节点与线段是导火线是燃烧的线，且匀速直线运动，'
    + #13#10 +
    '又或者设想是金属铜导线，通电后，以光速运动，最先到达的就是最快路径'
    + #13#10 + #13#10 +
    '原先的版本是没有权重的，点与边的权重是现在才添加上去的，'
    + #13#10 + '由于权重可能有多种组合解释，现在以下面为解释：'
    + #13#10 + '点的权重就是，经过此点时路径增加的值，' +
    #13#10 + '边的权重，就是边长再相乘的乘数倍数。' +
    #13#10 + '只在作者自创的燃线法添加权重功能，' +
    #13#10 + '别的算法暂没空去做了，以后再理';
  s := s + #13#10 + #13#10 +
    '因为作者自已闭门造车想出燃线法，再去网上寻找最短路径算法，发觉与已存在的A-Star算法十分相似，实际上又难以明确，于是作出程序来实用，' + #13#10 + '理论上归属哪个算法，不太明确。' + #13#10 + '关键是实际上能找到最短的最快的路径，实用就行了。' + #13#10 + '燃线法，就是设想，节点与线段是导火线是燃烧的线，且匀速直线运动，' + #13#10 + '又或者设想是金属铜导线，通电后，以光速运动，最先到达的就是最快路径';

  s := s + #13#10 +
    '点的权重，动态加入到当前边界的边权重中，lengthDY，动态有方向矢量，'
    + #13#10 + '不是静态加到边中乎？？？静态加到边中？两个端点一齐加？'
    + #13#10 +
    '如果两个端点一齐静态加到边中去，会造成端点被重复相？则加一半？也不行？可能行？？？'
    + #13#10 +
    '如果作为起点与止点或孤点，则不可加一半，改成加全部点权重到边中？';
  InputQueryLiMemo('燃线法权重算法说明', s, nil);

  //  燃线法权重算法说明
  //这其实是作者自创的燃线法，
  //燃线法，就是设想，节点与线段是导火线是燃烧的线，且匀速直线运动，
  //又或者设想是金属铜导线，通电后，以光速运动，最先到达的就是最快路径FastLine

  //原先的版本是没有权重的，点与边的权重是现在才添加上去的，
  //由于权重可能有多种组合解释，现在以下面为解释：
  //点的权重就是，经过此点时路径增加的值，
  //边的权重，就是边长再相乘的乘数倍数。
  //只在作者自创的燃线法添加权重功能，
  //别的算法暂没空去做了，以后再理

  //因为作者自已闭门造车想出燃线法，再去网上寻找最短路径算法，发觉与已存在的A-Star算法十分相似，实际上又难以明确，于是作出程序来实用，
  //理论上归属哪个算法，不太明确。
  //关键是实际上能找到最短的最快的路径，实用就行了。

  //点的权重，动态加入到当前边界的边权重中，lengthDY，动态有方向矢量，
  //不是静态加到边中乎？？？静态加到边中？两个端点一齐加？
  //如果两个端点一齐静态加到边中去，会造成端点被重复相？则加一半？也不行？可能行？？？
  //如果作为起点与止点或孤点，则不可加一半，改成加全部点权重到边中？

end;


//var
//  www: tpoint;
//begin
//  //if  Button=mbLeft then
//  //   Button:=mbRight;
//  www.x := x;
//  www.y := y;
//  www := button10.ClientToParent(www, self);
//  //self.PopupMenu1.PopUp(www.x, www.y);
//end;
procedure TMain.btn_runClick(Sender: TObject); //Button11
var
  bbb: boolean;
  curp, parentp, path, mind, truelength, tmpstr001, from_P, to_P: string;
  alllength, lengthcal: double;
  curc: TComponent;
  NewString, onepath, onep, onepname, twop, oneedge, onelength, oneline: string;
  iii, jjj, kkk, TOPid: integer;
  curaLong, curbLong, minlong, curlong: integer;
  curpa, curpb, curecode, curpaa, curpbb: string;
  ado: TSQLQuery;
  s: string;
  i: integer;
  bpoint, epoint: tpoint;
begin

  PPP.Values['LightLine_Li_002_endp_AllPoints'] := '';



  //path表有方向，从pcode到subcode，path表从islink表来的，这表如双向则同一边有两条记录
  //首先判断起点和终点是不是连通的。
  //showmessage('起点和终点检测到是连通的，点击确定后继续求解最短路。。。');
  //showmessage('起点和终点检测到是不连通的，不能继续求解最短路。');



  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from points where isbegin=True and dprid= ' + dprid;
  SQLQuery2.Open;
  if GetRecordCount(SQLQuery2) <= 0 then
  begin
    ShowMessage('还没有设置起点');
    exit;
  end
  else
    beginp := SQLQuery2.FieldByName('pcode').AsString;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from points where isend=True and dprid= ' + dprid;
  SQLQuery2.Open;
  if GetRecordCount(SQLQuery2) <= 0 then
  begin
    ShowMessage('还没有设置终点');
    exit;
  end
  else
    endp := SQLQuery2.FieldByName('pcode').AsString;
  if beginp = endp then
  begin
    ShowMessage('起点与终点不可以为同一个相同点！');
    exit;
  end;

  if RadioBtn_input.Checked then   //RadioBtn_input
  begin
    truelength := 'length';
  end
  else  //RadioBtn_calc
    truelength := 'lengthCal';

  //path表有方向，从pcode到subcode，path表从islink表来的，这表如双向则同一边有两条记录
  //if 1 = 2 then  //测试直接读取path表,  可手工测试两条结果路径，不止一条时
  begin   //测试直接读取path表,  可手工测试两条结果路径，不止一条时

    bbb := islink();

    if bbb then
      ShowMessage('起点和终点检测到是连通的，点击确定后继续求解最短路。。。')
    else
    begin
      ShowMessage('起点和终点检测到是不连通的，不能继续求解最短路。');
      ProgressBar1.Visible := False;
      exit;
    end;
    application.ProcessMessages;
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update edges set status=0 where dprid=' + dprid;
    //where dprid='+dprid+' and Relation=True';
    SQLQuery2.ExecSQL;
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update points set status=0 where dprid=' + dprid;
    //where dprid='+dprid+' and Relation=True';
    SQLQuery2.ExecSQL;

    if RadioBtn_input.Checked then   //RadioBtn_input
    begin
      truelength := 'length';
    end
    else
    begin //RadioBtn_calc
      truelength := 'lengthCal';
      SQLQuery2.Close;
      SQLQuery2.SQL.Text :=
        'select e.ecode,(select px from points where pcode=e.pcode1 and dprid=' +
        dprid + ') as px1,(select px from points where pcode=e.pcode2 and dprid=' +
        dprid + ') as px2,' + '(select py from points where pcode=e.pcode1 and dprid='
        + dprid + ') as py1,(select py from points where pcode=e.pcode2 and dprid=' +
        dprid + ') as py2' + ' from edges as e where dprid=' + dprid +
        ' and Relation=True';
      SQLQuery2.Open;
      SQLQuery2.First;
      self.ProgressBar1.Visible := True;
      ProgressBar1.Min := 0;
      ProgressBar1.Max := GetRecordCount(SQLQuery2);
      ProgressBar1.Position := 0;
      while not SQLQuery2.EOF do
      begin
        ProgressBar1.Position := ProgressBar1.Position + 1;
        curp := SQLQuery2.FieldByName('ecode').AsString;
        lengthcal := (sqrt(power(
          (SQLQuery2.FieldByName('px1').AsInteger - SQLQuery2.FieldByName(
          'px2').AsInteger), 2) + power(
          (SQLQuery2.FieldByName('py1').AsInteger -
          SQLQuery2.FieldByName('py2').AsInteger), 2)));
        SQLQuery3.Close;
        SQLQuery3.SQL.Text :=
          'update edges set lengthcal= ' + format('%f', [lengthcal]) +
          ' where ecode=''' + curp + '''  and dprid=' + dprid;
        //where dprid='+dprid+' and Relation=True';
        SQLQuery3.ExecSQL;
        SQLQuery2.Next;
      end;
    end;

    //SQLQuery2.Close;
    //SQLQuery2.SQL.Text :=
    //  'select * from edges where  Relation=True and dprid= ' + dprid;
    //SQLQuery2.Open;
    //showmessage( GetTableAllString(SQLQuery2));
    //self.Button3Click(nil); ///这个刷新，要简单的利用，好过重写代码
    //这个刷新试过效果不如上面的代码。
    SQLQuery2.Close;
    SQLQuery2.SQL.Text := 'update edges set lengthDy=' + truelength +
      '  where Relation=True and dprid=' + dprid;
    //where dprid='+dprid+' and Relation=True';
    //SQLQuery2.SQL.Text:='update edges set lengthDy='+ truelength+'  and dprid='+dprid;
    //上面的SQL语法不报错，但逻辑错。
    SQLQuery2.ExecSQL;

    SQLQuery2.Close;
    SQLQuery2.SQL.Text :=
      'select * from edges where ((lengthDy is null) ) and Relation=True and dprid= ' +
      dprid; //or (lengthDy="")不是字符类型的！！！
    SQLQuery2.Open;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select  * from islink ';
    SQLQuery1.Open;
    SQLQuery2.Tag := 0;
    if GetRecordCount(SQLQuery2) > 0 then
    begin
      SQLQuery2.First;
      tmpstr001 := '下列的代号的边长度不能为空值:';
      while not SQLQuery2.EOF do
      begin
        // if SQLQuery1.Locate('pa;pb', VarArrayOf([SQLQuery2.FieldByName('pcode1').AsString,
        //  SQLQuery2.FieldByName('pcode2').AsString]), [loCaseInsensitive]) then
        if LocateTwoField(SQLQuery1, 'pa', 'pb',
          SQLQuery2.FieldByName('pcode1').AsString, SQLQuery2.FieldByName(
          'pcode2').AsString) = 1 then
        begin
          SQLQuery2.Next;
          continue;
        end;
        // if SQLQuery1.Locate('pa;pb', VarArrayOf([SQLQuery2.FieldByName('pcode2').AsString,
        //   SQLQuery2.FieldByName('pcode1').AsString]), [loCaseInsensitive]) then
        if LocateTwoField(SQLQuery1, 'pa', 'pb',
          SQLQuery2.FieldByName('pcode2').AsString, SQLQuery2.FieldByName(
          'pcode1').AsString) = 1 then
        begin
          SQLQuery2.Next;
          continue;
        end;
        SQLQuery2.Tag := 1;
        tmpstr001 := tmpstr001 + #10#13 + SQLQuery2.FieldByName('Ecode').AsString;
        SQLQuery2.Next;
      end;

      if SQLQuery2.Tag = 1 then
      begin
        SQLQuery1.Close;
        SQLQuery1.SQL.Text := 'delete  from islink ';
        SQLQuery1.ExecSQL;
        SQLQuery2.Tag := 0;
        ShowMessage(tmpstr001);
        exit;
      end;
    end;




    SQLQuery2.Close;
    SQLQuery2.SQL.Text :=
      'select * from edges where (lengthDy)<0.01 and Relation=True and dprid= ' + dprid;
    SQLQuery2.Open;
    SQLQuery2.Tag := 0;
    if GetRecordCount(SQLQuery2) > 0 then
    begin

      if ((RadioBtn_way1.Checked)) then
      begin
        SQLQuery2.First;
        tmpstr001 :=
          '下列的代号的边长度为 0 或负数，一般情况下不能用算法一 : ';
        while not SQLQuery2.EOF do
        begin
          // if SQLQuery1.Locate('pa;pb', VarArrayOf([SQLQuery2.FieldByName('pcode1').AsString,
          //  SQLQuery2.FieldByName('pcode2').AsString]), [loCaseInsensitive]) then
          if LocateTwoField(SQLQuery1, 'pa', 'pb',
            SQLQuery2.FieldByName('pcode1').AsString, SQLQuery2.FieldByName(
            'pcode2').AsString) = 1 then
          begin
            SQLQuery2.Next;
            continue;
          end;
          //  if SQLQuery1.Locate('pa;pb', VarArrayOf([SQLQuery2.FieldByName('pcode2').AsString,
          //  SQLQuery2.FieldByName('pcode1').AsString]), [loCaseInsensitive]) then
          if LocateTwoField(SQLQuery1, 'pa', 'pb',
            SQLQuery2.FieldByName('pcode2').AsString, SQLQuery2.FieldByName(
            'pcode1').AsString) = 1 then
          begin
            SQLQuery2.Next;
            continue;
          end;
          SQLQuery2.Tag := 1;
          tmpstr001 := tmpstr001 + #10#13 + SQLQuery2.FieldByName('Ecode').AsString;
          SQLQuery2.Next;
        end;

        if SQLQuery2.Tag = 1 then
        begin
          SQLQuery2.Tag := 0;
          //showmessage(tmpstr001);
          if application.MessageBox(PChar(tmpstr001), '是否继续？', MB_YESNO) <>
            idYes then
          begin
            SQLQuery1.Close;
            SQLQuery1.SQL.Text := 'delete  from islink ';
            SQLQuery1.ExecSQL;
            exit;
          end;
        end;
      end;
    end;
    SQLQuery2.Close;
    SQLQuery2.SQL.Text :=
      'select * from edges where (lengthDy)<-0.01 and Relation=True and dprid= '
      + dprid;
    SQLQuery2.Open;
    SQLQuery2.Tag := 0;
    if GetRecordCount(SQLQuery2) > 0 then
    begin

      //if ((RadioBtn_way1.Checked)) then
      begin
        SQLQuery2.First;
        //tmpstr001 := '下列的代号的边长度为 0 或负数，一般情况下不能用算法一 : ';
        tmpstr001 := '';
        while not SQLQuery2.EOF do
        begin
          // if SQLQuery1.Locate('pa;pb', VarArrayOf([SQLQuery2.FieldByName('pcode1').AsString,
          //   SQLQuery2.FieldByName('pcode2').AsString]), [loCaseInsensitive]) then
          if LocateTwoField(SQLQuery1, 'pa', 'pb',
            SQLQuery2.FieldByName('pcode1').AsString, SQLQuery2.FieldByName(
            'pcode2').AsString) = 1 then
          begin
            SQLQuery2.Next;
            continue;
          end;
          //if SQLQuery1.Locate('pa;pb', VarArrayOf([SQLQuery2.FieldByName('pcode2').AsString,
          //  SQLQuery2.FieldByName('pcode1').AsString]), [loCaseInsensitive]) then
          if LocateTwoField(SQLQuery1, 'pa', 'pb',
            SQLQuery2.FieldByName('pcode2').AsString, SQLQuery2.FieldByName(
            'pcode1').AsString) = 1 then
          begin
            SQLQuery2.Next;
            continue;
          end;
          if ((SQLQuery2.FieldByName('direct').AsString = '') or
            (pos(SQLQuery2.FieldByName('direct').AsString, '双向') > 0) or
            (pos(SQLQuery2.FieldByName('direct').AsString, '无') > 0)) then
            //  if ((SQLQuery2.fieldbyname('direct').AsString = '') or
            //   (SQLQuery2.fieldbyname('direct').AsString = '双向或者无方向<-->')) then
          begin
            SQLQuery2.Tag := 1;
            tmpstr001 := tmpstr001 + #10#13 + SQLQuery2.FieldByName('Ecode').AsString;

          end;
          SQLQuery2.Next;
        end;

        if SQLQuery2.Tag = 1 then
        begin
          SQLQuery2.Tag := 0;
          if RadioBtn_spfa.Checked then
          begin

            ShowMessage('SPFA算法的负边不允许双向或无向：' + tmpstr001);
            exit;
          end;
          if application.MessageBox(
            PChar('负边一般不允许双向或无向，否则结果难料：' +
            tmpstr001), '是否继续？', MB_YESNO) <> idYes then
          begin
            SQLQuery1.Close;
            SQLQuery1.SQL.Text := 'delete  from islink ';
            SQLQuery1.ExecSQL;
            exit;
          end;
        end;
      end;
    end;

    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
    alreadyLength := 0;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from islink ';
    SQLQuery1.Open;


    ///2018.08.26
    ///  原来V6.0增加了下面这些不公开的方法乎。
    if (RadioBtn_way1.Checked) then   //A-Star
    begin
      LightLine_Li_000();   //A-Star
    end;
    if (RadioBtn_way2.Checked) then    //算法二
    begin
      //  LightLine_Li_001();
      //LightLine_Li_001_relax(); //此法证明是错的 ，整个边来relax，是不行的，必须流量法乎
      // //如果负边指定方向，此法也似是对的！
      LightLine_Li_001_flow();
    end;
    if (RadioBtn_way3.Checked) then   //算法三
    begin
      LightLine_Li_002();
      //LightLine_Li_002_relax();
      //LightLine_Li_002_flow();

    end;
    if (RadioBtn_spfa.Checked) then   //SPFA
    begin
      SPFA();
      //SPFA_Points(); // //如果负边指定方向，此法也似是对的！
      //SPFA_edges();
    end;
    if (RadioBtn_wayWeightLine.Checked) then   //SPFA
    begin
      LightLine_Li_wayWeightLine();
      //燃线法权重算法，内含直接读path表，显示结果
      exit;//  燃线法权重算法，内含直接读path表，显示结果
    end;

  end;//////测试直接读取path表,  可手工测试两条结果路径，不止一条时
  //path表有方向，从pcode到subcode，path表从islink表来的，这表如双向则同一边有两条记录

  ///////////////////////
  path := '';
  alllength := 0;
  ResultPathEdgesRed.Clear;
  if PPP.Values['LightLine_Li_002_endp_AllPoints'] = '' then
  begin
    AllPath.Clear;
    AllPath_.Clear;
    tempList.Clear;
    //AllTree(endp, endp);
    AllTree(endp, '', self.SQLConnector1, self.SQLTransaction1);
    //NewString := '总长度：' + format('%f', [alllength]) + #10#13 + '路径如下：(共' +
    //  inttostr(AllPath.Count) + '条最短路径)';
    //原来PATH表中，是由pcode指向subcode，如果想由subcode指向pcode,测试不行，这未知如何改动
    alllength := 0;
    NewString := '';
    onelength := '-1';
    oneline := '';
    ProgressBar1.Visible := True;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := AllPath.Count;
    ProgressBar1.Position := 0;
    kkk := 0;
    //showmessage(AllPath.text);
    for iii := 0 to AllPath.Count - 1 do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      tempList.Clear;
      tempList.Delimiter := ',';
      tempList.DelimitedText := AllPath[iii];
      onepath := '';
      oneline := '';
      onep := '';
      twop := '';
      if alreadyLength = 0 then
      begin
        for jjj := tempList.Count - 1 downto 0 do
        begin
          onep := tempList[jjj];
          if onep = '' then
            continue; //此BUG又烦人
          SQLQuery3.Close;
          SQLQuery3.SQL.Text :=
            'select *  from points  where dprid=' + dprid + ' and pcode="' +
            onep + '"';
          SQLQuery3.Open;

          onepname := SQLQuery3.FieldByName('pname').AsString;
          if onepath = '' then
            onepath := onepname
          else
            onepath := onepath + '-->' + onepname;
          if oneline = '' then
            oneline := onep
          else
            oneline := oneline + ',' + onep;
          if twop = '' then
            twop := onep
          else
          begin
            onep := stringreplace(onep, 'P', '', []);
            twop := stringreplace(twop, 'P', '', []);
            if StrToInt(onep) > StrToInt(twop) then
              oneedge := 'P' + twop + 'P' + onep //+'E'
            else
              oneedge := 'P' + onep + 'P' + twop {+'E'};
            //curc := self.FindComponent(oneedge);
            //if curc <> nil then
            //begin
            //  //if TRzLine(curc).LineWidth = 4 then
            //  //  TRzLine(curc).LineWidth := 6
            //  //else
            //  //  TRzLine(curc).LineWidth := 4;
            //  //TRzLine(curc).LineColor := clred;
            //  //tlabel(self.FindComponent('M' + TRzLine(curc).Name)).Font.Color := clred;
            //end;
            ScrollBox1.Canvas.pen.color := clHighlight;//clred;
            ScrollBox1.Canvas.pen.Width := 4;
            bpoint.x := getPcode('P' + onep).Left + (getPcode('P' + onep).Width div 2);
            bpoint.y := getPcode('P' + onep).top + (getPcode('P' + onep).Height div 2);
            epoint.x := getPcode('P' + twop).Left + (getPcode('P' + twop).Width div 2);
            epoint.y := getPcode('P' + twop).top + (getPcode('P' + twop).Height div 2);
            self.ScrollBox1.Canvas.Line(bpoint, epoint);

            ResultPathEdgesRed.Add('P' + twop + 'P' + onep);
            ResultPathEdgesRed.Add('P' + onep + 'P' + twop);


            if onelength = '-1' then
            begin
              SQLQuery2.Close;
              SQLQuery2.SQL.Text :=
                'select ' + truelength + '  as len from edges as e where e.ecode=''' +
                oneedge + ''' and dprid=' + dprid;
              SQLQuery2.Open;
              alllength := alllength + SQLQuery2.FieldByName('len').AsFloat;

            end;
            twop := 'P' + onep;
          end;
        end;
        onelength := 'OK';
        //NewString := NewString + #10#13 + 'NO.'+inttostr(iii+1) + ' : ' + AllPath[iii];
        NewString := NewString + #10#13 + 'NO.' + IntToStr(iii + 1) + ' : ' + onepath;
        ALLPATH_.Add(oneline);
      end
      else
      begin
        alllength := 0;
        for jjj := tempList.Count - 1 downto 0 do
        begin
          onep := tempList[jjj];
          if onep = '' then
            continue; //此BUG又烦人

          if twop = '' then
            twop := onep
          else
          begin
            onep := stringreplace(onep, 'P', '', []);
            twop := stringreplace(twop, 'P', '', []);
            if StrToInt(onep) > StrToInt(twop) then
              oneedge := 'P' + twop + 'P' + onep //+'E'
            else
              oneedge := 'P' + onep + 'P' + twop {+'E'};

            SQLQuery2.Close;
            SQLQuery2.SQL.Text :=
              'select ' + truelength + '  as len from edges as e where e.ecode=''' +
              oneedge + ''' and dprid=' + dprid;
            SQLQuery2.Open;
            alllength := alllength + SQLQuery2.FieldByName('len').AsFloat;

            twop := 'P' + onep;
          end;
        end;
        if format('%f', [alllength]) = format('%f', [alreadyLength]) then
        begin
          kkk := kkk + 1;
          for jjj := tempList.Count - 1 downto 0 do
          begin
            onep := tempList[jjj];
            if onep = '' then
              continue; //此BUG又烦人
            SQLQuery3.Close;
            SQLQuery3.SQL.Text :=
              'select *  from points  where dprid=' + dprid +
              ' and pcode="' + onep + '"';
            SQLQuery3.Open;

            onepname := SQLQuery3.FieldByName('pname').AsString;
            if onepath = '' then
              onepath := onepname
            else
              onepath := onepath + '-->' + onepname;
            if oneline = '' then
              oneline := onep
            else
              oneline := oneline + ',' + onep;
            if twop = '' then
              twop := onep
            else
            begin
              onep := stringreplace(onep, 'P', '', []);
              twop := stringreplace(twop, 'P', '', []);
              if StrToInt(onep) > StrToInt(twop) then
                oneedge := 'P' + twop + 'P' + onep //+'E'
              else
                oneedge := 'P' + onep + 'P' + twop {+'E'};
              //curc := self.FindComponent(oneedge);
              //if curc <> nil then
              //begin
              //  //if TRzLine(curc).LineWidth = 4 then
              //  //  TRzLine(curc).LineWidth := 6
              //  //else
              //  //  TRzLine(curc).LineWidth := 4;
              //  //TRzLine(curc).LineColor := clred;
              //  //tlabel(self.FindComponent('M' + TRzLine(curc).Name)).Font.Color := clred;
              //end;
              ScrollBox1.Canvas.pen.color := clHighlight;//clred;
              ScrollBox1.Canvas.pen.Width := 4;
              bpoint.x := getPcode('P' + onep).Left + (getPcode('P' + onep).Width div 2);
              bpoint.y := getPcode('P' + onep).top + (getPcode('P' + onep).Height div 2);
              epoint.x := getPcode('P' + twop).Left + (getPcode('P' + twop).Width div 2);
              epoint.y := getPcode('P' + twop).top + (getPcode('P' + twop).Height div 2);
              self.ScrollBox1.Canvas.Line(bpoint, epoint);

              ResultPathEdgesRed.Add('P' + twop + 'P' + onep);
              ResultPathEdgesRed.Add('P' + onep + 'P' + twop);


              if onelength = '-1' then
              begin
                SQLQuery2.Close;
                SQLQuery2.SQL.Text :=
                  'select ' + truelength +
                  '  as len from edges as e where e.ecode=''' +
                  oneedge + ''' and dprid=' + dprid;
                SQLQuery2.Open;
                alllength := alllength + SQLQuery2.FieldByName('len').AsFloat;

              end;
              twop := 'P' + onep;
            end;
          end;

          NewString := NewString + #10#13 + 'NO.' + IntToStr(kkk) + ' : ' + onepath;
          ALLPATH_.Add(oneline);
        end;
      end;
    end;
  end;
  //////////////////////////////
  if PPP.Values['LightLine_Li_002_endp_AllPoints'] <> '' then
  begin
    tempList.Clear;
    tempList.Delimiter := ',';
    tempList.DelimitedText := PPP.Values['LightLine_Li_002_endp_AllPoints'];
    onepath := '';
    oneline := '';
    onep := '';
    twop := '';
    for jjj := 0 to tempList.Count - 1 do
    begin
      onep := tempList[jjj];
      if onep = '' then
        continue; //此BUG又烦人
      SQLQuery3.Close;
      SQLQuery3.SQL.Text := 'select *  from points  where dprid=' +
        dprid + ' and pcode="' + onep + '"';
      SQLQuery3.Open;

      onepname := SQLQuery3.FieldByName('pname').AsString;
      if onepath = '' then
        onepath := onepname
      else
        onepath := onepath + '-->' + onepname;
      if oneline = '' then
        oneline := onep
      else
        oneline := oneline + ',' + onep;
      if twop = '' then
        twop := onep
      else
      begin
        onep := stringreplace(onep, 'P', '', []);
        twop := stringreplace(twop, 'P', '', []);
        if StrToInt(onep) > StrToInt(twop) then
          oneedge := 'P' + twop + 'P' + onep //+'E'
        else
          oneedge := 'P' + onep + 'P' + twop {+'E'};
        //curc := self.FindComponent(oneedge);
        //if curc <> nil then
        //begin
        //end;
        ScrollBox1.Canvas.pen.color := clHighlight;//clred;
        ScrollBox1.Canvas.pen.Width := 4;
        bpoint.x := getPcode('P' + onep).Left + (getPcode('P' + onep).Width div 2);
        bpoint.y := getPcode('P' + onep).top + (getPcode('P' + onep).Height div 2);
        epoint.x := getPcode('P' + twop).Left + (getPcode('P' + twop).Width div 2);
        epoint.y := getPcode('P' + twop).top + (getPcode('P' + twop).Height div 2);
        self.ScrollBox1.Canvas.Line(bpoint, epoint);

        ResultPathEdgesRed.Add('P' + twop + 'P' + onep);
        ResultPathEdgesRed.Add('P' + onep + 'P' + twop);
        twop := 'P' + onep;
      end;
    end;

    NewString := NewString + #10#13 + 'NO.1' + ' : ' + onepath;
    ALLPATH_.Add(oneline);
  end;

  if isdebug = 0 then
  begin
    //SQLQuery1.Close;
    //SQLQuery1.SQL.Text := 'delete  from path ';
    //SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete from xp ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from xpp_li ';
    //'truncate xpp_li ';// 'delete  from xpp_li ';
    SQLQuery1.ExecSQL;

    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from edges_li ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete from xp_inner ';
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'delete  from islink ';
    SQLQuery1.ExecSQL;
  end;
  ProgressBar1.Visible := False;
  if alreadyLength = 0 then
  begin
    NewString := '总长度：' + format('%f', [alllength]) + #10#13 +
      '路径如下：(共' + IntToStr(AllPath.Count) + '条最短路径)' + NewString;
  end
  else if PPP.Values['LightLine_Li_002_endp_AllPoints'] = '' then
    NewString := '总长度：' + format('%f', [alreadyLength]) +
      #10#13 + '路径如下：(共' + IntToStr(kkk) + '条最短路径)' + NewString
  else
    NewString := '总长度：' + format('%f', [alreadyLength]) +
      #10#13 + '路径如下：(此算法目前只能求一条最短路径)' +
      NewString;
  ///////////////////////////////////////////////


  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from setting ';
  SQLQuery1.Open;
  SQLQuery1.Edit;
  SQLQuery1.FieldByName('FFF').AsString := 'OK';
  SQLQuery1.FieldByName('MEMO2').AsString := NewString;
  SQLQuery1.FieldByName('ALLLength').AsString := format('%f', [alllength]);
  SQLQuery1.FieldByName('ALLPATH').AsString := ALLPATH_.Text;
  SQLQuery1.Post;
  SQLQuery1.ApplyUpdates();

  FFF := 'OK';

  ALLPATH2 := ALLPATH_.Text;
  MEMO2 := NewString;
  ALLLength2 := format('%f', [alllength]);
  //self.Tag := 111;
  //ShowMessage('已成功保存，下次不用再运算。');

  showPathTree.PathTreeshow.initshow(NewString);
  {
   //当年直接显示已保存的上次结果在self.tag=111
   NewString := '';
   AllPath.Clear;
   AllPath.Text := AllPath2;
   ProgressBar1.Visible := True;
   ProgressBar1.Min := 0;
   ProgressBar1.Max := AllPath.Count;
   ProgressBar1.Position := 0;
   for iii := 0 to AllPath.Count - 1 do
   begin
     ProgressBar1.Position := ProgressBar1.Position + 1;
     tempList.Clear;
     tempList.Delimiter := ',';
     tempList.DelimitedText := AllPath[iii];
     onepath := '';

     onep := '';
     twop := '';
     for jjj := 0 to tempList.Count - 1 do
     begin
       onep := tempList[jjj];

       if twop = '' then
         twop := onep
       else
       begin
         onep := stringreplace(onep, 'P', '', []);
         twop := stringreplace(twop, 'P', '', []);
         if StrToInt(onep) > StrToInt(twop) then
           oneedge := 'P' + twop + 'P' + onep //+'E'
         else
           oneedge := 'P' + onep + 'P' + twop {+'E'};
         curc := self.FindComponent(oneedge);
         if curc <> nil then
         begin

         end;

         twop := 'P' + onep;
       end;
     end;
   end;
   ProgressBar1.Visible := False;
   //InputQueryLi('结果如下：', '以下内容可以复制：', MEMO2);
   msgshow.showMSG.initshow(memo2);
  }

end;




procedure TMain.Button2Click(Sender: TObject);
begin
  msgshow2.showMSG2.Show;
end;

procedure TMain.Button3Click(Sender: TObject);
begin
  if opendialog1.Execute then
  begin
    image1.Picture.LoadFromFile(opendialog1.FileName);
  end;
end;

procedure TMain.addOnePointClick(Sender: TObject);
var
  NewString: string;
  ClickedOK: boolean;
  I, maxindex: integer;
begin
  if dprid <> userid then
    ShowMessage('演示数据不可修改，用户数据才可以');
  if dprid = userid then
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from points where dprid=' + userid;
    SQLQuery1.Open;
    if GetRecordCount(SQLQuery1) > 0 then
    begin
      NewString := '';
      ClickedOK := InputQuery('是否要增加一个质点',
        '新的质点坐标x=500;y=500', NewString);
      if ClickedOK then
      begin
        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'select pcode from points where dprid=' +
          userid + ' order by id';
        SQLQuery2.Open;    //max(pcode)=P9  <>P20  not  GetRecordCount
        SQLQuery2.Last;
        maxindex := StrToInt(stringreplace(
          SQLQuery2.FieldByName('pcode').AsString, 'P', '', []));
        // not  GetRecordCount
        SQLQuery1.Append;
        SQLQuery1.FieldByName('dprid').AsString := dprid;
        SQLQuery1.FieldByName('pcode').AsString :=
          'P' + IntToStr(maxindex + 1);
        SQLQuery1.FieldByName('pname').AsString :=
          'P' + IntToStr(maxindex + 1);
        SQLQuery1.FieldByName('px').AsInteger := 500;
        SQLQuery1.FieldByName('py').AsInteger := 500;
        SQLQuery1.FieldByName('memo').AsString := NewString;
        SQLQuery1.Post;
        SQLQuery1.ApplyUpdates();
        SQLQuery3.Close;
        SQLQuery3.SQL.Text := 'select * from edges where dprid=' + userid;
        SQLQuery3.Open;

        SQLQuery2.Close;
        SQLQuery2.SQL.Text := 'select * from points where dprid=' +
          userid + '  order by id';
        SQLQuery2.Open;
        SQLQuery2.First;
        while not SQLQuery2.EOF do
        begin
          if SQLQuery2.FieldByName('pcode').AsString = SQLQuery1.FieldByName(
            'pcode').AsString then
          begin
            SQLQuery2.Next;
            continue;
          end;
          SQLQuery3.Append;
          SQLQuery3.FieldByName('dprid').AsString := userid;
          SQLQuery3.FieldByName('ecode').AsString :=
            SQLQuery2.FieldByName('pcode').AsString +
            SQLQuery1.FieldByName('pcode').AsString;
          SQLQuery3.FieldByName('pcode1').AsString :=
            SQLQuery2.FieldByName('pcode').AsString;
          SQLQuery3.FieldByName('pcode2').AsString :=
            SQLQuery1.FieldByName('pcode').AsString;
          SQLQuery3.FieldByName('pname1').AsString :=
            SQLQuery2.FieldByName('pname').AsString;
          SQLQuery3.FieldByName('pname2').AsString :=
            SQLQuery1.FieldByName('pname').AsString;
          SQLQuery3.FieldByName('Relation').AsBoolean := False;
          SQLQuery3.Post;
          SQLQuery3.ApplyUpdates();
          SQLQuery2.Next;
        end;
      end;
      sqltransaction1.Commit;
      sqltransaction1.Active := True;

    end;
  end;
  //sqltransaction1.Commit;
  //sqltransaction1.Active := True;
  refreshClick(nil);
  u_points.frmPoints.ShowModal;
  u_edges.frmEdges.Show;
  refreshClick(nil);
end;



procedure TMain.Button8Click(Sender: TObject);
begin
  u_edges.frmEdges.ShowModal;
  //u_edges.frmEdges.Show;
  refrash.Click;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i: integer;
begin
  //for i := shapeList.Count - 1 downto 0 do
  //begin
  //  tshape(shapeList.Items[i]^).Free;
  //end;
  //shapeList.Free;
  //for i := LineList.Count - 1 downto 0 do
  //begin
  //  tshape(LineList.Items[i]^).Free;
  //end;
  //LineList.Free;

  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      //if i=20 then
      //  application.ProcessMessages;
      if (shapeList.Items[i]) <> nil then
        if TGraphicControl(shapeList.Items[i]) is tshape then
        begin
          tshape(shapeList.Items[i]).Visible := False;
          tshape(shapeList.Items[i]).Free;
          shapeList.Items[i] := nil;
          shapeList.Count := shapeList.Count - 1;
          application.ProcessMessages;
        end;
    except
      application.ProcessMessages;
    end;
    application.ProcessMessages;
  end;
  shapeList.Free;
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      if (lineList.Items[i]) <> nil then
      begin
        tlinepoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  LineList.Free;

  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;
  TPsubpPointList.Free;
end;

procedure TMain.shiftEdgesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  s: string;
begin
  s := '先点击清空用户项目，再点击这个按钮，然后，可以在导入地图作底图后，按住shift键不放，鼠标点击来自动批量记录坐标点，可以反复多次。然后再点击这按钮，就可以自动生成批量坐标点了。';
  s := s + #10#13 +
    '双重标志开关：先点这个按钮，再按下shift键，这两个开关，然后，鼠标左键单点，可以一次记录起点，然后ctrl键，再多个点，可以多个末点，一点对多点来自动生成多条边也';
  if (Button = mbRight) then
    ShowMessage(s);
end;

procedure TMain.shiftPointsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  s: string;
begin
  s := '先点击清空用户项目，再点击这个按钮，然后，可以在导入地图作底图后，按住shift键不放，鼠标点击来自动批量记录坐标点，可以反复多次。然后再点击这按钮，就可以自动生成批量坐标点了。';
  s := s + #10#13 +
    '双重标志开关：先点这个按钮，再按下shift键，这两个开关，然后，鼠标左键单点，可以一次记录批量记录多个点击作为多个点坐标自动输入也';
  if (Button = mbRight) then
    ShowMessage(s);
end;

procedure TMain.updateMemoClick(Sender: TObject);
var
  pcode, varmemo: string;
begin
  pcode := tmenuitem(Sender).Hint;
  varmemo := memopoint.Hint;
  if inputquery(PChar(updatememo.Hint), '修改备注：', varmemo) then
  begin
    sqltemp.Close;
    sqltemp.SQL.Text := 'update points set memo=''' + varmemo +
      ''' where dprid=' + dprid + ' and pcode=''' + pcode + '''';
    sqltemp.ExecSQL;
    sqltransaction1.Commit;
  end;

end;

function TMain.islink(): boolean;
var
  curdirect, pcode1, pcode2: string;
  curi: integer;
  ado: TSQLQuery;
  i: integer;
begin

  Result := False;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from islink ';
  SQLQuery1.ExecSQL;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from islink ';
  SQLQuery1.Open;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from edges where Relation=True and dprid= ' + dprid;
  SQLQuery2.Open;
  SQLQuery2.First;
  self.ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := GetRecordCount(SQLQuery2);
  curi := SQLQuery2.RecordCount;
  ProgressBar1.Position := 0;
  curi := 0;
  while not SQLQuery2.EOF do
  begin
    curi := curi + 1;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    curdirect := SQLQuery2.FieldByName('direct').AsString;
    pcode1 := SQLQuery2.FieldByName('pcode1').AsString;
    pcode2 := SQLQuery2.FieldByName('pcode2').AsString;
    if ((pos('双向', curdirect) > 0) or (pos('无', curdirect) > 0)) then
    begin //这个常为空，草
      {
      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;
      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.Post;
      }
    end;
    //  curi:=  pos(ansistring(curdirect),ansistring('序号从小指向大'));  //If Substr is not found, Pos returns zero.If the substr located at the first place, then return 1;
    if (pos('序号从小指向大', curdirect) > 0) then
      //if SQLQuery2.FieldByName('direct').AsString = '序号从小指向大 -->' then
    begin

      SQLQuery1.Append;
      SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
      SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
      SQLQuery1.Post;

    end
    else
    begin
      // if (pos(curdirect,'序号从大指向小')>0) then
      if (pos('序号从大指向小', curdirect) > 0) then
        //if SQLQuery2.FieldByName('direct').AsString = '序号从大指向小 <--' then
      begin

        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end
      else //'双向或者无方向<-->' 这个常为空，草
      begin
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.Post;
        SQLQuery1.Append;
        SQLQuery1.FieldByName('pa').AsString := SQLQuery2.FieldByName('pcode2').AsString;
        SQLQuery1.FieldByName('pb').AsString := SQLQuery2.FieldByName('pcode1').AsString;
        SQLQuery1.Post;

      end;

    end;
    SQLQuery2.Next;
  end;
  //////////////BUG 2018-05-30
  ///////如果起点与终点有一个为孤立点，则必不连通的。
  //ProgressBar1.Visible:=false;

  curi := GetRecordCount(SQLQuery1);




  //if not (SQLQuery1.UpdateStatus  in [usUnmodified]) then
  SQLQuery1.ApplyUpdates();




  //self.SQLTransaction1.Commit;
  //self.SQLTransaction1.Active := True;




  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from islink where pa=''' + beginp +
 '''  or pb=''' + beginp + '''';
  SQLQuery2.Open;
  curi := GetRecordCount(SQLQuery2);
  if GetRecordCount(SQLQuery2) <= 0 then
    exit;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from islink where pa=''' + endp +
 '''  or pb=''' + endp + '''';
  SQLQuery2.Open;
  if GetRecordCount(SQLQuery2) <= 0 then
    exit;
  /////////////BUG 2018-05-30
  ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := 100;
  ProgressBar1.Position := 0;
  link(beginp);
  ProgressBar1.Visible := False;
  SQLQuery2.Close;
  SQLQuery2.SQL.Text := 'select * from islink where pa=''' + endp +
 '''  or pb=''' + endp + '''';
  SQLQuery2.Open;
  if GetRecordCount(SQLQuery2) > 0 then
    exit;

  Result := True;

end;

function TMain.link(vpa: string): boolean;
var
  ado: TSQLQuery;
  ttt: TStringList;
  i: integer;
begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  if ProgressBar1.Position = 100 then
    ProgressBar1.Position := 1;
  ado := TSQLQuery.Create(self);
  ado.Close;
  //ado.Connection := self.ADOConnection1;
  ado.DataBase := self.SQLConnector1;
  ado.Transaction := self.SQLTransaction1;
  ado.SQL.Text :=
    'select * from  islink as www   where pa=''' + vpa + '''';
  ado.Open;
  ado.Tag := 0;
  if GetRecordCount(ado) <= 0 then
    //找到BUG了，这里有BUG，没有发出边，可能是只接收边，也是连通的！！！
    //不是今日测试实例，真的找不到此BUG，算法，人生，BUG，烦。
  begin
    //ado.Free;
    //exit;
    ado.Tag := 0;
  end
  else
  begin
    ado.Tag := GetRecordCount(ado);
    ttt := TStringList.Create;
    ado.First;
    while not ado.EOF do
    begin
      if ado.FieldByName('pb').AsString <> beginp then //debug  ///OK
        ttt.Add(ado.FieldByName('pb').AsString);

      ado.Next;
    end;
  end;
  ado.Close;
  //ado.Connection := self.ADOConnection1;
  ado.DataBase := self.SQLConnector1;
  ado.Transaction := self.SQLTransaction1;
  ado.SQL.Text := 'update islink set pa=''' + beginp + ''',pb=''' +
    beginp + ''' where pa=''' + vpa + '''';
  ado.ExecSQL;
  ado.Close;
  //ado.Connection := self.ADOConnection1;
  ado.DataBase := self.SQLConnector1;
  ado.Transaction := self.SQLTransaction1;
  ado.SQL.Text := 'update islink set pb=''' + beginp + ''' where pb=''' + vpa + '''';
  ado.ExecSQL; ///BUG
  if ado.Tag > 0 then
  begin
    for i := 0 to ttt.Count - 1 do
    begin
      link(ttt[i]);

    end;
    ttt.Free;
  end;
  ado.Free;

end;

function TMain.AllTree(curp, treePath: string; SQLConnector: TSQLConnector;
  Transaction: TSQLTransaction): boolean;
var
  ado: TSQLQuery;
  i: integer;
  s: string;
begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  if ProgressBar1.Position = 100 then
    ProgressBar1.Position := 1;
  Result := False;
  if pos(',' + curp + ',', ',' + treePath + ',') > 0 then
  begin
    //treePath := treePath + ',' + curp;
    //AllPath.Add(treePath);
    Result := True;

  end
  else
  begin
    treePath := treePath + ',' + curp;
    if curp = beginp then
    begin
      //treePath:=treePath+','+curp
      if AllPath.IndexOf(treePath) = -1 then
        AllPath.Add(treePath);
      Result := True;

    end
    else
    begin
      ado := TSQLQuery.Create(self);
      ado.Close;
      //ado.Connection := self.ADOConnection1;
      ado.DataBase := SQLConnector;
      ado.Transaction := Transaction;
      //if not SQLConnector.Connected then
      //  SQLConnector.Connected := True;
      //if not Transaction.Active then
      //  Transaction.StartTransaction;

      ado.SQL.Text := 'select * from path as pathwww where pcode="' +
        curp + '"  order by id';
      ado.Open;
      //原来PATH表中，是由pcode指向subcode，如果想由subcode指向pcode,测试不行，这未知如何改动

      ado.First;
      //s := ado.FieldByName('pcode').AsString;
      while not ado.EOF do
      begin
        //AllTree(ado.fieldbyname('subpcode').AsString, treePath + ',' +
        //  ado.fieldbyname('subpcode').AsString);
        AllTree(ado.FieldByName('subpcode').AsString, treePath,
          SQLConnector, Transaction);
        ado.Next;
      end;
      ado.Close;
      ado.Free;
      Result := True;
    end;
  end;
end;

function TMain.getFromTo(ecodePP, dirPP, pcode1PP, pcode2PP: string;
  var fromPP, toPP: string): boolean;
var
  tmpADO: TSQLquery;
  status1, status2: integer;
begin
  fromPP := '';
  toPP := '';
  if pos('序号从小指向大', dirPP) > 0 then
  begin
    toPP := pcode2PP;
    fromPP := pcode1PP;
  end
  else
  begin
    if pos('序号从大指向小', dirPP) > 0 then
    begin
      toPP := pcode1PP;
      fromPP := pcode2PP;
    end
    else
    begin
      //fromPP := '';
      //toPP := '';
      //exit;

      ////////这是双向的，BUG在此产生！！！有单向后，这里不同样了，很复杂。
      tmpADO := TSQLquery.Create(self);
      tmpADO.Close;
      tmpADO.DataBase := SQLConnector1;
      tmpADO.Transaction := SQLTransaction1;

      tmpADO.SQL.Text := 'select * from  points where  dprid=' +
        dprid + '  and pcode=''' + pcode1PP + '''';
      tmpADO.Open;
      status1 := tmpADO.FieldByName('status').AsInteger;
      tmpADO.Close;
      tmpADO.SQL.Text := 'select * from  points where  dprid=' +
        dprid + '  and pcode=''' + pcode2PP + '''';
      tmpADO.Open;
      status2 := tmpADO.FieldByName('status').AsInteger;
      //P3=2,P4=1,P3-->P4 NOT,,,P4-->P3  OOKK
      if ((status1 = 2) or (status1 = 2)) then
      begin
        toPP := pcode2PP;
        fromPP := pcode1PP;
      end;

      if ((status2 = 2) or (status2 = 2)) then
      begin
        toPP := pcode1PP;
        fromPP := pcode2PP;
      end;
      if ((status1 = 2) and (status2 = 2)) then
      begin
        fromPP := '2';
        toPP := '2';
      end;
      if ((status1 = 1) and (status2 = 1)) then
      begin
        fromPP := '1';
        toPP := '1';
      end;
      tmpADO.Close;
      tmpADO.Free;
    end;
  end;
end;

function TMain.getFromTo_Li(ecodePP, dirPP, pcode1PP, pcode2PP: string;
  var fromPP, toPP: string; TTag: integer): boolean;
var
  ado: tSQLquery;
  status1, status2: integer;
begin
  fromPP := '';
  toPP := '';
  Result := False;
  if pos('序号从小指向大', dirPP) > 0 then
  begin
    toPP := pcode2PP;
    fromPP := pcode1PP;
    Result := True;
  end
  else
  begin
    if pos('序号从大指向小', dirPP) > 0 then
    begin
      toPP := pcode1PP;
      fromPP := pcode2PP;
      Result := True;
    end
    else
    begin
      //fromPP := '';
      //toPP := '';
      //exit;
      ado := tSQLquery.Create(self);
      ado.Close;
      ado.DataBase := SQLConnector1;
      ado.Transaction := SQLTransaction1;
      ado.SQL.Text := 'select * from xpp_li   where pcode="' + pcode1PP + '" ';
      ///and dprid=' + dprid;
      ado.Open;
      //  ado.fieldbyname('lengthDy100').AsInteger;
      if self.GetRecordCount(ado) > 0 then
        ppp.Values['dist_a'] := ado.FieldByName('dist').AsString;
      ado.Close;
      ado.DataBase := SQLConnector1;
      ado.Transaction := SQLTransaction1;
      ado.SQL.Text := 'select * from xpp_li   where pcode="' + pcode2PP + '" ';
      ///and dprid=' + dprid;
      ado.Open;
      if self.GetRecordCount(ado) > 0 then
        ppp.Values['dist_b'] := ado.FieldByName('dist').AsString;
      if ppp.Values['dist_a'] = '' then
      begin
        fromPP := pcode2PP;
        toPP := pcode1PP;
        Result := True;
      end;
      if ppp.Values['dist_b'] = '' then
      begin
        fromPP := pcode1PP;
        toPP := pcode2PP;
        Result := True;
      end;
      {
      if not result then
      begin
        if strtoint(ppp.Values['CCount_a']) > strtoint(ppp.Values['CCount_b']) then
        begin
          //fromPP := pcode2PP;
          //toPP := pcode1PP;
           fromPP := pcode1PP;
           toPP := pcode2PP;
          result := true;
        end;
        if strtoint(ppp.Values['CCount_a']) < strtoint(ppp.Values['CCount_b']) then
        begin
          fromPP := pcode2PP;
          toPP := pcode1PP;
          // fromPP := pcode1PP;
          // toPP := pcode2PP;
          result := true;

        end;
        if not result then
        begin

          if strtoint(ppp.Values['CCount_a']) = strtoint(ppp.Values['CCount_b']) then
          begin
            showmessage('数据出错，联系作者');

          end;
        end;
      end; }


      ado.Free;
    end;
  end;
end;



function TMain.getLong(pa, pb: string): integer;
var
  aa, bb, edgecode: string;
  a, b: integer;
  ado: TSQLQuery;
begin

  ado := TSQLQuery.Create(self);

  Result := -1;
  aa := stringreplace(pa, 'P', '', []);
  bb := stringreplace(pb, 'P', '', []);
  //if a=b
  a := StrToInt(aa);
  b := StrToInt(bb);
  if a < b then
    edgecode := pa + pb;

  if a > b then
    edgecode := pb + pa;
  ado.Close;
  ado.DataBase := SQLConnector1;
  ado.Transaction := SQLTransaction1;
  ado.SQL.Text := 'select * from edges  where ecode="' + edgecode +
    '" and dprid=' + dprid;
  ado.Open;
  if self.GetRecordCount(ado) > 0 then
    if ado.FieldByName('lengthDy100').IsNull then
      Result := 0
    else
      Result := ado.FieldByName('lengthDy100').AsInteger;
end;

function TMain.getECode(pa, pb: string): string;
var
  aa, bb: string;
  a, b: integer;
begin
  Result := '';
  aa := stringreplace(pa, 'P', '', []);
  bb := stringreplace(pb, 'P', '', []);
  //if a=b
  a := StrToInt(aa);
  b := StrToInt(bb);
  if a < b then
  begin
    Result := pa + pb;
  end;
  if a > b then
  begin
    Result := pb + pa;
  end;

end;



procedure TMain.refreshClick(Sender: TObject);
var
  i: integer;
  www: tshape;
  pcode1, pcode2: string;
  pcode1Shape, pcode2Shape: Tshape;
  pcode1Pointer, pcode2Pointer: Tpoint;
  pline: TlinePoint;//PlinePoint;//TlinePoint;
  psubp: TPsubpPoint;
  ccolor: string;
  ccclred: tcolor;
  tt: integer;
  curdirect: string;
begin
  //for i:=self.component.Count-1 to 0 do
  //for i:=self.ControlCount-1 to 0 do
  //begin
  //   if   self.Controls[i] is tshape then
  //   begin
  //       self.Controls[i].Free;
  //   end;

  //end;
  //if shapeList.Count > 0 then
  for i := shapeList.Count - 1 downto 0 do
  begin
    try
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).Visible := False;
        tshape(shapeList.Items[i]).Free;
        shapeList.Items[i] := nil;
        shapeList.Count := shapeList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  shapeList.Clear;
  for i := lineList.Count - 1 downto 0 do
  begin
    try
      //if tobject(shapeList.Items[i]) is TlinePoint then
      if lineList.Items[i] <> nil then
      begin
        TlinePoint(lineList.Items[i]).Free;
        lineList.Items[i] := nil;
        lineList.Count := lineList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  lineList.Clear;
  for i := TPsubpPointList.Count - 1 downto 0 do
  begin
    try
      if (TPsubpPointList.Items[i]) <> nil then
      begin
        TPsubpPoint(TPsubpPointList.Items[i]).Free;
        TPsubpPointList.Items[i] := nil;
        TPsubpPointList.Count := TPsubpPointList.Count - 1;
        application.ProcessMessages;
      end;
    except
    end;
    application.ProcessMessages;
  end;
  TPsubpPointList.Clear;
  //SQLTransaction1.Active := True;
  //self.ScrollBox1.Canvas.Destroy;
  self.ScrollBox1.Canvas.Brush.Color := ScrollBox1.Color;
  ScrollBox1.Canvas.FillRect(ScrollBox1.Canvas.ClipRect);
  image1.Refresh;
  image1.BringToFront;
  application.ProcessMessages;
  //self.ScrollBox1.Canvas.Create;
  application.ProcessMessages;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from points where dprid=' + dprid;
  self.SQLQuery1.Open;
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    // www := tshape.Create(nil);
    www := tshape.Create(self);
    www.Parent := ScrollBox1;
    www.Width := StrToInt(edit1.Text);
    www.Height := StrToInt(edit1.Text);
    www.Shape := stCircle;
    www.Left := SQLQuery1.FieldByName('px').AsInteger;
    www.top := SQLQuery1.FieldByName('py').AsInteger;
    www.Caption := SQLQuery1.FieldByName('pname').AsString;
    www.Name := SQLQuery1.FieldByName('pcode').AsString;
    www.Hint := SQLQuery1.FieldByName('pname').AsString + '权' +
      SQLQuery1.FieldByName('weightPoint').AsString;
    www.ShowHint := True;
    www.OnMouseDown := self.Shape1.OnMouseDown;
    www.OnMouseMove := self.Shape1.OnMouseMove;
    www.OnMouseUp := self.Shape1.OnMouseUp;
    www.OnPaint := self.Shape1.OnPaint;  //  www.Canvas.TextOut(0,0,www.Caption);
    // www.brush.Color := clred;
    //www.canvas.TextStyle:=[Graphics.TTextStyle.EndEllipsis];
    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption,www.canvas.TextStyle);
    //www.Canvas.TextOut(0,0,www.Caption);

    //www.Canvas.TextRect(www.ClientRect,www.Width div 2,www.Height div 2,www.Caption);
    ccolor := '5';
    if ccolor = '0' then
      ccclred := clwhite;
    if ccolor = '1' then
      ccclred := cllime;
    if ccolor = '2' then
      ccclred := clFuchsia;
    if ccolor = '3' then
      ccclred := clyellow;
    if ccolor = '4' then
      ccclred := clskyblue;
    if ccolor = '5' then
      ccclred := clsilver;
    www.Brush.Color := ccclred;
    if SQLQuery1.FieldByName('isbegin').AsInteger = 1 then
      www.Brush.Color := clred;
    if SQLQuery1.FieldByName('isend').AsInteger = 1 then
      www.Brush.Color := clyellow;
    shapeList.Add(www);
    //www.Tag:=;
    psubp := TPsubpPoint.Create(nil);
    psubp.Pcode := SQLQuery1.FieldByName('pcode').AsString;
    TPsubpPointList.Add(psubp);
    //tt:=gettickcount64;
    //while (gettickcount64-tt)<100 do
    //application.ProcessMessages;
    SQLQuery1.Next;
  end;



  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from edges where relation=1 and dprid=' + dprid;
  self.SQLQuery1.Open;
  SQLQuery1.First;
  ScrollBox1.Canvas.pen.color := clgrayText;
  ScrollBox1.Canvas.pen.Width := 2;
  while not SQLQuery1.EOF do
  begin
    ///pline    //init???memory???
    pline := TlinePoint.Create(nil);
    pcode1 := SQLQuery1.FieldByName('pcode1').AsString;
    pcode2 := SQLQuery1.FieldByName('pcode2').AsString;
    curdirect := SQLQuery1.FieldByName('direct').AsString;
    pcode1Shape := getpcode(pcode1);
    pcode2Shape := getpcode(pcode2);
    pcode1Pointer.x := pcode1Shape.Left + (pcode1Shape.Width div 2);
    pcode1Pointer.y := pcode1Shape.top + (pcode1Shape.Height div 2);
    pcode2Pointer.x := pcode2Shape.Left + (pcode2Shape.Width div 2);
    pcode2Pointer.y := pcode2Shape.top + (pcode2Shape.Height div 2);
    //self.Image1.Canvas.Line(pcode1Pointer,pcode2Pointer);

    if ResultPathEdgesRed.IndexOf(pcode1 + pcode2) >= 0 then
    begin
      ScrollBox1.Canvas.pen.color := clHighlight;//clred;
      ScrollBox1.Canvas.pen.Width := 4;
    end
    else
    begin
      ScrollBox1.Canvas.pen.color := clgrayText;
      ScrollBox1.Canvas.pen.Width := 2;
    end;


    self.ScrollBox1.Canvas.Line(pcode1Pointer, pcode2Pointer);  //ok


    //pline^.beginPcode := pcode1;
    //pline^.endPcode := pcode2;
    //pline^.direction := 'from1to2';
    //pline^.beginPoint := pcode1Pointer;
    //pline^.endPoint := pcode2Pointer;
    //linelist.Add(pline);
    pline.beginPcode := pcode1;
    pline.endPcode := pcode2;
    pline.direction := 'from1to2';
    pline.beginPoint := pcode1Pointer;
    pline.endPoint := pcode2Pointer;
    pline.weightLine := SQLQuery1.FieldByName('weightLine').AsString;
    linelist.Add(pline);
    //linelist.Add(^pline);
    //shapeList.Add(www);

    //www.Tag:=;
    //drawarrow
    //if curdirect = '序号从小指向大 --->' then    //    序号从小指向大 --->
    if (pos('序号从小指向大', curdirect) > 0) then
    begin
      drawarrow(pline.beginPoint, pline.endPoint);
    end;
    if (pos('序号从大指向小', curdirect) > 0) then
      //if curdirect = '序号从大指向小 <---' then    //   序号从大指向小 <---
    begin
      drawarrow(pline.endPoint, pline.beginPoint);
    end;
    if (pos('双向', curdirect) > 0) then
      if (pos('无向', curdirect) <= 0) then
        if (pos('无方向', curdirect) <= 0) then
          //if curdirect = '双向  <---->' then    //   双向  <---->
        begin
          drawarrow(pline.beginPoint, pline.endPoint);
          drawarrow(pline.endPoint, pline.beginPoint);
        end;
    if (pos('无向', curdirect) > 0) then
      //if curdirect = '无向   ------' then    //   无向   ------
    begin
      ///
    end;

    for i := TPsubpPointList.Count - 1 downto 0 do
    begin
      try
        if (TPsubpPointList.Items[i]) <> nil then
        begin
          if TPsubpPoint(TPsubpPointList.Items[i]).Pcode = pcode1 then
          begin
            if TPsubpPoint(TPsubpPointList.Items[i]).subPcode.IndexOf(pcode2) = -1 then
              TPsubpPoint(TPsubpPointList.Items[i]).subPcode.add(pcode2);
          end;
          if TPsubpPoint(TPsubpPointList.Items[i]).Pcode = pcode2 then
          begin
            if TPsubpPoint(TPsubpPointList.Items[i]).subPcode.IndexOf(pcode1) = -1 then
              TPsubpPoint(TPsubpPointList.Items[i]).subPcode.add(pcode1);
          end;
        end;
      except
      end;
      application.ProcessMessages;
    end;
    SQLQuery1.Next;
  end;
  ScrollBox1.Canvas.pen.color := clblack;
  ScrollBox1.Canvas.pen.Width := 1;
  SQLQuery1.Close;
  for i := shapeList.Count - 1 downto 0 do
    if shapeList.Items[i] <> nil then
      if TGraphicControl(shapeList.Items[i]) is tshape then
      begin
        tshape(shapeList.Items[i]).BringToFront;
        tshape(shapeList.Items[i]).OnPaint(tshape(shapeList.Items[i]));
        //refreshoneP('1',tshape(shapeList.Items[i]).name,0,clMoneyGreen);
        // Application.ProcessMessages;
      end;
  // refreshoneP();
  //   refreshoneP(sqltemp.FieldByName('fc').AsString, sqltemp.FieldByName('pcode')
  //  .AsString, 0, clMoneyGreen);
end;

procedure TMain.emptyfreeClick(Sender: TObject);
begin
  if not RadioButton2.Checked then
  begin
    ShowMessage('请先选择用户项目，而不是演示项目');
    exit;
  end;
  if Application.MessageBox('是否清空用户项目数据？',
    '是否继续？', MB_YESNO) <> idYes then
    exit;
  SQLTransaction1.Active := True;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from points where dprid=' + dprid;
  SQLQuery1.ExecSQL;//SQLTransaction1.Commit;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'delete  from edges where dprid=' + dprid + '';
  SQLQuery1.ExecSQL;//SQLTransaction1.Commit;
  // SQLQuery1.ApplyUpdates();
  SQLTransaction1.Commit;
  SQLTransaction1.Active := True;
  FFF := '';
  self.Tag := 0;
  //refreshhClick(nil);
  ShowMessage('已清空用户项目数据！');
end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  AllPath.Free;
  tempList.Free;
  PPP.Free;
  shiftPointsL.Free;
  shiftEdgesL.Free;
  LabelsCaptions.Free;
  ResultPathEdgesRed.Free;
end;

{ TPsubpPoint }

constructor TPsubpPoint.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  subPcode := TStringList.Create;
end;

destructor TPsubpPoint.Destroy;
var
  i: integer;
begin
  subPcode.Free;
  subPcode := nil;
  inherited Destroy;

end;

end.
