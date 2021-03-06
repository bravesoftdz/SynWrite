{
SynWrite main Options dialog.
}

unit unSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Spin,
  Menus, TntMenus,

  ecSyntMemo, ecKeyMap, ecHotKeyEdit, ecPopupCtrl,
  TntStdCtrls, TntComCtrls, TntForms, TntGrids,
  DKLang,

  unGlobData,
  unColorBox,
  unMain,
  unSetupOvr,
  unProcEditor;

const
  cMaxCaretTime = 1000*1000*1000;
  
type
  TfmSetup = class(TTntForm)
    Tabs: TTntPageControl;
    bApply: TTntButton;
    bCan: TTntButton;
    tabColors: TTntTabSheet;
    tabKey: TTntTabSheet;
    bOk: TTntButton;
    FontDialog: TFontDialog;
    KeyList: TTntStringGrid;
    tabFiles: TTntTabSheet;
    gColors: TTntGroupBox;
    Label4: TTntLabel;
    ListColors: TTntListBox;
    Label5: TTntLabel;
    LabelColorInf: TTntLabel;
    tabProgSett: TTntTabSheet;
    boxProgSett: TTntGroupBox;
    cbChar: TTntCheckBox;
    Label11: TTntLabel;
    cbStat: TTntCheckBox;
    tabACP: TTntTabSheet;
    DKLanguageController1: TDKLanguageController;
    cbColors: TColorBox;
    cbInst: TTntCheckBox;
    gAcpAll: TTntGroupBox;
    Label42: TTntLabel;
    cbAcpFilter: TTntComboBox;
    cbAcpNone: TTntCheckBox;
    edAcpDrop: TSpinEdit;
    bColorLoad: TTntButton;
    bColorSave: TTntButton;
    OpenDialogPre: TOpenDialog;
    SaveDialogPre: TSaveDialog;
    tabHist: TTntTabSheet;
    boxHist: TTntGroupBox;
    Label8: TTntLabel;
    Label7: TTntLabel;
    TntLabel11: TTntLabel;
    edFileCount: TSpinEdit;
    edFindCount: TSpinEdit;
    cbHistoryCaret: TTntCheckBox;
    cbHistoryEnc: TTntCheckBox;
    btnClearFindHistory: TTntButton;
    btnClearEdHistory: TTntButton;
    cbHistoryCleanRecents: TTntCheckBox;
    cbDirLast: TTntComboBox;
    edDirLast: TTntEdit;
    bDirLast: TTntButton;
    cbKeyCat: TTntComboBox;
    TntLabel19: TTntLabel;
    cbEsc: TTntComboBox;
    TntLabel21: TTntLabel;
    tabSearch: TTntTabSheet;
    boxFind: TTntGroupBox;
    cbSrWord: TTntCheckBox;
    cbSrOnTop: TTntCheckBox;
    TntLabel22: TTntLabel;
    edFilter: TTntEdit;
    TntLabel25: TTntLabel;
    TimerFilt: TTimer;
    bFiltClear: TTntButton;
    cbSrSel: TTntCheckBox;
    tabASave: TTntTabSheet;
    gASave: TTntGroupBox;
    cbASaveTimer: TTntCheckBox;
    edASaveTime: TSpinEdit;
    cbASaveFocus: TTntCheckBox;
    gASaveWhat: TTntGroupBox;
    cbASaveCurrFile: TTntRadioButton;
    cbASaveAllFiles: TTntRadioButton;
    labASavIgnore: TTntLabel;
    edASaveMaxSize: TSpinEdit;
    labASaveTime: TTntLabel;
    labKByte: TTntLabel;
    gUnnamed: TTntGroupBox;
    edASaveUnnamedDir: TEdit;
    cbASaveUnIgnore: TTntRadioButton;
    cbASaveUnShowSave: TTntRadioButton;
    cbASaveUnSaveToDir: TTntRadioButton;
    bUnnamedBrowse: TTntButton;
    gAcpSp: TTntGroupBox;
    cbAcpHtm: TTntCheckBox;
    cbAcpTabbing: TTntCheckBox;
    cbAcpCss: TTntCheckBox;
    LabelHelpTabbin: TTntLabel;
    cbHistoryForTemp: TTntCheckBox;
    cbAcpUseSingle: TTntCheckBox;
    cbACloseTags: TTntCheckBox;
    TntLabel7: TTntLabel;
    LabelHelpAClose: TTntLabel;
    cbACloseBr: TTntCheckBox;
    cbACloseBrEsc: TTntCheckBox;
    ListCat: TTntListBox;
    tabTabs: TTntTabSheet;
    boxTabs: TTntGroupBox;
    cbTabBtn: TTntCheckBox;
    cbTabDown: TTntCheckBox;
    cbTabNums: TTntCheckBox;
    cbTabSw: TTntCheckBox;
    edTabMaxLen: TSpinEdit;
    boxToolbar: TTntGroupBox;
    Label2: TTntLabel;
    cbTheme: TTntComboBox;
    Label12: TTntLabel;
    cbIcons: TTntComboBox;
    tabFonts: TTntTabSheet;
    gFont: TTntGroupBox;
    bFontText: TTntButton;
    bFontNumbers: TTntButton;
    bFontRuler: TTntButton;
    bFontTree: TTntButton;
    bFontAcp: TTntButton;
    bFontOutput: TTntButton;
    tabTree: TTntTabSheet;
    boxTree: TTntGroupBox;
    cbTreeSync: TTntCheckBox;
    tabSess: TTntTabSheet;
    boxSess: TTntGroupBox;
    cbSessDef: TTntCheckBox;
    cbSessLoad: TTntCheckBox;
    cbSessSave: TTntCheckBox;
    boxProj: TTntGroupBox;
    cbProjLoad: TTntCheckBox;
    cbProjSave: TTntCheckBox;
    boxFGroup: TTntGroupBox;
    TntLabel1: TTntLabel;
    cbText_: TTntComboBox;
    Label17: TTntLabel;
    TntLabel8: TTntLabel;
    edOem: TTntEdit;
    edUTF8: TTntEdit;
    TntLabel9: TTntLabel;
    boxReload: TTntGroupBox;
    Label9: TTntLabel;
    cbNotif: TTntComboBox;
    cbTail: TTntCheckBox;
    cbOverRO: TTntCheckBox;
    tabPath: TTntTabSheet;
    boxFolders: TTntGroupBox;
    LabelPathHint: TTntLabel;
    TntLabel15: TTntLabel;
    edFolders: TTntMemo;
    bAddFolder: TTntButton;
    tabOvr: TTntTabSheet;
    edSrOffsetY: TSpinEdit;
    TntLabel32: TTntLabel;
    TntLabel36: TTntLabel;
    cbUniNeed: TTntComboBox;
    cbTreeDelay: TSpinEdit;
    TntLabel39: TTntLabel;
    tabCarets: TTntTabSheet;
    LabelHelpAcpHtml: TTntLabel;
    boxFindTree: TTntGroupBox;
    cbSrExpand: TTntCheckBox;
    edSrMaxTreeMatches: TSpinEdit;
    TntLabel17: TTntLabel;
    cbSrQsCap: TTntCheckBox;
    boxCarets2: TTntGroupBox;
    edCaretShapeIns: TTntComboBox;
    TntLabel40: TTntLabel;
    cbCaretSmart: TTntCheckBox;
    cbCaretKeepPos: TTntCheckBox;
    tabNewOpen: TTntTabSheet;
    boxNew: TTntGroupBox;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    edEnc: TTntComboBox;
    edLE: TTntComboBox;
    edLex: TTntComboBox;
    tabView: TTntTabSheet;
    tabSelHL: TTntTabSheet;
    tabInsertFormat: TTntTabSheet;
    cbSavePos: TTntCheckBox;
    boxMicromap: TTntGroupBox;
    cbMicroMap: TTntCheckBox;
    cbBeep: TTntCheckBox;
    cbMenuIcon: TTntCheckBox;
    cbFullTitle: TTntCheckBox;
    cbGroupLexers: TTntCheckBox;
    TntLabel37: TTntLabel;
    cbRecColors: TTntComboBox;
    boxIndent: TTntGroupBox;
    edIndent: TSpinEdit;
    boxSelFmt: TTntGroupBox;
    cbUrlHilite: TTntCheckBox;
    cbUrlClick: TTntCheckBox;
    cbColorOnEmpty: TTntCheckBox;
    boxView: TTntGroupBox;
    LabelSpace: TTntLabel;
    LabelMargin: TTntLabel;
    LabelNums: TTntLabel;
    LabelStaple: TTntLabel;
    cbDrawLineBG: TTntCheckBox;
    cbHideCursor: TTntCheckBox;
    edLineSpace: TSpinEdit;
    edMargin: TSpinEdit;
    cbMargin: TTntCheckBox;
    edLineNums: TTntComboBox;
    cbDrawFocus: TTntCheckBox;
    cbRuler: TTntCheckBox;
    cbStapleKind: TTntComboBox;
    cbGutterWrapMark: TTntCheckBox;
    cbDrawCol: TTntCheckBox;
    boxNonPrint: TTntGroupBox;
    cbNPrintShow: TTntCheckBox;
    cbNPrintSp: TTntCheckBox;
    cbNPrintEol: TTntCheckBox;
    cbNPrintEolEx: TTntCheckBox;
    tabUndo: TTntTabSheet;
    boxUndo: TTntGroupBox;
    TntLabel2: TTntLabel;
    edUndoLimit: TSpinEdit;
    cbUndoMass: TTntCheckBox;
    cbGroupUndo: TTntCheckBox;
    cbUndoAfterSave: TTntCheckBox;
    cbAutoIndent: TTntCheckBox;
    cbBackspUnindent: TTntCheckBox;
    cbUnindentAlign: TTntCheckBox;
    cbFold: TTntCheckBox;
    cbFixLineSize: TTntCheckBox;
    cbFixColMove: TTntCheckBox;
    cbVarHorzBar: TTntCheckBox;
    cbSelMode: TTntComboBox;
    TntLabel35: TTntLabel;
    cbCollapseEmpty: TTntCheckBox;
    cbSelDragDrop: TTntCheckBox;
    cbCopyRtf: TTntCheckBox;
    cbSelGreedy: TTntCheckBox;
    cbSelLineByDClick: TTntCheckBox;
    cbSelOverwrite: TTntCheckBox;
    boxTabs2: TTntGroupBox;
    edTabStops: TTntEdit;
    Label16: TTntLabel;
    edTabMode: TTntComboBox;
    Label6: TTntLabel;
    cbReplaceTabs: TTntCheckBox;
    boxLang: TTntGroupBox;
    labLangInfo: TTntLabel;
    cbLang: TTntComboBox;
    cbAcpParamHints: TTntCheckBox;
    cbProjSessSave: TTntCheckBox;
    cbProjSessOpen: TTntCheckBox;
    cbProjCloseTabs: TTntCheckBox;
    bFontConsole: TTntButton;
    edNoSnippetsExt: TEdit;
    TntLabel34: TTntLabel;
    edTreeSorted: TTntEdit;
    TntLabel28: TTntLabel;
    cbScrollLast: TTntCheckBox;
    PopupLexers: TTntPopupMenu;
    edWrap: TTntComboBox;
    cbTreeExpand: TTntCheckBox;
    cbTreeCollapse: TTntCheckBox;
    cbTabDirs: TTntCheckBox;
    boxOpen: TTntGroupBox;
    edBigSize: TSpinEdit;
    TntLabel23: TTntLabel;
    TntLabel14: TTntLabel;
    cbTabVis: TTntCheckBox;
    cbTabPlus: TTntCheckBox;
    edTabAngle: TSpinEdit;
    TntLabel3: TTntLabel;
    bFontTabs: TTntButton;
    LabelLangMore: TTntLabel;
    edTabMinLen: TSpinEdit;
    TntLabel29: TTntLabel;
    cbTabEntire: TTntCheckBox;
    cbClipHook: TTntCheckBox;
    cbACloseQuote2: TTntCheckBox;
    cbACloseQuote1: TTntCheckBox;
    bFontMenus: TTntButton;
    LabMoreSkins: TTntLabel;
    LabMoreIcons: TTntLabel;
    TntLabel41: TTntLabel;
    edCaretTime: TTrackBar;
    TntLabel42: TTntLabel;
    cbTreeClick: TTntComboBox;
    cbSelByWords: TTntCheckBox;
    cbHistoryBkmk: TTntCheckBox;
    cbHistoryFold: TTntCheckBox;
    cbHistoryWrap: TTntCheckBox;
    cbGutterBmCol: TTntCheckBox;
    edAcpHintDelay: TSpinEdit;
    TntLabel43: TTntLabel;
    cbGutterSyncIcon: TTntCheckBox;
    cbUndoSimple: TTntCheckBox;
    cbSelJump: TTntCheckBox;
    cbTabDblClose: TTntCheckBox;
    cbCaretVirtual: TTntCheckBox;
    cbCaretMulti: TTntCheckBox;
    LabelHelpCarets: TTntLabel;
    cbCaretROnly: TTntCheckBox;
    TntLabel18: TTntLabel;
    edCaretShapeOvr: TTntComboBox;
    cbCutLineNoSel: TTntCheckBox;
    cbCopyLineNoSel: TTntCheckBox;
    bColorCustom: TTntButton;
    LabelBlickIndent: TTntLabel;
    labelHtokeyInfo: TTntLabel;
    lblInfoAutoShowACP: TLabel;
    cbDeleteBlanks: TTntCheckBox;
    procedure bApplyClick(Sender: TObject);
    procedure bCanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Apply;
    procedure bOkClick(Sender: TObject);
    procedure tabColorsShow(Sender: TObject);
    procedure ListColorsClick(Sender: TObject);
    procedure cbColorsSelect(Sender: TObject);
    procedure tabKeyShow(Sender: TObject);
    procedure KeyListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure KeyListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure KeyListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure KeyListClick(Sender: TObject);
    procedure KeyListMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure KeyListMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tabFilesShow(Sender: TObject);
    procedure bFontTextClick(Sender: TObject);
    procedure bFontNumbersClick(Sender: TObject);
    procedure bFontTreeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FontDialogShow(Sender: TObject);
    procedure tabProgSettShow(Sender: TObject);
    procedure tabACPShow(Sender: TObject);
    procedure btnClearEdHistoryClick(Sender: TObject);
    procedure btnClearFindHistoryClick(Sender: TObject);
    procedure bFontRulerClick(Sender: TObject);
    procedure bFontAcpClick(Sender: TObject);
    procedure edTabModeChange(Sender: TObject);
    procedure bFontOutputClick(Sender: TObject);
    procedure bColorSaveClick(Sender: TObject);
    procedure bColorLoadClick(Sender: TObject);
    procedure bDirLastClick(Sender: TObject);
    procedure tabHistShow(Sender: TObject);
    procedure cbKeyCatChange(Sender: TObject);
    procedure LabelHelpDateFmtClick(Sender: TObject);
    procedure tabSearchShow(Sender: TObject);
    procedure cbSessSaveClick(Sender: TObject);
    procedure edFilterChange(Sender: TObject);
    procedure TimerFiltTimer(Sender: TObject);
    procedure edIndentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bFiltClearClick(Sender: TObject);
    procedure tabASaveShow(Sender: TObject);
    procedure bUnnamedBrowseClick(Sender: TObject);
    procedure cbASaveUnnamedClick(Sender: TObject);
    procedure cbASaveTimerClick(Sender: TObject);
    procedure LabelHelpTabbinClick(Sender: TObject);
    procedure LabelHelpACloseClick(Sender: TObject);
    procedure cbACloseBrClick(Sender: TObject);
    procedure ListColorsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListCatClick(Sender: TObject);
    procedure tabTabsShow(Sender: TObject);
    procedure tabFontsShow(Sender: TObject);
    procedure tabTreeShow(Sender: TObject);
    procedure tabSessShow(Sender: TObject);
    procedure cbLangChange(Sender: TObject);
    procedure bAddFolderClick(Sender: TObject);
    procedure edFoldersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tabPathShow(Sender: TObject);
    procedure tabOvrShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure tabCaretsShow(Sender: TObject);
    procedure LabelHelpCaretsClick(Sender: TObject);
    procedure LabelHelpAcpHtmlClick(Sender: TObject);
    procedure tabNewOpenShow(Sender: TObject);
    procedure tabViewShow(Sender: TObject);
    procedure tabSelHLShow(Sender: TObject);
    procedure tabInsertFormatShow(Sender: TObject);
    procedure tabUndoShow(Sender: TObject);
    procedure bFontConsoleClick(Sender: TObject);
    procedure bFontTabsClick(Sender: TObject);
    procedure LabelLangMoreClick(Sender: TObject);
    procedure bFontMenusClick(Sender: TObject);
    procedure LabMoreSkinsClick(Sender: TObject);
    procedure LabMoreIconsClick(Sender: TObject);
    procedure bColorCustomClick(Sender: TObject);
  private
    { Private declarations }
    fmOvr: TfmSetupOvr;
    ColorsSetup: TSynColors;
    FLangChanged: boolean;

    //procedure MenuLexersClick(Sender: TObject);
    function Keymap: TSyntKeyMapping;
    procedure DoFontConfig(btn: TTntButton);
    procedure DoFillKeys;
    procedure FixWnd;
    function GetColorPresetFN(const Name: string): string;
    function GetKeymappingIndex(Row: integer): integer;

    procedure ApplyView;
    procedure ApplySelHL;
    procedure ApplyInsertFormat;
    procedure ApplyLang;
    procedure ApplyProgSett;
    procedure ApplyColors;
    procedure ApplyFonts;
    procedure ApplyTabs;
    procedure ApplyEditorCarets;
    procedure ApplyEditorOverrides;
    procedure ApplyFiles;
    procedure ApplySearch;
    procedure ApplyTree;
    procedure ApplyHistory;
    procedure ApplyUndo;
    procedure ApplySessionsProjects;
    procedure ApplyAutoComplete;
    procedure ApplyAutoSave;
    procedure ApplySearchFolders;
    procedure ApplyNewOpen;

    procedure InitView;
    procedure InitSelHL;
    procedure InitInsertFormat;
    procedure InitNewOpen;
    procedure InitSidebar;
    procedure InitLang;
    procedure InitProgSett;
    procedure InitColors;
    procedure InitFonts;
    procedure InitTabs;
    procedure InitEditorCarets;
    procedure InitEditorOverrides;
    procedure InitKeys;
    procedure InitFiles;
    procedure InitSearch;
    procedure InitTree;
    procedure InitHistory;
    procedure InitUndo;
    procedure InitSessionsProjects;
    procedure InitAutoComplete;
    procedure InitAutoSave;
    procedure InitSearchFolders;
  public
    { Public declarations }
    fmMain: TfmMain;
  end;

