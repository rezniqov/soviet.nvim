-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.pick"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniPickBorder        = "FloatBorder",
    MiniPickBorderBusy    = "DiagnosticFloatingWarn",
    MiniPickBorderText    = { fg = c.hint, bg = c.bg_float },
    MiniPickIconDirectory = "Directory",
    MiniPickIconFile      = "MiniPickNormal",
    MiniPickHeader        = "DiagnosticFloatingHint",
    MiniPickMatchCurrent  = "CursorLine",
    MiniPickMatchMarked   = "Visual",
    MiniPickMatchRanges   = "DiagnosticFloatingHint",
    MiniPickNormal        = "NormalFloat",
    MiniPickPreviewLine   = "CursorLine",
    MiniPickPreviewRegion = "IncSearch",
    MiniPickPrompt        = { fg = c.info, bg = c.bg_float },
  }
end

return M
