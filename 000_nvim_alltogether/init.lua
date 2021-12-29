
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
-- source ~/.env/nvim/config/googletest.vim
-- source ~/.env/nvim/config/ultisnips.vim

require('user.reload')
require('user.treesitter')
require('user.indentation')
require('user.toggleterm')
require('user.gitsigns')
require('user.comment')
require('user.notify')

require('user.lualine')
require('user.tabline')
-- require('user.nvim_tree')
-- require('user.vista')
require('user.telescope')

-- require('user.dap')
require('user.lsp')
require('user.cmp')

-- luafile ~/.env/nvim/config/dap/dap.lua
-- luafile ~/.env/nvim/config/dap/dapui.lua
-- luafile ~/.env/nvim/config/dap/dap_virtual_text.lua

-- luafile ~/.env/nvim/config/lsp/null_ls.lua

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

-- " DAP
-- nnoremap <leader>db :lua require('dap').toggle_breakpoint()<CR>
-- nnoremap <leader>dr :lua require('dap.repl').toggle()<CR>
-- nnoremap <leader>dn :lua require('dap').continue()<CR>
-- nnoremap <leader>d_ :lua require('dap').run_last()<CR>
-- nnoremap <leader>dq :lua require('dap').disconnect()<CR>
-- nnoremap <leader>d? :lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>
-- nnoremap <S-j> :lua require('dap').step_over()<CR>
-- nnoremap <S-k> :lua require('dap').step_into()<CR>
-- nnoremap <S-l> :lua require('dap').step_out()<CR>
-- nnoremap <leader>dk :lua require('dap').up()<CR>
-- nnoremap <leader>dj :lua require('dap').down()<CR>
-- nnoremap <leader>dl :lua require('dap').list_breakpoints()<CR>

-- " googletest
-- nnoremap <leader>tr <cmd>GTestRun<cr>
-- nnoremap <leader>tc <cmd>GTestRunUnderCursor<cr>
-- nnoremap ]t <cmd>GTestNext<cr>
-- nnoremap [t <cmd>GTestPrev<cr>
-- nnoremap <leader>du :lua require('dapui').toggle()<CR>
-- nnoremap <leader>di :lua require('dapui').eval()<CR>
-- nnoremap <leader>df :lua require('dapui').float_element()<CR>

-- ================================================================================

