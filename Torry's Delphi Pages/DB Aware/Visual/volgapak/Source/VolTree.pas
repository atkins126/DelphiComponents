unit VolTree;

interface

uses
  Windows, SysUtils, Classes, Controls, ComCtrls, DB,
  ExtCtrls;

type
  TGetNewIDEvent =
    function(Sender: TObject; Table: TDataSet): string of object;

  {TreeView, ���������� �� ������� ������������ ���������}
  TVolgaTreeView = class(TTreeView)
  private
    FUniqueField: string;
    FIndexField: string;
    FRootCaption: string;
    FLevelField: string;
    FTextField: string;
    FTable: TDataSet;
    ptrUID: PShortString;
    FAfterChangeSelectedNode: TNotifyEvent;
    FBeforeDeleteNode: TNotifyEvent;
    FGetNewID: TGetNewIDEvent;
    FConnected: Boolean;
    FScrollTableWithTree: Boolean;
    procedure SetTable(const Value: TDataSet);
    procedure SetIndexField(const Value: string);
    procedure SetLevelField(const Value: string);
    procedure SetRootCaption(const Value: string);
    procedure SetTextField(const Value: string);
    procedure SetUniqueField(const Value: string);
    procedure VolgaTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure VolgaTreeViewEdited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure VolgaTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure VolgaTreeViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    function GetIsRoot: Boolean;
    procedure SetConnected(const Value: Boolean);
    procedure SetScrollTableWithTree(const Value: Boolean);
    function GetRootSelected: Boolean;
    function GetSelectedID: string;
    { Private declarations }
  protected
    { Protected declarations }
    procedure ChangeSelectedNode; dynamic;
    procedure DoBeforeDeleteNode; dynamic;
    function GetNewID: string; virtual;
    property OnChange;
    property OnEdited;
    property Items;
    property OnDragDrop;
    property OnDragOver;
    property IsRoot: Boolean read GetIsRoot;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure NewNode;
    procedure SaveTreeToTable;
    procedure RestoreTreeFromTable;
    procedure DeleteNode;
    procedure EditNode;
    function GetListChildrenID: string;
    function NodeID(Node: TTreeNode): string;
    function GetFullNodeCaption(Node: TTreeNode; Delimiter: char): string;
    function GetFullRecCaption(UniqueID: string; Delimiter: char): string;
    function GetNodeLastChildIndex(Node: TTreeNode): longint;
    function GetRecLastChildIndex(UniqueID: string): longint;
    function FindNodeByUniqueID(UniqueID: string): TTreeNode;
    procedure SynchronizeTreeWithTable(UniqueID: string);
    procedure SynchronizeTableWithTree(Node: TTreeNode);
    property RootSelected: Boolean read GetRootSelected;
    property SelectedID: string read GetSelectedID;
  published
    { Published declarations }
    property Connected: Boolean read FConnected write SetConnected;
    property Table: TDataSet read FTable write SetTable;
    property IndexField: string read FIndexField write SetIndexField;
    property LevelField: string read FLevelField write SetLevelField;
    property RootCaption: string read FRootCaption write SetRootCaption;
    property TextField: string read FTextField write SetTextField;
    property UniqueField: string read FUniqueField write SetUniqueField;
    property AfterChangeSelectedNode: TNotifyEvent read FAfterChangeSelectedNode write
      FAfterChangeSelectedNode;
    property BeforeDeleteNode: TNotifyEvent read FBeforeDeleteNode write
      FBeforeDeleteNode;
    property GetNewUniqueValue: TGetNewIDEvent read FGetNewID write FGetNewID;
    property ScrollTableWithTree: Boolean read FScrollTableWithTree write
      SetScrollTableWithTree;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Volga', [TVolgaTreeView]);
end;

{ TVolgaTreeView }

constructor TVolgaTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRootCaption := '';
  FUniqueField := '';
  FIndexField := '';
  FRootCaption := '';
  FLevelField := '';
  FTextField := '';
  HotTrack := true;
  DragMode := dmAutomatic;
  SortType := stNone;
  OnChange := VolgaTreeViewChange;
  OnEdited := VolgaTreeViewEdited;
  OnDragDrop := VolgaTreeViewDragDrop;
  OnDragOver := VolgaTreeViewDragOver;
end;

destructor TVolgaTreeView.Destroy;
var i, istart: integer;
begin
  {������������ ������ �� UniqueID}
  if IsRoot then
    istart := 1
  else
    istart := 0;
  for i := istart to Items.Count - 1 do
    Dispose(Items[i].Data);
  inherited Destroy;
end;

procedure TVolgaTreeView.ChangeSelectedNode;
begin
  if assigned(FAfterChangeSelectedNode) then
    FAfterChangeSelectedNode(Self);
end;

