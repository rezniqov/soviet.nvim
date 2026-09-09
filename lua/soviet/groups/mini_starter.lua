-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.starter"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniStarterCurrent    = { bg = c.bg_visual, bold = true, nocombine = true },
    MiniStarterFooter     = { fg = c.olive },
    MiniStarterHeader     = { fg = c.accent, bold = true },
    MiniStarterInactive   = { fg = c.comment },
    MiniStarterItem       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.burgundy },
    MiniStarterItemPrefix = { fg = c.brass, bold = true },
    MiniStarterQuery      = { fg = c.enamel_blue },
    MiniStarterSection    = { fg = c.burgundy, bold = true },
  }
end

return M
