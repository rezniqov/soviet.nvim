-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.diff"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniDiffOverAdd     = "DiffAdd",
    MiniDiffOverChange  = "DiffText",
    MiniDiffOverContext = "DiffChange",
    MiniDiffOverDelete  = "DiffDelete",
    MiniDiffSignAdd     = { fg = c.git.add },
    MiniDiffSignChange  = { fg = c.git.change },
    MiniDiffSignDelete  = { fg = c.git.delete },
  }
end

return M
