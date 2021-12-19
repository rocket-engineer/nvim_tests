
set nocompatible
filetype plugin indent on

lua require('config.general')
lua require('config.plugins')

" ================================================================================

syntax on                  " enable syntax
" set softtabstop=2
" set smartindent            " auto indent after new line
" set colorcolumn=80
" set completeopt=menu,menuone,noselect

let mapleader=","          " set map leader key

" ================================================================================

if (has("termguicolors"))
  set termguicolors
endif

let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_italic_variables = 0
colorscheme tokyonight

let g:better_whitespace_enabled = 0

let g:better_escape_shortcut = 'jk'

" ================================================================================

" Colors
" ======

" change guisp for different colour
highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline

" gitsigns
highlight GitSignsAdd    guifg=#00FF00
highlight GitSignsChange guifg=#F0EF00
highlight GitSignsDelete guifg=#F00000

" ================================================================================

" Plugin Configs
" ==============

"lua require('colorizer').setup()
"lua require('nvim-autopairs').setup{}

source ~/.env/nvim/config/dashboard.vim
source ~/.env/nvim/config/delimite_mate.vim
source ~/.env/nvim/config/googletest.vim
source ~/.env/nvim/config/ultisnips.vim

lua require('config.comment')
lua require('config.gitsigns')
lua require('config.indent_blankline')
lua require('config.lualine')
lua require('config.notify')
lua require('config.nvim_tree')
lua require('config.tabline')
lua require('config.telescope')
lua require('config.toggleterm')
lua require('config.treesitter')
lua require('config.lsp.cmp')
lua require('config.lsp.installer')
lua require('config.lsp.lspsaga')
lua require('config.lsp.null_ls')

" ================================================================================

" Mappings
" ========

" Telescope
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gm <cmd>Telescope git_branches<cr>
nnoremap <leader>gS <cmd>Telescope git_stash<cr>

" Dashboard
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" lsp
nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>

" lspsaga
nnoremap <silent> <leader>cr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>cp <cmd>lua require('lspsaga.provider').preview_definition()<CR>
nnoremap <silent> <leader>cd <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>
nnoremap <silent> <leader>cc <cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>
nnoremap <silent> [d <cmd>lua require('lspsaga.diagnostic').navigate("prev")()<CR>
nnoremap <silent> ]d <cmd>lua require('lspsaga.diagnostic').navigate("next")()<CR>
nnoremap <silent> <leader>cs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
"vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> <leader>ch <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" googletest
nnoremap <leader>tr <cmd>GTestRun<cr>
nnoremap <leader>tc <cmd>GTestRunUnderCursor<cr>
nnoremap ]t <cmd>GTestNext<cr>
nnoremap [t <cmd>GTestPrev<cr>

" ================================================================================

