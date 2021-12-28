
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, reload = pcall(require, "nvim-reload")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- reload.modules_reload_external = {}


-- =================================================================================================
-- Keymaps
-- =================================================================================================

local opts = { silent = true, noremap = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
-- * normal_mode       -> "n",
-- * insert_mode       -> "i",
-- * visual_mode       -> "v",
-- * visual_block_mode -> "x",
-- * term_mode         -> "t",
-- * command_mode      -> "c",

-- keymap("n", "<leader>pr", ":Restart<CR>", opts)
keymap("n", "<leader>pr", ":Reload<CR>", opts)

