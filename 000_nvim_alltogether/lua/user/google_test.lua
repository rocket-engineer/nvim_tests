
-- =================================================================================================
-- Module Protection
-- =================================================================================================

-- local status_ok, _ = pcall(require, "vim-gtest")
-- if not status_ok then
--   return
-- end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- let g:gtest#highlight_failing_tests = 0


-- =================================================================================================
-- Keymaps
-- =================================================================================================

-- Modes
-- * normal_mode       -> "n",
-- * insert_mode       -> "i",
-- * visual_mode       -> "v",
-- * visual_block_mode -> "x",
-- * term_mode         -> "t",
-- * command_mode      -> "c",

local opts = {silent = true, noremap = true}

-- shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "]t", "<cmd>GTestNext<cr>", opts)
keymap("n", "[t", "<cmd>GTestPrev<cr>", opts)

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  return
end

local wk_opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>",
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local mappings = {
  t = {
    name = "GoogleTest",
    r = {"<cmd>GTestRunUnderCursor<cr>", "Run Test under Cursor"},
    R = {"<cmd>GTestRun<cr>",            "Run Test(s)"          },
  }
}

wk.register(mappings, wk_opts)

