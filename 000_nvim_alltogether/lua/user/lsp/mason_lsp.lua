
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

mason_lsp.setup {
  ensure_installed = { "sumneko_lua" },
}

-- mason.on_server_ready(function(server)
-- 	local opts = {
--     on_attach    = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
-- 	}
--
--   if server.name == "sumneko_lua" then
--     local sumneko_opts = require("user.lsp.settings.sumneko_lua")
--     opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--   end
--
--   if server.name == "cmake" then
--     local cmake_opts = require("user.lsp.settings.cmake")
--     opts = vim.tbl_deep_extend("force", cmake_opts, opts)
--   end
--
--   if server.name == "pyright" then
--     local pyright_opts = require("user.lsp.settings.pyright")
--     opts = vim.tbl_deep_extend("force", pyright_opts, opts)
--   end
--
--   if server.name == "clangd" then
--     local clangd_opts = require("user.lsp.settings.clangd")
--     opts = vim.tbl_deep_extend("force", clangd_opts, opts)
--   end
--
--   if server.name == "jdtls" then
--     local jdtls_opts = require("user.lsp.settings.jdtls")
--     opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
--   end
--
--   -- if server.name == "jsonls" then
--   --   local jsonls_opts = require("user.lsp.settings.jsonls")
--   --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--   -- end
--
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)


mason_lsp.setup_handlers({
	-- local opts = {
 --    on_attach    = require("user.lsp.handlers").on_attach,
 --    capabilities = require("user.lsp.handlers").capabilities,
	-- }
  
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({})
  end,
  
  -- Next, you can provide targeted overrides for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup({})
  -- end,
  
  ["jdtls"] = function ()
		local opts = {
      on_attach    = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
		}
    local jdtls_opts = require("user.lsp.settings.jdtls")
    opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
    require("lspconfig").jdtls.setup(opts)
  end,
  
  ["clangd"] = function ()
		local opts = {
      on_attach    = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
		}
    local clangd_opts = require("user.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
    require("lspconfig").clangd.setup(opts)
  end,
})

