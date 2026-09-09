-- Integration layout adapted from folke/tokyonight.nvim (Apache-2.0).
local Util = require("soviet.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type soviet.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    RenderMarkdownBullet    = {fg = c.orange}, -- horizontal rule
    RenderMarkdownCode      = { bg = c.bg_dark },
    RenderMarkdownDash      = {fg = c.orange}, -- horizontal rule
    RenderMarkdownTableHead = { fg = c.red, bold = true },
    RenderMarkdownTableRow  = { fg = c.orange},
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline"
  }
  for i, color in ipairs(c.rainbow) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end
  return ret
end

return M
