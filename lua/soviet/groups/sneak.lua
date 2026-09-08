-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    Sneak      = { fg = c.bg_highlight, bg = c.magenta },
    SneakScope = { bg = c.bg_visual },
  }
end

return M
