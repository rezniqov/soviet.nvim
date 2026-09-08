-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyProgressDone = { bold = true, fg = c.magenta2 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }
end

return M
