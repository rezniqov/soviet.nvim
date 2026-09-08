local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

local uv = vim.uv or vim.loop

local function rgb(color)
  color = color:lower()
  return {
    tonumber(color:sub(2, 3), 16),
    tonumber(color:sub(4, 5), 16),
    tonumber(color:sub(6, 7), 16),
  }
end

function M.mod(module)
  if package.loaded[module] then
    return package.loaded[module]
  end
  local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")
  local chunk = assert(loadfile(root .. "/" .. module:gsub("%.", "/") .. ".lua"))
  local value = chunk()
  package.loaded[module] = value
  return value
end

function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)
  local function channel(index)
    local value = alpha * fg[index] + (1 - alpha) * bg[index]
    return math.floor(math.min(math.max(0, value), 255) + 0.5)
  end
  return string.format("#%02x%02x%02x", channel(1), channel(2), channel(3))
end

function M.blend_bg(color, amount, bg)
  return M.blend(color, amount, bg or M.bg)
end

M.darken = M.blend_bg

function M.blend_fg(color, amount, fg)
  return M.blend(color, amount, fg or M.fg)
end

M.lighten = M.blend_fg

function M.resolve(groups)
  for _, highlight in pairs(groups) do
    if type(highlight) == "table" and type(highlight.style) == "table" then
      for key, value in pairs(highlight.style) do
        highlight[key] = value
      end
      highlight.style = nil
    end
  end
  return groups
end

M.cache = {}

function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/soviet-" .. key .. ".json"
end

function M.cache.read(key)
  local ok, value = pcall(function()
    local file = assert(io.open(M.cache.file(key), "r"))
    local data = file:read("*a")
    file:close()
    return vim.json.decode(data, { luanil = { object = true, array = true } })
  end)
  return ok and value or nil
end

function M.cache.write(key, value)
  pcall(function()
    local path = M.cache.file(key)
    vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
    local file = assert(io.open(path, "w+"))
    file:write(vim.json.encode(value))
    file:close()
  end)
end

function M.cache.clear()
  for _, style in ipairs({ "dark", "light" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

return M
