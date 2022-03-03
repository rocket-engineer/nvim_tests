
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

alpha.setup(
  require('alpha.themes.dashboard').config
)


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
  -- f = {
  --   name = "Find",
  --   b = {"<cmd>Telescope file_browser<cr>", "File Browser"      },
  --   c = {"<cmd>Telescope commands<cr>",     "Show Commands"     },
  --   f = {"<cmd>Telescope find_files<cr>",   "Find Files"        },
  -- }
}

wk.register(mappings, opts)

