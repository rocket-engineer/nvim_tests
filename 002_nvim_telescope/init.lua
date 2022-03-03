
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

-- source ~/.env/nvim/config/dashboard.vim
-- source ~/.env/nvim/config/delimite_mate.vim
-- source ~/.env/nvim/config/ultisnips.vim

require('user.reload')
require('user.treesitter')
-- require('user.indentation')
require('user.which_key')

-- require('user.toggleterm')
-- require('user.gitsigns')
-- require('user.comment')
-- require('user.notify')

-- require('user.lualine')
-- require('user.tabline')
-- require('user.nvim_tree')
-- require('user.vista')
require('user.telescope')
-- require('user.hop')

-- require('user.dap')
-- require('user.lsp')
-- require('user.cmp')

-- require('user.google_test')

-- ================================================================================

-- Colors
-- ======

-- change guisp for different colour
-- highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline

-- ================================================================================

-- " Mappings
-- " ========

-- " Dashboard
-- nmap <Leader>ss :<C-u>SessionSave<CR>
-- nmap <Leader>sl :<C-u>SessionLoad<CR>
-- nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
-- nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
-- nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
-- nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
-- nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
-- nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

-- ================================================================================

