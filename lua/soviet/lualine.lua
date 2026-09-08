local M = {}

---@param style? "dark"|"light"
function M.get(style)
  style = style or (vim.g.colors_name == "soviet-light" and "light" or "dark")
  local c, opts = require("soviet.colors").setup({ style = style })
  local function mode(accent)
    return {
      a = { fg = c.bg_dark, bg = accent, gui = opts.lualine_bold and "bold" or nil },
      b = { fg = c.fg, bg = c.bg_highlight },
      c = { fg = c.muted, bg = c.bg_statusline },
    }
  end
  return {
    normal = mode(c.brass),
    insert = mode(c.teal),
    visual = mode(c.burgundy),
    replace = mode(c.red),
    command = mode(c.ochre),
    terminal = mode(c.enamel_blue),
    inactive = {
      a = { fg = c.muted, bg = c.bg_statusline },
      b = { fg = c.muted, bg = c.bg_statusline },
      c = { fg = c.muted, bg = c.bg_statusline },
    },
  }
end

return M
