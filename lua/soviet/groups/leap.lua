-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.magenta2, fg = c.fg, bold = true },
    LeapLabel          = { fg = c.magenta2, bold = true },
    LeapBackdrop       = { fg = c.dark3 },
  }
end

return M
