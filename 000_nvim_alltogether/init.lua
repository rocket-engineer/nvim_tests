
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

-- let mapleader=","          " set map leader key

-- ================================================================================

-- " if (has("termguicolors"))
-- "   set termguicolors
-- " endif

-- let g:better_whitespace_enabled = 0

-- let g:better_escape_shortcut = 'jk'

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

-- luafile ~/.env/nvim/config/comment.lua
-- luafile ~/.env/nvim/config/lualine.lua
-- luafile ~/.env/nvim/config/notify.lua
-- luafile ~/.env/nvim/config/nvim_tree.lua
-- luafile ~/.env/nvim/config/tabline.lua
require('user.telescope')
-- luafile ~/.env/nvim/config/dap/dap.lua
-- luafile ~/.env/nvim/config/dap/dapui.lua
-- luafile ~/.env/nvim/config/dap/dap_virtual_text.lua
-- luafile ~/.env/nvim/config/lsp/cmp.lua
-- luafile ~/.env/nvim/config/lsp/installer.lua
-- luafile ~/.env/nvim/config/lsp/lspconfig.lua
-- luafile ~/.env/nvim/config/lsp/lspsaga.lua
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

-- " LSP
-- nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
-- nnoremap <silent> <leader>lD <cmd>lua vim.lsp.buf.declaration()<CR>
-- nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
-- nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>

-- " lspsaga
-- nnoremap <silent> <leader>cr <cmd>lua require('lspsaga.rename').rename()<CR>
-- nnoremap <silent> <leader>cp <cmd>lua require('lspsaga.provider').preview_definition()<CR>
-- nnoremap <silent> <leader>cd <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>
-- nnoremap <silent> <leader>cc <cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>
-- nnoremap <silent> [d <cmd>lua require('lspsaga.diagnostic').navigate("prev")()<CR>
-- nnoremap <silent> ]d <cmd>lua require('lspsaga.diagnostic').navigate("next")()<CR>
-- nnoremap <silent> <leader>cs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
-- nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
-- nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
-- "vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
-- nnoremap <silent> <leader>ch <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

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

