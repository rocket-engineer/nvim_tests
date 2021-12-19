
set nocompatible
set encoding=utf8
filetype off

call plug#begin('~/.env/nvim/plugins')

" coloring
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons',

" Plug 'chrisbra/vim-autoread' " NOT supported by NeoVim (+job missing)
Plug 'djoshea/vim-autoread'

call plug#end()

filetype plugin indent on

" ================================================================================

syntax on                  " enable syntax
" set softtabstop=2
" set smarttab 
" set smartindent            " auto indent after new line

let mapleader=","          " set map leader key

" set colorcolumn=80

lua << EOF
local options = {

  -- general settings
  mouse        = "a",                      -- allow the mouse to be used in neovim
  -- mousehide = true,
  number       = true,                     -- set numbered lines
  wrap         = false,                    -- display lines as one long line
  updatetime   = 300,                      -- faster completion (4000ms default)
  fileencoding = "utf-8",                  -- the encoding written to a file
  showmode     = false,                    -- we don't need to see things like -- INSERT -- anymore
  splitbelow   = true,                     -- force all horizontal splits to go below current window
  splitright   = true,                     -- force all vertical splits to go to the right of current window

  -- indentation settings
  tabstop    = 2,                          -- insert 2 spaces for a tab
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  expandtab  = true,                       -- convert tabs to spaces
  autoindent = true,                       -- use the indent from the previous line
  cindent    = true,                       -- use C-indentation style
  -- smartindent = true,                      -- make indenting smarter again

  -- appearance settings
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- colorscheme   = tokyonight,              -- set default color scheme
  -- background    = "dark",                  -- use a dark background
  cursorline     = true,                   -- highlight the current line
  relativenumber = false,                  -- set relative numbered lines
  signcolumn     = "yes",                  -- always show the sign column, otherwise it would shift the text each time
  -- numberwidth = 4,                         -- set number column width to 2 {default 4}

}

for k, v in pairs(options) do
  vim.opt[k] = v
end
EOF

" ================================================================================

let $NVM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
" if (has("termguicolors"))
"   set termguicolors
" endif

let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_italic_variables = 0
colorscheme tokyonight

" ================================================================================



lua << EOF
EOF

" ================================================================================

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "cpp",
    "python",
    "lua",
    "vim",
  },
  highlight = { 
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = false
  }
}
EOF

" ================================================================================

