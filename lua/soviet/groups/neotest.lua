-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    NeotestAdapterName  = { fg = c.purple, bold = true },
    NeotestBorder       = { fg = c.border_highlight },
    NeotestDir          = { fg = c.enamel_blue },
    NeotestExpandMarker = { fg = c.fg_sidebar },
    NeotestFailed       = { fg = c.red },
    NeotestFile         = { fg = c.teal },
    NeotestFocused      = { fg = c.yellow },
    NeotestIndent       = { fg = c.fg_sidebar },
    NeotestMarked       = { fg = c.blue },
    NeotestNamespace    = { fg = c.green2 },
    NeotestPassed       = { fg = c.green },
    NeotestRunning      = { fg = c.yellow },
    NeotestSkipped      = { fg = c.blue },
    NeotestTarget       = { fg = c.blue },
    NeotestTest         = { fg = c.fg_sidebar },
    NeotestWinSelect    = { fg = c.blue },
  }
end

return M
