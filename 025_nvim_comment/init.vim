
set nocompatible
set encoding=utf8
filetype off

call plug#begin('~/.env/nvim/plugins')

" coloring
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons',

Plug 'numToStr/Comment.nvim'

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

lua << EOF
require('Comment').setup({

  ---Add a space b/w comment and the line
  padding = true,

  ---Whether the cursor should stay at its position
  ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
  sticky = true,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|fun():string
  ignore = nil,

  ---LHS of toggle mappings in NORMAL + VISUAL mode
  toggler = {
    line  = '<leader>cc',
    block = '<leader>bc',
  },

  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  opleader = {
    line  = '<leader>c',
    block = '<leader>b',
  },

  ---LHS of extra mappings
  ---@type table
  extra = {
      ---Add comment on the line above
      above = 'gcO',
      ---Add comment on the line below
      below = 'gco',
      ---Add comment at the end of line
      eol = 'gcA',
  },

  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  mappings = {
      ---Operator-pending mapping
      ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
      ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
      basic = true,
      ---Extra mapping
      ---Includes `gco`, `gcO`, `gcA`
      extra = false,
      ---Extended mapping
      ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = false,
  },

  ---Pre-hook, called before commenting the line
  ---@type fun(ctx: Ctx):string
  pre_hook = nil,

  ---Post-hook, called after commenting is done
  ---@type fun(ctx: Ctx)
  post_hook = nil,
})
EOF

" ================================================================================

