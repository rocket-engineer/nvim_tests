
set nocompatible
filetype plugin indent on

call plug#begin('~/.env/nvim/plugins')
" standard
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'glepnir/dashboard-nvim'

" coloring
Plug 'pacha/vem-dark'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" code
Plug 'SirVer/ultisnips'
Plug 'lewis6991/gitsigns.nvim'
" Plug 'tpope/vim-fugitive'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path',
Plug 'quangnguyen30192/cmp-nvim-ultisnips',
"Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim',
Plug 'onsails/lspkind-nvim'

" misc
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jdhao/better-escape.vim'
call plug#end()

" ================================================================================

syntax on                  " enable syntax
"set t_Co=256              " set number of colors
set mouse=a                " enable mouse
set mousehide              " hide the mouse cursor while typing
set number                 " enable row numbers
set nowrap                 " display long lines as just one single line
set cursorline             " show cursor line
set tabstop=2              " change the number of space characters for the tab key
set shiftwidth=2           " change the number of space characters for indentation
set softtabstop=2
set expandtab              " convert tabs to spaces
set expandtab
set smarttab
" set autoindent           " auto indent after new line
set smartindent            " auto indent after new line
set splitright
set colorcolumn=80
set completeopt=menu,menuone,noselect

let mapleader=","          " set map leader key

" ================================================================================

let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_italic_variables = 0
colorscheme tokyonight

" if (has("termguicolors"))
"   set termguicolors
" endif

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
lua require('nvim-autopairs').setup{}

source ~/.env/nvim/config/dashboard.vim
source ~/.env/nvim/config/ultisnips.vim

luafile ~/.env/nvim/config/treesitter.lua
luafile ~/.env/nvim/config/indent-blankline.lua
luafile ~/.env/nvim/config/telescope.lua
luafile ~/.env/nvim/config/lsp/cmp.lua
luafile ~/.env/nvim/config/lsp/lspsaga.lua
luafile ~/.env/nvim/config/gitsigns.lua

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

" ================================================================================

