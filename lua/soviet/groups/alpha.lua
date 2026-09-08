-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut    = { fg = c.orange },
    AlphaHeader      = { fg = c.blue },
    AlphaHeaderLabel = { fg = c.orange },
    AlphaFooter      = { fg = c.blue1 },
    AlphaButtons     = { fg = c.cyan },
  }
end

return M
