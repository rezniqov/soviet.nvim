-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.files"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniFilesBorder         = "FloatBorder",
    MiniFilesBorderModified = "DiagnosticFloatingWarn",
    MiniFilesCursorLine     = "CursorLine",
    MiniFilesDirectory      = "Directory",
    MiniFilesFile           = { fg = c.fg_float },
    MiniFilesNormal         = "NormalFloat",
    MiniFilesTitle          = "FloatTitle",
    MiniFilesTitleFocused   = { fg = c.border_highlight, bg = c.bg_float, bold = true },
  }
end

return M
