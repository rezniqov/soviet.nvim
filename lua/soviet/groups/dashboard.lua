-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- General
    DashboardHeader           = { fg = c.accent, bold = true },
    DashboardFooter           = { fg = c.olive },
    -- Hyper theme
    DashboardProjectTitle     = { fg = c.burgundy, bold = true },
    DashboardProjectTitleIcon = { fg = c.burgundy },
    DashboardProjectIcon      = { fg = c.enamel_blue },
    DashboardMruTitle         = { fg = c.burgundy, bold = true },
    DashboardMruIcon          = { fg = c.brass },
    DashboardFiles            = { fg = c.fg },
    DashboardShortCutIcon     = { fg = c.brass, bold = true },
    -- Doome theme
    DashboardDesc             = { fg = c.olive },
    DashboardKey              = { fg = c.brass, bold = true },
    DashboardIcon             = { fg = c.enamel_blue },
    DashboardShortCut         = { fg = c.burgundy },
  }
end

return M