const
  cColors: array[0..cColorsNum-1] of string = (
    'Text', //0
    'Text-BG', //1
    'Current-line-BG', //2
    'Line-numbers-text', //3
    'Line-numbers-BG', //4
    'Collapse-line', //5
    'Folding-lines', //6
    'Folding-bar-BG', //7
    'Gutter-separator', //8
    'Selection-text', //9
    'Selection-BG', //10
    'Right-margin', //11
    'Hints-text', //12
    'Hints-BG', //13
    'Non-printable-chars', //14
    'Indentation-staples', //15
    'Gutter-gradient-right', //16
    'Tree-text', //17
    'Tree-BG', //18
    'Ruler-text', //19
    'Ruler-BG', //20
    'Tab-BG-passive', //21
    'Tab-BG-active', //22
    'Tab-BG-active-oth', //23
    'Search-marks-text', //24
    'Search-marks-BG', //25
    'Output-panel-text', //26
    'Output-panel-BG', //27
    'Output-panel-selection-text', //28
    'Output-panel-selection-BG', //29
    'Output-panel-active-text', //30
    'Output-panel-active-selected-text', //31
    'Output-panel-highlight-mask', //32
    'Pair-brackets', //33
    'Pair-brackets-BG', //34
    'Links-highlighting', //35
    'Views-splitter', //36
    'Current-line-text', //37
    'Line-state-modified', //38
    'Line-state-new', //39
    'Line-state-saved', //40
    'Line-state-unchanged', //41
    'Tab-caption', //42
    'Tab-caption-unsaved', //43
    'Bookmark-BG', //44
    'Minimap-sel-BG', //45
    'Collapse-mark', //46
    'Slave-splitter', //47
    'Line-state-def', //48
    'Non-printable-BG', //49
    'Collapse-mark-BG', //50
    'SyncEdit-BG', //51
    'Micromap-marks-BG', //52
    'Carets-gutter-BG', //53
    'Auto-complete-text', //54
    'Auto-complete-BG', //55
    'Tab-BG-passive-over', //56
    'Tab-border-active', //57
    'Tab-border-passive', //58
    'Tab-caption-modified', //59
    'Ftp-log-notif', //60
    'Ftp-log-server', //61
    'Ftp-log-error', //62
    'Micromap-BG', //63
    'Micromap-misspel', //64
    'Auto-complete-prefix', //65
    'Auto-complete-hint', //66
    'Auto-complete-hint-2' //67
    );

