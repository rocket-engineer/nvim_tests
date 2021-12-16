
set nocompatible
filetype plugin indent on
call plug#begin('~/.env/nvim/plugins')
Plug 'lifepillar/vim-gruvbox8'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'rcarriga/nvim-notify'
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

" ================================================================================

" Edit and reload init.vim quickly
nnoremap <silent> <leader>nr :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> <leader>ne :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar> call v:lua.vim.notify("Nvim config successfully reloaded!", 'info', {'title': 'nvim-config'})<cr>

" ================================================================================

if (has("termguicolors"))
  set termguicolors
endif

colorscheme gruvbox8_hard

set background=dark

" ================================================================================

lua << EOF
vim.notify = require("notify")

require("notify").setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Function called when a window is closed
  on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 1000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = "#000000",
  -- background_colour = "Normal",

  -- Minimum width for notification windows
  minimum_width = 20,

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
EOF

" ================================================================================

