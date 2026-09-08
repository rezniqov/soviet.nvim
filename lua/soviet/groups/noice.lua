-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    NoiceCmdlineIconInput          = { fg = c.yellow },
    NoiceCmdlineIconLua            = { fg = c.blue1 },
    NoiceCmdlinePopupBorderInput   = { fg = c.border_active },
    NoiceCmdlinePopupBorderLua     = { fg = c.border_active },
    NoiceCmdlinePopupTitleInput    = { fg = c.border_active },
    NoiceCmdlinePopupTitleLua      = { fg = c.border_active },
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
  }
  require("soviet.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M