function TVolgaTreeView.GetNewID: string;
begin                                   {�������� �������� ����.���� ��� ����� ������}
  if Assigned(FGetNewID) then
    Result := FGetNewID(self, Table)
  else
    Result := '0';
end;

procedure TVolgaTreeView.DeleteNode;
begin
  if Selected = nil then Exit;
  if IsRoot and (Selected.AbsoluteIndex = 0) then Exit;
  DoBeforeDeleteNode;                   {��������� �� ������� ������� � �������� �������!}
  {�� ��������� ������ �� ������� Children}
  {�������� �� ������ � ��}
  if not Selected.HasChildren then
  begin
    {�������������, ���� �������� ���.������ ������ �����}
    if Connected then
    begin
      SynchronizeTableWithTree(Selected);
      try Table.Delete;
      except;
      end;
    end;
    Selected.Delete;
  end;
end;

procedure TVolgaTreeView.DoBeforeDeleteNode;
begin
  if assigned(FBeforeDeleteNode) then
    FBeforeDeleteNode(Self);
end;

procedure TVolgaTreeView.VolgaTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  if Connected and FScrollTableWithTree then
  begin
    {������������� �� � ������� ��� ����� Selected}
    SynchronizeTableWithTree(Selected);
  end;
  ChangeSelectedNode;
end;

procedure TVolgaTreeView.VolgaTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var AnItem: TTreeNode;
  AttachMode: TNodeAttachMode;
  HT: THitTests;
  NoMove: Boolean;
begin
  {��������� ������� �� ������ ����� � "������"}
  if Selected = nil then Exit;
  if (Table = nil) or not Table.Active then Exit;
  HT := GetHitTestInfoAt(X, Y);
  AnItem := GetNodeAt(X, Y);
  AttachMode := naAdd;                  {�������� � �����}
  NoMove := false;                      {����� ��������}
  if (htOnItem in HT) or (htOnIcon in HT) or
    (htOnButton in HT) or (htOnLabel in HT) then
    AttachMode := naAddChild            {�������� ��� Child}
  else if htNowhere in HT then          {����� ����}
    if IsRoot then
    begin
      AttachMode := naAddChild;
      AnItem := Items.GetFirstNode;     {Root}
    end
    else
      AttachMode := naAdd               {�������� � �����}
  else if htOnIndent in HT then
    AttachMode := naInsert              {�������� �����}
  else
    NoMove := true;
  if not NoMove then
  begin
    Selected.MoveTo(AnItem, AttachMode);
    {��������� ��������� � �������}
    SaveTreeToTable;                    {Connected ����������� ���}
  end;
end;

procedure TVolgaTreeView.VolgaTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  {"������" ��������� ������� ������ �� ���� ��}
  if Source is TTreeNode then Accept := true;
end;

procedure TVolgaTreeView.VolgaTreeViewEdited(Sender: TObject; Node: TTreeNode;
  var S: string);
begin
  if Connected then
  begin
    {��������� ������ � �� ��� ��������� � "������"}
    try
      if Table.State = dsBrowse then
      begin
        {�������������, ���� �������� ���.������ ������ �����}
        SynchronizeTableWithTree(Selected);
        Table.Edit;
      end;
      Table.FieldValues[TextField] := S;
      Table.Post;
    except;
    end;
  end;
end;

procedure TVolgaTreeView.EditNode;
begin
  try Selected.EditText;
  except {��� �����������};
  end;
end;

procedure TVolgaTreeView.NewNode;
var newID: string;
begin                                   {����� Node}
  newID := GetNewID;                    {���������� ������� �� ���������� ID}
  if Connected then
  begin
    Table.Append;
    Table.FieldValues[UniqueField] := newID;
    if IsRoot then
      Table.FieldValues[IndexField] := Items.Count - 1
    else
      Table.FieldValues[IndexField] := Items.Count;
    Table.FieldValues[LevelField] := 1;
    Table.FieldValues[TextField] := '<New>';
    try Table.Post;
    except Table.Cancel;
      Exit;
    end;
  end;
  New(ptrUID);
  ptrUID^ := newID;
  if IsRoot then
    Items.AddChildObject(Items.GetFirstNode, '<�����>', ptrUID)
  else
    Items.AddObject(nil, '<�����>', ptrUID);
  SetFocus;
  Items[Items.Count - 1].Selected := True;
  Selected.EditText;
end;

