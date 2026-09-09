local M = {}

---Return a fresh palette, so overrides never mutate the defaults.
---@param overrides? table<string, string>
---@param style? "dark"|"light"
---@return table<string, string>
function M.get(overrides, style)
  if style == "light" then
    return vim.tbl_extend("force", {
      bg_dark = "#C9B99F",
      bg = "#DDD0B8",
      bg_light = "#EBDFC9",
      line = "#C3B197",
      selection = "#C8AEB2",
      border = "#8E7C69",
      border_active = "#7C5B25",
      fg = "#382F2B",
      fg_bright = "#292626",
      muted = "#615751",
      comment = "#5B5A47",
      red_dark = "#843C35",
      red = "#9C382E",
      red_bright = "#A62D24",
      on_accent = "#FFF3E2",
      burgundy = "#87455A",
      olive = "#585C3B",
      added = "#4B602D",
      added_bright = "#426020",
      khaki = "#675834",
      brown = "#74523F",
      brass = "#74541C",
      ochre = "#864A20",
      -- Dense printing inks: industrial steel, enamel blue, and turquoise.
      steel = "#405B62",
      blue = "#235C89",
      teal = "#176466",
      string = "#2B674D",
      property = "#685448",
    }, overrides or {})
  end
  return vim.tbl_extend("force", {
    -- Warm graphite and book paper, without an olive cast on every surface.
    bg_dark = "#1F1D1D",
    bg = "#292727",
    bg_light = "#353232",
    line = "#403A3A",
    selection = "#554B54",
    border = "#746666",
    border_active = "#B89A68",
    fg = "#D8CFC4",
    fg_bright = "#E9DFD0",
    muted = "#B7AAA3",
    comment = "#A3A187",
    -- Poster red stays an accent; book-cover burgundy carries keywords.
    red_dark = "#A14C45",
    red = "#E36A5B",
    red_bright = "#EF7565",
    on_accent = "#E9DFD0",
    burgundy = "#C58F9D",
    -- Military and workshop colors remain as a secondary family.
    olive = "#A8AC7D",
    added = "#B8BA73",
    added_bright = "#CED08B",
    khaki = "#B1A178",
    brown = "#B28A75",
    brass = "#D1B078",
    ochre = "#D29A69",
    -- Clear enamel and industrial inks instead of powdery pastels.
    steel = "#7899A0",
    blue = "#5F9DD0",
    teal = "#45A39E",
    string = "#65AA88",
    property = "#C6B8AA",
  }, overrides or {})
end

return M
