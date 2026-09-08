-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- rainbow-delimiters
    RainbowDelimiterRed    = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen  = { fg = c.green },
    RainbowDelimiterBlue   = { fg = c.blue },
    RainbowDelimiterViolet = { fg = c.purple },
    RainbowDelimiterCyan   = { fg = c.cyan },
  }
end

return M