procedure TVolgaTreeView.SaveTreeToTable;
var i, istart, doplev: integer;
begin                                   {��������� ����� ������� � ������ � �������}
  if not Connected then Exit;
  Table.DisableControls;
  if IsRoot then
  begin
    istart := 1;
    doplev := 1;                        {�������� �� 2-� ������ � ������ 2}
  end
  else
  begin
    istart := 0;
    doplev := 0;                        {�������� � 1-� ������ � ������ 1}
  end;
  {��������� ������ � �������,������ ����������� �� ����� ������-�}
  for i := istart to Items.Count - 1 do
  begin
    Table.Locate(UniqueField, NodeID(Items[i]), []);
    if (Table.FieldValues[IndexField] <> (Items[i].AbsoluteIndex - istart + 1)) or
      (Table.FieldValues[LevelField] <> (Items[i].Level - doplev + 1)) then
    begin
      Table.Edit;
      Table.FieldValues[IndexField] := Items[i].AbsoluteIndex - istart + 1;
      Table.FieldValues[LevelField] := Items[i].Level - doplev + 1;
      try Table.Post;
      except Table.Cancel;
      end;
    end;
  end;
  Table.EnableControls;
end;

procedure TVolgaTreeView.RestoreTreeFromTable;
var RootNode, ActNode1, ActNode2, ActNode3, ActNode4, ActNode5, ActNode6: TTreeNode;
  imgCount,i: integer;
begin
  if not Connected then Exit;
  {������� ������ �� �������}
  Items.Clear;
  //�� �������� TreeView ���� �� ������� ��� ���������
  Items.BeginUpdate;
  RootNode := nil;
  ActNode1 := nil;
  ActNode2 := nil;
  ActNode3 := nil;
  ActNode4 := nil;
  ActNode5 := nil;
  ActNode6 := nil;
  if IsRoot then RootNode := Items.Add(nil, RootCaption);
  if Images<>nil then
    imgCount := Images.Count
  else imgCount := 0;
  Table.DisableControls;
//Table.IndexFieldNames:=IndexField;
  Table.First;
  while not Table.Eof do
  begin
    New(ptrUID);
    ptrUID^ := Table.FieldValues[UniqueField];
    if Table.FieldValues[LevelField] = 1 then
      if IsRoot then                    {�������� � �����}
        ActNode1 := Items.AddChildObject(RootNode, Table.FieldValues[TextField], ptrUID)
      else                              {�� �������� �� � ����}
        ActNode1 := Items.AddObject(nil, Table.FieldValues[TextField], ptrUID)
    else if Table[LevelField] = 2 then
      ActNode2 := Items.AddChildObject(ActNode1, Table.FieldValues[TextField], ptrUID)
    else if Table[LevelField] = 3 then
      ActNode3 := Items.AddChildObject(ActNode2, Table.FieldValues[TextField], ptrUID)
    else if Table[LevelField] = 4 then
      ActNode4 := Items.AddChildObject(ActNode3, Table.FieldValues[TextField], ptrUID)
    else if Table[LevelField] = 5 then
      ActNode5 := Items.AddChildObject(ActNode4, Table.FieldValues[TextField], ptrUID)
    else if Table[LevelField] = 6 then
      ActNode6 := Items.AddChildObject(ActNode5, Table.FieldValues[TextField], ptrUID)
    else
      Items.AddChildObject(ActNode6, Table.FieldValues[TextField], ptrUID);
    Table.Next;
  end;
  if imgCount >= 2 then
  for i := 0 to Items.Count-1 do begin
    Items[i].ImageIndex := 0;  //�� ���������
    Items[i].SelectedIndex := 1; //����������
  end;
