local fn = vim.fn
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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)

  -- packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- coloring
  use {'pacha/vem-dark'}
  use {'folke/tokyonight.nvim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  use {'kyazdani42/nvim-web-devicons'}

  -- work page appearance
  use {'nvim-lualine/lualine.nvim'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'liuchengxu/vista.vim'}
  use {'seblj/nvim-tabline'}

  -- functionality
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  -- use 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  use {'glepnir/dashboard-nvim'}
  use {'akinsho/toggleterm.nvim'}
  use {'rcarriga/nvim-notify'}

  -- code
  use {'numToStr/Comment.nvim'}
  use {'SirVer/ultisnips'}
  use {'lewis6991/gitsigns.nvim'}
  -- use 'tpope/vim-fugitive'
  use {'alepez/vim-gtest'}

  -- code completion
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'quangnguyen30192/cmp-nvim-ultisnips'}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/nvim-lsp-installer'}
  -- use 'glepnir/lspsaga.nvim'
  use {'tami5/lspsaga.nvim'}
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'onsails/lspkind-nvim'}

  -- DAP
  use {'mfussenegger/nvim-dap'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'rcarriga/nvim-dap-ui'}

  -- misc
  use {'lukas-reineke/indent-blankline.nvim'}
  use {'djoshea/vim-autoread'}
  -- use 'windwp/nvim-autopairs'
  use {'Raimondi/delimitMate'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'ntpeters/vim-better-whitespace'}
  use {'jdhao/better-escape.vim'}

  -- synchronize everything after bootstrap
  if packer_bootstrap then
    require('packer').sync()
  end

end)

