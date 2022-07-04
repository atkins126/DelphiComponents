//******************************************************************************
//  Print dataset using TVolgaDbGrid properties with FastReport
//******************************************************************************
//  ������������ �������� TVolgaColumn:
//
//  procedure Execute; - ������������ ����� � ������� Preview
//  property Dataset - �������� ������
//  property DetailFont - ���� ��� ��������� ����� ������
//  property SumFields - ������ �����, ������� ���� �����������
//  property Summary - ��������� ������, ��������� � �������� ������
//  property Title - ��������� ������, ��������� � ��������� ������
//  property TitleFont - ���� ��������� ������
//  property DisablePrint - ������� ���������� ������ ������ �� ������ � ���������� ������
//    (��� ������������� � ����-������ ���������)
//
//  � ������� ��������� � �������� �������� ��������� ��������������:
//  1.������ ���������� � ������� - ��� ����� ��������������
//  2.������ ���������� � +2 ��� +4 � �.�. - ��� ����� �������� ������� �� 2-4 ������
//     ������� ��������� (DetailFont ��� TitleFont)
//  3.������ ������� �� ������� "-" - ����� �������� �����.����� �� ��� ������ �����
//
//  ����� ������� ������������ �� ��������� �� ���������� ����, �� ���� ������
//  ������� ��������� ������ ����� - �� ������������� ������� ��������� ����.
//  �� ���������� �������� �� ������ �� ����.����, ��� ������� ������������� ��������������,
//  ����� ������ ��� ������ �����.
//  �������� ����� (���� ��� ����) ���������� ������ ��������� �������.
//  (c) 2000-2003, Olga Vlasova       info@volgadb.com
//******************************************************************************

unit FRVGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  DB, Printers, FR_DSet, FR_DBSet, FR_Class, FR_View, VolDBGrid;

type
  TFRVGrid = class(TComponent)
  private
    { Private declarations }
    FDataSet: TDataset;
    FReport: TfrReport;
    FReportDataSet: TfrDBDataSet;
    FDetailFont: TFont;
    FTitleFont: TFont;
    FSumFields: TStringList;
    FSummary: TStrings;
    FTitle: TStrings;
    v: TfrView;
    b: TfrBandView;
    Page: TfrPage;
    c: TCanvas;
    cd: Boolean;
    widfld: array[0..50] of integer;    {������ �������}
    t, FontH, dh, MaxWid, plus: integer;
    sim: string[1];
    koef: Double;
    FDisablePrint: Boolean;
    FGrid: TVolgaDBGrid;
    procedure SetDetailFont(const Value: TFont);
    procedure SetSumFields(const Value: TStringList);
    procedure SetSummary(const Value: TStrings);
    procedure SetTitle(const Value: TStrings);
    procedure SetTitleFont(const Value: TFont);
    procedure WhatFormat(v: TfrMemoView; F: TField);
    procedure TitlePrepare;
    procedure PageHeaderPrepare;
    procedure ColumnHeaderPrepare;
    procedure DetailPrepare;
    procedure SummaryPrepare;
    procedure SetGrid(const Value: TVolgaDBGrid);
    procedure frReportUserFunction(const Name: string; p1, p2,
      p3: Variant; var Val: Variant);
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
  published
    { Published declarations }
    property Grid: TVolgaDBGrid read FGrid write SetGrid;
    property DetailFont: TFont read FDetailFont write SetDetailFont;
    property SumFields: TStringList read FSumFields write SetSumFields;
    property Summary: TStrings read FSummary write SetSummary;
    property Title: TStrings read FTitle write SetTitle;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property DisablePrint: Boolean read FDisablePrint write FDisablePrint;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Volga', [TFRVGrid]);
end;

{ TFRVGrid }

constructor TFRVGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSumFields := TStringList.Create;
  FSumFields.Sorted := true;
  FTitle := TStringList.Create;
  FSummary := TStringList.Create;
  FTitleFont := TFont.Create;
  FTitleFont.Name := 'Times New Roman';
  FTitleFont.Charset := RUSSIAN_CHARSET;
  FTitleFont.Size := 10;
  FTitleFont.Style := [fsBold];
  FDetailFont := TFont.Create;
  FDetailFont.Name := 'Arial';
  FDetailFont.Charset := RUSSIAN_CHARSET;
  FDetailFont.Size := 8;
  FReport := TfrReport.Create(Self);