const
  cColorsOrder: array[0..60] of Integer = (
    0,
    1,
    9,
    10,
    37,
    2,
    3,
    4,
    6,
    7,
    5,
    46,
    50,
    14,
    49,
    15,
    11,
    24,
    25,
    44,
    42, //tab caption
    59, //tab caption modif
    22, //tab bg active, active group
    23, //tab bg active, other groups
    21, //tab bg passive
    56, //tab bg passive hover
    57, //tab border active
    58, //tab border passive
    17,
    18,
    19,
    20,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    //33,
    //34,
    35,
    //36,
    //47,
    38,
    39,
    40,
    41,
    48,
    45, //minimap sel bg
    63, //micromap bg
    64, //micromap misspel
    52, //micromap marks
    51,
    53,
    55, //acp bg
    54, //acp text
    65, //acp prefix
    66, //acp hint
    67, //acp hint2
    12,
    13,
    60,
    61,
    62
    );

implementation

uses
  IniFiles, Types,
  StrUtils,
  ecSyntTree, ecSyntAnal, ecStrUtils,
  ATSyntMemo,
  ATxShell, ATxFProc, ATxSProc,

  unProc,
  unProcHelp,
  unProj,
  unProcLines,

  TntClasses,
  TntFileCtrl;

{$R *.dfm}

const
  cColorExt = 'synw-colors';
  cColorFilter = '*.'+cColorExt+'|*.'+cColorExt;

function _ColorIndexToDklangID(n: integer): string;
begin
  Result:= 'zzc_' + cColors[n];
  SReplaceAll(Result, '-', '_');
end;

procedure TfmSetup.bOkClick(Sender: TObject);
begin
  Apply;
  ModalResult:= mrOk;
end;

procedure TfmSetup.bCanClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfmSetup.bApplyClick(Sender: TObject);
begin
  Apply;
end;

procedure TfmSetup.Apply;
begin
  if tabCarets.Tag  <>0 then ApplyEditorCarets;
  if tabOvr.Tag     <>0 then ApplyEditorOverrides;
  if tabSearch.Tag  <>0 then ApplySearch;
  if tabTree.Tag    <>0 then ApplyTree;
  if tabFonts.Tag   <>0 then ApplyFonts;
  if tabColors.Tag  <>0 then ApplyColors;
  if tabPath.Tag    <>0 then ApplySearchFolders;
  if tabFiles.Tag   <>0 then ApplyFiles;
  if tabProgSett.Tag<>0 then ApplyProgSett;
  if tabTabs.Tag    <>0 then ApplyTabs;
  if tabACP.Tag     <>0 then ApplyAutoComplete;
  if tabASave.Tag   <>0 then ApplyAutoSave;
  if tabSess.Tag    <>0 then ApplySessionsProjects;
  if tabHist.Tag    <>0 then ApplyHistory;
  if tabUndo.Tag    <>0 then ApplyUndo;
  if tabNewOpen.Tag <>0 then ApplyNewOpen;
  if tabView.Tag    <>0 then ApplyView;
  if tabSelHL.Tag   <>0 then ApplySelHL;
  if tabInsertFormat.Tag<>0 then ApplyInsertFormat;

  with fmMain do
  begin
    //update from template
    PropsManager.UpdateAll;
    ApplyFramesGutters;

    //save
    opTabOptionsLast:= ListCat.ItemIndex;
    SaveOptionsAll;
  end;
end;

procedure TfmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfmSetup.tabColorsShow(Sender: TObject);
begin
  if tabColors.Tag<>0 then Exit;
  tabColors.Tag:= 1;
  InitColors;
end;

procedure TfmSetup.ListColorsClick(Sender: TObject);
begin
  cbColors.Selected:= ColorsSetup[cColorsOrder[ListColors.ItemIndex]];
  cbColors.Items.Objects[0]:= TObject(cbColors.Selected); //set Custom color
  cbColors.Invalidate;
end;

procedure TfmSetup.cbColorsSelect(Sender: TObject);
begin
  ColorsSetup[cColorsOrder[ListColors.ItemIndex]]:= cbColors.Selected;
  ListColors.Invalidate;
end;

procedure TfmSetup.DoFontConfig(btn: TTntButton);
begin
  FontDialog.Font:= btn.Font;
  if FontDialog.Execute then
    btn.Font:= FontDialog.Font;
end;

procedure TfmSetup.bFontTextClick(Sender: TObject);
begin
  DoFontConfig(bFontText);
end;

procedure TfmSetup.bFontNumbersClick(Sender: TObject);
begin
  DoFontConfig(bFontNumbers);
end;

procedure TfmSetup.bFontTreeClick(Sender: TObject);
begin
  DoFontConfig(bFontTree);
end;

procedure TfmSetup.bFontRulerClick(Sender: TObject);
begin
  DoFontConfig(bFontRuler);
end;

procedure TfmSetup.bFontAcpClick(Sender: TObject);
begin
  DoFontConfig(bFontAcp);
end;

procedure TfmSetup.bFontOutputClick(Sender: TObject);
begin
  DoFontConfig(bFontOutput);
end;

procedure TfmSetup.bFontConsoleClick(Sender: TObject);
begin
  DoFontConfig(bFontConsole);
end;

procedure TfmSetup.tabKeyShow(Sender: TObject);
begin
  if tabKey.Tag<>0 then Exit;
  tabKey.Tag:= 1;

  InitKeys;
end;

function SKeysOf(c: TecCommandItem): string;
begin
  Result:= '';
  if c.KeyStrokes.Count>0 then
    Result:= Result + c.KeyStrokes.Items[0].AsString+' ';
  if c.KeyStrokes.Count>1 then
    Result:= Result + c.KeyStrokes.Items[1].AsString+' ';
end;

procedure TfmSetup.DoFillKeys;
var
  old: Widestring;
  g: TGridRect;
  i, j, k: integer;
begin
  with KeyList do
  begin
    ColWidths[0]:= 0;
    ColWidths[1]:= Width - 2 * DefaultColWidth - 32;
    Cells[1,0]:= DKLangConstW('zKeyCmd');
    Cells[2,0]:= DKLangConstW('zKey1');
    Cells[3,0]:= DKLangConstW('zKey2');
    RowCount:= 2;
    j:= 1;
    old:= '';

    for k:= 0 to cbKeyCat.Items.Count-1 do //categories
      for i:= 0 to Keymap.Items.Count-1 do //items
        //item filtered?
        if SSubstringMatch(Keymap.Items[i].DisplayName, edFilter.Text) or
          SSubstringMatch(SKeysOf(Keymap.Items[i]), edFilter.Text) then
        if Keymap.Items[i].Category = cbKeyCat.Items[k] then
        begin
          if not Keymap.Items[i].Customizable then
            Continue;
          if Keymap.Items[i].Command <= 0 then //unused items
          begin
            Keymap.Items[i].KeyStrokes.Clear;
            Continue;
          end;

          RowCount:= j+1;
          KeyList.RowHeights[KeyList.RowCount-1]:= KeyList.RowHeights[0];

          //add category
          if old<>Keymap.Items[i].Category then
          begin
            Cells[0,j]:= '-';
            Cells[1,j]:= Keymap.Items[i].Category;
            Cells[2,j]:= '';
            Cells[3,j]:= '';
            old:= Cells[1,j];
            Inc(j);
            RowCount:= j+1;
          end;

          //add item
          Cells[0,j]:= IntToStr(i);
          Cells[1,j]:= Keymap.Items[i].DisplayName;
          Cells[2,j]:= '';
          Cells[3,j]:= '';
          if Keymap.Items[i].KeyStrokes.Count>0 then
            Cells[2,j]:= Keymap.Items[i].KeyStrokes.Items[0].AsString;
          if Keymap.Items[i].KeyStrokes.Count>1 then
            Cells[3,j]:= Keymap.Items[i].KeyStrokes.Items[1].AsString;
          Inc(j);
        end;
  end;

  if edFilter.Text='' then
    cbKeyCatChange(Self);

  //scrollbar
  {FillChar(info, SizeOf(info), 0);
  with info do begin
   cbsize := SizeOf(info);
   fmask  := SIF_ALL;
   GetScrollInfo(KeyList.Handle, SB_VERT, info);
   fmask := fmask or SIF_PAGE;
   nPage := 22 * (nmax - nmin) div j;
  end;
  SetScrollInfo(KeyList.Handle, SB_VERT, info, True);}

  g.Left:= 2; g.Top:= 2; g.Right:= 2; g.Bottom:= 2;
  KeyList.Selection:= g;
end;

procedure TfmSetup.KeyListMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  c, r: integer;
begin
  KeyList.MouseToCell(x, y, c, r);
  if (c<0) or (r<0) then Exit;
  if (r=0) or (c=0) then
    KeyList.Hint:= ''
  else
    KeyList.Hint:= KeyList.Cells[c, r];

  Application.ActivateHint(KeyList.ClientToScreen(Point(x, y)));
end;

procedure TfmSetup.KeyListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  r: TGridRect;
begin
  KeyList.Repaint;
  if ARow=0 then Exit;

  if GetKeymappingIndex(ARow)<0 then
  begin
    Inc(ARow);
    ACol:= 0;
  end;
  if (ACol<2) then
  begin
    r.Left:= 2;
    r.Top:= ARow;
    r.Right:= r.Left;
    r.Bottom:= r.Top;
    KeyList.Selection:= r;
    CanSelect:= false;
  end;
end;

procedure TfmSetup.KeyListDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  r: TRect;
  s: WideString;
