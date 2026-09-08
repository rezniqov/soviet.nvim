-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local Util = require("soviet.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SnacksNotifierDebug       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderDebug = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconDebug   = { fg = c.comment },
    SnacksNotifierTitleDebug  = { fg = c.comment },
    SnacksNotifierError       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderError = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconError   = { fg = c.error },
    SnacksNotifierTitleError  = { fg = c.error },
    SnacksNotifierInfo        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderInfo  = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconInfo    = { fg = c.info },
    SnacksNotifierTitleInfo   = { fg = c.info },
    SnacksNotifierTrace       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderTrace = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconTrace   = { fg = c.purple },
    SnacksNotifierTitleTrace  = { fg = c.purple },
    SnacksNotifierWarn        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderWarn  = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconWarn    = { fg = c.warning },
    SnacksNotifierTitleWarn   = { fg = c.warning },
    -- Dashboard
    SnacksDashboardDesc       = { fg = c.cyan },
    SnacksDashboardFooter     = { fg = c.blue1 },
    SnacksDashboardHeader     = { fg = c.blue },
    SnacksDashboardIcon       = { fg = c.blue1 },
    SnacksDashboardKey        = { fg = c.orange },
    SnacksDashboardSpecial    = { fg = c.purple },
    SnacksDashboardDir        = { fg = c.dark3 },
    -- Profiler
    SnacksProfilerIconInfo    = { bg = Util.blend_bg(c.blue1, 0.3), fg = c.blue1 },
    SnacksProfilerBadgeInfo   = { bg = Util.blend_bg(c.blue1, 0.1), fg = c.blue1 },
    SnacksFooterKey           = "SnacksProfilerIconInfo",
    SnacksFooterDesc          = "SnacksProfilerBadgeInfo",
    SnacksProfilerIconTrace   = { bg = Util.blend_bg(c.blue7, 0.3), fg = c.dark3 },
    SnacksProfilerBadgeTrace  = { bg = Util.blend_bg(c.blue7, 0.1), fg = c.dark3 },
    SnacksIndent              = { fg = c.fg_gutter, nocombine = true },
    SnacksIndentScope         = { fg = c.blue1, nocombine = true },
    SnacksZenIcon             = { fg = c.purple },
    SnacksInputIcon           = { fg = c.blue1 },
    SnacksInputBorder         = { fg = c.border_active },
    SnacksInputTitle          = { fg = c.border_active },
    -- Picker
    SnacksPickerInputBorder   = { fg = c.border_active, bg = c.bg_float },
    SnacksPickerInputTitle    = { fg = c.border_active, bg = c.bg_float },
    SnacksPickerBoxTitle      = { fg = c.border_active, bg = c.bg_float },
    SnacksPickerSelected      = { fg = c.magenta2},
    SnacksPickerToggle        = "SnacksProfilerBadgeInfo",
    SnacksPickerPickWinCurrent= { fg = c.fg, bg = c.magenta2, bold = true },
    SnacksPickerPickWin       = { fg = c.fg, bg = c.bg_search, bold = true },
    SnacksGhLabel             = { fg = c.blue1, bold = true },
    SnacksDiffLabel           = { fg = c.blue1, bold = true },
    SnacksGhDiffHeader        = { bg = Util.blend_bg(c.blue1, 0.1), fg = c.blue1 }
  }
  for i, color in ipairs(c.rainbow) do
    ret["SnacksIndent" .. i] = { fg = color, nocombine = true }
  end
  return ret
end

return M
