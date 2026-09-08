-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentBlanklineChar        = { fg = c.fg_gutter, nocombine = true },
    IndentBlanklineContextChar = { fg = c.blue1, nocombine = true },
    IblIndent                  = { fg = c.fg_gutter, nocombine = true },
    IblScope                   = { fg = c.blue1, nocombine = true },
  }
end

return M
