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

---@param style? "dark"|"light"
---@return table<string, any>
function M.get_colors(style)
  style = style or (vim.g.colors_name == "soviet-light" and "light" or "dark")
  if style ~= "dark" and style ~= "light" then
    error('soviet: color variant must be "dark" or "light"')
  end
  return require("soviet.colors").setup({ style = style })
end

---@param style "dark"|"light"
function M.load(style)
  if style ~= "dark" and style ~= "light" then
    error('soviet: load expects "dark" or "light"')
  end

  local colors, opts = require("soviet.colors").setup({ style = style })
  local highlights = require("soviet.groups").setup(colors, opts)

  vim.o.termguicolors = true
  vim.g.colors_name = nil
  vim.o.background = style
  vim.cmd("highlight clear")
  if vim.g.syntax_on then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "soviet-" .. style

  for name, definition in pairs(highlights) do
    definition = type(definition) == "string" and { link = definition } or definition
    vim.api.nvim_set_hl(0, name, definition)
  end

  if opts.terminal_colors then
    local terminal = colors.terminal
    local values = {
      terminal.black, terminal.red, terminal.green, terminal.yellow,
      terminal.blue, terminal.magenta, terminal.cyan, terminal.white,
      terminal.black_bright, terminal.red_bright, terminal.green_bright, terminal.yellow_bright,
      terminal.blue_bright, terminal.magenta_bright, terminal.cyan_bright, terminal.white_bright,
    }
    for index, color in ipairs(values) do
      vim.g["terminal_color_" .. (index - 1)] = color
    end
  end

  package.loaded["lualine.themes.soviet"] = nil
  package.loaded["lualine.themes.soviet-dark"] = nil
  package.loaded["lualine.themes.soviet-light"] = nil

  return colors, highlights, opts
end

return M