end;

destructor TFRVGrid.Destroy;
begin
  FReport.Free;
  FReport := nil;
  FTitleFont.Free;
  FDetailFont.Free;
  FSumFields.Free;
  FTitle.Free;
  FSummary.Free;
  inherited Destroy;
end;

procedure TFRVGrid.Execute;
var i: integer;
begin                                   {����� �������}
  if FDataSet = nil then Exit;

  if not FDataSet.Active then FDataset.Open;
  FReportDataSet := TfrDBDataSet.Create(Self);
  FReportDataSet.Name := 'FRVGridDBDataSet1';
  FReportDataSet.DataSet := FDataSet;

  {������ ����� ����� ������ ��� FDetailFont}
  c := TCanvas.Create;
  c.Handle := GetDC(0);
  c.Font := FDetailFont;
  FontH := c.TextHeight('0123456789');

  {������������ ������� �� �����}
  MaxWid := 0;
  for i := 0 to FGrid.Columns.Count - 1 do
  begin
    if FGrid.Columns[i].Visible then
      widfld[i] := FGrid.Columns[i].Width
    else
      widfld[i] := 0;
    Inc(MaxWid, widfld[i]);             {������ �����}
  end;
  c.Free;

  cd := FDataSet.ControlsDisabled;
  try
    FDataSet.DisableControls;
    FReport.Pages.Clear;
    FReport.Pages.Add;
    Page := FReport.Pages[0];
    Page.pgMargins := Rect(36, 36, 36, 36); //������� �� ���� ����� �� 1 ��
    Page.UseMargins := true;

    {���������� ����, ���� ������� ������}
    if (MaxWid > Page.PrnInfo.Pw - 2 * 36) and (Page.pgOr = poPortrait) then
      with Page do
        ChangePaper(pgSize, pgWidth, pgHeight, -1, poLandscape);
    koef := (Page.PrnInfo.Pw - 2 * 36) / MaxWid; {����.���������}
    {��������������� ������ ������ �������, ����� ��� ���������� �� Bande}
    for i := 0 to FGrid.Columns.Count - 1 do
      widfld[i] := Round(widfld[i] * koef);

    // Title
    if FTitle.Count > 0 then TitlePrepare;
    // PageHeader
    PageHeaderPrepare;
    // Column Header
    ColumnHeaderPrepare;
    // Detail Band
    DetailPrepare;
    //�������� ����� � ������
    if (Summary.Count > 0) or (SumFields.Count > 0) then SummaryPrepare;

    //������ �������
    if DisablePrint then
      FReport.PreviewButtons := FReport.PreviewButtons - [pbPrint, pbSave]
    else
      FReport.PreviewButtons := FReport.PreviewButtons + [pbPrint, pbSave];
    FReport.OnUserFunction := frReportUserFunction;
    FReport.ShowReport;
  finally
    if not cd then FDataSet.EnableControls;
    FReportDataSet.Free;
  end;
end;

procedure TFRVGrid.frReportUserFunction(const Name: string; p1, p2,
  p3: Variant; var Val: Variant);
var Col: TVolgaColumn;
  fv: Variant;
  ind: integer;
begin
  if (Name <> 'LOOKUP') and (Name <> 'COMBO') then Exit;
  fv := frParser.Calc(p1);
  Col := FGrid.Columns[p2];
  if Name = 'LOOKUP' then
  begin
    if Col.LookupLinkField = p3 then
      Val := fv
    else
      Val := Col.LookupDataSet.Lookup(Col.LookupLinkField, fv, p3);
  end
  else
  begin
    ind := Col.PickValues.IndexOf(fv);
    if ind >= 0 then
      Val := Col.PickList[ind]
    else
      Val := '';
  end;
end;

procedure TFRVGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Grid) then
    Grid := nil;
end;

