-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut    = { fg = c.brass, bold = true },
    AlphaHeader      = { fg = c.accent, bold = true },
    AlphaHeaderLabel = { fg = c.burgundy },
    AlphaFooter      = { fg = c.olive },
    AlphaButtons     = { fg = c.fg },
  }
end

return M