//Table.IndexFieldNames:=UniqueField;
{  Table.IndexName:='';  {��������� ������ �� ����.����}
  Table.EnableControls;
  // ������ ���������� TTreeView ����� �������� ���� ������
  Items.EndUpdate;
  // ��������� ����� �� ������ ������ Tree View
  Items.GetFirstNode.Selected := True;
  if not IsRoot and FScrollTableWithTree then
    Table.Locate(UniqueField, NodeID(Selected), [])
  else
    Items.GetFirstNode.Expand(false);
end;

procedure TVolgaTreeView.SetTable(const Value: TDataSet);
begin
  FTable := Value;
  Connected := (Value <> nil);          {������� ��������� Tree}
  if Value = nil then Items.Clear;
end;

function TVolgaTreeView.GetFullNodeCaption(Node: TTreeNode; Delimiter: char): string;
{������ ������������ Node,������� � ������� ��������}
var ParentNode: TTreeNode;
begin
  {���� ����� RootCaption,�� �� ����������.����������� - Delimiter}
  if Node <> nil then
  begin
    Result := Node.Text;
    if Node.Level = 0 then Exit;        {��� ���������� Root}
    if (Node.Level = 1) and IsRoot then Exit; {���� ����� Root}
    ParentNode := Node.Parent;
    while (ParentNode <> nil) and (ParentNode.Level >= 0) and (ParentNode.Text <>
      RootCaption) do
    begin
      Result := ParentNode.Text + Delimiter + Result;
      try ParentNode := ParentNode.Parent;
      except;
      end;
    end;
  end
  else
    Result := '';
end;

procedure TVolgaTreeView.SetIndexField(const Value: string);
begin
  FIndexField := Value;
  Connected := (Value <> '');           {������� ��������� Tree}
  if Value = '' then Items.Clear;
end;

function TVolgaTreeView.GetNodeLastChildIndex(Node: TTreeNode): longint;
begin                                   {����� ������ ���������� ������� � ��������� Node}
  while Node.HasChildren do
    Node := Node.GetLastChild;
  Result := Node.AbsoluteIndex + 1;     {� ��� ������ � 0,� ��� � 1}
  if IsRoot then Dec(Result);           {��� ����� Root}
end;

procedure TVolgaTreeView.SetLevelField(const Value: string);
begin
  FLevelField := Value;
  Connected := (Value <> '');           {������� ��������� Tree}
  if Value = '' then Items.Clear;
end;

procedure TVolgaTreeView.SetRootCaption(const Value: string);
var oldRoot: string;
begin
  oldRoot := FRootCaption;
  if FRootCaption <> Value then
  begin
    FRootCaption := Value;
    if (oldRoot > '') and (Value > '') then {������ ���������� ��������}
    try Items.GetFirstNode.Text := Value;
    except;
    end
    else if Connected then
      RestoreTreeFromTable;
  end;
end;

procedure TVolgaTreeView.SetTextField(const Value: string);
begin
  FTextField := Value;
  Connected := (Value <> '');           {������� ��������� Tree}
  if Value = '' then Items.Clear;
end;

procedure TVolgaTreeView.SetUniqueField(const Value: string);
begin
  FUniqueField := Value;
  Connected := (Value <> '');           {������� ��������� Tree}
  if Value = '' then Items.Clear;
end;

function TVolgaTreeView.GetIsRoot: Boolean;
begin
  Result := (RootCaption > '');
end;

function TVolgaTreeView.GetFullRecCaption(UniqueID: string;
  Delimiter: char): string;
begin
  {������ �������� �� ����.����}
  Result := GetFullNodeCaption(FindNodeByUniqueID(UniqueID), Delimiter);
end;

function TVolgaTreeView.GetRecLastChildIndex(UniqueID: string): longint;
begin
  {��������� Child �� ����.����}
  Result := GetNodeLastChildIndex(FindNodeByUniqueID(UniqueID));
end;

procedure TVolgaTreeView.SynchronizeTreeWithTable(UniqueID: string);
begin
  {������������� ������ � ��}
  Selected := FindNodeByUniqueID(UniqueID);
end;

procedure TVolgaTreeView.SynchronizeTableWithTree(Node: TTreeNode);
begin
  if not Connected then Exit;
  if (RootCaption = '') or (Node.AbsoluteIndex > 0) then
  try Table.Locate(UniqueField, NodeID(Node), []);
  except;
  end;
end;

function TVolgaTreeView.FindNodeByUniqueID(UniqueID: string): TTreeNode;
var i, istart: integer;
begin
  {����� Node,�����.����.���� ������}
  if IsRoot then
    istart := 1
  else
    istart := 0;
  Result := nil;
  for i := istart to Items.Count - 1 do
    if NodeID(Items[i]) = UniqueID then
    begin
      Result := Items[i];
      Break;
    end;
end;

procedure TVolgaTreeView.SetConnected(const Value: Boolean);
begin
  if FConnected <> Value then
    FConnected := Value and (Table <> nil) and (IndexField <> '') and
      (LevelField <> '') and (UniqueField <> '') and (TextField <> '')
      and Table.Active;
  if FConnected then RestoreTreeFromTable;
end;

procedure TVolgaTreeView.SetScrollTableWithTree(const Value: Boolean);
begin
  FScrollTableWithTree := Value;
end;

function TVolgaTreeView.NodeID(Node: TTreeNode): string;
begin
  if Node <> nil then
    if IsRoot and (Node = Items[0]) then
      Result := '0'
    else
    try Result := PShortString(Node.Data)^;
    except Result := '';
    end
  else
    Result := '';
end;

function TVolgaTreeView.GetRootSelected: Boolean;
begin
  Result := IsRoot and (Selected = Items[0]);
end;

function TVolgaTreeView.GetSelectedID: string;
begin
  if Selected <> nil then
    if RootSelected then
      Result := '0'
    else
      Result := PShortString(Selected.Data)^
  else
    Result := '';
end;

function TVolgaTreeView.GetListChildrenID: string;
var Node: TTreeNode; i: integer;
begin
  Result := '';
  if (Selected <> nil) and RootSelected then Exit;
  Node := Selected;
  while Node.HasChildren do     //���� ���� ���� � ���������� Node
    Node := Node.GetLastChild;
  for i := Selected.AbsoluteIndex to Node.AbsoluteIndex do
    Result := Result + NodeID(Items[i]) + ';';
end;

end.

