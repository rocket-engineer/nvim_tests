
set nocompatible
filetype plugin indent on

call plug#begin('~/.env/nvim/plugins')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/tokyonight.nvim'
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

set colorcolumn=80

lua << EOF
-- fix for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
EOF

" ================================================================================

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 0
colorscheme tokyonight

if (has("termguicolors"))
  set termguicolors
endif

" ================================================================================

if 1==1

  if 2==2

    if 3==3
       " huhu

    endif
  endif
endif

" change guisp for different colour
"hi IndentBlanklineContextStart guibg=none guifg=none guisp=#000000 gui=underline
highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline

" plugin: indent-blankline
lua << EOF
require("indent_blankline").setup {
  -- standard settings
  enabled          = true,
  use_treesitter   = true,
  filetype_exclude = {'help', 'tagbar', 'conf'},
  buftype_exclude  = {'help', 'tagbar', 'conf'}, 

  -- advanced settings
  -- char = '┊',
  char = '▏',
  show_first_indent_level        = false,
  show_trailing_blankline_indent = false,
  show_current_context           = true,
  show_current_context_start     = true,
  context_patterns = {
    "function",
    "class",
    "method",
    "^table",
    "^if",
    "^for",
  },
  -- let g:indent_blankline_context_patterns = ["class", "function", "method", "block", "list_literal", "selector", "^if",
  -- "^table", "if_statement", "while", "for"]
}
EOF

" ================================================================================

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
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

