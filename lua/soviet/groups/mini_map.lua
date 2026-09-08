-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.map"

---@type soviet.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniMapNormal      = "NormalFloat",
    MiniMapSymbolCount = "Special",
    MiniMapSymbolLine  = "Title",
    MiniMapSymbolView  = "Delimiter",
  }
end

return M