procedure TFRVGrid.TitlePrepare;
var i: integer;
begin
  b := TfrBandView(frCreateObject(gtBand, ''));
  c := TCanvas.Create;
  c.Handle := GetDC(0);
  c.Font := FTitleFont;
  dh := c.TextHeight('0123456789');     //������ ����� ���������
  c.Free;
  b.SetBounds(0, 36, 1000, dh * FTitle.Count + 10);
  b.BandType := btReportTitle;
  Page.Objects.Add(b);
  t := 36;                              //Top ��������
  for i := 0 to FTitle.Count - 1 do
  begin
    sim := Copy(FTitle[i], 1, 1);
    plus := 0;
    if sim = '-' then
    begin                               //�����.�����
      //������ �����
      v := frCreateObject(gtLine, '');
      v.SetBounds(36, t, Page.PrnInfo.Pw - 36 * 2, 1);
      Page.Objects.Add(v);
      Inc(t, 2);
      Continue;
    end
    else if sim = '+' then
    begin                               {������ ���������� ������ ���������}
      try
        plus := StrToInt(Copy(FTitle[i], 2, 1));
      except plus := 0;
      end;
      sim := Copy(FTitle[i], 3, 1);     //��������� �� �������� ���������� ������
      FTitle[i] := Copy(FTitle[i], 3, length(FTitle[i]) - 2);
    end;
    //������� �����
    v := frCreateObject(gtMemo, '');
    v.SetBounds(36, t, Page.PrnInfo.Pw - 36 * 2, dh + plus);  //��� ���������� ����� ������ ������
    if sim = ' ' then                   //�������� �����
      TfrMemoView(v).Alignment := frtaCenter + frtaMiddle
    else
      TfrMemoView(v).Alignment := frtaLeft + frtaMiddle;
    TfrMemoView(v).Font := FTitleFont;
    TfrMemoView(v).Font.Size := TfrMemoView(v).Font.Size + plus; {����������� �����}
    v.Memo.Add(FTitle[i]);              //���������� �����
    Page.Objects.Add(v);
    Inc(t, dh + plus);
  end;
end;

procedure TFRVGrid.PageHeaderPrepare;
begin
  b := TfrBandView(frCreateObject(gtBand, ''));
  b.BandType := btPageHeader;           //���� ��� ���������� �����
  b.SetBounds(0, 200, 1000, FontH + 5);
  b.Flags := b.Flags or flBandOnFirstPage; //�������� �� ������ ��������
  Page.Objects.Add(b);
  t := 36;                              //����� ���� �����/�����
  v := frCreateObject(gtMemo, '');
  v.SetBounds(t, 200, Page.PrnInfo.Pw - 36 * 2, FontH);
  TfrMemoView(v).Alignment := frtaLeft + frtaMiddle;
  TfrMemoView(v).Font := FDetailFont;
  v.FrameWidth := 1;
  v.Memo.Add('���� ����������� [DATE] [TIME]     ���� [PAGE#]');
  Page.Objects.Add(v);
end;

procedure TFRVGrid.ColumnHeaderPrepare;
var i: integer;
begin
  b := TfrBandView(frCreateObject(gtBand, ''));
  b.BandType := btColumnHeader;         //���� ��� ���������� �����
  b.SetBounds(0, 250, 1000, FontH);
  b.Flags := b.Flags or flStretched;    //�������������
  Page.Objects.Add(b);
  t := 36;                              //����� ���� �����/�����
  for i := 0 to FGrid.Columns.Count - 1 do
    if widfld[i] > 0 then
    begin
      v := frCreateObject(gtMemo, '');
      v.SetBounds(t, 250, widfld[i], FontH);
      TfrMemoView(v).Alignment := frtaCenter + frtaMiddle;
      TfrMemoView(v).Font := FDetailFont;
      v.FrameTyp := 8 + 4 + 2;          //1-������ �����, 2-������, 4-�����, 8-�������
      v.FrameWidth := 1;
      v.Memo.Add(FGrid.Columns[i].Title.Caption); //�������� �������
      v.Flags := v.Flags or flStretched or flWordWrap or flWordBreak;  //�������������  � �������
      Page.Objects.Add(v);
      Inc(t, widfld[i]);
    end;
  TfrMemoView(Page.Objects[Page.Objects.Count - 1]).FrameTyp := 8 + 4 + 2 + 1;  //��� ����� � ����������
end;

