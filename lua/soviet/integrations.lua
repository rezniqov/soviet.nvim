local M = {}

---Define groups eagerly: plugins can load later without extra hooks or dependencies.
function M.get(c, opts)
  local h = {}
  local function links(enabled, groups)
    if opts.integrations[enabled] then
      for name, target in pairs(groups) do
        h[name] = { link = target }
      end
    end
  end
  links("telescope", {
    TelescopeNormal = "NormalFloat", TelescopeBorder = "FloatBorder",
    TelescopeTitle = "FloatTitle", TelescopeSelection = "PmenuSel",
    TelescopeSelectionCaret = "Special", TelescopeMatching = "Special",
    TelescopePromptPrefix = "Special", TelescopePromptCounter = "Comment",
    TelescopeMultiSelection = "Type", TelescopeResultsComment = "Comment",
  })
  links("gitsigns", {
    GitSignsAdd = "Added", GitSignsChange = "Changed", GitSignsDelete = "Removed",
    GitSignsAddNr = "Added", GitSignsChangeNr = "Changed", GitSignsDeleteNr = "Removed",
    GitSignsAddLn = "DiffAdd", GitSignsChangeLn = "DiffChange", GitSignsDeleteLn = "DiffDelete",
    GitSignsAddInline = "DiffAdd", GitSignsChangeInline = "DiffText",
    GitSignsDeleteInline = "DiffDelete", GitSignsCurrentLineBlame = "Comment",
  })
  links("completion", {
    CmpItemAbbr = "Identifier", CmpItemAbbrMatch = "Special",
    CmpItemAbbrMatchFuzzy = "Special", CmpItemMenu = "Comment",
    CmpItemKind = "Type", BlinkCmpMenu = "Pmenu", BlinkCmpMenuBorder = "FloatBorder",
    BlinkCmpMenuSelection = "PmenuSel", BlinkCmpLabel = "Identifier",
    BlinkCmpLabelMatch = "Special", BlinkCmpLabelDetail = "Comment",
    BlinkCmpLabelDescription = "Comment", BlinkCmpKind = "Type",
    BlinkCmpSource = "Comment", BlinkCmpDoc = "NormalFloat",
    BlinkCmpDocBorder = "FloatBorder", BlinkCmpSignatureHelp = "NormalFloat",
    BlinkCmpSignatureHelpBorder = "FloatBorder",
    BlinkCmpSignatureHelpActiveParameter = "LspSignatureActiveParameter",
    BlinkCmpGhostText = "Comment", BlinkCmpScrollBarThumb = "PmenuThumb",
    BlinkCmpScrollBarGutter = "PmenuSbar",
  })
  if opts.integrations.completion then
    h.CmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true }
    h.BlinkCmpLabelDeprecated = { fg = c.muted, strikethrough = true }
    for kind, target in pairs({
      Text = "Identifier", Method = "Function", Function = "Function", Constructor = "Type",
      Field = "SovietProperty", Variable = "Identifier", Class = "Type", Interface = "Type",
      Module = "Type", Property = "SovietProperty", Unit = "Number", Value = "Constant",
      Enum = "Type", Keyword = "Keyword", Snippet = "Special", Color = "Special",
      File = "Directory", Reference = "Underlined", Folder = "Directory",
      EnumMember = "Constant", Constant = "Constant", Struct = "Type", Event = "Special",
      Operator = "Operator", TypeParameter = "Type",
    }) do
      h["CmpItemKind" .. kind] = { link = target }
      h["BlinkCmpKind" .. kind] = { link = target }
    end
  end
  links("trees", {
    NvimTreeNormal = "SovietSidebar", NvimTreeNormalNC = "SovietSidebar",
    NvimTreeEndOfBuffer = "EndOfBuffer", NvimTreeWinSeparator = "WinSeparator",
    NvimTreeRootFolder = "Title", NvimTreeFolderName = "Directory",
    NvimTreeOpenedFolderName = "Directory", NvimTreeEmptyFolderName = "Comment",
    NvimTreeFolderIcon = "Directory", NvimTreeIndentMarker = "NonText",
    NvimTreeCursorLine = "CursorLine", NvimTreeGitDirty = "Changed",
    NvimTreeGitNew = "Added", NvimTreeGitDeleted = "Removed",
    NvimTreeSpecialFile = "Special", NvimTreeSymlink = "Underlined",
    NeoTreeNormal = "SovietSidebar", NeoTreeNormalNC = "SovietSidebar",
    NeoTreeEndOfBuffer = "EndOfBuffer", NeoTreeWinSeparator = "WinSeparator",
    NeoTreeDirectoryName = "Directory", NeoTreeDirectoryIcon = "Directory",
    NeoTreeRootName = "Title", NeoTreeIndentMarker = "NonText",
    NeoTreeGitAdded = "Added", NeoTreeGitModified = "Changed", NeoTreeGitDeleted = "Removed",
    NeoTreeGitUntracked = "Added", NeoTreeGitConflict = "Error",
    NeoTreeFloatBorder = "FloatBorder", NeoTreeFloatTitle = "FloatTitle",
    NeoTreeTabActive = "TabLineSel", NeoTreeTabInactive = "TabLine",
    NeoTreeTabSeparatorActive = "WinSeparator", NeoTreeTabSeparatorInactive = "WinSeparator",
    OilDir = "Directory", OilDirIcon = "Directory", OilLink = "Underlined",
    OilLinkTarget = "Comment", OilFile = "Identifier",
  })
  links("which_key", {
    WhichKey = "Special", WhichKeyGroup = "Type", WhichKeyDesc = "Identifier",
    WhichKeySeparator = "Delimiter", WhichKeyFloat = "NormalFloat",
    WhichKeyNormal = "NormalFloat", WhichKeyBorder = "FloatBorder", WhichKeyValue = "Comment",
  })
  links("indent_blankline", { IblIndent = "Whitespace", IblWhitespace = "Whitespace", IblScope = "NonText" })
  links("lazy", {
    LazyNormal = "NormalFloat", LazyButton = "TabLine", LazyButtonActive = "TabLineSel",
    LazyH1 = "PmenuSel", LazyH2 = "Title", LazySpecial = "Special",
    LazyProgressDone = "DiagnosticHint", LazyProgressTodo = "NonText",
    LazyReasonPlugin = "Type", LazyReasonEvent = "Special", LazyComment = "Comment",
  })
  links("mini", {
    MiniStatuslineModeNormal = "TabLineSel", MiniStatuslineModeInsert = "DiffAdd",
    MiniStatuslineModeVisual = "Visual", MiniStatuslineModeReplace = "IncSearch",
    MiniStatuslineModeCommand = "Search", MiniStatuslineModeOther = "StatusLine",
    MiniStatuslineDevinfo = "StatusLine", MiniStatuslineFilename = "StatusLine",
    MiniStatuslineFileinfo = "StatusLine", MiniStatuslineInactive = "StatusLineNC",
    MiniStatuslineRecording = "Error", MiniTablineCurrent = "TabLineSel",
    MiniTablineVisible = "TabLine", MiniTablineHidden = "TabLine",
    MiniTablineModifiedCurrent = "TabLineSel", MiniTablineModifiedVisible = "Changed",
    MiniTablineModifiedHidden = "Changed", MiniTablineFill = "TabLineFill",
    MiniIndentscopeSymbol = "NonText", MiniCursorword = "LspReferenceText",
    MiniCursorwordCurrent = "LspReferenceText", MiniPickNormal = "NormalFloat",
    MiniPickBorder = "FloatBorder", MiniPickBorderText = "FloatTitle",
    MiniPickMatchCurrent = "PmenuSel", MiniPickMatchRanges = "Special",
    MiniFilesNormal = "NormalFloat", MiniFilesBorder = "FloatBorder",
    MiniFilesTitle = "FloatTitle", MiniFilesTitleFocused = "FloatTitle",
    MiniFilesDirectory = "Directory", MiniFilesFile = "Identifier",
    MiniDiffSignAdd = "Added", MiniDiffSignChange = "Changed", MiniDiffSignDelete = "Removed",
    MiniJump = "Search", MiniJump2dSpot = "Search",
  })
  links("snacks", {
    SnacksNormal = "NormalFloat", SnacksWinBar = "WinBar", SnacksWinSeparator = "WinSeparator",
    SnacksBackdrop = "SovietSidebar", SnacksPicker = "NormalFloat",
    SnacksPickerBorder = "FloatBorder", SnacksPickerTitle = "FloatTitle",
    SnacksPickerMatch = "Special", SnacksPickerSelected = "Special",
    SnacksPickerDir = "Comment", SnacksPickerFile = "Identifier",
    SnacksPickerDirectory = "Directory", SnacksPickerListCursorLine = "CursorLine",
    SnacksPickerInput = "NormalFloat", SnacksPickerInputBorder = "FloatBorder",
    SnacksPickerPrompt = "Special", SnacksPickerPreview = "NormalFloat",
    SnacksPickerPreviewBorder = "FloatBorder", SnacksIndent = "Whitespace",
    SnacksIndentScope = "NonText", SnacksDashboardHeader = "Title",
    SnacksDashboardFooter = "Comment", SnacksDashboardKey = "Special",
    SnacksDashboardDesc = "Identifier", SnacksDashboardIcon = "Type",
    SnacksNotifierInfo = "DiagnosticInfo", SnacksNotifierWarn = "DiagnosticWarn",
    SnacksNotifierError = "DiagnosticError", SnacksNotifierDebug = "Comment",
    SnacksNotifierTrace = "Comment",
  })
  return h
end

return M
