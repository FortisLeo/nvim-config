-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP Zero for simplifying LSP setup
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required core LSP config
      {'williamboman/mason.nvim'},           -- Optional: Installer for LSPs
      {'williamboman/mason-lspconfig.nvim'}, -- Optional: Mason integration

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required completion engine
      {'hrsh7th/cmp-nvim-lsp'}, -- Required LSP completions
      {'L3MON4D3/LuaSnip'},     -- Required snippets engine
    },
  }

  -- Treesitter for better syntax highlighting and parsing
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'java' }, -- Add 'java' for Treesitter support
        highlight = {
          enable = true,              -- Enable syntax highlighting
        },
      }
    end
  }

  -- Telescope for fuzzy finding and project navigation
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {".git/", "target/", "build/"}, -- Ignore Java build folders
        },
      }
    end
  }
  use {
     'andweeb/presence.nvim',
	config = function()
	-- Load your presence.lua config
	require('presence') -- This assumes presence.lua sets up the configuration
     end
  }



  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup ({map_cr = true})
    end
}



end)