procedure TFRVGrid.DetailPrepare;
var i: integer;

  function IsLinkActive(Col: TVolgaColumn): Boolean;
  begin
    try
      Result := (Col.LookupDataSet <> nil)
        and Col.LookupDataSet.Active and (Col.LookupLinkField > '') and
        (Col.LookupDropDownFields > '') and (Col.LookupKeyField > '');
    except Result := false;
    end;
  end;

  function ViewField(names: string): string;
  begin
    if Pos(';', names) > 0 then         //������� ���� ������ ������ �� ������!
      Result := Copy(names, 1, Pos(';', names) - 1)
    else
      Result := names;
  end;

begin
  b := TfrBandView(frCreateObject(gtBand, ''));
  b.BandType := btMasterData;
  b.Dataset := FReportDataSet.Name;
  b.SetBounds(0, 300, 1000, FontH);
  b.Flags := b.Flags or flStretched;    //�������������
  Page.Objects.Add(b);
  t := 36;                              //����� ���� �����/�����
  for i := 0 to FGrid.Columns.Count - 1 do
    if widfld[i] > 0 then
    begin
      v := frCreateObject(gtMemo, '');
      v.SetBounds(t, 300, widfld[i], FontH);
      TfrMemoView(v).Font := FDetailFont;
      v.FrameTyp := 4 + 2;              //1-������ �����, 2-������, 4-�����, 8-�������
      v.FrameWidth := 1;
      case FGrid.Columns[i].ButtonStyle of
        cbsLookup:
          if IsLinkActive(FGrid.Columns[i]) then
            v.Memo.Add('[LOOKUP(["' + FGrid.Columns[i].FieldName + '"],' + IntToStr(i)
              + ',' + ViewField(FGrid.Columns[i].LookupDropDownFields) + ')]')
          else
            v.Memo.Add('["' + FGrid.Columns[i].FieldName + '"]'); //�������� ����
        cbsCombo:
          if FGrid.Columns[i].PickList.Count = FGrid.Columns[i].PickValues.Count then
            v.Memo.Add('[COMBO(["' + FGrid.Columns[i].FieldName + '"],' + IntToStr(i) +
              ')]')
          else
            v.Memo.Add('["' + FGrid.Columns[i].FieldName + '"]'); //�������� ����
        else
          v.Memo.Add('["' + FGrid.Columns[i].FieldName + '"]'); //�������� ����
      end;
      if (FGrid.Columns[i].Field.DataType = ftString) or (FGrid.Columns[i].Field.DataType
        =
        ftMemo) then
        v.Flags := v.Flags or flStretched or flWordWrap {or flWordBreak};  //�������������  � �������
      case FGrid.Columns[i].Alignment of
        taLeftJustify: TfrMemoView(v).Alignment := frtaLeft;
        taRightJustify: TfrMemoView(v).Alignment := frtaRight;
        taCenter: TfrMemoView(v).Alignment := frtaCenter;
      end;
      WhatFormat(TfrMemoView(v), FGrid.Columns[i].Field); //������ ����
      Page.Objects.Add(v);
      Inc(t, widfld[i]);
    end;
  TfrMemoView(Page.Objects[Page.Objects.Count - 1]).FrameTyp := 4 + 2 + 1;  //��� ����� � ����������
end;