begin
  if (ARow=0) or (ACol=0) then Exit;
  //category
  if GetKeymappingIndex(ARow)<0 then
  begin
    r:= Rect;
    Inc(r.Right);
    KeyList.Canvas.FillRect(r);
    KeyList.Canvas.Font.Color:= clNavy;
    KeyList.Canvas.Font.Style:= KeyList.Canvas.Font.Style+[fsBold];
    s:= KeyList.Cells[ACol, ARow];
    TextOutW(KeyList.Canvas.Handle, Rect.Left+2, Rect.Top+2, PWChar(s), Length(s));
  end;
  //selection line
  if ARow=KeyList.Selection.Top then begin
    if ACol=KeyList.Selection.Left then
      KeyList.Canvas.Brush.Color:= clHighlight
    else
      KeyList.Canvas.Brush.Color:= clMedGray;
    KeyList.Canvas.FillRect(Rect);
    s:= KeyList.Cells[ACol, ARow];
    TextOutW(KeyList.Canvas.Handle, Rect.Left+2, Rect.Top+2, PWChar(s), Length(s));
  end;
end;

procedure TfmSetup.KeyListClick(Sender: TObject);
begin
  KeyList.Repaint;
end;

procedure TfmSetup.KeyListMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled:= true;
  with KeyList do
  if TopRow>Mouse.WheelScrollLines then
    TopRow:= TopRow-Mouse.WheelScrollLines
  else
    TopRow:= 1;
end;

procedure TfmSetup.KeyListMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Handled:= true;
  with KeyList do
  if TopRow<RowCount-VisibleRowCount then
    TopRow:= TopRow+Mouse.WheelScrollLines;
end;

//misc
procedure TfmSetup.tabFilesShow(Sender: TObject);
begin
  if tabFiles.Tag<>0 then Exit;
  tabFiles.Tag:= 1;
  InitFiles;
end;

procedure TfmSetup.InitSidebar;
  //----
  procedure AddTab(tab: TTntTabSheet);
  const
    SPad = '    ';
  begin
    ListCat.Items.AddObject(SPad+tab.Caption, tab);
  end;
var
  i: Integer;
begin
  for i:= 0 to Tabs.PageCount-1 do
    Tabs.Pages[i].TabVisible:= false;

  ListCat.Items.Clear;
  ListCat.Items.Add(DKLangConstW('zMOp_Intf'));
  AddTab(tabProgSett);
  AddTab(tabKey);
  AddTab(tabColors);
  AddTab(tabFonts);
  AddTab(tabTabs);
  AddTab(tabSearch);
  AddTab(tabTree);

  ListCat.Items.Add(DKLangConstW('zMOp_Editor'));
  AddTab(tabView);
  AddTab(tabSelHL);
  AddTab(tabCarets);
  AddTab(tabUndo);
  AddTab(tabInsertFormat);
  AddTab(tabOvr);
  AddTab(tabACP);

  ListCat.Items.Add(DKLangConstW('zMOp_Files'));
  AddTab(tabNewOpen);
  AddTab(tabASave);
  AddTab(tabHist);
  AddTab(tabFiles);
  AddTab(tabSess);
  AddTab(tabPath);

  //activate last used category
  if fmMain.opTabOptionsIndex<0 then
    ListCat.ItemIndex:= fmMain.opTabOptionsLast
  else
    ListCat.ItemIndex:= fmMain.opTabOptionsIndex;
  ListCatClick(Self);
end;

procedure TfmSetup.FormShow(Sender: TObject);
var
  i, n: Integer;
begin
  FLangChanged:= false;
  InitSidebar;

  n:= KeyList.RowHeights[0];
  n:= ScaleFontSize(n, Self);
  for i:= 0 to KeyList.RowCount-1 do
    KeyList.RowHeights[i]:= n;
end;

procedure TfmSetup.FontDialogShow(Sender: TObject);
begin
  DoCenterForm(FontDialog.Handle, Self);
end;

procedure TfmSetup.tabProgSettShow(Sender: TObject);
begin
  if tabProgSett.Tag<>0 then Exit;
  tabProgSett.Tag:= 1;
  InitProgSett;
end;

procedure TfmSetup.tabACPShow(Sender: TObject);
begin
  if tabACP.Tag<>0 then Exit;
  tabACP.Tag:= 1;
  InitAutoComplete;
end;

procedure TfmSetup.btnClearEdHistoryClick(Sender: TObject);
begin
  fmMain.TBXItemClrClick(Self);
  btnClearEdHistory.Enabled:= false;
end;

procedure TfmSetup.btnClearFindHistoryClick(Sender: TObject);
begin
  fmMain.DoClearSearchHistory;
  btnClearFindHistory.Enabled:= false;
end;

procedure TfmSetup.edTabModeChange(Sender: TObject);
begin
  cbReplaceTabs.Enabled:= edTabMode.ItemIndex=0;
end;

procedure TfmSetup.bColorSaveClick(Sender: TObject);
var
  ok: Boolean;
  i: Integer;
begin
  with SaveDialogPre do
  begin
    InitialDir:= ExtractFileDir(GetColorPresetFN('-'));
    FileName:= '';
    ok:= Execute;
    FixWnd;
    if not ok then Exit;

    if ExtractFileExt(FileName) <> '.'+cColorExt then
      FileName:= FileName+'.'+cColorExt;

    with TIniFile.Create(FileName) do
    try
      EraseSection('Colors');
      for i:= 0 to cColorsNum-1 do
        WriteString('Colors_', cColors[i], ColorToString(ColorsSetup[i]));
    finally
      Free
    end;
  end;
end;

function TfmSetup.GetColorPresetFN(const Name: string): string;
begin
  Result:= SynDataSubdir(cSynDataColors) + '\' + Name + '.' + cColorExt;
end;

procedure TfmSetup.FixWnd;
begin
  if not SynExe then
  begin
    SetForegroundWindow(fmMain.hLister);
    SetForegroundWindow(Handle);
  end;
end;

procedure TfmSetup.bColorLoadClick(Sender: TObject);
var
  i:Integer;
  ok:Boolean;
  s:string;
begin
  with OpenDialogPre do
  begin
    InitialDir:= ExtractFileDir(GetColorPresetFN('-'));
    FileName:= '';
    ok:= Execute;
    FixWnd;
    if not ok then Exit;

    with TIniFile.Create(FileName) do
    try
      for i:= 0 to cColorsNum-1 do
      begin
        s:= ReadString('Colors_', cColors[i], '');
        if s<>'' then
          ColorsSetup[i]:= StringToColor(s);
      end;
    finally
      Free
    end;
  end;

  ListColorsClick(Self);
  ListColors.Invalidate;
end;

procedure TfmSetup.bDirLastClick(Sender: TObject);
var S: Widestring;
begin
  S:= edDirLast.Text;
  if WideSelectDirectory('', '', S) then
    edDirLast.Text:= S;
end;

procedure TfmSetup.tabHistShow(Sender: TObject);
begin
  if tabHist.Tag<>0 then Exit;
  tabHist.Tag:= 1;
  InitHistory;
end;

procedure TfmSetup.cbKeyCatChange(Sender: TObject);
var
  s: Widestring;
  i: Integer;
  r: TGridRect;
begin
  with cbKeyCat do
    s:= Items[ItemIndex];
  with KeyList do
    for i:= 0 to RowCount-1 do
      if (Cells[0,i] = '-') and
         (Cells[1,i] = s) then
      begin
        TopRow:= i;
        r.Top:= TopRow+1;
        r.Bottom:= r.Top;
        r.Left:= 2;
        r.Right:= 2;
        Selection:= r;
        Repaint;
        Break
      end;
end;

procedure TfmSetup.LabelHelpDateFmtClick(Sender: TObject);
begin
  SynHelpTopic(helpDateFmt, Handle);
end;

procedure TfmSetup.tabSearchShow(Sender: TObject);
begin
  if tabSearch.Tag<>0 then Exit;
  tabSearch.Tag:= 1;
  InitSearch;
end;

procedure TfmSetup.cbSessSaveClick(Sender: TObject);
begin
  cbSessDef.Enabled:= cbSessSave.Checked;
end;

procedure TfmSetup.edFilterChange(Sender: TObject);
begin
  TimerFilt.Enabled:= false;
  TimerFilt.Enabled:= true;
end;

procedure TfmSetup.TimerFiltTimer(Sender: TObject);
begin
  TimerFilt.Enabled:= false;
  DoFillKeys;
end;

procedure TfmSetup.edIndentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  begin
    bCan.Click;
    Key:= 0;
    Exit
  end;
  if key=VK_RETURN then
  begin
    bOk.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmSetup.bFiltClearClick(Sender: TObject);
begin
  edFilter.Text:= '';
  TimerFilt.Enabled:= false;
  DoFillKeys;
end;

procedure TfmSetup.tabASaveShow(Sender: TObject);
begin
  if tabASave.Tag<>0 then Exit;
  tabASave.Tag:= 1;
  InitAutoSave;
end;

procedure TfmSetup.bUnnamedBrowseClick(Sender: TObject);
var S: Widestring;
begin
  S:= SExpandVars(edASaveUnnamedDir.Text);
  if WideSelectDirectory('', '', S) then
    edASaveUnnamedDir.Text:= S;
end;

procedure TfmSetup.cbASaveUnnamedClick(Sender: TObject);
var en: boolean;
begin
  en:= cbASaveUnSaveToDir.Checked;
  edASaveUnnamedDir.Enabled:= en;
  bUnnamedBrowse.Enabled:= en;
end;

procedure TfmSetup.cbASaveTimerClick(Sender: TObject);
var
  en: boolean;
begin
  en:= cbASaveTimer.Checked;
  edASaveTime.Enabled:= en;
  labASaveTime.Enabled:= en;
end;

procedure TfmSetup.LabelHelpTabbinClick(Sender: TObject);
begin
  SynHelpTopic(helpSmartTabbing, Handle);
end;

procedure TfmSetup.LabelHelpACloseClick(Sender: TObject);
begin
  SynHelpTopic(helpAutoClose, Handle);
end;

procedure TfmSetup.cbACloseBrClick(Sender: TObject);
begin
  cbACloseBrEsc.Enabled:= cbACloseBr.Checked or cbACloseQuote1.Checked or cbACloseQuote2.Checked;
end;

