
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

hop.setup({
})


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

-- local opts = {silent = true, noremap = true}

-- shorten function name
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>fb", ":Telescope file_browser<CR>", opts)

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
  h = {
    name = "Hop",
    w = {"<cmd>lua require('hop').hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",  "Hop Word (after)" },
    b = {"<cmd>lua require('hop').hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>", "Hop Word (before)"},
  }
}

wk.register(mappings, opts)

