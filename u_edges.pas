unit U_edges;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, SQLite3Conn, Forms, Controls, Graphics, Dialogs,
  DBGrids, StdCtrls, Buttons;

type

  { TfrmEdges }

  TfrmEdges = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery1direct: TBlobField;
    SQLQuery1dprid: TLongintField;
    SQLQuery1ecode: TBlobField;
    SQLQuery1id: TAutoIncField;
    SQLQuery1length: TFloatField;
    SQLQuery1lengthcal: TFloatField;
    SQLQuery1lengthdy: TFloatField;
    SQLQuery1memo: TMemoField;
    SQLQuery1pcode1: TBlobField;
    SQLQuery1pcode2: TBlobField;
    SQLQuery1pname1: TBlobField;
    SQLQuery1pname2: TBlobField;
    SQLQuery1relation: TBooleanField;
    SQLQuery1weightLine: TFloatField;
    SQLtemp: TSQLQuery;
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
    procedure SQLQuery111AfterPost(DataSet: TDataSet);
    //procedure SQLQuery1memoSetText(Sender: TField; const aText: string);
    //procedure SQLQuery1pcodeGetText(Sender: TField; var aText: string;
    //  DisplayText: Boolean);
    //procedure SQLQuery1pnameGetText(Sender: TField; var aText: string;
    //  DisplayText: Boolean);

  private

  public

  end;

var
  frmEdges: TfrmEdges;

implementation

uses fl,U_points;

  {$R *.lfm}

  { TfrmEdges }

  //procedure TfrmEdges.SQLQuery1pcodeGetText(Sender: TField; var aText: string;
  //  DisplayText: Boolean);
  //begin
  //  //aText:=utf8tostring(sender.AsString);
  //  aText:=Utf8ToAnsi(sender.AsString);
  //  DisplayText:=true;
  //end;

  //procedure TfrmEdges.SQLQuery1memoGetText(Sender: TField; var aText: string;
  //  DisplayText: Boolean);
  //begin
  //    //aText:=utf8tostring(sender.AsString);
  // // aText:=Utf8ToAnsi(sender.AsString);
  // // DisplayText:=true;
  //end;

  //procedure TfrmEdges.SQLQuery1memoSetText(Sender: TField; const aText: string);
  //begin
  //     //Sender.DataSet.Edit;
  //     ////Sender.AsString:=aText;
  //     //TSQLquery(Sender.DataSet).FieldByName(sender.FieldName).AsString:=aText;
  //     //Sender.DataSet.Post;
  //     //TSQLquery(Sender.DataSet).ApplyUpdates();
  //     //TSQLTransaction(TSQLquery(Sender.DataSet).Transaction).Commit;
  //     //TSQLTransaction(TSQLquery(Sender.DataSet).Transaction).Active:=true;
  //end;

procedure TfrmEdges.DataSource1UpdateData(Sender: TObject);
begin
  //self.SQLQuery1.ApplyUpdates();
  //  self.SQLTransaction1.Commit;
  //self.SQLTransaction1.Active:=true;
end;

procedure TfrmEdges.Button1Click(Sender: TObject);
begin
  //   self.SQLQuery1.ApplyUpdates();
  self.SQLTransaction1.Commit;
  self.SQLTransaction1.Active := True;
  close;
end;

procedure TfrmEdges.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //SQLQuery111.ApplyUpdates();
end;

procedure TfrmEdges.DBGrid1EditButtonClick(Sender: TObject);
begin
  //TSQLquery(DBGrid1.DataSource.DataSet).ApplyUpdates;
  //TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Commit;
  ////  TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Active:=true;
  //self.SQLQuery1.ApplyUpdates();
  // self.SQLTransaction1.Commit;

end;

procedure TfrmEdges.DBGrid1TitleClick(Column: TColumn);
var
  fn, id: string;
  i:integer;
