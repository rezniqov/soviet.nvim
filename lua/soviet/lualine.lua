local M = {}

---@param style? "dark"|"light"
function M.get(style)
  style = style or (vim.g.colors_name == "soviet-light" and "light" or "dark")
  local c, opts = require("soviet.colors").setup({ style = style })
  local mode_fg = style == "light" and c.on_accent or c.bg_dark
  local function mode(accent)
    return {
      a = { fg = mode_fg, bg = accent, gui = opts.lualine_bold and "bold" or nil },
      b = { fg = c.fg, bg = c.bg_highlight },
      c = { fg = c.muted, bg = c.bg_statusline },
    }
  end
  return {
    normal = mode(c.red),
    insert = mode(c.enamel_blue),
    visual = mode(c.burgundy),
    replace = mode(c.red_bright),
    command = mode(c.brass),
    terminal = mode(c.teal),
    inactive = {
      a = { fg = c.muted, bg = c.bg_statusline },
      b = { fg = c.muted, bg = c.bg_statusline },
      c = { fg = c.muted, bg = c.bg_statusline },
    },
  }
end

return M
