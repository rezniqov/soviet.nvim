-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.deps"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniDepsChangeAdded   = "diffAdded",
    MiniDepsChangeRemoved = "diffRemoved",
    MiniDepsHint          = "DiagnosticHint",
    MiniDepsInfo          = "DiagnosticInfo",
    MiniDepsMsgBreaking   = "DiagnosticWarn",
    MiniDepsPlaceholder   = "Comment",
    MiniDepsTitle         = "Title",
    MiniDepsTitleError    = { fg = c.black, bg = c.git.delete },
    MiniDepsTitleSame     = "Comment",
    MiniDepsTitleUpdate   = { fg = c.black, bg = c.git.add },
  }
end

return M
