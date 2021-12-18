
set nocompatible
filetype plugin indent on
call plug#begin('~/.env/nvim/plugins')

" coloring
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'

" misc
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jdhao/better-escape.vim'

Plug 'alepez/vim-gtest'

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

let mapleader=","          " set map leader key

" set colorcolumn=80

" ================================================================================

if (has("termguicolors"))
  set termguicolors
endif

colorscheme tokyonight
" colorscheme gruvbox8_hard
" colorscheme wombat

let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_italic_variables = 0

set background=dark

" ================================================================================

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "cpp",
    "cmake",
    "lua",
    "vim"
  },
  highlight = { 
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = true
  }
}
EOF

" ================================================================================

let g:gtest#highlight_failing_tests = 0

nnoremap <leader>tr <cmd>GTestRun<cr>
nnoremap <leader>tc <cmd>GTestRunUnderCursor<cr>
nnoremap ]t <cmd>GTestNext<cr>
nnoremap [t <cmd>GTestPrev<cr>

" ================================================================================

