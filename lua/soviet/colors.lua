local Util = require("soviet.util")

local M = {}

function M.setup(opts)
  opts = require("soviet.config").extend(opts)
  local c = require("soviet.palette").get(opts.palette, opts.style)

  Util.bg = c.bg
  Util.fg = c.fg

  c.none = "NONE"
  -- Reserve the clean printing red for a small number of primary accents.
  c.accent = c.red
  c.black = Util.blend_bg(c.bg, 0.8, "#000000")
  c.terminal_black = c.border
  c.dark3 = c.border
  c.dark5 = c.muted
  c.fg_dark = c.muted

  -- A subdued cartographic layer for grids, contours, and coordinate labels.
  -- It stays behind syntax and primary interface accents in both variants.
  c.map_surface = Util.blend_bg(c.olive, opts.style == "light" and 0.10 or 0.08)
  c.map_grid = Util.blend_bg(c.olive, opts.style == "light" and 0.48 or 0.28)
  c.map_contour = Util.blend_bg(c.khaki, opts.style == "light" and 0.80 or 0.68)
  c.map_label = Util.blend_bg(c.steel, opts.style == "light" and 0.90 or 0.80)
  c.fg_gutter = c.map_grid

  -- Tokyonight integrations use several blue slots as general-purpose
  -- accents. Spread those roles across warmer Soviet printing inks and keep
  -- enamel blue for the few places where it carries semantic meaning.
  c.enamel_blue = c.blue
  c.blue = c.brass
  c.blue1 = c.ochre
  c.blue2 = c.teal
  c.blue5 = c.muted
  c.blue6 = c.teal
  c.blue7 = c.selection
  c.cyan = c.steel
  c.green = c.string
  c.green1 = c.added
  c.green2 = c.added
  c.magenta = c.burgundy
  c.magenta2 = c.burgundy
  c.orange = c.ochre
  c.purple = c.burgundy
  c.red1 = c.red_bright
  c.yellow = c.brass

  c.git = {
    add = c.added,
    change = c.ochre,
    delete = c.red_dark,
    ignore = c.muted,
  }
  c.diff = {
    add = Util.blend_bg(c.added, 0.18),
    delete = Util.blend_bg(c.red_dark, 0.18),
    change = Util.blend_bg(c.ochre, 0.14),
    text = Util.blend_bg(c.brass, 0.28),
  }

  c.bg_highlight = c.line
  c.bg_popup = c.bg_dark
  c.bg_statusline = c.bg_dark
  c.bg_sidebar = opts.styles.sidebars == "transparent" and c.none
    or opts.styles.sidebars == "dark" and c.bg_dark
    or c.bg
  c.bg_float = opts.styles.floats == "transparent" and c.none
    or opts.styles.floats == "dark" and c.bg_dark
    or c.bg
  c.bg_visual = c.selection
  c.bg_search = c.brass
  c.fg_sidebar = c.fg
  c.fg_float = c.fg
  c.border_highlight = c.burgundy

  c.error = c.red_bright
  c.warning = c.ochre
  c.info = c.enamel_blue
  c.hint = c.olive
  c.todo = c.brass
  c.rainbow = { c.accent, c.ochre, c.brass, c.added, c.teal, c.enamel_blue, c.burgundy, c.khaki }

  c.terminal = {
    black = opts.style == "light" and c.fg_bright or c.bg_dark,
    black_bright = c.muted,
    red = c.red,
    red_bright = c.red_bright,
    green = c.added,
    green_bright = c.added_bright,
    yellow = c.ochre,
    yellow_bright = c.brass,
    blue = c.enamel_blue,
    blue_bright = c.enamel_blue,
    magenta = c.burgundy,
    magenta_bright = c.burgundy,
    cyan = c.teal,
    cyan_bright = c.string,
    white = c.fg,
    white_bright = c.fg_bright,
  }

  opts.on_colors(c)
  return c, opts
end

return M