begin
  if SQLQuery1.Active then
  begin
    fn := Column.FieldName;
    id := SQLQuery1.FieldByName('id').AsString;
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from edges where dprid=' +
      Fl.dprid + ' order by  ' + fn;
   if uppercase(fn)=uppercase('ecode') then
    SQLQuery1.SQL.Text := 'select * from edges where dprid=' +
      Fl.dprid + ' order by  substr(replace(pcode1,"P","0000000000"),-6),substr(replace(pcode2,"P","0000000000"),-6)' ;
    //百度：sqlite3没有left/right/mid，只有substr/substring,左为1，中为2，右为-1


    SQLQuery1.Open;
    SQLQuery1.DisableControls;
    SQLQuery1.First;
    //SQLQuery111.RecordCount;
    //SQLQuery111.RecordSize;
    //SQLQuery111.RefreshSQL;
    while not SQLQuery1.EOF do
    begin
      if SQLQuery1.FieldByName('id').AsString = id then
        break;
      SQLQuery1.Next;
    end;
    SQLQuery1.EnableControls;

    for i:=0 to dbgrid1.Columns.Count-1 do
    begin
       if  dbgrid1.Columns[i].Visible then
       begin
          dbgrid1.Columns[i].Title.Caption:=stringreplace(dbgrid1.Columns[i].Title.Caption,' ↑','',[]);
       end;    //↑  ^
    end;
    Column.Title.Caption:=Column.Title.Caption+' ↑' ;

  end;
end;

procedure TfrmEdges.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //TSQLquery(DBGrid1.DataSource.DataSet).ApplyUpdates;
  //TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Commit;
  //  TSQLTransaction(TSQLquery(DBGrid1.DataSource.DataSet).Transaction).Active:=true;

end;

procedure TfrmEdges.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  //   self.SQLQuery1.ApplyUpdates();
  //self.SQLTransaction1.Commit;
  //self.SQLTransaction1.Active:=true;

  //self.SQLTransaction1.Active := True;
  main.SQLConnector1.connected := True;
  main.SQLTransaction1.Active := True;
  //frmpoints.SQLConnector1.connected:=false;
  //frmpoints.SQLTransaction1.Active:=false;
  frmedges.SQLConnector1.connected := False;
  frmedges.SQLTransaction1.Active := False;
end;

procedure TfrmEdges.FormShow(Sender: TObject);
begin
  main.SQLConnector1.connected := False;
  main.SQLTransaction1.Active := False;
  frmpoints.SQLConnector1.connected := False;
  frmpoints.SQLTransaction1.Active := False;
  //frmedges.SQLConnector1.connected:=false;
  //frmedges.SQLTransaction1.Active:=false;
  application.ProcessMessages;
  SQLTransaction1.Active := True;
  SQLtemp.Close;
  SQLtemp.SQL.Text := 'select count(1) as ccc  from edges where dprid=' + Fl.dprid;
  SQLtemp.Open;
  self.Label1.Caption:='记录总数：'+SQLtemp.FieldByName('ccc').AsString;
  SQLtemp.Close;

  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from edges where dprid=' + Fl.dprid+' order by id';
  self.SQLQuery1.Open;

end;

procedure TfrmEdges.SpeedButton1Click(Sender: TObject);
var
  www: tbookmark;
begin
  if SQLQuery1.Active then
  begin
    www := SQLQuery1.GetBookmark;
    SQLQuery1.DisableControls;
    SQLQuery1.First;
    //SQLQuery111.RecordCount;
    //SQLQuery111.RecordSize;
    //SQLQuery111.RefreshSQL;
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

procedure TfrmEdges.SQLQuery111AfterPost(DataSet: TDataSet);
begin
  //SQLQuery111.ApplyUpdates();
end;



//procedure TfrmEdges.SQLQuery1pnameGetText(Sender: TField; var aText: string;
//  DisplayText: Boolean);
//begin
//    //aText:=utf8tostring(sender.AsString);
//  aText:=Utf8ToAnsi(sender.AsString);
//  DisplayText:=true;
//end;

end.
