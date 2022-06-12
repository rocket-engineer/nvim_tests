
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

lsp_installer.on_server_ready(function(server)
	local opts = {
    on_attach    = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
	}

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "cmake" then
    local cmake_opts = require("user.lsp.settings.cmake")
    opts = vim.tbl_deep_extend("force", cmake_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "clangd" then
    local clangd_opts = require("user.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server.name == "jdtls" then
    local jdtls_opts = require("user.lsp.settings.jdtls")
    opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
  end

  -- if server.name == "jsonls" then
  --   local jsonls_opts = require("user.lsp.settings.jsonls")
  --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)


-- =================================================================================================
-- Keymaps
-- =================================================================================================

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  return
end

local opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>",
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local mappings = {
  l = {
    name = "LSP",
    i = {"<cmd>LspInfo<cr>",        "Info"              },
    R = {"<cmd>LspRestart<cr>",     "Restart LSP server"},
    I = {"<cmd>LspInstallInfo<cr>", "Installer Info"    },
  }
}

wk.register(mappings, opts)

