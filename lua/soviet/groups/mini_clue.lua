-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.clue"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniClueBorder              = "FloatBorder",
    MiniClueDescGroup           = "DiagnosticFloatingWarn",
    MiniClueDescSingle          = "NormalFloat",
    MiniClueNextKey             = "DiagnosticFloatingHint",
    MiniClueNextKeyWithPostkeys = "DiagnosticFloatingError",
    MiniClueSeparator           = "DiagnosticFloatingInfo",
    MiniClueTitle               = "FloatTitle",
  }
end

return M