procedure TfmSetup.ListColorsDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
const
  cRect = 25; //color rect width
  cDx = 2; //offset near cell
var
  RColor, RText: TRect;
begin
  RColor:= Types.Rect(Rect.Left+cDx, Rect.Top+cDx-1, Rect.Left+cDx+cRect, Rect.Bottom-cDx);
  RText:= Types.Rect(Rect.Left+cDx+cRect+cDx, Rect.Top, Rect.Right, Rect.Bottom);
  with ListColors.Canvas do
  begin
    Brush.Color:= clWindow;
    FillRect(Rect);
    Pen.Color:= clGray;
    Brush.Color:= ColorsSetup[cColorsOrder[Index]];

    if Brush.Color<>clNone then
      Rectangle(RColor)
    else
    begin
      Brush.Color:= clWindow;
      Rectangle(RColor);
      MoveTo(RColor.Left, RColor.Top);
      LineTo(RColor.Right-1, RColor.Bottom-1);
      MoveTo(RColor.Right-1, RColor.Top);
      LineTo(RColor.Left, RColor.Bottom-1);
    end;

    if odSelected in State then
    begin
      Brush.Color:= clHighlight;
      Pen.Color:= clHighlightText;
    end
    else
    begin
      Brush.Color:= clWindow;
      Pen.Color:= clWindowText;
    end;

    FillRect(RText);
    ecTextOut(ListColors.Canvas, RText.Left+2*cDx, RText.Top+cDx, ListColors.Items[Index]);
  end;
end;

procedure TfmSetup.ListCatClick(Sender: TObject);
var
  TabObj: TTntTabSheet;
begin
  if ListCat.ItemIndex>=0 then
  begin
    TabObj:= ListCat.Items.Objects[ListCat.ItemIndex] as TTntTabSheet;
    if Assigned(TabObj) then
      Tabs.ActivePage:= TabObj
    else
    begin
      ListCat.ItemIndex:= ListCat.ItemIndex+1;
      ListCatClick(Self);
    end;
  end;
end;

procedure TfmSetup.tabTabsShow(Sender: TObject);
begin
  if tabTabs.Tag<>0 then Exit;
  tabTabs.Tag:= 1;
  InitTabs;
end;

procedure TfmSetup.tabFontsShow(Sender: TObject);
begin
  if tabFonts.Tag<>0 then Exit;
  tabFonts.Tag:= 1;
  InitFonts;
end;

procedure TfmSetup.tabTreeShow(Sender: TObject);
begin
  if tabTree.Tag<>0 then Exit;
  tabTree.Tag:= 1;
  InitTree;
end;

procedure TfmSetup.tabSessShow(Sender: TObject);
begin
  if tabSess.Tag<>0 then Exit;
  tabSess.Tag:= 1;
  InitSessionsProjects;
end;

procedure TfmSetup.cbLangChange(Sender: TObject);
begin
  FLangChanged:= true;
  labLangInfo.Caption:= DKLangConstW('MLnApply');
  labLangInfo.Font.Color:= clNavy;
  labLangInfo.Show;
end;

procedure TfmSetup.bAddFolderClick(Sender: TObject);
var
  s: Widestring;
begin
  s:= '';
  if WideSelectDirectory('', '', s) then
    edFolders.Lines.Add(s);
  SetFocus;//TC
end;

procedure TfmSetup.edFoldersKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) then
  begin
    bCan.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmSetup.tabPathShow(Sender: TObject);
begin
  if tabPath.Tag<>0 then Exit;
  tabPath.Tag:= 1;
  InitSearchFolders;
end;

procedure TfmSetup.tabOvrShow(Sender: TObject);
begin
  if tabOvr.Tag<>0 then Exit;
  tabOvr.Tag:= 1;
  InitEditorOverrides;
end;

procedure TfmSetup.TntFormCreate(Sender: TObject);
var
  sh: TATCaretShape;
begin
  fmOvr:= nil;

  with ListColors do
    ItemHeight:= ScaleFontSize(ItemHeight, Self);

  OpenDialogPre.Filter:= cColorFilter;
  SaveDialogPre.Filter:= cColorFilter;

  //fill caret shape
  edCaretShapeIns.Items.Clear;
  for sh:= Low(TATCaretShape) to High(TATCaretShape) do
    edCaretShapeIns.Items.Add('  '+cCaretDesc[sh]);
    
  edCaretShapeOvr.Items.Assign(edCaretShapeIns.Items);

  //Delphi needs
  cbColors.AddItem('(None)', TObject(clNone));
end;

procedure TfmSetup.tabCaretsShow(Sender: TObject);
begin
  if tabCarets.Tag<>0 then Exit;
  tabCarets.Tag:= 1;
  InitEditorCarets;
end;

procedure TfmSetup.LabelHelpCaretsClick(Sender: TObject);
begin
  SynHelpTopic(helpCarets, Handle);
end;

procedure TfmSetup.LabelHelpAcpHtmlClick(Sender: TObject);
begin
  SynHelpTopic(helpAcp, Handle);
end;

procedure TfmSetup.ApplyFiles;
begin
  with fmMain do
  begin
    opReloadMode:= TSynReloadMode(cbNotif.ItemIndex);
    opAskOverwrite:= cbOverRO.Checked;
    opTextOnly:= TSynBinaryAct(cbText_.ItemIndex);
    opOpenAsOem:= edOem.Text;
    opOpenAsUtf8:= edUTF8.Text;
    opFollowTail:= cbTail.Checked;
    opUnicodeNeeded:= cbUniNeed.ItemIndex;
  end;
end;

procedure TfmSetup.ApplyAutoComplete;
begin
  with fmMain do
  begin
    opAcpHtm:= cbAcpHtm.Checked;
    opAcpCss:= cbAcpCss.Checked;
    opAcpTabbing:= cbAcpTabbing.Checked;
    opAutoCloseTags:= cbACloseTags.Checked;
    opAutoCloseBrackets:= cbACloseBr.Checked;
    opAutoCloseBracketsNoEsc:= cbACloseBrEsc.Checked;
    opAutoCloseQuotes1:= cbACloseQuote1.Checked;
    opAutoCloseQuotes2:= cbACloseQuote2.Checked;
    opAcpUseSingle:= cbAcpUseSingle.Checked;
    ParamCompletion.Enabled:= cbAcpParamHints.Checked;
    SyntaxManagerChange(nil);
    ecACP.DropDownCount:= edAcpDrop.Value;
    ecACP.ShowWhenNone:= cbAcpNone.Checked;
    ecACP.FilterType:= TAutoCompleteFilter(cbAcpFilter.ItemIndex);
    opAcpHintDelay:= edAcpHintDelay.Value;
    ApplyACP;

    opTemplateTabbingExcept:= edNoSnippetsExt.Text;
  end;
end;

procedure TfmSetup.ApplyAutoSave;
begin
  with fmMain do
  begin
    opASaveOnTimer:= cbASaveTimer.Checked;
    opASaveOnFocus:= cbASaveFocus.Checked;
    opASaveTimeMin:= edASaveTime.Value;
    opASaveAllFiles:= cbASaveAllFiles.Checked;
    opASaveMaxSizeKb:= edASaveMaxSize.Value;
    if cbASaveUnIgnore.Checked then opASaveUnnamed:= cAutoSaveIgnore else
     if cbASaveUnShowSave.Checked then opASaveUnnamed:= cAutoSavePromptFN else
      if cbASaveUnSaveToDir.Checked then opASaveUnnamed:= cAutoSaveSaveToDir;
    opASaveUnnamedDir:= edASaveUnnamedDir.Text;
    ApplyAutoSave;
  end;
end;

procedure TfmSetup.ApplyColors;
begin
  with fmMain do
  begin
    opTheme:= cbTheme.Text;
    opIcons:= cbIcons.Text;

    Move(ColorsSetup, ColorsArray, SizeOf(TSynColors));
    ApplyColorsFontsToFrames;
    
    ApplyColors;
    ApplyOut;
    ApplyMinimapProps;
    ApplyCarets;
  end;
end;

procedure TfmSetup.ApplyEditorCarets;
begin
  with fmMain do
  begin
    opCaretsEnabled:= cbCaretMulti.Checked;
    opCaretShapeIns:= TATCaretShape(edCaretShapeIns.ItemIndex);
    opCaretShapeOvr:= TATCaretShape(edCaretShapeOvr.ItemIndex);

    if edCaretTime.Position=edCaretTime.Max then
      opCaretTime:= cMaxCaretTime
    else
      opCaretTime:= edCaretTime.Position*100;

    if cbCaretSmart.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soSmartCaret]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soSmartCaret];

    if cbCaretVirtual.Checked then
      TemplateEditor.Options:= TemplateEditor.Options - [soKeepCaretInText]
    else
      TemplateEditor.Options:= TemplateEditor.Options + [soKeepCaretInText];

    if cbCaretKeepPos.Checked then
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx + [soKeepCaretPaste]
    else
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx - [soKeepCaretPaste];

    if cbCaretROnly.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soAlwaysShowCaret]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soAlwaysShowCaret];

    ApplyCarets;
    ApplyColorsFontsToFrames;
  end;
end;

procedure TfmSetup.ApplyEditorOverrides;
begin
  //none
end;

procedure TfmSetup.ApplyFonts;
begin
  with fmMain do
  begin
    TemplateEditor.Font:= bFontText.Font;
    TemplateEditor.LineNumbers.Font:= bFontNumbers.Font;
    TemplateEditor.HorzRuler.Font:= bFontRuler.Font;
    Tree.Font:= bFontTree.Font;
    ecACP.Font:= bFontAcp.Font;
    ListOut.Font:= bFontOutput.Font;
    MemoConsole.Font:= bFontConsole.Font;
    EdConsole.Font:= MemoConsole.Font;
    FFontTabs.Assign(bFontTabs.Font);
    FFontMenus.Assign(bFontMenus.Font);

    ApplyACP;
    ApplyOut;
    ApplyFonts;
  end;
end;

