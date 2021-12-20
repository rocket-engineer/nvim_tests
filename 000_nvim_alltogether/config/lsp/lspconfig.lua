local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- LSP config: clangd
lspconfig.clangd.setup({
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
lspconfig.pyright.setup{
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
lspconfig.fortls.setup{
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
