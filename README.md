# ★ soviet.nvim

Light and dark Neovim colorschemes inspired by Soviet visual culture: book covers, posters, enamel signs, design bureaus, and military colors.

Warm graphite and book paper form the foundation. Burgundy, ochre, blue, and turquoise distinguish syntax, while olive and khaki provide secondary accents. Poster red marks headings, search, and errors. This is an interpretation for the screen, not a reconstruction of historical printing inks.

- **soviet-dark** — warm graphite with soft contrast and lighter ink colors.
- **soviet-light** — cream paper with darker ink colors.

## Screenshots

### Dark

### Light

## Requirements

Neovim **0.10+** and a terminal with true color support. No plugin dependencies. The colorscheme enables `termguicolors` and sets `background` for its variant.

## Installation

### vim.pack

Requires Neovim **0.12+** for the built-in [vim.pack](https://neovim.io/doc/user/pack/#vim.pack) plugin manager. Add this to your `init.lua`:

```lua
vim.pack.add({
  { src = "https://github.com/rezniqov/soviet.nvim" },
})

require("soviet").setup({}) -- Optional; add your settings here.
vim.cmd.colorscheme("soviet-dark")
-- vim.cmd.colorscheme("soviet-light")
```

Restart Neovim and confirm installation if prompted.

### lazy.nvim

Add this plugin spec to your existing [lazy.nvim](https://lazy.folke.io/spec) setup:

```lua
{
  "rezniqov/soviet.nvim",
  lazy = false,
  priority = 1000,
  opts = {}, -- Add your soviet.nvim settings here.
  config = function(_, opts)
    require("soviet").setup(opts)
    vim.cmd.colorscheme("soviet-dark")
    -- vim.cmd.colorscheme("soviet-light")
  end,
}
```

Restart Neovim to install the plugin. Choose your default variant in the `config` function. If you organize specs into imported files, wrap the spec above in `return { ... }`.

## Usage

Choose a variant after installing the plugin:

```vim
:colorscheme soviet-dark
:colorscheme soviet-light
```

With `vim.pack`, keep your choice in `init.lua` after the installation block:

```lua
vim.cmd.colorscheme("soviet-dark")
-- vim.cmd.colorscheme("soviet-light")
```

The variant is selected by its colorscheme name. There is no OS synchronization or `style` option. Configuration is optional.

## Configuration

With `vim.pack`, call `setup()` before applying the colorscheme. With lazy.nvim, put the same settings in the `opts` table of the `rezniqov/soviet.nvim` spec; the `config` function above passes them to `setup()`. All defaults are shown below:

```lua
require("soviet").setup({
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
    completion = true, -- nvim-cmp and blink.cmp
    trees = true, -- nvim-tree, neo-tree, and oil.nvim
    which_key = true,
    indent_blankline = true,
    lazy = true,
    mini = true,
    snacks = true,
  },
  palette = {},
  -- on_highlights = function(highlights, palette) end,
})
vim.cmd.colorscheme("soviet-dark")
```

Each `setup()` call merges your options with fresh defaults. It saves the configuration; reapply the chosen colorscheme to update highlights.

`transparent` removes editor and sidebar backgrounds while keeping backgrounds for floating windows, menus, and statuslines. Setting `terminal_colors = false` leaves existing ANSI palette settings untouched. Disabling an integration skips its highlight definitions; integrations never load their associated plugins.

### Custom colors and highlights

```lua
require("soviet").setup({
  styles = { comments = { italic = false } },
  palette = { property = "#C8C1AA" },
  on_highlights = function(hl, c)
    hl.CursorLineNr = { fg = c.brass, bold = false }
    hl["@keyword.return"] = { fg = c.red_bright }
    hl.TelescopeBorder = { fg = c.brass, bg = c.bg_light }
  end,
})
vim.cmd.colorscheme("soviet-dark")
```

The callback runs after all highlight definitions are assembled and before they are applied. Replace a linked group's entire table when changing its colors: a `link` takes precedence over other attributes.

Palette overrides apply to both variants. The callback receives the selected variant's palette. Using its colors keeps highlights consistent with that variant. The `on_accent` color provides light text on red search backgrounds.

Retrieve a fresh palette, including your overrides, with:

```lua
local colors = require("soviet").get_palette()
local dark = require("soviet").get_palette("dark")
local light = require("soviet").get_palette("light")
```

Without an argument, this returns the active variant, or dark before either colorscheme has loaded. Modifying the returned table does not change the theme.

## 🎨 Palette

| Role                                             | Dark      | Light     |
| ------------------------------------------------ | --------- | --------- |
| Editor background                                | `#292727` | `#F0E7D8` |
| Sidebar / statusline                             | `#222020` | `#E3D9C9` |
| Floating windows                                 | `#323030` | `#F6EEDF` |
| Cursor line                                      | `#393535` | `#E7DDCD` |
| Selection                                        | `#494249` | `#D7CCD0` |
| Border                                           | `#625858` | `#AEA094` |
| Text                                             | `#D8CFC4` | `#413C38` |
| Bright text                                      | `#E9DFD0` | `#292626` |
| Comments                                         | `#92917B` | `#77765D` |
| Keywords / booleans — burgundy                   | `#C58F9D` | `#8A465C` |
| Functions / current line number / search — brass | `#D1B078` | `#856020` |
| Strings / characters — green ink                 | `#9BC1B2` | `#3D735C` |
| Editor questions — khaki                         | `#B1A178` | `#78663D` |
| Numbers / warnings — ochre                       | `#D29A69` | `#985424` |
| Types / classes / information — enamel blue      | `#91ABC4` | `#3D648B` |
| Preprocessor — steel                             | `#9BA9AC` | `#5C6D74` |
| Operators / secondary text                       | `#ABA09A` | `#766A62` |
| Properties                                       | `#C6B8AA` | `#685448` |
| Builtins — turquoise                             | `#81B4B0` | `#326D70` |
| Hints — olive                                    | `#979B72` | `#6B7048` |
| Added lines / ANSI green                         | `#B8BA73` | `#536B32` |
| ANSI bright green                                | `#CED08B` | `#426020` |
| Headings / removed lines / active search — red   | `#D45C4F` | `#AB3E33` |
| Errors                                           | `#EF7565` | `#B93228` |
| Dark red                                         | `#88413C` | `#843C35` |
| Brown                                            | `#A17F6C` | `#89604A` |

Comments and secondary elements are deliberately subdued. Adjust `palette.comment`, `palette.muted`, or `palette.border` to suit your display.

## Integrations

Built-in coverage includes Vim syntax, Tree-sitter, LSP semantic tokens, diagnostics, inlay hints, diff views, spell checking, and terminal ANSI colors.

Plugin highlight groups cover Telescope, Gitsigns, nvim-cmp, blink.cmp, nvim-tree, neo-tree, oil.nvim, which-key, indent-blankline, lazy.nvim, mini.nvim, and Snacks. Plugins do not need to be installed for these groups to be defined. Icons with their own palettes may retain their original colors.

LSP semantic tokens use the same roles as Tree-sitter. The final result depends on the parser's captures and the language server's tokens.

### Lualine

Apply the colorscheme before configuring lualine:

```lua
require("lualine").setup({ options = { theme = "soviet" } })
```

The lualine theme `soviet` follows the active variant. Fixed `soviet-dark` and `soviet-light` themes are also available. Lualine's default `theme = "auto"` discovers them by colorscheme name.

The plugin clears its lualine theme cache when loading a colorscheme, allowing lualine's `ColorScheme` handler to pick up the new palette.

### Terminal colors and LazyGit

The ANSI palette applies to newly created terminal buffers. An existing terminal or LazyGit session may retain its previous colors after switching variants. Close that terminal buffer and create a new one to refresh its palette. Changing the colorscheme does not restart terminal processes.

## 📚 Structure

In-editor documentation is available through `:help soviet`, `:help soviet-setup`, `:help soviet-palette`, and `:help soviet-lualine`.

```text
colors/soviet-dark.lua          Dark colorscheme entry point
colors/soviet-light.lua         Light colorscheme entry point
lua/soviet/init.lua             Public API and highlight application
lua/soviet/config.lua           Defaults and configuration
lua/soviet/palette.lua          Both palettes
lua/soviet/highlights.lua       UI, syntax, Tree-sitter, and LSP
lua/soviet/integrations.lua     Optional plugin highlight groups
lua/soviet/lualine.lua          Lualine palette builder
lua/lualine/themes/soviet.lua   Lualine theme for the active variant
lua/lualine/themes/soviet-*.lua  Fixed lualine variants
doc/soviet.txt                  :help soviet
```

The plugin has no timers, autocommands, OS preference readers, or file cache. It updates highlight groups, `colors_name`, color options, and optionally `terminal_color_0` through `terminal_color_15`.

## License

Licensed under the [Apache License, Version 2.0](LICENSE).