procedure TFRVGrid.SummaryPrepare;
var i, j: integer;
begin
  b := TfrBandView(frCreateObject(gtBand, ''));
  b.BandType := btReportSummary;
  b.SetBounds(0, 400, 1000, FontH + FontH * Summary.Count);
  Page.Objects.Add(b);
  t := 36;                              //����� ���� �����/�����
  if SumFields.Count > 0 then
  begin
    for i := 0 to FGrid.Columns.Count - 1 do
      if widfld[i] > 0 then
      begin
        v := frCreateObject(gtMemo, '');
        v.SetBounds(t, 400, widfld[i], FontH);
        TfrMemoView(v).Alignment := frtaRight + frtaMiddle; //����� ������
        TfrMemoView(v).Font := FDetailFont;
        TfrMemoView(v).Font.Style := [fsBold];
        v.FrameTyp := 4 + 2;            //2-������, 4-�����
        v.FrameWidth := 1;
        if SumFields.Find(FGrid.Columns[i].FieldName, j) then
        begin
          v.Memo.Add('[SUM("' + FGrid.Columns[i].FieldName + '")]'); //�������� ����
          WhatFormat(TfrMemoView(v), FGrid.Columns[i].Field); //������ ����
        end;
        Page.Objects.Add(v);
        Inc(t, widfld[i]);
      end;
    TfrMemoView(Page.Objects[Page.Objects.Count - 1]).FrameTyp := 4 + 2 + 1;  //��� ����� � ����������
    t := 400 + FontH;
  end
  else
    t := 400;
  if FSummary.Count > 0 then
  begin
    for i := 0 to FSummary.Count - 1 do
    begin
      sim := Copy(FSummary[i], 1, 1);
      plus := 0;
      if sim = '-' then
      begin                             //�����.�����
        //������ �����
        v := frCreateObject(gtLine, '');
        v.SetBounds(36, t, Page.PrnInfo.Pw - 36 * 2, 1);
        Page.Objects.Add(v);
        Inc(t, 2);
        Continue;
      end
      else if sim = '+' then
      begin                             {������ ���������� ������ ���������}
        try
          plus := StrToInt(Copy(FSummary[i], 2, 1));
        except plus := 0;
        end;
        sim := Copy(FSummary[i], 3, 1); //��������� �� �������� ���������� ������
        FSummary[i] := Copy(FSummary[i], 3, length(FSummary[i]) - 2);
      end;
          //������� �����
      v := frCreateObject(gtMemo, '');
      v.SetBounds(36, t, Page.PrnInfo.Pw - 36 * 2, FontH + plus);  //��� ���������� ����� ������ ������
      if sim = ' ' then                 //�������� �����
        TfrMemoView(v).Alignment := frtaCenter + frtaMiddle
      else
        TfrMemoView(v).Alignment := frtaLeft + frtaMiddle;
      TfrMemoView(v).Font := FDetailFont;
      TfrMemoView(v).Font.Size := TfrMemoView(v).Font.Size + plus; {����������� �����}
      v.Memo.Add(FSummary[i]);          //���������� �����
      Page.Objects.Add(v);
      Inc(t, FontH + plus);
    end;
  end;
end;

procedure TFRVGrid.SetDetailFont(const Value: TFont);
begin
  if Value <> nil then
    FDetailFont.Assign(Value)
  else
  begin                                 {���� �� ���������}
    FDetailFont.Name := 'Arial';
    FDetailFont.Charset := RUSSIAN_CHARSET;
    FDetailFont.Size := 8;
  end;
end;

procedure TFRVGrid.SetSumFields(const Value: TStringList);
begin
  if Value <> nil then
    FSumFields.Assign(Value)
  else
    FSumFields.Clear;
end;

procedure TFRVGrid.SetSummary(const Value: TStrings);
begin
  if Value <> nil then
    FSummary.Assign(Value)
  else
    FSummary.Clear;
end;

procedure TFRVGrid.SetTitle(const Value: TStrings);
begin
  if Value <> nil then
    FTitle.Assign(Value)
  else
    FTitle.Clear;
end;

procedure TFRVGrid.SetTitleFont(const Value: TFont);
begin
  if Value <> nil then
    FTitleFont.Assign(Value)
  else
  begin                                 {���� �� ���������}
    FTitleFont.Name := 'Times New Roman';
    FTitleFont.Charset := RUSSIAN_CHARSET;
    FTitleFont.Size := 10;
    FTitleFont.Style := [fsBold];
  end;
end;

procedure TFRVGrid.WhatFormat(v: TfrMemoView; F: TField);
begin
  if F is TNumericField then
  begin
    v.Format := 1 * $01000000 + 4 * $00010000 + 3 * $00000100; //����� ������.�������
    v.Format := v.Format + Ord(',');    //����������� ����� - �������
    if TNumericField(F).DisplayFormat > '' then
      v.FormatStr := TNumericField(F).DisplayFormat //����� ������ �� ����
    else
      v.FormatStr := '#.##';            //����� ������ ����
  end
  else if F is TDateField then
  begin
    v.Format := 2 * $01000000 + 1 * $00010000; //���� ������� ��.��.����
  end;
end;

procedure TFRVGrid.SetGrid(const Value: TVolgaDBGrid);
begin
  if Value <> nil then
  begin
    FGrid := Value;
    if (FGrid.DataSource <> nil) and (FGrid.DataSource.DataSet <> nil) then
      FDataSet := FGrid.DataSource.DataSet
    else
      FDataSet := nil;
  end
  else
  begin
    FGrid := nil;
    FDataSet := nil;
  end;
end;

end.

