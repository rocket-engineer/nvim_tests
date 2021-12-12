
set nocompatible
filetype plugin indent on

call plug#begin('~/.env/nvim/plugins')
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'kyazdani42/nvim-web-devicons'
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

lua << EOF
-- fix for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = "99999"
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
EOF

" ================================================================================

let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_italic_variables = 0
colorscheme tokyonight

if (has("termguicolors"))
  set termguicolors
endif

" ================================================================================

nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>

" ================================================================================

lua << EOF
-- require("telescope").setup() {
-- }
require('telescope').load_extension('fzf')
EOF

" ================================================================================

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
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

