# Neovim configuration

Personal Neovim configuration managed with [Packer](https://github.com/wbthomason/packer.nvim).
The configuration is intentionally kept free of machine-specific paths so it can be used on Linux, macOS, and Windows.

## Requirements

- Neovim 0.11 or newer
- Git
- A compiler/toolchain for languages you use
- Optional: Node.js and npm for Treesitter parser compilation and Pyright
- Optional: a C compiler/toolchain for Treesitter parsers

## Installation

Back up an existing configuration, then clone this repository to the platform-specific Neovim config directory:

```sh
# Linux/macOS
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
git clone git@github.com:FortisLeo/nvim-config.git ~/.config/nvim

# Windows PowerShell (use $env:LOCALAPPDATA\nvim instead)
# Rename-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
# git clone git@github.com:FortisLeo/nvim-config.git $env:LOCALAPPDATA\nvim
```

Start Neovim. Packer is bootstrapped automatically into Neovim's data directory. Install the plugins with:

```vim
:PackerSync
```

Treesitter automatically installs and updates the configured parsers. Parser compilation needs a C compiler. On Debian/Ubuntu, install the prerequisites with:

```sh
sudo apt install build-essential
```

If you need a parser that is not configured, install it manually with `:TSInstall <language>`.

If SSH authentication is not configured, use the HTTPS repository URL instead:

```sh
git clone https://github.com/FortisLeo/nvim-config.git ~/.config/nvim
```

## Useful mappings

The leader key is `<Space>`.

- `<leader>f`: netrw file explorer
- `<leader><Enter>`: Telescope file search
- `<leader>/`: Telescope live grep
- `<leader>r`: save and compile/run the current Java file
- `gd`, `K`, `<leader>vca`, `<leader>vrn`: common LSP actions

## Plugin guide and power-user workflow

### Packer

Packer manages the plugins declared in `lua/rishit_configs/packer.lua`:

- `:PackerSync`: install/update plugins and regenerate the compiled loader
- `:PackerUpdate`: update installed plugins
- `:PackerCompile`: regenerate the loader after editing the plugin list
- `:PackerClean`: remove plugins no longer declared
- `:PackerStatus`: inspect plugin state

Restart Neovim after a major plugin update. The generated `plugin/packer_compiled.lua` is local-only and ignored by Git.

### nvim-tree

Use `<leader>e` to toggle the file tree. Inside the tree, press `?` to see all available actions. Common actions include:

- `<CR>` or `o`: open the selected file
- `a`: create a file or directory (`name/` creates a directory)
- `d`: delete
- `r`: rename
- `x`: cut, `c`: copy, `p`: paste
- `R`: refresh
- `H`: toggle hidden files
- `q`: close the tree

The tree follows the current working directory. Use `:NvimTreeFindFile` to reveal the current buffer in the tree.

### Telescope

- `<leader><Enter>`: search files
- `<leader>/`: live grep through the project

Inside Telescope, use `<C-n>`/`<C-p>` or arrow keys to move, `<CR>` to select, `<C-x>` to open in a split, `<C-v>` to open in a vertical split, and `<C-t>` to open in a tab. Press `<C-q>` to send selected results to the quickfix list and `<Esc>` to close. Telescope ignores `.git`, `target`, and `build` directories.

### LSP and Mason

Mason installs and manages `rust_analyzer` and `pyright`:

- `:Mason`: open the package manager
- `:MasonInstall <package>`: install a server or tool
- `:MasonUpdate`: update the registry
- `:LspInfo`: inspect servers attached to the current buffer
- `:checkhealth vim.lsp`: diagnose LSP problems

LSP mappings are buffer-local and become available when a server attaches:

- `gd`: go to definition
- `K`: hover documentation
- `<leader>vws`: workspace symbols
- `<leader>vd`: diagnostics in a floating window
- `[d` / `]d`: next/previous diagnostic
- `<leader>vca`: code action
- `<leader>vrr`: references
- `<leader>vrn`: rename symbol
- `<C-h>` in insert mode: signature help

### nvim-cmp completion

In insert mode, `<C-n>` and `<C-p>` navigate completion results, `<C-y>` confirms the selected item, and `<C-Space>` manually opens completion. `<Esc>` closes the menu. LuaSnip is installed as the snippet engine.

### nvim-autopairs

`nvim-autopairs` automatically closes brackets, parentheses, and quotes while you type. The old custom mappings were removed, so there is now one consistent pairing implementation. Press `<BS>` inside an empty pair to remove both characters; pressing the closing character skips over an existing closing character. Press `<CR>` inside pairs for the plugin's configured pair formatting.

### vim-tmux-navigator

With tmux running, use `<C-h>`, `<C-j>`, `<C-k>`, and `<C-l>` to move between Neovim splits and tmux panes. The same keys work from both Neovim and tmux. Add the following to `~/.tmux.conf` if the keys do not work from tmux:

```tmux
set -g @plugin 'christoomey/vim-tmux-navigator'
run '~/.tmux/plugins/tpm/tpm'
```

If you do not use tmux, these mappings simply behave like normal split navigation when supported by the plugin.

### Treesitter

Treesitter provides syntax highlighting and automatically installs the configured parsers. Use `:TSUpdate` to update parsers, `:TSInstall <language>` to add one, and `:TSInstallInfo` to inspect parser status.

### Java and file templates

- `<leader>r` in a Java buffer saves, compiles, and runs the class.
- New `.java` files receive a class template based on the filename.
- New `.cpp` files receive the template in `lua/rishit_configs/templates/CpSkeleton.cpp`.
- `<S-CR>` in insert mode opens a new line below the current line.

## Updating

```vim
:PackerUpdate
:PackerCompile
```

`plugin/packer_compiled.lua` is generated locally and is ignored because Packer writes absolute, machine-specific paths into it.
