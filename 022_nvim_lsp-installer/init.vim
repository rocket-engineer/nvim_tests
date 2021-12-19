
set nocompatible
set encoding=utf8
filetype off

call plug#begin('~/.env/nvim/plugins')

" coloring
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons',

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path',
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim',
Plug 'onsails/lspkind-nvim'

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
          Text          = "",
          Method        = "",
          Function      = "",
          Constructor   = "",
          Field         = "ﰠ",
          Variable      = "",
          Class         = "ﴯ",
          Interface     = "",
          Module        = "",
          Property      = "ﰠ",
          Unit          = "塞",
          Value         = "",
          Enum          = "",
          Keyword       = "",
          Snippet       = "",
          Color         = "",
          File          = "",
          Reference     = "",
          Folder        = "",
          EnumMember    = "",
          Constant      = "",
          Struct        = "פּ",
          Event         = "",
          Operator      = "",
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

  -- LSP config: Clangd
  require("lspconfig").clangd.setup{
  -- cmd = {"clangd-12", "--background-index"},
    cmd = {"/home/man-behind-moon/.local/share/nvim/lsp_servers/clangd/clangd", "--background-index"},
    filetypes    = {"c", "cpp", "cxx", ".cu"},
    capabilities = capabilities,
  }

  -- LSP config: pyright
  require("lspconfig").pyright.setup{
    cmd = {"/home/man-behind-moon/.local/share/nvim/lsp_servers/python/node_modules/pyright/langserver.index.js", "--stdio"},
    -- filetypes = {"python"},
    -- root_dir = function(startpath)
    --     return M.search_ancestors(startpath, matcher)
    --   end,
    --   settings = {
    --     python = {
    --       analysis = {
    --         autoSearchPaths = true,
    --         diagnosticMode = "workspace",
    --         useLibraryCodeForTypes = true
    --       }
    --     }
    --   }
    single_file_support = true,
  }

  -- LSP config: fortls
  require("lspconfig").fortls.setup{
    cmd = {"/home/man-behind-moon/.local/share/nvim/lsp_servers/fortls/venv/bin/fortls"},
    -- filetypes = {"fortran"},
    -- root_dir = function(startpath)
    --    return M.search_ancestors(startpath, matcher)
    --  end,
    --  settings = {
    --    python = {
    --      analysis = {
    --        autoSearchPaths = true,
    --        diagnosticMode = "workspace",
    --        useLibraryCodeForTypes = true
    --      }
    --    }
    --  }
  }

  -- LSP config: Lua
  -- require("lspconfig").sumneko_lua.setup{
    -- cmd = {"clangd-12", "--background-index"},
  --   cmd = {"~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
    -- filetypes    = {"lua"},
    -- capabilities = capabilities,
  -- }

  -- LSP config: Lua
  -- require('lspconfig').sumneko_lua.setup{
  -- settings = {
  --   Lua = {
  --     runtime = {
  --       -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
  --       version = 'LuaJIT',
  --       -- Setup your lua path
  --       path = "/home/man-behind-moon/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server",
  --     },
  --     diagnostics = {
  --       -- Get the language server to recognize the `vim` global
  --       globals = {'vim'},
  --     },
  --     workspace = {
  --       -- Make the server aware of Neovim runtime files
  --       library = vim.api.nvim_get_runtime_file("", true),
  --     },
  --     -- Do not send telemetry data containing a randomized but unique identifier
  --     telemetry = {
  --       enable = false,
  --     },
  --   },
  -- },
  -- }
EOF

" ================================================================================

lua << EOF
  local lspsaga = require('lspsaga')
  lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign  = "",
    hint_sign  = "",
    infor_sign = "",
    dianostic_header_icon = "   ",
    -- code action title icon
    code_action_icon   = " ",
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    finder_definition_icon = "  ",
    finder_reference_icon  = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
      open   = "o",
      vsplit = "s",
      split  = "i",
      quit   = "q",
      scroll_down = "<C-f>",
      scroll_up   = "<C-b>",
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
vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" -- LSP finder
" nnoremap <silent> <leader>ch <cmd>lua require('lspsaga.provider').lsp_finder()<CR>

" ================================================================================

lua << EOF
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  -- ui = {
  --   icons = {
  --     server_installed = "✓",
  --     server_pending = "➜",
  --     server_uninstalled = "✗"
  --   }
  -- }
})

-- lsp_installer.on_server_ready(function(server)
--   local opts = {
    -- on_attach    = require("user.lsp.handlers").on_attach,
    -- capabilities = require("user.lsp.handlers").capabilities,
--   }

	-- if server.name == "jsonls" then
	-- 	local jsonls_opts = require("user.lsp.settings.jsonls")
	-- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	-- end

  -- if server.name == "fortls" then
  --   local fortls_opts = require("user.lsp.settings.fortls")
  -- 	opts = vim.tbl_deep_extend("force", fortls_opts, opts)
  -- end

  -- if server.name == "sumneko_lua" then
  -- local sumneko_opts = require("user.lsp.settings.sumneko_lua")
  -- 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  -- end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
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

