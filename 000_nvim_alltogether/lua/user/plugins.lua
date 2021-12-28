
local fn = vim.fn


-- =================================================================================================
-- Bootstrapping
-- =================================================================================================

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer. Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- =================================================================================================
-- Module Protection
-- =================================================================================================

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

require('packer').startup(function(use)

  -- packer can manage itself
  use {'wbthomason/packer.nvim'}
  use {
    'famiu/nvim-reload',
    requires = {'nvim-lua/plenary.nvim', opt = false}
  }

  -- coloring
  -- use {'pacha/vem-dark'}
  use {'folke/tokyonight.nvim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'kyazdani42/nvim-web-devicons'}

  -- work page appearance
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- use {'kyazdani42/nvim-tree.lua'}
  -- use {'liuchengxu/vista.vim'}
  use {'seblj/nvim-tabline'}

  -- functionality
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim', opt = false}
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = {'nvim-telescope/telescope.nvim', opt = false},
    run = 'make'
  }
  -- use {'glepnir/dashboard-nvim'}
  use {'akinsho/toggleterm.nvim'}
  use {'rcarriga/nvim-notify'}

  -- code
  use {'numToStr/Comment.nvim'}
  -- use {'SirVer/ultisnips'}
  use {'lewis6991/gitsigns.nvim'}
  -- use 'tpope/vim-fugitive'
  -- use {'alepez/vim-gtest'}

  -- code completion
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  -- use {'hrsh7th/cmp-nvim-lsp'}
  -- use {'quangnguyen30192/cmp-nvim-ultisnips'}
  use {'onsails/lspkind-nvim'}

  -- LSP
  -- use {'neovim/nvim-lspconfig'}
  -- use {'williamboman/nvim-lsp-installer'}
  -- use 'glepnir/lspsaga.nvim'
  -- use {'tami5/lspsaga.nvim'}
  -- use {'jose-elias-alvarez/null-ls.nvim'}

  -- DAP
  -- use {'mfussenegger/nvim-dap'}
  -- use {'theHamsta/nvim-dap-virtual-text'}
  -- use {'rcarriga/nvim-dap-ui'}

  -- misc
  use {
    'lukas-reineke/indent-blankline.nvim',
    requires = {{'nvim-treesitter/nvim-treesitter', opt = true}},
  }
  -- use {'djoshea/vim-autoread'}
  -- use 'windwp/nvim-autopairs'
  -- use {'Raimondi/delimitMate'}
  -- use {'norcalli/nvim-colorizer.lua'}
  -- use {'ntpeters/vim-better-whitespace'}
  use {
    'jdhao/better-escape.vim',
    event = 'InsertEnter'
  }

  -- synchronize everything after bootstrap
  if packer_bootstrap then
    require('packer').sync()
  end

end)


-- =================================================================================================
-- Keymaps
-- =================================================================================================

-- Modes
-- * normal_mode       -> "n",
-- * insert_mode       -> "i",
-- * visual_mode       -> "v",
-- * visual_block_mode -> "x",
-- * term_mode         -> "t",
-- * command_mode      -> "c",

local opts = {silent = true, noremap = true}

-- shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ps", ":PackerSync<CR>",   opts)
keymap("n", "<leader>pl", ":PackerStatus<CR>", opts)
-- keymap("n", "<leader>pc", ":PackerClean<CR>",  opts)

