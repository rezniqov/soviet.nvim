local M = {}

M.version = "4"

---@class SovietConfig
---@field transparent boolean
---@field terminal_colors boolean
---@field styles table<string, table|string>
---@field dim_inactive boolean
---@field lualine_bold boolean
---@field cache boolean
---@field plugins table<string, boolean|{ enabled: boolean }>
---@field integrations table<string, boolean>
---@field palette table<string, string>
---@field on_colors fun(colors: table<string, any>)
---@field on_highlights fun(highlights: table<string, table|string>, colors: table<string, any>)

---@type SovietConfig
M.defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    strings = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  dim_inactive = false,
  lualine_bold = false,
  cache = true,
  plugins = {
    -- Outside lazy.nvim all integrations are defined eagerly. With lazy.nvim,
    -- only groups for plugins present in its registry are generated.
    all = package.loaded.lazy == nil,
    auto = true,
  },
  -- Backwards-compatible aliases for the pre-2.0 integration switches.
  integrations = {},
  palette = {},
  on_colors = function() end,
  on_highlights = function() end,
}

---@type SovietConfig
M.options = vim.deepcopy(M.defaults)

local function validate(options)
  if options.style ~= nil then
    error("soviet: select :colorscheme soviet-dark or soviet-light instead of setup({ style = ... })")
  end
  for _, key in ipairs({ "transparent", "terminal_colors", "dim_inactive", "lualine_bold", "cache" }) do
    if type(options[key]) ~= "boolean" then
      error("soviet: " .. key .. " must be a boolean")
    end
  end
  for _, key in ipairs({ "styles", "plugins", "integrations", "palette" }) do
    if type(options[key]) ~= "table" then
      error("soviet: " .. key .. " must be a table")
    end
  end
  for _, key in ipairs({ "sidebars", "floats" }) do
    if not vim.tbl_contains({ "dark", "normal", "transparent" }, options.styles[key]) then
      error("soviet: styles." .. key .. ' must be "dark", "normal", or "transparent"')
    end
  end
  for key, color in pairs(options.palette) do
    if type(color) ~= "string" or not color:match("^#%x%x%x%x%x%x$") then
      error("soviet: palette." .. key .. " must be a #RRGGBB color")
    end
  end
  for key, enabled in pairs(options.integrations) do
    if type(enabled) ~= "boolean" then
      error("soviet: integrations." .. key .. " must be a boolean")
    end
  end
  for key, enabled in pairs(options.plugins) do
    local valid = type(enabled) == "boolean"
      or (type(enabled) == "table" and type(enabled.enabled) == "boolean")
    if not valid then
      error("soviet: plugins." .. key .. " must be a boolean or { enabled = boolean }")
    end
  end
  for _, key in ipairs({ "on_colors", "on_highlights" }) do
    if type(options[key]) ~= "function" then
      error("soviet: " .. key .. " must be a function")
    end
  end
end

---@param opts? SovietConfig|table
function M.setup(opts)
  if opts ~= nil and type(opts) ~= "table" then
    error("soviet: setup expects a table")
  end
  local options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
  validate(options)
  M.options = options
end

---@param opts? table
---@return SovietConfig
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or vim.deepcopy(M.options)
end

return M
