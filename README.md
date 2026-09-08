# ★ soviet.nvim

![soviet.nvim — dark constructivist poster with cream typography, a hammer and sickle, and a red star](assets/soviet-historical-poster.png)

Light and dark Neovim colorschemes inspired by Soviet visual culture: book covers, posters, enamel signs, design bureaus, and military colors.

Warm graphite and book paper form the foundation. Burgundy, ochre, blue, and turquoise distinguish syntax, while olive and khaki provide secondary accents. Poster red marks headings, search, and errors. This is an interpretation for the screen, not a reconstruction of historical printing inks.

- **soviet-dark** — warm graphite with soft contrast and lighter ink colors.
- **soviet-light** — cream paper with darker ink colors.

## Screenshots

### Dark

<img width="1551" height="883" alt="Снимок экрана — 2026-09-05 в 12 28 35" src="https://github.com/user-attachments/assets/3c1faa83-dca2-4e3e-8ed2-8a0533391ffc" />

### Light

<img width="1550" height="883" alt="Снимок экрана — 2026-09-05 в 12 29 22" src="https://github.com/user-attachments/assets/8df24a13-aa79-4fca-87cc-be807ec19a76" />

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

### LazyVim

Soviet automatically detects plugins registered with lazy.nvim. Add this to `lua/plugins/colorscheme.lua`:

```lua
return {
  {
    "rezniqov/soviet.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "soviet-dark",
      -- colorscheme = "soviet-light",
    },
  },
}
```

When loaded by LazyVim, Soviet reads lazy.nvim's plugin registry and generates highlight groups only for installed integrations. No additional LazyVim-specific configuration is required.

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
    sidebars = "dark", -- "dark", "normal", or "transparent"
    floats = "dark", -- "dark", "normal", or "transparent"
  },
  dim_inactive = false,
  lualine_bold = false,
  cache = true,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
  integrations = {}, -- Legacy aliases; prefer plugins.
  palette = {},
  -- on_colors = function(colors) end,
  -- on_highlights = function(highlights, colors) end,
})
vim.cmd.colorscheme("soviet-dark")
```

Each `setup()` call merges your options with fresh defaults. It saves the configuration; reapply the chosen colorscheme to update highlights.

`transparent` removes the main editor background. Sidebar and floating-window backgrounds are controlled independently by `styles.sidebars` and `styles.floats`. Setting `terminal_colors = false` leaves existing ANSI palette settings untouched.

With lazy.nvim, `plugins.auto = true` enables integrations found in its registry. Outside lazy.nvim, `plugins.all` defaults to `true`, so plugin highlight groups are defined eagerly. You can override either behavior by group name or lazy.nvim plugin name:

```lua
plugins = {
  all = false,
  auto = true,
  snacks = true,
  ["render-markdown.nvim"] = false,
  telescope = { enabled = true },
}
```

The old `integrations` table is still accepted for backwards compatibility; new configurations should use `plugins`.

### Custom colors and highlights

```lua
require("soviet").setup({
  styles = { comments = { italic = false } },
  palette = { property = "#C8C1AA" },
  on_colors = function(c)
    c.border_highlight = c.red
  end,
  on_highlights = function(hl, c)
    hl.CursorLineNr = { fg = c.brass, bold = false }
    hl["@keyword.return"] = { fg = c.red_bright }
    hl.TelescopeBorder = { fg = c.brass, bg = c.bg_light }
  end,
})
vim.cmd.colorscheme("soviet-dark")
```

The `on_highlights` callback runs after all highlight definitions are assembled and before they are applied. Replace a linked group's entire table when changing its colors: a `link` takes precedence over other attributes.

Palette overrides apply to both variants. `on_colors` runs after derived colors are created; `on_highlights` then receives the complete color table. Using its colors keeps highlights consistent with the active variant.

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

Plugin coverage includes Aerial, ALE, Alpha, Barbar, Blink, Bufferline, Codeium, Copilot, Dashboard, DAP, Flash, fzf-lua, GitGutter, Gitsigns, GrugFar, Headlines, Hop, Illuminate, indent-blankline, Lazy, Leap, Lspsaga, the Mini modules, Navic, neo-tree, Neogit, Neotest, Noice, nvim-cmp, nvim-notify, nvim-scrollbar, nvim-tree, Octo, Rainbow Delimiters, render-markdown, Sidekick, Snacks, Supermaven, Telescope, Treesitter Context, Trouble, Vimwiki, WhichKey, Yanky, and related integrations. Oil support is retained as well.

Core Vim syntax, Tree-sitter, LSP semantic tokens, diagnostics, inlay hints, diff views, and completion-kind groups are always available. Integrations define highlights only; they never load the corresponding plugins.

Plugin UI uses brass and ochre as its primary accents, with burgundy, olive, and turquoise for secondary states. Enamel blue is deliberately reserved for types, file paths, and informational diagnostics so it does not dominate LazyVim's interface.

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
lua/soviet/colors.lua           Derived semantic colors
lua/soviet/groups/              Core and plugin highlight groups
lua/soviet/util.lua             Color blending and highlight cache
lua/soviet/lualine.lua          Lualine palette builder
lua/lualine/themes/soviet.lua   Lualine theme for the active variant
lua/lualine/themes/soviet-*.lua  Fixed lualine variants
doc/soviet.txt                  :help soviet
```

The plugin has no timers, autocommands, or OS preference readers. It updates highlight groups, `colors_name`, color options, and optionally `terminal_color_0` through `terminal_color_15`. The generated highlight table is cached by variant by default; set `cache = false` to disable this.

## License

Licensed under the [Apache License, Version 2.0](LICENSE).
