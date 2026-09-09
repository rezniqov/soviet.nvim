-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/stevearc/aerial.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide  = { fg = c.map_grid },
    AerialLine   = "LspInlayHint",
  }
  require("soviet.groups.kinds").kinds(ret, "Aerial%sIcon")
  return ret
end

return M
