# Neovim Configuration 

This Neovim configuration is a compact LazyVim-based setup located at:

`~/.config/nvim`

It uses `lazy.nvim` as the plugin manager and imports the default LazyVim plugin set, with a small number of local customizations for colorscheme, LSP servers, Treesitter, and Mason-managed tools.

## File Tree

```text
.
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── stylua.toml
├── .gitignore
├── .neoconf.json
└── lua
    ├── config
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins
        ├── example.lua
        └── lsp.lua
```

## Files And Roles

| File | Role |
|---|---|
| `init.lua` | Entry point. Loads `lua/config/lazy.lua`. |
| `lua/config/lazy.lua` | Bootstraps `lazy.nvim`, imports LazyVim, configures plugin loading, colorscheme, update checks, and disabled runtime plugins. |
| `lua/config/options.lua` | Place for custom Neovim options. Currently empty except comments. |
| `lua/config/keymaps.lua` | Place for custom keymaps. Currently empty except comments. |
| `lua/config/autocmds.lua` | Place for custom autocommands. Currently empty except comments. |
| `lua/plugins/lsp.lua` | Local plugin overrides for LSP servers, Treesitter, and Mason tools. |
| `lua/plugins/example.lua` | Empty example plugin spec from the LazyVim starter template. |
| `lazy-lock.json` | Lockfile containing exact plugin commits. |
| `lazyvim.json` | LazyVim metadata and extras list. No extras are enabled. |
| `.neoconf.json` | Neoconf/neodev settings for Lua workspace support. |
| `stylua.toml` | Lua formatter settings. |
| `.gitignore` | Ignore rules. |

## Explicit Plugins

These plugins are directly defined by this config.

| Plugin | File | Purpose |
|---|---|---|
| `LazyVim/LazyVim` | `lua/config/lazy.lua` | Imports LazyVim's default plugin set. |
| `ellisonleao/gruvbox.nvim` | `lua/config/lazy.lua` | Provides the configured Gruvbox colorscheme. |
| `neovim/nvim-lspconfig` | `lua/plugins/lsp.lua` | Configures language servers. |
| `nvim-treesitter/nvim-treesitter` | `lua/plugins/lsp.lua` | Treesitter syntax parsing and highlighting. |
| `mason-org/mason.nvim` | `lua/plugins/lsp.lua` | Installs external developer tools. |

## Locked Plugins

The current `lazy-lock.json` includes these plugins:

| Plugin | Branch | &#124; | Plugin | Branch |
|---|---|:---:|---|---|
| `LazyVim` | `main` | &#124; | `mini.pairs` | `main` |
| `blink.cmp` | `main` | &#124; | `noice.nvim` | `main` |
| `bufferline.nvim` | `main` | &#124; | `nui.nvim` | `main` |
| `catppuccin` | `main` | &#124; | `nvim-lint` | `master` |
| `conform.nvim` | `master` | &#124; | `nvim-lspconfig` | `master` |
| `flash.nvim` | `main` | &#124; | `nvim-treesitter` | `main` |
| `friendly-snippets` | `main` | &#124; | `nvim-treesitter-textobjects` | `main` |
| `gitsigns.nvim` | `main` | &#124; | `nvim-ts-autotag` | `main` |
| `grug-far.nvim` | `main` | &#124; | `persistence.nvim` | `main` |
| `gruvbox.nvim` | `main` | &#124; | `plenary.nvim` | `master` |
| `lazy.nvim` | `main` | &#124; | `snacks.nvim` | `main` |
| `lazydev.nvim` | `main` | &#124; | `todo-comments.nvim` | `main` |
| `lualine.nvim` | `master` | &#124; | `tokyonight.nvim` | `main` |
| `mason-lspconfig.nvim` | `main` | &#124; | `trouble.nvim` | `main` |
| `mason.nvim` | `main` | &#124; | `ts-comments.nvim` | `main` |
| `mini.ai` | `main` | &#124; | `which-key.nvim` | `main` |
| `mini.icons` | `main` | &#124; |  |  |

## Main Settings

Defined in `lua/config/lazy.lua`:

| Setting | Value |
|---|---|
| Colorscheme | `gruvbox` |
| LazyVim import | `lazyvim.plugins` |
| User plugin import | `plugins` |
| `defaults.lazy` | `false` |
| `defaults.version` | `false` |
| Install colorschemes | `tokyonight`, `habamax`, `gruvbox` |
| Plugin update checker | Enabled |
| Update notifications | Disabled |
| Disabled runtime plugins | `gzip`, `tarPlugin`, `tohtml`, `zipPlugin` |

Defined in `lua/plugins/lsp.lua`:

| Area | Value |
|---|---|
| Python LSP | `pyright` |
| C/C++ LSP | `clangd` |
| YAML LSP | `yamlls` |
| YAML key ordering | Disabled |
| Mason tools | `pyright`, `clangd`, `yaml-language-server` |
| Treesitter build command | `:TSUpdate` |

Defined in `stylua.toml`:

| Setting | Value |
|---|---|
| Indentation | Spaces |
| Indent width | `4` |
| Column width | `120` |

## How To Navigate This Config

Open the config directory:

```sh
cd ~/.config/nvim
```

Start at the entry point:

```text
init.lua
```

`init.lua` loads:

```lua
require("config.lazy")
```

That means the main startup logic lives here:

```text
lua/config/lazy.lua
```

Use these files for common edits:

| Goal | Edit This File |
|---|---|
| Add editor options | `lua/config/options.lua` |
| Add keymaps | `lua/config/keymaps.lua` |
| Add autocommands | `lua/config/autocmds.lua` |
| Add or configure plugins | Files under `lua/plugins/` |
| Change colorscheme | `lua/config/lazy.lua` |
| Add LSP servers | `lua/plugins/lsp.lua` |
| Add Mason-managed tools | `lua/plugins/lsp.lua` |
| Change Lua formatting | `stylua.toml` |

## Adding A Plugin

Create or edit a file under:

```text
lua/plugins/
```

Example:

```lua
return {
    {
        "author/plugin-name",
        opts = {},
    },
}
```

Lazy.nvim automatically imports plugin specs from `lua/plugins` because `lua/config/lazy.lua` contains:

```lua
{ import = "plugins" }
```

## Adding A Keymap

Edit:

```text
lua/config/keymaps.lua
```

Example:

```lua
vim.keymap.set("n", "<leader>x", "<cmd>echo 'hello'<cr>", { desc = "Say hello" })
```

## Adding An Option

Edit:

```text
lua/config/options.lua
```

Example:

```lua
vim.opt.relativenumber = true
```

## Adding An Autocommand

Edit:

```text
lua/config/autocmds.lua
```

Example:

```lua
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
```

## Adding An LSP Server

Edit:

```text
lua/plugins/lsp.lua
```

Add a server under `opts.servers`:

```lua
opts.servers.lua_ls = opts.servers.lua_ls or {}
```

If the server should be installed by Mason, add it to the `ensure_tool` list:

```lua
ensure_tool("lua-language-server")
```

## Useful Commands

| Task | Command |
| --- | --- |
| Open Lazy plugin manager | `:Lazy` |
| Sync plugins | `:Lazy sync` |
| Check LSP status | `:LspInfo` |
| Check Mason tools | `:Mason` |
| Update Treesitter parsers | `:TSUpdate` |
| Format Lua files with Stylua | `stylua lua` |

## Notes

This config currently relies mostly on LazyVim defaults. The local customizations are intentionally small and concentrated in `lua/config/lazy.lua` and `lua/plugins/lsp.lua`.
