# Neovim configuration

Personal Neovim configuration managed with [Packer](https://github.com/wbthomason/packer.nvim).
The configuration is intentionally kept free of machine-specific paths so it can be used on Linux, macOS, and Windows.

## Requirements

- Neovim 0.11 or newer
- Git
- A compiler/toolchain for languages you use
- Optional: Java, Rust, and Python language servers (Mason can install these)
- Optional: Discord desktop for `presence.nvim`

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

Restart Neovim after synchronization. Run `:checkhealth` if something does not work. Treesitter parsers are installed automatically; they can also be updated with `:TSUpdate`.

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

## Updating

```vim
:PackerUpdate
:PackerCompile
```

`plugin/packer_compiled.lua` is generated locally and is ignored because Packer writes absolute, machine-specific paths into it.
