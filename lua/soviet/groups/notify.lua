-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NotifyBackground  = { fg = c.fg, bg = c.bg },
    NotifyDEBUGBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyDEBUGTitle  = { fg = c.comment },
    NotifyERRORBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyERRORBorder = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    NotifyERRORIcon   = { fg = c.error },
    NotifyERRORTitle  = { fg = c.error },
    NotifyINFOBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyINFOBorder  = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    NotifyINFOIcon    = { fg = c.info },
    NotifyINFOTitle   = { fg = c.info },
    NotifyTRACEBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    NotifyTRACEIcon   = { fg = c.purple },
    NotifyTRACETitle  = { fg = c.purple },
    NotifyWARNBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyWARNBorder  = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyWARNTitle   = { fg = c.warning },
  }
end

return M
