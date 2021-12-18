
set nocompatible
filetype plugin indent on

call plug#begin('~/.env/nvim/plugins')

" coloring
Plug 'pacha/vem-dark'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" tab page appearance
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'liuchengxu/vista.vim'

" code
Plug 'SirVer/ultisnips'
Plug 'lewis6991/gitsigns.nvim'
" Plug 'tpope/vim-fugitive'
Plug 'alepez/vim-gtest'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path',
Plug 'quangnguyen30192/cmp-nvim-ultisnips',
"Plug 'glepnir/lspsaga.nvim'
Plug 'tami6/lspsaga.nvim',
Plug 'onsails/lspkind-nvim'

" functionality
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'glepnir/dashboard-nvim'
" Plug 'akinsho/toggleterm'
Plug 'rcarriga/nvim-notify'

" misc
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'windwp/nvim-autopairs'
Plug 'Raimondi/delimitMate'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jdhao/better-escape.vim'
call plug#end()

" ================================================================================

syntax on                  " enable syntax
"set t_Co=256              " set number of colors
" set mouse=a                " enable mouse
" set mousehide              " hide the mouse cursor while typing
" set number                 " enable row numbers
" set nowrap                 " display long lines as just one single line
" set cursorline             " show cursor line
" set tabstop=2              " change the number of space characters for the tab key
" set shiftwidth=2           " change the number of space characters for indentation
" set softtabstop=2
" set expandtab              " convert tabs to spaces
" set expandtab
" set smarttab
" set autoindent           " auto indent after new line
" set smartindent            " auto indent after new line
" set splitright
" set colorcolumn=80
" set completeopt=menu,menuone,noselect

lua << EOF
local options = {

  -- general settings
  mouse        = "a",                      -- allow the mouse to be used in neovim
  -- mousehide = true,
  number       = true,                     -- set numbered lines
  wrap         = false,                    -- display lines as one long line
  updatetime   = 300,                      -- faster completion (4000ms default)
  fileencoding = "utf-8",                  -- the encoding written to a file
  showmode     = true,                    -- we don't need to see things like -- INSERT -- anymore
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
  showtabline    = 2,                      -- always show tabline
  signcolumn     = "yes",                  -- always show the sign column, otherwise it would shift the text each time
  -- numberwidth = 4,                         -- set number column width to 2 {default 4}

  -- backup and swap settings
  -- backup    = true,                        -- creates a backup file
  -- backupdir = "~/.env/nvim/backup"
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- miscellaneous settings
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0,                        -- so that `` is visible in markdown files
  -- hlsearch = true,                         -- highlight all matches on previous search pattern
  -- ignorecase = true,                       -- ignore case in search patterns
  -- pumheight = 10,                          -- pop up menu height
  -- smartcase = true,                        -- smart case
  -- swapfile = false,                        -- creates a swapfile
  -- timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  -- undofile = true,                         -- enable persistent undo
  -- scrolloff = 8,                           -- is one of my fav
  -- sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
EOF

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
"lua require('nvim-autopairs').setup{}

source ~/.env/nvim/config/dashboard.vim
source ~/.env/nvim/config/ultisnips.vim
source ~/.env/nvim/config/delimite_mate.vim

luafile ~/.env/nvim/config/gitsigns.lua
luafile ~/.env/nvim/config/googletest.vim
luafile ~/.env/nvim/config/lualine.lua
luafile ~/.env/nvim/config/notify.lua
luafile ~/.env/nvim/config/nvim-tree.lua
luafile ~/.env/nvim/config/indent-blankline.lua
luafile ~/.env/nvim/config/telescope.lua
" luafile ~/.env/nvim/config/toggleterm.lua
luafile ~/.env/nvim/config/treesitter.lua
luafile ~/.env/nvim/config/lsp/cmp.lua
luafile ~/.env/nvim/config/lsp/lspsaga.lua

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

