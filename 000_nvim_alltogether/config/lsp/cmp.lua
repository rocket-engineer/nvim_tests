
local cmp = require('cmp')
local lspkind = require('lspkind')
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = "ultisnips"},
    {name = 'path'},
    {name = 'buffer'},
  },
  -- documentation = {
  --   border = {"+", "-", "+", "|", "+", "-", "+", "|"},
  -- },
  mapping = {
    ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-e>']     = cmp.mapping.close(),
    ['<C-d>']     = cmp.mapping.scroll_docs(-4),
    ['<C-u>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>']      = cmp.mapping.confirm({select = true}),
    ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
          end
          cmp.select_next_item()
        elseif has_any_words_before() then
          press("<C-k>")
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- add this line when using cmp-cmdline:
        "c",
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
          press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          press("<ESC>:call UltiSnips#JumpForwards()<CR>")
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_any_words_before() then
          press("<Tab>")
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- add this line when using cmp-cmdline:
        "c",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- add this line when using cmp-cmdline:
        "c",
      }),
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
  -- }, {
  --   { name = 'cmdline' }
  })
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- LSP config: clangd
require("lspconfig").clangd.setup({
  -- cmd = {"clangd-12", "--background-index"},
  cmd = {"/home/man-behind-moon/.local/share/nvim/lsp_servers/clangd/clangd", "--background-index"},
  filetypes    = {"c", "cpp", "cxx", ".cu"},
  capabilities = capabilities,
  -- disable formatting for clangd
  on_attach = function(client)
    client.resolved_capabilities.document_formatting       = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

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
-- require('lspconfig').sumneko_lua.setup({
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
-- })

