local M = {}

function M.get(c, opts)
  local bg = opts.transparent and "NONE" or c.bg
  local dark = opts.transparent and "NONE" or c.bg_dark
  local function styled(color, role)
    return vim.tbl_extend("force", { fg = color }, opts.styles[role] or {})
  end
  local h = {
    Normal = { fg = c.fg, bg = bg },
    NormalNC = { fg = c.fg, bg = bg },
    NormalFloat = { fg = c.fg, bg = c.bg_light },
    FloatBorder = { fg = c.border, bg = c.bg_light },
    FloatTitle = { fg = c.brass, bg = c.bg_light, bold = true },
    FloatFooter = { fg = c.muted, bg = c.bg_light },
    ColorColumn = { bg = c.line },
    Cursor = { fg = c.bg, bg = c.fg_bright },
    CursorLine = { bg = c.line },
    CursorColumn = { bg = c.line },
    CursorLineNr = { fg = c.brass, bold = true },
    LineNr = { fg = c.border },
    SignColumn = { fg = c.muted, bg = bg },
    FoldColumn = { fg = c.muted, bg = bg },
    Folded = { fg = c.muted, bg = c.bg_light },
    EndOfBuffer = { fg = c.border },
    NonText = { fg = c.border },
    Whitespace = { fg = c.line },
    SpecialKey = { fg = c.border },
    Visual = { bg = c.selection },
    VisualNOS = { bg = c.selection },
    Search = { fg = c.bg_dark, bg = c.brass },
    IncSearch = { fg = c.on_accent, bg = c.red },
    CurSearch = { fg = c.on_accent, bg = c.red },
    Substitute = { fg = c.on_accent, bg = c.red_dark },
    MatchParen = { fg = c.brass, bg = c.selection, bold = true },
    Pmenu = { fg = c.fg, bg = c.bg_light },
    PmenuSel = { fg = c.fg_bright, bg = c.selection, bold = true },
    PmenuSbar = { bg = c.line },
    PmenuThumb = { bg = c.border },
    PmenuMatch = { fg = c.brass, bold = true },
    PmenuMatchSel = { fg = c.brass, bg = c.selection, bold = true },
    StatusLine = { fg = c.fg, bg = c.bg_dark },
    StatusLineNC = { fg = c.muted, bg = c.bg_dark },
    WinBar = { fg = c.fg, bg = bg },
    WinBarNC = { fg = c.muted, bg = bg },
    WinSeparator = { fg = c.border },
    TabLine = { fg = c.muted, bg = c.bg_dark },
    TabLineFill = { bg = c.bg_dark },
    TabLineSel = { fg = c.brass, bg = c.bg_light, bold = true },
    Title = { fg = c.red, bold = true },
    Directory = { fg = c.blue },
    Question = { fg = c.khaki },
    MoreMsg = { fg = c.olive },
    ModeMsg = { fg = c.brass, bold = true },
    MsgArea = { fg = c.fg, bg = bg },
    ErrorMsg = { fg = c.red_bright },
    WarningMsg = { fg = c.ochre },
    WildMenu = { fg = c.fg_bright, bg = c.selection },
    QuickFixLine = { bg = c.selection, bold = true },
    Conceal = { fg = c.muted },
    DiffAdd = { fg = c.added, bg = c.bg_light },
    DiffChange = { bg = c.line },
    DiffText = { fg = c.brass, bg = c.selection, bold = true },
    DiffDelete = { fg = c.red, bg = c.bg_dark },
    Added = { fg = c.added },
    Changed = { fg = c.ochre },
    Removed = { fg = c.red },
    SpellBad = { sp = c.red_bright, undercurl = true },
    SpellCap = { sp = c.ochre, undercurl = true },
    SpellLocal = { sp = c.blue, undercurl = true },
    SpellRare = { sp = c.olive, undercurl = true },
    Comment = styled(c.comment, "comments"),
    Constant = { fg = c.ochre },
    String = styled(c.string, "strings"),
    Character = { fg = c.string },
    Number = { fg = c.ochre },
    Boolean = { fg = c.burgundy },
    Float = { fg = c.ochre },
    Identifier = styled(c.fg, "variables"),
    Function = styled(c.brass, "functions"),
    Keyword = styled(c.burgundy, "keywords"),
    Operator = { fg = c.muted },
    PreProc = { fg = c.steel },
    Type = { fg = c.blue },
    Special = { fg = c.brass },
    Delimiter = { fg = c.muted },
    Underlined = { fg = c.blue, underline = true },
    Ignore = { fg = c.muted },
    Error = { fg = c.red_bright },
    Todo = { fg = c.brass, bold = true },
    SovietProperty = { fg = c.property },
    SovietBuiltin = { fg = c.teal },
    SovietSidebar = { fg = c.fg, bg = dark },
    LspReferenceText = { bg = c.line },
    LspReferenceRead = { bg = c.line },
    LspReferenceWrite = { bg = c.selection },
    LspInlayHint = { fg = c.comment, bg = c.bg_light },
    LspCodeLens = { fg = c.comment },
    LspCodeLensSeparator = { fg = c.border },
    LspSignatureActiveParameter = { fg = c.brass, bold = true },
    SnippetTabstop = { bg = c.selection },
  }

  local links = {
    lCursor = "Cursor", CursorIM = "Cursor", VertSplit = "WinSeparator",
    LineNrAbove = "LineNr", LineNrBelow = "LineNr", CursorLineSign = "SignColumn",
    CursorLineFold = "FoldColumn", PmenuKind = "Pmenu", PmenuKindSel = "PmenuSel",
    PmenuExtra = "Pmenu", PmenuExtraSel = "PmenuSel", MsgSeparator = "WinSeparator",
    Statement = "Keyword", Conditional = "Keyword", Repeat = "Keyword",
    Label = "Keyword", Exception = "Keyword", Include = "PreProc",
    Define = "PreProc", Macro = "PreProc", PreCondit = "PreProc",
    StorageClass = "Type", Structure = "Type", Typedef = "Type",
    SpecialChar = "Special", Tag = "Special", SpecialComment = "Comment", Debug = "Special",
    ["@variable"] = "Identifier", ["@variable.builtin"] = "SovietBuiltin",
    ["@variable.parameter"] = "Identifier", ["@variable.parameter.builtin"] = "SovietBuiltin",
    ["@variable.member"] = "SovietProperty", ["@property"] = "SovietProperty",
    ["@constant"] = "Constant", ["@constant.builtin"] = "SovietBuiltin",
    ["@constant.macro"] = "PreProc", ["@module"] = "Type", ["@module.builtin"] = "SovietBuiltin",
    ["@label"] = "Label", ["@string"] = "String", ["@string.documentation"] = "String",
    ["@string.regexp"] = "Special", ["@string.escape"] = "SpecialChar",
    ["@string.special"] = "Special", ["@string.special.url"] = "Underlined",
    ["@character"] = "Character", ["@character.special"] = "SpecialChar",
    ["@boolean"] = "Boolean", ["@number"] = "Number", ["@number.float"] = "Float",
    ["@type"] = "Type", ["@type.builtin"] = "SovietBuiltin", ["@type.definition"] = "Type",
    ["@attribute"] = "PreProc", ["@attribute.builtin"] = "SovietBuiltin",
    ["@function"] = "Function", ["@function.builtin"] = "SovietBuiltin",
    ["@function.call"] = "Function", ["@function.macro"] = "PreProc",
    ["@function.method"] = "Function", ["@function.method.call"] = "Function",
    ["@constructor"] = "Type", ["@operator"] = "Operator", ["@keyword"] = "Keyword",
    ["@keyword.import"] = "PreProc", ["@keyword.directive"] = "PreProc",
    ["@keyword.operator"] = "Operator", ["@punctuation.delimiter"] = "Delimiter",
    ["@punctuation.bracket"] = "Delimiter", ["@punctuation.special"] = "Special",
    ["@comment"] = "Comment", ["@comment.error"] = "DiagnosticError",
    ["@comment.warning"] = "DiagnosticWarn", ["@comment.todo"] = "Todo",
    ["@comment.note"] = "DiagnosticInfo", ["@markup.heading"] = "Title",
    ["@markup.quote"] = "Comment", ["@markup.math"] = "Special",
    ["@markup.link"] = "Underlined", ["@markup.link.label"] = "Special",
    ["@markup.link.url"] = "Underlined", ["@markup.raw"] = "String",
    ["@markup.list"] = "Special", ["@markup.list.checked"] = "DiagnosticHint",
    ["@markup.list.unchecked"] = "Delimiter", ["@diff.plus"] = "Added",
    ["@diff.minus"] = "Removed", ["@diff.delta"] = "Changed",
    ["@tag"] = "Type", ["@tag.builtin"] = "Type",
    ["@tag.attribute"] = "SovietProperty", ["@tag.delimiter"] = "Delimiter",
  }
  h["@markup.strong"] = { bold = true }
  h["@markup.italic"] = { italic = true }
  h["@markup.strikethrough"] = { strikethrough = true }
  h["@markup.underline"] = { underline = true }

  local semantic = {
    class = "Type", enum = "Type", interface = "Type", struct = "Type",
    type = "Type", typeParameter = "Type", decorator = "PreProc",
    enumMember = "Constant", ["function"] = "Function", method = "Function",
    macro = "PreProc", namespace = "Type", parameter = "Identifier",
    property = "SovietProperty", variable = "Identifier", event = "SovietProperty",
    keyword = "Keyword", modifier = "Keyword", operator = "Operator",
    number = "Number", string = "String", regexp = "Special",
  }
  for token, target in pairs(semantic) do
    links["@lsp.type." .. token] = target
  end
  -- Let Tree-sitter keep documentation tags and TODOs inside LSP comments.
  h["@lsp.type.comment"] = {}
  h["@lsp.mod.deprecated"] = { strikethrough = true }
  links["@lsp.mod.defaultLibrary"] = "SovietBuiltin"
  for severity, color in pairs({ Error = c.red_bright, Warn = c.ochre, Info = c.blue, Hint = c.olive, Ok = c.olive }) do
    h["Diagnostic" .. severity] = { fg = color }
    h["DiagnosticVirtualText" .. severity] = { fg = color, bg = c.bg_light }
    h["DiagnosticUnderline" .. severity] = { sp = color, undercurl = true }
    links["DiagnosticSign" .. severity] = "Diagnostic" .. severity
    links["DiagnosticFloating" .. severity] = "Diagnostic" .. severity
    links["DiagnosticVirtualLines" .. severity] = "Diagnostic" .. severity
  end
  h.DiagnosticDeprecated = { strikethrough = true, sp = c.muted }
  h.DiagnosticUnnecessary = { fg = c.muted }
  for name, target in pairs(links) do
    h[name] = { link = target }
  end
  return h
end

return M
