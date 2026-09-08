local M = {}

---Return a fresh palette, so overrides never mutate the defaults.
---@param overrides? table<string, string>
---@param style? "dark"|"light"
---@return table<string, string>
function M.get(overrides, style)
  if style == "light" then
    return vim.tbl_extend("force", {
      bg_dark = "#E3D9C9",
      bg = "#F0E7D8",
      bg_light = "#F6EEDF",
      line = "#E7DDCD",
      selection = "#D7CCD0",
      border = "#AEA094",
      border_active = "#7C5B25",
      fg = "#413C38",
      fg_bright = "#292626",
      muted = "#766A62",
      comment = "#77765D",
      red_dark = "#843C35",
      red = "#AB3E33",
      red_bright = "#B93228",
      on_accent = "#FFF3E2",
      burgundy = "#8A465C",
      olive = "#6B7048",
      added = "#536B32",
      added_bright = "#426020",
      khaki = "#78663D",
      brown = "#89604A",
      brass = "#856020",
      ochre = "#985424",
      steel = "#5C6D74",
      blue = "#3D648B",
      teal = "#326D70",
      string = "#3D735C",
      property = "#685448",
    }, overrides or {})
  end
  return vim.tbl_extend("force", {
    -- Warm graphite and book paper, without an olive cast on every surface.
    bg_dark = "#222020",
    bg = "#292727",
    bg_light = "#323030",
    line = "#393535",
    selection = "#494249",
    border = "#625858",
    border_active = "#B89A68",
    fg = "#D8CFC4",
    fg_bright = "#E9DFD0",
    muted = "#ABA09A",
    comment = "#92917B",
    -- Poster red stays an accent; book-cover burgundy carries keywords.
    red_dark = "#88413C",
    red = "#D45C4F",
    red_bright = "#EF7565",
    on_accent = "#E9DFD0",
    burgundy = "#C58F9D",
    -- Military and workshop colors remain as a secondary family.
    olive = "#979B72",
    added = "#B8BA73",
    added_bright = "#CED08B",
    khaki = "#B1A178",
    brown = "#A17F6C",
    brass = "#D1B078",
    ochre = "#D29A69",
    steel = "#9BA9AC",
    -- Enamel-sign blue and turquoise balance the warm printing inks.
    blue = "#91ABC4",
    teal = "#81B4B0",
    string = "#9BC1B2",
    property = "#C6B8AA",
  }, overrides or {})
end

return M
