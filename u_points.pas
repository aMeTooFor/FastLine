unit U_points;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, SQLite3Conn, Forms, Controls, Graphics, Dialogs,
  DBGrids, StdCtrls, Buttons;

type

  { TfrmPoints }

  TfrmPoints = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SQLConnector1: TSQLConnector;
    SQLQuery1weightPoint: TFloatField;
    SQLtemp: TSQLQuery;
    SQLQuery1: TSQLQuery;
    SQLQuery1dprid: TLongintField;
    SQLQuery1id: TAutoIncField;
    SQLQuery1isbegin: TLongintField;
    SQLQuery1isend: TLongintField;
    SQLQuery1memo: TMemoField;
    SQLQuery1pcode: TMemoField;
    SQLQuery1pname: TMemoField;
    SQLQuery1px: TLongintField;
    SQLQuery1py: TLongintField;
    SQLQuery1status: TLongintField;
    SQLTransaction1: TSQLTransaction;
    //procedure SQLQuery1memoGetText(Sender: TField; var aText: string;
    //  DisplayText: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource1UpdateData(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SQLQuery1AfterOpen(DataSet: TDataSet);
    procedure SQLQuery1AfterPost(DataSet: TDataSet);
    procedure SQLQuery1isbeginChange(Sender: TField);
    procedure SQLQuery1isendChange(Sender: TField);
    //procedure SQLQuery1memoSetText(Sender: TField; const aText: string);
    //procedure SQLQuery1pcodeGetText(Sender: TField; var aText: string;
    //  DisplayText: Boolean);
    //procedure SQLQuery1pnameGetText(Sender: TField; var aText: string;
    //  DisplayText: Boolean);
  private

  public

  end;

var
  frmPoints: TfrmPoints;

implementation

uses fl, u_edges;

  {$R *.lfm}

  { TfrmPoints }

  //procedure TfrmPoints.SQLQuery1pcodeGetText(Sender: TField; var aText: string;
  //  DisplayText: Boolean);
  //begin
  //  //aText:=utf8tostring(sender.AsString);
  //  aText:=Utf8ToAnsi(sender.AsString);
  //  DisplayText:=true;
  //end;

  //procedure TfrmPoints.SQLQuery1memoGetText(Sender: TField; var aText: string;
  //  DisplayText: Boolean);
  //begin
  //    //aText:=utf8tostring(sender.AsString);
  // // aText:=Utf8ToAnsi(sender.AsString);
  // // DisplayText:=true;
  //end;

  //procedure TfrmPoints.SQLQuery1memoSetText(Sender: TField; const aText: string);
  //begin
  //     //Sender.DataSet.Edit;
  //     ////Sender.AsString:=aText;
  //     //TSQLquery(Sender.DataSet).FieldByName(sender.FieldName).AsString:=aText;
  //     //Sender.DataSet.Post;
  //     //TSQLquery(Sender.DataSet).ApplyUpdates();
  //     //TSQLTransaction(TSQLquery(Sender.DataSet).Transaction).Commit;
  //     //TSQLTransaction(TSQLquery(Sender.DataSet).Transaction).Active:=true;
  //end;

procedure TfrmPoints.DataSource1UpdateData(Sender: TObject);
begin
  //self.SQLQuery1.ApplyUpdates();
  //  self.SQLTransaction1.Commit;
  //self.SQLTransaction1.Active:=true;
end;

procedure TfrmPoints.Button1Click(Sender: TObject);
begin
  //   self.SQLQuery1.ApplyUpdates();
  self.SQLTransaction1.Commit;
  self.SQLTransaction1.Active := True;
  Close;
end;

procedure TfrmPoints.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //SQLQuery1.ApplyUpdates();
end;

procedure TfrmPoints.DBGrid1EditButtonClick(Sender: TObject);
begin
  //TSQLquery(DBGrid1.DataSource.DataSet).ApplyUpdates;
  //TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Commit;
  ////  TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Active:=true;
  //self.SQLQuery1.ApplyUpdates();
  // self.SQLTransaction1.Commit;

