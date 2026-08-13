-- Bootstrap packer in Neovim's data directory on any platform.
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("Installing packer.nvim...", vim.log.levels.INFO)
  local result = fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to install packer.nvim:\n" .. result, vim.log.levels.ERROR)
    return
  end
end
vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP Zero for simplifying LSP setup
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig', tag = 'v2.11.0'}, -- v3 requires Neovim 0.11+
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
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
          configs.setup {
            ensure_installed = { "java" },
            highlight = { enable = true },
          }
        end
      end
  }

  -- Telescope for fuzzy finding and project navigation
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.setup {
          defaults = {
            file_ignore_patterns = { ".git/", "target/", "build/" },
          },
        }
      end
    end
  }
  use {
     'andweeb/presence.nvim',
    config = function()
      local ok, presence = pcall(require, "presence")
      if ok then
        presence.setup()
      end
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