procedure TfmSetup.ApplyHistory;
begin
  with fmMain do
  begin
    opMruCheck:= cbHistoryCleanRecents.Checked;
    opSaveFileCount:= edFileCount.Value;
    opSaveFindCount:= edFindCount.Value;
    opLastDirMode:= TSynLastDirMode(cbDirLast.ItemIndex);
    opLastDirPath:= edDirLast.Text;

    opSaveEditor:= [];
    if cbHistoryCaret.Checked then Include(opSaveEditor, cSynHistoryCaret);
    if cbHistoryEnc.Checked then Include(opSaveEditor, cSynHistoryEnc);
    if cbHistoryWrap.Checked then Include(opSaveEditor, cSynHistoryWrap);
    if cbHistoryBkmk.Checked then Include(opSaveEditor, cSynHistoryBkmk);
    if cbHistoryFold.Checked then Include(opSaveEditor, cSynHistoryFolding);
    if cbHistoryForTemp.Checked then Include(opSaveEditor, cSynHistoryForTemp);
  end;
end;

procedure TfmSetup.ApplyUndo;
begin
  with fmMain do
  begin
    TemplateEditor.UndoLimit:= edUndoLimit.Value;
    opBkUndo:= cbUndoMass.Checked;

    if cbGroupUndo.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soGroupUndo]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soGroupUndo];

    if cbGroupUndo.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soGroupRedo]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soGroupRedo];

    if cbUndoAfterSave.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soUndoAfterSave]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soUndoAfterSave];

    if cbUndoSimple.Checked then
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx + [soSimplifiedUndo]
    else
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx - [soSimplifiedUndo];

    ApplyColorsFontsToFrames;
  end;
end;


procedure TfmSetup.ApplyProgSett;
begin
  ApplyLang;

  with fmMain do
  begin
    opShowCharInfo:= cbChar.Checked;
    UpdateStatusbar;

    //Menu.Visible:= cbMenu.Checked;
    Status.Visible:= cbStat.Checked;
    opEsc:= TSynEscMode(cbEsc.ItemIndex);
    opSingleInstance:= cbInst.Checked;

    opSaveWndPos:= cbSavePos.Checked;
    opShowRecentColors:= TSynRecentColors(cbRecColors.ItemIndex);
    ApplyShowRecentColors;
    opLexerGroups:= cbGroupLexers.Checked;
    opShowMenuIcons:= cbMenuIcon.Checked;
    ApplyShowIconsInMenus;
    opShowTitleFull:= cbFullTitle.Checked;
    opBeep:= cbBeep.Checked;
    opClipHook:= cbClipHook.Checked;

    //redraw
    tbFile.Invalidate;
    tbEdit.Invalidate;
    tbView.Invalidate;
    plTree.Invalidate;
    //
  end;
end;

procedure TfmSetup.ApplySearch;
begin
  with fmMain do
  begin
    opMaxTreeMatches:= edSrMaxTreeMatches.Value;
    opFindOffsetTop:= edSrOffsetY.Value;
    opFindExpand:= cbSrExpand.Checked;
    opFindOnTop:= cbSrOnTop.Checked;
    opFindSuggestWord:= cbSrWord.Checked;
    opFindSuggestSel:= cbSrSel.Checked;
    opShowQsCaptions:= cbSrQsCap.Checked;
    ApplyQs;
  end;
end;

procedure TfmSetup.ApplySearchFolders;
begin
  with fmMain do
  begin
    SListToString(edFolders.Lines, opProjPaths);
  end;
end;

procedure TfmSetup.ApplySessionsProjects;
begin
  with fmMain do
  begin
    opHistSessionSave:= cbSessSave.Checked;
    opHistSessionLoad:= cbSessLoad.Checked;
    opHistSessionProjSave:= cbProjSessSave.Checked;
    opHistSessionProjLoad:= cbProjSessOpen.Checked;
    opHistSessionDef:= cbSessDef.Checked;
    opHistProjectSave:= cbProjSave.Checked;
    opHistProjectLoad:= cbProjLoad.Checked;
    opHistProjectCloseTabs:= cbProjCloseTabs.Checked;
  end;
end;

procedure TfmSetup.ApplyTabs;
begin
  with fmMain do
  begin
    opTabVisible:= cbTabVis.Checked;
    opTabXButtons:= cbTabBtn.Checked;
    opTabPlus:= cbTabPlus.Checked;
    opTabNums:= cbTabNums.Checked;
    opTabEntireColor:= cbTabEntire.Checked;
    opTabDblClickClose:= cbTabDblClose.Checked;
    opTabSwitcher:= cbTabSw.Checked;
    opTabAtBottom:= cbTabDown.Checked;
    opTabFolders:= cbTabDirs.Checked;
    opTabAngle:= edTabAngle.Value;

    opTabWidthMin:= edTabMinLen.Value;
    opTabWidthMax:= edTabMaxLen.Value;
    if opTabWidthMin>opTabWidthMax then
      opTabWidthMax:= opTabWidthMin;

    ApplyTabOptions;
    ApplyFramesOptions;
  end;
end;

procedure TfmSetup.ApplyTree;
begin
  with fmMain do
  begin
    Tree.ClickAction:= TSyntaxTreeAction(cbTreeClick.ItemIndex);
    Tree.AutoSynchronize:= cbTreeSync.Checked;
    Tree.AutoCollapse:= cbTreeCollapse.Checked;
    Tree.AutoExpand:= cbTreeExpand.Checked;
    Tree.UpdateDelay:= cbTreeDelay.Value;
    opTreeSorted:= edTreeSorted.Text;

    opMicroMap:= cbMicroMap.Checked;
    ApplyFramesOptions;
  end;
end;

procedure TfmSetup.InitAutoComplete;
begin
  with fmMain do
  begin
    cbAcpHtm.Checked:= opAcpHtm;
    cbAcpCss.Checked:= opAcpCss;
    cbAcpTabbing.Checked:= opAcpTabbing;
    cbACloseTags.Checked:= opAutoCloseTags;

    cbACloseBr.Checked:= opAutoCloseBrackets;
    cbACloseBrEsc.Checked:= opAutoCloseBracketsNoEsc;
    cbACloseQuote1.Checked:= opAutoCloseQuotes1;
    cbACloseQuote2.Checked:= opAutoCloseQuotes2;
    cbACloseBrClick(Self);

    cbAcpParamHints.Checked:= ParamCompletion.Enabled;
    cbAcpUseSingle.Checked:= opAcpUseSingle;
    cbAcpNone.Checked:= ecACP.ShowWhenNone;
    cbAcpFilter.ItemIndex:= integer(ecACP.FilterType);
    edAcpDrop.Value:= ecACP.DropDownCount;
    edAcpHintDelay.Value:= opAcpHintDelay;

    edNoSnippetsExt.Text:= opTemplateTabbingExcept;
  end;
end;

procedure TfmSetup.InitAutoSave;
begin
  with fmMain do
  begin
    cbASaveTimer.Checked:= opASaveOnTimer;
    cbASaveFocus.Checked:= opASaveOnFocus;
    edASaveTime.Value:= opASaveTimeMin;
    cbASaveAllFiles.Checked:= opASaveAllFiles;
    cbASaveCurrFile.Checked:= not opASaveAllFiles;
    edASaveMaxSize.Value:= opASaveMaxSizeKb;
    cbASaveUnIgnore.Checked:= opASaveUnnamed=cAutoSaveIgnore;
    cbASaveUnShowSave.Checked:= opASaveUnnamed=cAutoSavePromptFN;
    cbASaveUnSaveToDir.Checked:= opASaveUnnamed=cAutoSaveSaveToDir;
    edASaveUnnamedDir.Text:= opASaveUnnamedDir;
    cbASaveTimerClick(Self);
    cbASaveUnnamedClick(Self);
  end;
end;


procedure TfmSetup.InitColors;
var
  i: Integer;
  L: TTntStringList;
begin
  //1) skin
  cbTheme.ItemIndex:= cbTheme.Items.IndexOf(fmMain.opTheme);

  //2) icons
  L:= TTntStringList.Create;
  try
    fmMain.DoEnumIcons(L);
    cbIcons.Items:= L;
    cbIcons.ItemIndex:= cbIcons.Items.IndexOf(fmMain.opIcons);
  finally
    FreeAndNil(L);
  end;

  //3) colors
  Move(fmMain.ColorsArray, ColorsSetup, SizeOf(TSynColors));

  ListColors.Items.BeginUpdate;
  try
    ListColors.Items.Clear;
    for i:= Low(cColorsOrder) to High(cColorsOrder) do
      ListColors.Items.Add(DKLangConstW(_ColorIndexToDklangID(cColorsOrder[i])));
    ListColors.Selected[0]:= true;
    ListColorsClick(Self);
  finally
    ListColors.Items.EndUpdate;
  end;
end;

procedure TfmSetup.InitEditorCarets;
begin
  with fmMain do
  begin
    cbCaretMulti.Checked:= opCaretsEnabled;
    edCaretShapeIns.ItemIndex:= Ord(opCaretShapeIns);
    edCaretShapeOvr.ItemIndex:= Ord(opCaretShapeOvr);

    if opCaretTime>=cMaxCaretTime then
      edCaretTime.Position:= edCaretTime.Max
    else
      edCaretTime.Position:= opCaretTime div 100;

    cbCaretSmart.Checked:= soSmartCaret in TemplateEditor.Options;
    cbCaretVirtual.Checked:= not (soKeepCaretInText in TemplateEditor.Options);
    cbCaretKeepPos.Checked:= soKeepCaretPaste in TemplateEditor.OptionsEx;
    cbCaretROnly.Checked:= soAlwaysShowCaret in TemplateEditor.Options;
  end;
end;

procedure TfmSetup.InitEditorOverrides;
begin
  fmOvr:= TfmSetupOvr.Create(Self);
  fmOvr.Parent:= tabOvr;
  fmOvr.Align:= alClient;
  fmOvr.BorderStyle:= bsNone;

  with fmOvr do
  begin
    FDefTabStop:= fmMain.TemplateEditor.TabList.AsString;
    case fmMain.TemplateEditor.TabMode of
      tmSpaces: FDefTabMode:= 0;
      tmTabChar: FDefTabMode:= 1;
      tmSmartTab: FDefTabMode:= 2;
    end;

    FDefIndent:= fmMain.TemplateEditor.BlockIndent;
    FDefMargin:= fmMain.TemplateEditor.RightMargin;
    FDefSpacing:= fmMain.TemplateEditor.LineSpacing;

    ListLex.Items.Clear;
    fmMain.DoEnumLexers(ListLex.Items);
  end;
  fmOvr.Show;
end;

