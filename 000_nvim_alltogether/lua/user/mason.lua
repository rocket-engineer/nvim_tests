
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

mason.setup({
  ui = {
    icons = {
      -- package_installed = "✓"
    }
  },
  log_level = vim.log.levels.DEBUG,
})

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
    i = {"<cmd>Mason<cr>",      "Show Mason Configuration"},
    I = {"<cmd>MasonLog<cr>",   "Show Mason Log"          },
    R = {"<cmd>LspRestart<cr>", "Restart LSP server"      },
  }
}

wk.register(mappings, opts)

