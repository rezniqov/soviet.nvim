local M = {}

---@param style? "dark"|"light"
function M.get(style)
  local c = require("soviet").get_palette(style)
  local function mode(accent)
    return {
      a = { fg = c.bg_dark, bg = accent, gui = "bold" },
      b = { fg = c.fg, bg = c.bg_light },
      c = { fg = c.muted, bg = c.bg_dark },
    }
  end
  return {
    normal = mode(c.brass),
    insert = mode(c.teal),
    visual = mode(c.burgundy),
    replace = mode(c.red),
    command = mode(c.ochre),
    terminal = mode(c.blue),
    inactive = {
      a = { fg = c.muted, bg = c.bg_dark },
      b = { fg = c.muted, bg = c.bg_dark },
      c = { fg = c.muted, bg = c.bg_dark },
    },
  }
end

return M
