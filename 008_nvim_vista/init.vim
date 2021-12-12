
set nocompatible
set encoding=utf8
filetype off

call plug#begin('~/.env/nvim/plugins')
Plug 'folke/tokyonight.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path',
Plug 'kyazdani42/nvim-web-devicons',
"Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim',
Plug 'onsails/lspkind-nvim'

Plug 'liuchengxu/vista.vim'
call plug#end()

filetype plugin indent on

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
set autoindent             " auto indent after new line
set smartindent            " auto indent after new line

let mapleader=","          " set map leader key

set splitright

" set colorcolumn=80

lua << EOF
-- fix for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = "99999"
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
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

" LSP Config
" ==========

" LSP config (the mappings used in the default file don't quite work right)                                                                                                                                                                                                                                              
nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>                                                                                                                                                                                                                                                       
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>                                                                                                                                                                                                                                                      
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>                                                                                                                                                                                                                                                       
nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>                                                                                                                                                                                                                                                   
"nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>                                                                                                                                                                                                                                                         
"nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>                                                                                                                                                                                                                                                         

" ================================================================================

" Cmp Config
" ==========

set completeopt=menu,menuone,noselect

lua << EOF
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  -- Setup nvim-cmp
  cmp.setup({
    mapping = {
      ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-e>']     = cmp.mapping.close(),
      ['<C-d>']     = cmp.mapping.scroll_docs(-4),
      ['<C-u>']     = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>']      = cmp.mapping.confirm({select = true}),
    },
    sources = {
      {name = 'nvim_lsp'},
      {name = 'path'},
      {name = 'buffer'},
    },
    formatting = {
      format = lspkind.cmp_format({
        -- with_text = false,
        -- maxwidth = 50,
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
        },
      })
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline('/', {
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  -- Clangd Config
  require("lspconfig").clangd.setup{
    cmd = {"clangd-12", "--background-index"},
    filetypes = {"c", "cpp", "cxx", ".cu"},
    capabilities = capabilities,
  }
EOF

" ================================================================================

lua << EOF
local lspsaga = require('lspsaga')
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
}
EOF

" -- renaming and preview
nnoremap <silent> <leader>cr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>cp <cmd>lua require('lspsaga.provider').preview_definition()<CR>

" -- show diagnostics
nnoremap <silent> <leader>cd <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>

" -- only show diagnostic if cursor is over the area
nnoremap <silent> <leader>cc <cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>

" -- jump diagnostic
nnoremap <silent> [d <cmd>lua require('lspsaga.diagnostic').navigate("prev")()<CR>
nnoremap <silent> ]d <cmd>lua require('lspsaga.diagnostic').navigate("next")()<CR>

" -- signature help
nnoremap <silent> <leader>cs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" -- hovering
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

" -- code action
nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
"vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" -- LSP finder
nnoremap <silent> <leader>ch <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" ================================================================================
lua << EOF
-- require("nvim-treesitter.configs").setup {
--   ensure_installed = {
--     "c",
--     "lua",
--     "vim"
--   },
--   highlight = { 
--     enable = true,
--     use_languagetree = true
--   },
--   indent = {
--     enable = true
--   }
-- }
EOF

" ================================================================================

