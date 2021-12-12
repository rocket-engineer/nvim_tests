
set nocompatible
filetype plugin indent on
call plug#begin('~/.env/nvim/plugins')
Plug 'lifepillar/vim-gruvbox8'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'Raimondi/delimitMate'
call plug#end()

" ================================================================================

syntax on                  " enable syntax
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

set background=dark
colorscheme gruvbox8_hard



" ================================================================================

let delimitMate_expand_cr    = 1
let delimitMate_expand_space = 1


lua << EOF
-- require("telescope").setup() {
-- }
EOF

" ================================================================================