procedure TfmSetup.InitFiles;
begin
  with fmMain do
  begin
    cbNotif.ItemIndex:= Ord(opReloadMode);
    cbOverRO.Checked:= opAskOverwrite;
    cbText_.ItemIndex:= Ord(opTextOnly);
    edOem.Text:= opOpenAsOem;
    edUTF8.Text:= opOpenAsUtf8;
    cbTail.Checked:= opFollowTail;
    cbUniNeed.ItemIndex:= opUnicodeNeeded;
  end;
end;

procedure TfmSetup.InitFonts;
begin
  with fmMain do
  begin
    bFontText.Font:= TemplateEditor.Font;
    bFontNumbers.Font:= TemplateEditor.LineNumbers.Font;
    bFontRuler.Font:= TemplateEditor.HorzRuler.Font;
    bFontTree.Font:= Tree.Font;
    bFontAcp.Font:= ecACP.Font;
    bFontOutput.Font:= ListOut.Font;
    bFontConsole.Font:= MemoConsole.Font;
    bFontTabs.Font:= FFontTabs;
    bFontMenus.Font:= FFontMenus;
  end;
end;

procedure TfmSetup.InitHistory;
begin
  with fmMain do
  begin
    edFileCount.Value:= opSaveFileCount;
    edFindCount.Value:= opSaveFindCount;
    cbHistoryCleanRecents.Checked:= opMruCheck;
    cbDirLast.ItemIndex:= Ord(opLastDirMode);
    edDirLast.Text:= opLastDirPath;

    cbHistoryCaret.Checked:= cSynHistoryCaret in opSaveEditor;
    cbHistoryEnc.Checked:= cSynHistoryEnc in opSaveEditor;
    cbHistoryWrap.Checked:= cSynHistoryWrap in opSaveEditor;
    cbHistoryBkmk.Checked:= cSynHistoryBkmk in opSaveEditor;
    cbHistoryFold.Checked:= cSynHistoryFolding in opSaveEditor;
    cbHistoryForTemp.Checked:= cSynHistoryForTemp in opSaveEditor;
  end;
end;


procedure TfmSetup.InitUndo;
begin
  with fmMain do
  begin
    edUndoLimit.Value:= TemplateEditor.UndoLimit;
    cbGroupUndo.Checked:= soGroupUndo in TemplateEditor.Options;
    cbUndoAfterSave.Checked:= soUndoAfterSave in TemplateEditor.Options;
    cbUndoSimple.Checked:= soSimplifiedUndo in TemplateEditor.OptionsEx;
    cbUndoMass.Checked:= opBkUndo;
  end;
end;


procedure TfmSetup.InitProgSett;
begin
  InitLang;

  with fmMain do
  begin
    //cbMenu.Checked:= Menu.Visible;
    cbStat.Checked:= Status.Visible;
    cbChar.Checked:= opShowCharInfo;

    cbEsc.ItemIndex:= Ord(opEsc);
    cbInst.Checked:= opSingleInstance;

    cbSavePos.Checked:= opSaveWndPos;
    cbRecColors.ItemIndex:= Ord(opShowRecentColors);
    cbGroupLexers.Checked:= opLexerGroups;
    cbFullTitle.Checked:= opShowTitleFull;
    cbMenuIcon.Checked:= opShowMenuIcons;
    cbBeep.Checked:= opBeep;
    cbClipHook.Checked:= opClipHook;
  end;
end;

procedure TfmSetup.InitKeys;
var
  L: TTntStringList;
  i: Integer;
begin
  //list categories
  L:= TTntStringList.Create;
  try
    for i:= 0 to Keymap.Items.Count-1 do
      if Keymap.Items[i].Customizable then
        if L.IndexOf(Keymap.Items[i].Category)<0 then
          L.Add(Keymap.Items[i].Category);

    cbKeyCat.Items.AddStrings(L);
    cbKeyCat.ItemIndex:= 0;
  finally
    FreeandNil(L);
  end;

  //list keys
  Screen.Cursor:= crHourGlass;
  try
    DoFillKeys;
  finally
    Screen.Cursor:= crDefault;
  end;

  KeyList.SetFocus;
end;

procedure TfmSetup.InitSearch;
begin
  with fmMain do
  begin
    edSrMaxTreeMatches.Value:= opMaxTreeMatches;
    edSrOffsetY.Value:= opFindOffsetTop;
    cbSrExpand.Checked:= opFindExpand;
    cbSrOnTop.Checked:= opFindOnTop;
    cbSrWord.Checked:= opFindSuggestWord;
    cbSrSel.Checked:= opFindSuggestSel;
    cbSrQsCap.Checked:= opShowQsCaptions;
  end;
end;

procedure TfmSetup.InitSearchFolders;
begin
  SStringToList(fmMain.opProjPaths, edFolders.Lines);
end;

procedure TfmSetup.InitSessionsProjects;
begin
  with fmMain do
  begin
    cbSessSave.Checked:= opHistSessionSave;
    cbSessLoad.Checked:= opHistSessionLoad;
    cbProjSessSave.Checked:= opHistSessionProjSave;
    cbProjSessOpen.Checked:= opHistSessionProjLoad;
    cbSessDef.Checked:= opHistSessionDef;
    cbSessSaveClick(Self);
    cbProjSave.Checked:= opHistProjectSave;
    cbProjLoad.Checked:= opHistProjectLoad;
    cbProjCloseTabs.Checked:= opHistProjectCloseTabs;
  end;
end;


procedure TfmSetup.InitTabs;
begin
  with fmMain do
  begin
    cbTabBtn.Checked:= opTabXButtons;
    cbTabPlus.Checked:= opTabPlus;
    cbTabVis.Checked:= opTabVisible;
    cbTabNums.Checked:= opTabNums;
    cbTabEntire.Checked:= opTabEntireColor;
    cbTabDblClose.Checked:= opTabDblClickClose;
    cbTabDown.Checked:= opTabAtBottom;
    cbTabSw.Checked:= opTabSwitcher;
    cbTabDirs.Checked:= opTabFolders;
    edTabMinLen.Value:= opTabWidthMin;
    edTabMaxLen.Value:= opTabWidthMax;
    edTabAngle.Value:= opTabAngle;
  end;
end;

procedure TfmSetup.InitTree;
begin
  with fmMain do
  begin
    cbTreeSync.Checked:= Tree.AutoSynchronize;
    cbTreeCollapse.Checked:= Tree.AutoCollapse;
    cbTreeExpand.Checked:= Tree.AutoExpand;
    cbTreeDelay.Value:= Tree.UpdateDelay;
    edTreeSorted.Text:= opTreeSorted;
    cbTreeClick.ItemIndex:= Ord(Tree.ClickAction);
    cbMicroMap.Checked:= opMicroMap;
  end;
end;

procedure TfmSetup.ApplyLang;
begin
  with fmMain do
    opLang:= LangManager.LanguageIDs[cbLang.ItemIndex];
end;

procedure TfmSetup.InitLang;
var
  i: Integer;
begin
  with cbLang do begin
    Items.Clear;
    for i:= 0 to LangManager.LanguageCount-1 do
      Items.Add(LangManager.LanguageNames[i]);
    ItemIndex:= LangManager.LanguageIndex;
  end;
end;

procedure TfmSetup.tabNewOpenShow(Sender: TObject);
begin
  if tabNewOpen.Tag<>0 then Exit;
  tabNewOpen.Tag:= 1;
  InitNewOpen;
end;

procedure TfmSetup.ApplyNewOpen;
begin
  with fmMain do
  begin
    opNewEnc:= edEnc.ItemIndex;
    opNewLineEnds:= edLE.ItemIndex;
    if edLex.ItemIndex=0 then
      opNewLexer:= ''
    else
      opNewLexer:= edLex.Text;
    opBigSize:= edBigSize.Value;
  end;
end;

procedure TfmSetup.InitNewOpen;
begin
  with fmMain do
  begin
    edLex.Items.Clear;
    edLex.Items.Add(' '+DKLangConstW('None'));
    DoEnumLexers(edLex.Items);

    with edLex do
      if opNewLexer='' then
        ItemIndex:= 0
      else
        ItemIndex:= Items.IndexOf(opNewLexer);
    edEnc.ItemIndex:= opNewEnc;
    edLE.ItemIndex:= opNewLineEnds;

    edBigSize.Value:= opBigSize;
  end;
end;

procedure TfmSetup.tabViewShow(Sender: TObject);
begin
  if tabView.Tag<>0 then Exit;
  tabView.Tag:= 1;
  InitView;
end;

procedure TfmSetup.tabSelHLShow(Sender: TObject);
begin
  if tabSelHL.Tag<>0 then Exit;
  tabSelHL.Tag:= 1;
  InitSelHL;
end;

procedure TfmSetup.tabInsertFormatShow(Sender: TObject);
begin
  if tabInsertFormat.Tag<>0 then Exit;
  tabInsertFormat.Tag:= 1;
  InitInsertFormat;
end;

procedure TfmSetup.ApplyInsertFormat;
begin
  with fmMain do
  begin
    TemplateEditor.BlockIndent:= edIndent.Value;
    TemplateEditor.TabList.AsString:= edTabStops.Text;
    case edTabMode.ItemIndex of
      0: TemplateEditor.TabMode:= tmSpaces;
      1: TemplateEditor.TabMode:= tmTabChar;
      2: TemplateEditor.TabMode:= tmSmartTab;
    end;
    opTabsReplace:= cbReplaceTabs.Checked;

    if cbAutoIndent.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soAutoIndentMode]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soAutoIndentMode];

    if cbBackspUnindent.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soBackUnindent]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soBackUnindent];

    if cbUnindentAlign.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soUnindentKeepAlign]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soUnindentKeepAlign];

    if cbDeleteBlanks.Checked then
      TemplateEditor.Options:= TemplateEditor.Options - [soKeepTrailingBlanks]
    else
      TemplateEditor.Options:= TemplateEditor.Options + [soKeepTrailingBlanks];

    //OptimalFill: get value from TabMode
    if TemplateEditor.TabMode=tmTabChar then
      TemplateEditor.Options:= TemplateEditor.Options + [soOptimalFill]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soOptimalFill];

    ApplyFramesOptions;
    ApplyColorsFontsToFrames;
  end;
end;