end;

procedure TfrmPoints.DBGrid1TitleClick(Column: TColumn);
var
  fn, id: string;
  i: integer;
begin
  if SQLQuery1.Active then
  begin
    fn := Column.FieldName;
    id := SQLQuery1.FieldByName('id').AsString;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from points where dprid=' +
      Fl.dprid + ' order by  ' + fn;
    if uppercase(fn) = uppercase('pcode') then
      SQLQuery1.SQL.Text := 'select * from points where dprid=' +
        Fl.dprid + ' order by  substr(replace(pcode,"P","0000000000"),-6)';
    //百度：sqlite3没有left/right/mid，只有substr/substring,左为1，中为2，右为-1
    SQLQuery1.Open;
    SQLQuery1.DisableControls;
    SQLQuery1.First;
    //SQLQuery1.RecordCount;
    //SQLQuery1.RecordSize;
    //SQLQuery1.RefreshSQL;
    while not SQLQuery1.EOF do
    begin
      if SQLQuery1.FieldByName('id').AsString = id then
        break;
      SQLQuery1.Next;
    end;
    SQLQuery1.EnableControls;

    for i := 0 to dbgrid1.Columns.Count - 1 do
    begin
      if dbgrid1.Columns[i].Visible then
      begin
        dbgrid1.Columns[i].Title.Caption :=
          stringreplace(dbgrid1.Columns[i].Title.Caption, '↑', '', []);
      end;    //↑  ^
    end;
    Column.Title.Caption := Column.Title.Caption + ' ↑';

  end;
end;

procedure TfrmPoints.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //TSQLquery(DBGrid1.DataSource.DataSet).ApplyUpdates;
  //TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Commit;
  //  TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Active:=true;

end;

procedure TfrmPoints.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i, j: integer;
begin
  //   self.SQLQuery1.ApplyUpdates();
  //self.SQLTransaction1.Commit;
  //self.SQLTransaction1.Active:=true;

  //self.SQLTransaction1.Active := True;

  CanClose := True;
  i := 0;
  j := 0;
  SQLQuery1.First;
  while not SQLQuery1.EOF do
  begin
    if SQLQuery1.FieldByName('isbegin').AsInteger = 1 then
      i := i + 1;
    if SQLQuery1.FieldByName('isend').AsInteger = 1 then
      j := j + 1;
    if i > 1 then
    begin
      ShowMessage('检测到多于一点被选作起始点，请只选一点作起始点');
      CanClose := False;
      break;
    end;
    if j > 1 then
    begin
      ShowMessage('检测到多于一点被选作目的地，请只选一点作目的地');
      CanClose := False;
      break;
    end;
    SQLQuery1.Next;
  end;

  if CanClose then
  begin
    fl.main.SQLConnector1.connected := False;
    fl.main.SQLTransaction1.Active := True;
    frmpoints.SQLConnector1.connected := False;
    frmpoints.SQLTransaction1.Active := False;
    //frmedges.SQLConnector1.connected=false;
    //frmedges.SQLTransaction1.Active:=false;
  end;
end;

procedure TfrmPoints.FormShow(Sender: TObject);
var
  www:string;
begin
  main.SQLConnector1.connected := False;
  main.SQLTransaction1.Active := False;
  //frmpoints.SQLConnector1.connected=false;
  //frmpoints.SQLTransaction1.Active:=false;
  frmedges.SQLConnector1.connected := False;
  frmedges.SQLTransaction1.Active := False;
  application.ProcessMessages;
  SQLTransaction1.Active := True;
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select count(1) as ccc  from points where dprid=' +
    Fl.dprid ;
  //www:= SQLtemp.SQL.Text;
  SQLtemp.Open;
  self.Label1.Caption := '记录总数：' + SQLtemp.FieldByName('ccc').AsString;
  SQLtemp.Close;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from points where dprid=' + Fl.dprid + ' order by id ';
  self.SQLQuery1.Open;

