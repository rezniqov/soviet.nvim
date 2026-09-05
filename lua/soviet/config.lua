local M = {}

---@class SovietConfig
---@field transparent boolean
---@field terminal_colors boolean
---@field styles table<string, table>
---@field integrations table<string, boolean>
---@field palette table<string, string>
---@field on_highlights? fun(highlights: table<string, table>, palette: table<string, string>)

---@type SovietConfig
local defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    strings = {},
    variables = {},
  },
  integrations = {
    telescope = true,
    gitsigns = true,
    completion = true,
    trees = true,
    which_key = true,
    indent_blankline = true,
    lazy = true,
    mini = true,
    snacks = true,
  },
  palette = {},
}

M.options = vim.deepcopy(defaults)

---@param opts? SovietConfig|table
function M.setup(opts)
  if opts ~= nil and type(opts) ~= "table" then
    error("soviet: setup expects a table")
  end
  local options = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
  if options.style ~= nil then
    error("soviet: select :colorscheme soviet-dark or soviet-light instead of setup({ style = ... })")
  end
  for _, key in ipairs({ "transparent", "terminal_colors" }) do
    if type(options[key]) ~= "boolean" then
      error("soviet: " .. key .. " must be a boolean")
    end
  end
  for _, key in ipairs({ "styles", "integrations", "palette" }) do
    if type(options[key]) ~= "table" then
      error("soviet: " .. key .. " must be a table")
    end
  end
  for key, color in pairs(options.palette) do
    if type(color) ~= "string" or not color:match("^#%x%x%x%x%x%x$") then
      error("soviet: palette." .. key .. " must be a #RRGGBB color")
    end
  end
  if options.on_highlights ~= nil and type(options.on_highlights) ~= "function" then
    error("soviet: on_highlights must be a function")
  end
  M.options = options
end

return M
