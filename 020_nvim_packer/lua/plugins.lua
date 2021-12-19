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

  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  use {'folke/tokyonight.nvim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  use {'kyazdani42/nvim-web-devicons'}

  if packer_bootstrap then
    require('packer').sync()
  end

end)

