object Form1: TForm1
  Left = 192
  Top = 114
  Width = 771
  Height = 491
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    763
    457)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 400
    Width = 94
    Height = 13
    Caption = 'click to get collstate'
  end
  object Label2: TLabel
    Left = 96
    Top = 424
    Width = 93
    Height = 13
    Caption = 'click to set collstate'
  end
  object s: TSyntaxMemo
    Left = 152
    Top = 20
    Width = 521
    Height = 368
    Lines.Strings = (
      's')
    TabList.AsString = '4'
    NonPrinted.Color = clGray
    NonPrinted.Font.Charset = DEFAULT_CHARSET
    NonPrinted.Font.Color = clGray
    NonPrinted.Font.Height = -11
    NonPrinted.Font.Name = 'MS Sans Serif'
    NonPrinted.Font.Style = []
    LineNumbers.Visible = False
    LineNumbers.Font.Charset = DEFAULT_CHARSET
    LineNumbers.Font.Color = clWindowText
    LineNumbers.Font.Height = -9
    LineNumbers.Font.Name = 'Courier New'
    LineNumbers.Font.Style = []
    LineNumbers.Band = 1
    Gutter.Width = 50
    Gutter.ExpandButtons.Data = {
      FA000000424DFA000000000000007600000028000000120000000B0000000100
      0400000000008400000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
      1111110000000000000000000000000000000FFFFFFF00FFFFFFF00000000FFF
      FFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000F00000F00F00000F000
      00000FFFFFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000FFFFFFF00FF
      FFFFF0000000000000000000000000000000111111111111111111000000}
    Gutter.Bands = <
      item
        Width = 16
        Color = clMenu
      end
      item
        Width = 16
        Color = clMenuBar
      end
      item
        Width = 16
        Color = clInfoBk
      end>
    Gutter.Objects = <>
    Gutter.ExpBtnBand = 1
    Gutter.CollapsePen.Color = clGray
    Gutter.AutoSize = False
    HintProps.Font.Charset = DEFAULT_CHARSET
    HintProps.Font.Color = clWindowText
    HintProps.Font.Height = -11
    HintProps.Font.Name = 'MS Sans Serif'
    HintProps.Font.Style = []
    HintProps.Color = 13041663
    HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
    UserRanges = <>
    StaplePen.Color = clGray
    WordWrap = True
    DefaultStyles.SelectioMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.SelectioMark.Font.Color = clHighlightText
    DefaultStyles.SelectioMark.Font.Height = -13
    DefaultStyles.SelectioMark.Font.Name = 'Courier New'
    DefaultStyles.SelectioMark.Font.Style = []
    DefaultStyles.SelectioMark.BgColor = clHighlight
    DefaultStyles.SelectioMark.FormatType = ftColor
    DefaultStyles.SearchMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.SearchMark.Font.Color = clWhite
    DefaultStyles.SearchMark.Font.Height = -13
    DefaultStyles.SearchMark.Font.Name = 'Courier New'
    DefaultStyles.SearchMark.Font.Style = []
    DefaultStyles.SearchMark.BgColor = clBlack
    DefaultStyles.SearchMark.FormatType = ftColor
    DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.CurrentLine.Font.Color = clWindowText
    DefaultStyles.CurrentLine.Font.Height = -13
    DefaultStyles.CurrentLine.Font.Name = 'Courier New'
    DefaultStyles.CurrentLine.Font.Style = []
    DefaultStyles.CurrentLine.BgColor = clInfoBk
    DefaultStyles.CurrentLine.FormatType = ftBackGround
    DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.CollapseMark.Font.Color = clSilver
    DefaultStyles.CollapseMark.Font.Height = -13
    DefaultStyles.CollapseMark.Font.Name = 'Courier New'
    DefaultStyles.CollapseMark.Font.Style = []
    DefaultStyles.CollapseMark.FormatType = ftColor
    DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
    DefaultStyles.CollapseMark.BorderColorLeft = clSilver
    DefaultStyles.CollapseMark.BorderTypeTop = blSolid
    DefaultStyles.CollapseMark.BorderColorTop = clSilver
    DefaultStyles.CollapseMark.BorderTypeRight = blSolid
    DefaultStyles.CollapseMark.BorderColorRight = clSilver
    DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
    DefaultStyles.CollapseMark.BorderColorBottom = clSilver
    SyncEditing.SyncRangeStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.SyncRangeStyle.Font.Color = clWindowText
    SyncEditing.SyncRangeStyle.Font.Height = -13
    SyncEditing.SyncRangeStyle.Font.Name = 'Courier New'
    SyncEditing.SyncRangeStyle.Font.Style = []
    SyncEditing.SyncRangeStyle.BgColor = 14745568
    SyncEditing.SyncRangeStyle.FormatType = ftBackGround
    SyncEditing.ActiveWordsStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.ActiveWordsStyle.Font.Color = clWindowText
    SyncEditing.ActiveWordsStyle.Font.Height = -13
    SyncEditing.ActiveWordsStyle.Font.Name = 'Courier New'
    SyncEditing.ActiveWordsStyle.Font.Style = []
    SyncEditing.ActiveWordsStyle.FormatType = ftBackGround
    SyncEditing.ActiveWordsStyle.BorderTypeLeft = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorLeft = clBlue
    SyncEditing.ActiveWordsStyle.BorderTypeTop = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorTop = clBlue
    SyncEditing.ActiveWordsStyle.BorderTypeRight = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorRight = clBlue
    SyncEditing.ActiveWordsStyle.BorderTypeBottom = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorBottom = clBlue
    SyncEditing.InactiveWordsStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.InactiveWordsStyle.Font.Color = clWindowText
    SyncEditing.InactiveWordsStyle.Font.Height = -13
    SyncEditing.InactiveWordsStyle.Font.Name = 'Courier New'
    SyncEditing.InactiveWordsStyle.Font.Style = []
    SyncEditing.InactiveWordsStyle.FormatType = ftBackGround
    SyncEditing.InactiveWordsStyle.BorderTypeBottom = blSolid
    SyncEditing.InactiveWordsStyle.BorderColorBottom = clBtnFace
    HorzRuler.Font.Charset = DEFAULT_CHARSET
    HorzRuler.Font.Color = clWindowText
    HorzRuler.Font.Height = -11
    HorzRuler.Font.Name = 'MS Sans Serif'
    HorzRuler.Font.Style = []
    TextMargins = <
      item
        Pen.Color = clSilver
        RulerMark = False
      end>
    Caret.Insert.Width = -2
    Caret.Overwrite.Width = 100
    Caret.ReadOnly.Width = -1
    Caret.Custom.Width = -2
    Transparent = False
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akBottom]
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnContextPopup = sContextPopup
  end
  object Button2: TButton
    Left = 680
    Top = 276
    Width = 75
    Height = 25
    Caption = 'opt'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 680
    Top = 248
    Width = 75
    Height = 25
    Caption = 'save'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 680
    Top = 176
    Width = 75
    Height = 25
    Caption = 'open'
    TabOrder = 3
    OnClick = Button3Click
  end
  object SyntaxTreeView1: TSyntaxTreeView
    Left = 8
    Top = 20
    Width = 137
    Height = 369
    SyntaxMemo = s
    AutoSynchronize = True
    Indent = 19
    TabOrder = 4
  end
  object Button4: TButton
    Left = 680
    Top = 204
    Width = 75
    Height = 25
    Caption = 'open 2'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 680
    Top = 128
    Width = 75
    Height = 25
    Caption = 'unfold'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 680
    Top = 100
    Width = 75
    Height = 25
    Caption = 'fold'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 216
    Top = 396
    Width = 457
    Height = 21
    TabOrder = 8
    OnClick = Edit1Click
  end
  object Edit2: TEdit
    Left = 216
    Top = 420
    Width = 369
    Height = 21
    TabOrder = 9
    Text = '3,6,7,'
    OnClick = Edit2Click
  end
  object SyntaxManager1: TSyntaxManager
    MenuPlainText = 'Plain Text'
    Left = 272
    Top = 356
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 356
    object ccc1: TMenuItem
      Caption = 'ccc'
    end
  end
end
