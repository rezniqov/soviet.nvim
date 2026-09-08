-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.test"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },
  }
end

return M
