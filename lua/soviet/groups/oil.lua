-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/stevearc/oil.nvim"

---@type soviet.HighlightsFn
function M.get()
  return {
    OilDir = "Directory",
    OilDirIcon = "Directory",
    OilLink = "Underlined",
    OilLinkTarget = "Comment",
    OilFile = "Identifier",
  }
end

return M
