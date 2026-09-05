local M = {}

---Configure both variants. Apply with :colorscheme soviet-dark or soviet-light.
---@param opts? SovietConfig|table
function M.setup(opts)
  require("soviet.config").setup(opts)
end

---@param style? "dark"|"light"
---@return table<string, string>
function M.get_palette(style)
  style = style or (vim.g.colors_name == "soviet-light" and "light" or "dark")
  if style ~= "dark" and style ~= "light" then
    error('soviet: palette variant must be "dark" or "light"')
  end
  local opts = require("soviet.config").options
  return require("soviet.palette").get(opts.palette, style)
end

---@param style "dark"|"light"
function M.load(style)
  if style ~= "dark" and style ~= "light" then
    error('soviet: load expects "dark" or "light"')
  end
  local opts = require("soviet.config").options
  local palette = M.get_palette(style)
  local highlights = require("soviet.highlights").get(palette, opts)
  highlights = vim.tbl_extend("force", highlights, require("soviet.integrations").get(palette, opts))
  if opts.on_highlights then
    opts.on_highlights(highlights, palette)
  end

  vim.o.termguicolors = true
  -- Avoid recursively sourcing the colorscheme when background changes.
  vim.g.colors_name = nil
  vim.o.background = style
  vim.cmd("highlight clear")
  if vim.g.syntax_on then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "soviet-" .. style
  for name, definition in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, definition)
  end
  -- lualine reloads on ColorScheme; its palette must follow the new appearance.
  package.loaded["lualine.themes.soviet"] = nil
  package.loaded["lualine.themes.soviet-dark"] = nil
  package.loaded["lualine.themes.soviet-light"] = nil

  if opts.terminal_colors then
    local colors = {
      palette.bg_dark, palette.red, palette.added, palette.ochre,
      palette.blue, palette.burgundy, palette.teal, palette.fg,
      palette.muted, palette.red_bright, palette.added_bright, palette.brass,
      palette.blue, palette.burgundy, palette.string, palette.fg_bright,
    }
    if style == "light" then
      -- ANSI black is text, not the sidebar's paper-colored background.
      colors[1] = palette.fg_bright
    end
    for index, color in ipairs(colors) do
      vim.g["terminal_color_" .. (index - 1)] = color
    end
  end
end

return M