procedure TfmSetup.ApplySelHL;
begin
  with fmMain do
  begin
    opHiliteUrls:= cbUrlHilite.Checked;
    opSingleClickURL:= cbUrlClick.Checked;
    ApplyUrlClick;

    opCopyLineIfNoSel:= cbCopyLineNoSel.Checked;
    opCutLineIfNoSel:= cbCutLineNoSel.Checked;
    opLeftRightSelJump:= cbSelJump.Checked;

    if cbColorOnEmpty.Checked then
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx - [soNormalSelToLineEnd]
    else
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx + [soNormalSelToLineEnd];

    if cbSelOverwrite.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soOverwriteBlocks]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soOverwriteBlocks];

    {
    if cbSelPreserve.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soPersistentBlocks]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soPersistentBlocks];
      }
    TemplateEditor.Options:= TemplateEditor.Options - [soPersistentBlocks];

    if cbSelLineByDClick.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soDoubleClickLine]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soDoubleClickLine];

    if cbSelByWords.Checked then
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx + [soAllowSelectByWords]
    else
      TemplateEditor.OptionsEx:= TemplateEditor.OptionsEx - [soAllowSelectByWords];

    if cbCopyRtf.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soCopyAsRTF]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soCopyAsRTF];

    if cbSelDragDrop.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soDragText]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soDragText];

    if cbCollapseEmpty.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soCallapseEmptyLines]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soCallapseEmptyLines];

    if cbSelGreedy.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soGreedySelect]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soGreedySelect];

    case cbSelMode.ItemIndex of
      0: TemplateEditor.SelectModeDefault:= msNormal;
      1: TemplateEditor.SelectModeDefault:= msColumn;
      2: TemplateEditor.SelectModeDefault:= msLine;
    end;

    ApplyEdOptions;
    ApplyFramesOptions;
    ApplyColorsFontsToFrames;
  end;
end;

procedure TfmSetup.ApplyView;
begin
  with fmMain do
  begin
    TemplateEditor.WordWrap:= edWrap.ItemIndex < 2;
    TemplateEditor.DisableFolding:= not cbFold.Checked;
    TemplateEditor.HorzRuler.Visible:= cbRuler.Checked;
    TemplateEditor.DefaultStyles.CurrentLine.Enabled:= cbDrawLineBG.Checked;
    TemplateEditor.LineSpacing:= edLineSpace.Value;
    TemplateEditor.ShowRightMargin:= cbMargin.Checked;
    TemplateEditor.RightMargin:= edMargin.Value;
    TemplateEditor.LineNumbers.NumberingStyle:= TLineNumberingStyle(edLineNums.ItemIndex);
    opShowBookmarkColumn:= cbGutterBmCol.Checked;
    opSyncEditIcon:= cbGutterSyncIcon.Checked;
    opStapleKind:= cbStapleKind.ItemIndex;

    if cbDrawFocus.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soDrawCurLineFocus]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soDrawCurLineFocus];

    if cbHideCursor.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soHideCursorOnType]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soHideCursorOnType];

    if cbFixLineSize.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soFixedLineHeight]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soFixedLineHeight];

    if cbScrollLast.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soScrollLastLine]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soScrollLastLine];

    if edWrap.ItemIndex=1 then
      TemplateEditor.Options:= TemplateEditor.Options + [soBreakOnRightMargin]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soBreakOnRightMargin];

    if cbFixColMove.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soFixedColumnMove]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soFixedColumnMove];

    if cbVarHorzBar.Checked then
      TemplateEditor.Options:= TemplateEditor.Options + [soVariableHorzScrollBar]
    else
      TemplateEditor.Options:= TemplateEditor.Options - [soVariableHorzScrollBar];

    opNonPrint:= cbNPrintShow.Checked;
    opNonPrintSpaces:= cbNPrintSp.Checked;
    opNonPrintEol:= cbNPrintEol.Checked;
    opNonPrintEolDetail:= cbNPrintEolEx.Checked;

    opShowWrapMark:= cbGutterWrapMark.Checked;
    opShowCurrentColumn:= cbDrawCol.Checked;

    ApplyEdOptions;
    ApplyFramesOptions;
    ApplyColorsFontsToFrames;
  end;
end;

procedure TfmSetup.InitInsertFormat;
begin
  with fmMain do
  begin
    edIndent.Value:= TemplateEditor.BlockIndent;
    edTabStops.Text:= TemplateEditor.TabList.AsString;
    case TemplateEditor.TabMode of
      tmSpaces:   edTabMode.ItemIndex:= 0;
      tmTabChar:  edTabMode.ItemIndex:= 1;
      tmSmartTab: edTabMode.ItemIndex:= 2;
    end;
    cbReplaceTabs.Checked:= opTabsReplace;
    edTabModeChange(Self);

    cbAutoIndent.Checked:= soAutoIndentMode in TemplateEditor.Options;
    cbBackspUnindent.Checked:= soBackUnindent in TemplateEditor.Options;
    cbUnindentAlign.Checked:= soUnindentKeepAlign in TemplateEditor.Options;
    cbDeleteBlanks.Checked:= not (soKeepTrailingBlanks in TemplateEditor.Options);
  end;
end;

procedure TfmSetup.InitSelHL;
begin
  with fmMain do
  begin
    cbUrlHilite.Checked:= opHiliteUrls;
    cbUrlClick.Checked:= opSingleClickURL;

    cbSelJump.Checked:= opLeftRightSelJump;
    cbCopyLineNoSel.Checked:= opCopyLineIfNoSel;
    cbCutLineNoSel.Checked:= opCutLineIfNoSel;
    cbCopyRtf.Checked:= soCopyAsRTF in TemplateEditor.Options;
    cbColorOnEmpty.Checked:= not (soNormalSelToLineEnd in TemplateEditor.OptionsEx);

    cbSelOverwrite.Checked:= sooverwriteBlocks in TemplateEditor.Options;
    //cbSelPreserve.Checked:= soPersistentBlocks in TemplateEditor.Options;
    cbSelLineByDClick.Checked:= soDoubleClickLine in TemplateEditor.Options;
    cbSelByWords.Checked:= soAllowSelectByWords in TemplateEditor.OptionsEx;
    cbSelDragDrop.Checked:= soDragText in TemplateEditor.Options;
    cbSelGreedy.Checked:= soGreedySelect in TemplateEditor.Options;
    cbCollapseEmpty.Checked:= soCallapseEmptyLines in TemplateEditor.Options;

    case TemplateEditor.SelectModeDefault of
      msNone,
      msNormal: cbSelMode.ItemIndex:= 0;
      msColumn: cbSelMode.ItemIndex:= 1;
      msLine: cbSelMode.ItemIndex:= 2;
    end;
  end;
end;

procedure TfmSetup.InitView;
begin
  with fmMain do
  begin
    cbRuler.Checked:= TemplateEditor.HorzRuler.Visible;
    cbHideCursor.Checked:= soHideCursorOnType in TemplateEditor.Options;
    cbDrawFocus.Checked:= soDrawCurLineFocus in TemplateEditor.Options;
    cbDrawLineBG.Checked:= TemplateEditor.DefaultStyles.CurrentLine.Enabled;
    cbGutterWrapMark.Checked:= opShowWrapMark;
    cbGutterBmCol.Checked:= opShowBookmarkColumn;
    cbGutterSyncIcon.Checked:= opSyncEditIcon;
    cbMargin.Checked:= TemplateEditor.ShowRightMargin;
    edMargin.Value:= TemplateEditor.RightMargin;
    edLineSpace.Value:= TemplateEditor.LineSpacing;
    edLineNums.ItemIndex:= Ord(TemplateEditor.LineNumbers.NumberingStyle);
    cbDrawCol.Checked:= opShowCurrentColumn;
    cbStapleKind.ItemIndex:= opStapleKind;

    if not TemplateEditor.WordWrap then
      edWrap.ItemIndex:= 2
    else
    if soBreakOnRightMargin in TemplateEditor.Options then
      edWrap.ItemIndex:= 1
    else
      edWrap.ItemIndex:= 0;

    cbFold.Checked:= not TemplateEditor.DisableFolding;
    cbFixLineSize.Checked:= soFixedLineHeight in TemplateEditor.Options;
    cbFixColMove.Checked:= soFixedColumnMove in TemplateEditor.Options;
    cbScrollLast.Checked:= soScrollLastLine in TemplateEditor.Options;
    cbVarHorzBar.Checked:= soVariableHorzScrollBar in TemplateEditor.Options;

    cbNPrintShow.Checked:= opNonPrint;
    cbNPrintSp.Checked:= opNonPrintSpaces;
    cbNPrintEol.Checked:= opNonPrintEol;
    cbNPrintEolEx.Checked:= opNonPrintEolDetail;
  end;
end;

procedure TfmSetup.tabUndoShow(Sender: TObject);
begin
  if tabUndo.Tag<>0 then Exit;
  tabUndo.Tag:= 1;
  InitUndo;
end;

function TfmSetup.GetKeymappingIndex(Row: integer): integer;
begin
  Result:= StrToIntDef(KeyList.Cells[0, Row], -1);
end;

procedure TfmSetup.bFontTabsClick(Sender: TObject);
begin
  DoFontConfig(bFontTabs);
end;

procedure TfmSetup.bFontMenusClick(Sender: TObject);
begin
  DoFontConfig(bFontMenus);
end;

procedure TfmSetup.LabelLangMoreClick(Sender: TObject);
begin
  FOpenUrl('https://sourceforge.net/projects/synwrite-addons/files/Languages/', Handle);
end;

procedure TfmSetup.LabMoreSkinsClick(Sender: TObject);
begin
  FOpenUrl('http://www.silverpointdevelopment.com/skineditor/index.htm', Handle);
end;

procedure TfmSetup.LabMoreIconsClick(Sender: TObject);
begin
  FOpenUrl('http://sourceforge.net/projects/synwrite-addons/files/IconSets/', Handle);
end;

procedure TfmSetup.bColorCustomClick(Sender: TObject);
begin
  ColorDialogMain.Color:= cbColors.Selected;
  if not ColorDialogMain.Execute then exit;
  cbColors.Selected:= ColorDialogMain.Color;
  cbColors.OnSelect(nil);
  cbColors.Invalidate;
end;

function TfmSetup.Keymap: TSyntKeyMapping;
begin
  Result:= fmMain.AppKeymap;
end;

end.

