
-- set nocompatible
-- filetype plugin indent on

require('user.general')
require('user.plugins')
require('user.keymaps')
require('user.coloring')

-- ================================================================================

-- syntax on                  " enable syntax
-- " set softtabstop=2
-- " set smartindent            " auto indent after new line
-- " set colorcolumn=80
-- " set completeopt=menu,menuone,noselect

-- ================================================================================

-- let g:better_whitespace_enabled = 0

-- ================================================================================

-- Plugin Configs
-- ==============

-- "lua require('colorizer').setup()
-- "lua require('nvim-autopairs').setup{}

-- require('user.alpha')
-- source ~/.env/nvim/config/dashboard.vim
-- source ~/.env/nvim/config/delimite_mate.vim
-- source ~/.env/nvim/config/ultisnips.vim

require('user.reload')
require('user.treesitter')
-- require('user.indentation')
require('user.which_key')
-- require('user.sessions')

-- require('user.toggleterm')
-- require('user.gitsigns')
-- require('user.comment')
-- require('user.notify')

-- require('user.alpha')
-- require('user.lualine')
-- require('user.tabline')
-- require('user.nvim_tree')
-- require('user.vista')
-- require('user.telescope')
-- require('user.hop')

require('user.dap')
-- require('user.lsp')
-- require('user.cmp')

-- require('user.google_test')

-- ================================================================================

