-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.cursorword"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniCursorword        = { bg = c.fg_gutter },
    MiniCursorwordCurrent = { bg = c.fg_gutter },
  }
end

return M
