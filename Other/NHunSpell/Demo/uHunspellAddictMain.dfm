object FrmHunspellAddictMain: TFrmHunspellAddictMain
  Left = 367
  Top = 115
  Caption = 'NHunspell Addict4 Test'
  ClientHeight = 397
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object MeText: TMemo
    AlignWithMargins = True
    Left = 10
    Top = 40
    Width = 635
    Height = 347
    Margins.Left = 10
    Margins.Top = 40
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    HideSelection = False
    Lines.Strings = (
      
        'This demo requires the commercial spell check component Addict v' +
        'ersion 4 or later to be installed!'
      
        'For more information, refer to the online help and to http://www' +
        '.addictivesoftware.com'
      ''
      '(1) Copy and paste some text into this memo.'
      '(2) Click "Config" to select the active Hunspell dictionaries'
      '(3) Click "Check" to run the Addict spellchecker')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnConfig: TButton
    Left = 10
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Config'
    TabOrder = 1
    OnClick = btnConfigClick
  end
  object btnCheck: TButton
    Left = 91
    Top = 8
    Width = 78
    Height = 25
    Caption = 'Check'
    TabOrder = 2
    OnClick = btnCheckClick
  end
  object AddictSpell1: TAddictSpell
    ConfigStorage = csRegistry
    ConfigID = '%UserName%'
    ConfigFilename = '%AppDir%\Spell.cfg'
    ConfigRegistryKey = 'Software\Addictive Software\%AppName%'
    ConfigDictionaryDir.Strings = (
      '%AppDir%')
    ConfigAvailableOptions = [soLiveSpelling, soLiveCorrect, soUpcase, soNumbers, soHTML, soInternet, soQuoted, soAbbreviations, soPrimaryOnly, soRepeated, soDUalCaps]
    ConfigUseMSWordCustom = True
    ConfigDefaultMain.Strings = (
      'American.adm')
    ConfigDefaultCustom.Strings = (
      'Autocorrect.adu')
    ConfigDefaultActiveCustomPrevent.Strings = (
      'autocorrect.adu'
      'autocorrect-british.adu')
    ConfigDefaultActiveCustom = '%ConfigID%.adu'
    ConfigDefaultOptions = [soLiveSpelling, soLiveCorrect, soInternet, soAbbreviations, soRepeated, soDUalCaps]
    ConfigDefaultUseMSWordCustom = False
    SuggestionsAutoReplace = False
    SuggestionsLearning = True
    SuggestionsLearningDict = '%AppDir%\%UserName%_sp.adl'
    QuoteChars = '>'
    DialogInitialPos = ipLastUserPos
    DialogSelectionAvoid = saAvoid
    DialogShowImmediate = False
    DialogShowModal = False
    EndMessage = emExceptCancel
    EndCursorPosition = epOriginal
    EndMessageWordCount = False
    MaxUndo = -1
    MaxSuggestions = -1
    KeepDictionariesActive = False
    SynchronousCheck = True
    UseHourglassCursor = True
    CommandsVisible = [sdcIgnore, sdcIgnoreAll, sdcChange, sdcChangeAll, sdcAdd, sdcAutoCorrect, sdcUndo, sdcHelp, sdcCancel, sdcOptions, sdcCustomDictionary, sdcCustomDictionaries, sdcConfigOK, sdcAddedEdit, sdcAutoCorrectEdit, sdcExcludedEdit, sdcInternalEdit, sdcMainDictFolderBrowse, sdcResetDefaults, sdcConfigCancel, sdcConfigLearningLink, sdcConfigDownloadLink]
    CommandsEnabled = [sdcIgnore, sdcIgnoreAll, sdcChange, sdcChangeAll, sdcAdd, sdcAutoCorrect, sdcUndo, sdcHelp, sdcCancel, sdcOptions, sdcCustomDictionary, sdcCustomDictionaries, sdcConfigOK, sdcAddedEdit, sdcAutoCorrectEdit, sdcExcludedEdit, sdcInternalEdit, sdcMainDictFolderBrowse, sdcResetDefaults, sdcConfigCancel, sdcConfigLearningLink, sdcConfigDownloadLink]
    PhoneticSuggestions = True
    PhoneticMaxDistance = 4
    PhoneticDivisor = 2
    PhoneticDepth = 1
    MappingAutoReplace = True
    UseExcludeWords = True
    UseAutoCorrectFirst = True
    RecheckReplacedWords = True
    ResumeFromLastPosition = True
    AllowedCases = cmInitialCapsOrUpcase
    UILanguage = ltEnglish
    UIType = suiDialog
    UILanguageFontControls.Charset = DEFAULT_CHARSET
    UILanguageFontControls.Color = clWindowText
    UILanguageFontControls.Height = -13
    UILanguageFontControls.Name = 'Tahoma'
    UILanguageFontControls.Style = []
    UILanguageFontText.Charset = DEFAULT_CHARSET
    UILanguageFontText.Color = clWindowText
    UILanguageFontText.Height = -13
    UILanguageFontText.Name = 'Tahoma'
    UILanguageFontText.Style = []
    UILanguageUseFonts = False
    ParentFont = False
    DialogTypeSpelling = sdOffice
    DialogTypeConfiguration = sdOffice
    DialogMisspelledWordColor = clRed
    DialogMisspelledWordStyle = [fsBold]
    URLDownloadDictionaries = 
      'http://www.addictivesoftware.com/dl-dictionaries.htm?app=%AppNam' +
      'e%'
    URLEditDictionaries = 
      'http://www.addictivesoftware.com/ed-dictionaries.htm?app=%AppNam' +
      'e%'
    DoubleBuffered = False
    TimingWindow = 800
    TimingBadTimeCount = 2
    TimingNoActivityRestart = 1600
    TimingCutoff = 300
    Left = 48
    Top = 168
  end
end