end;

procedure TfrmPoints.SpeedButton1Click(Sender: TObject);
var
  www: tbookmark;
begin
  if SQLQuery1.Active then
  begin
    www := SQLQuery1.GetBookmark;
    SQLQuery1.DisableControls;
    SQLQuery1.First;
    //SQLQuery1.RecordCount;
    //SQLQuery1.RecordSize;
    //SQLQuery1.RefreshSQL;
    while not SQLQuery1.EOF do
    begin
      if SQLQuery1.FieldByName(ComboBox1.Text).AsString = edit1.Text then
        break;
      SQLQuery1.Next;
    end;
    if SQLQuery1.EOF then
      SQLQuery1.GotoBookmark(www);
    SQLQuery1.EnableControls;
  end;
end;

procedure TfrmPoints.SQLQuery1AfterOpen(DataSet: TDataSet);
begin
  //self.Label1.Caption:='记录数：'+inttostr(SQLQuery1.RecordCount);

  //self.Label2.Caption:='记录数：'+inttostr(SQLQuery1.RecordSize);

end;

procedure TfrmPoints.SQLQuery1AfterPost(DataSet: TDataSet);
begin
  //SQLQuery1.ApplyUpdates();
end;

procedure TfrmPoints.SQLQuery1isbeginChange(Sender: TField);
var
  id: string;
  w:TBookmark;
begin
  if  TField(Sender).AsInteger=0 then exit;
  w:=SQLQuery1.GetBookmark;
  //dbgrid1.;
  id:=SQLQuery1.FieldByName('id').AsString;
  SQLQuery1.DisableControls;
  SQLQuery1.First;
  //SQLQuery1.Edit;
  while not SQLQuery1.EOF do
  begin
    if  SQLQuery1.FieldByName('id').AsString<>id then
    if  SQLQuery1.FieldByName('isbegin').AsInteger<>0 then
    begin
       SQLQuery1.Edit;
       SQLQuery1.FieldByName('isbegin').AsInteger:=0;
       SQLQuery1.Post;
    end;
    SQLQuery1.Next;
  end;
  //SQLQuery1.Post;
  SQLQuery1.Locate('id',id,[loCaseInsensitive,loPartialKey]) ;
  SQLQuery1.EnableControls;
  SQLQuery1.GotoBookmark(w);

end;

procedure TfrmPoints.SQLQuery1isendChange(Sender: TField);
var
  id: string;
  w:TBookmark;
begin
  if  TField(Sender).AsInteger=0 then exit;
  w:=SQLQuery1.GetBookmark;
  //dbgrid1.;
  id:=SQLQuery1.FieldByName('id').AsString;
  SQLQuery1.DisableControls;
  SQLQuery1.First;
  //SQLQuery1.Edit;
  while not SQLQuery1.EOF do
  begin
    if  SQLQuery1.FieldByName('id').AsString<>id then
    if  SQLQuery1.FieldByName('isend').AsInteger<>0 then
    begin
       SQLQuery1.Edit;
       SQLQuery1.FieldByName('isend').AsInteger:=0;
       SQLQuery1.Post;
    end;
    SQLQuery1.Next;
  end;
  //SQLQuery1.Post;
  SQLQuery1.Locate('id',id,[loCaseInsensitive,loPartialKey]) ;
  SQLQuery1.EnableControls;
  SQLQuery1.GotoBookmark(w);

end;

//procedure TfrmPoints.SQLQuery1pnameGetText(Sender: TField; var aText: string;
//  DisplayText: Boolean);
//begin
//    //aText:=utf8tostring(sender.AsString);
//  aText:=Utf8ToAnsi(sender.AsString);
//  DisplayText:=true;
//end;

end.
