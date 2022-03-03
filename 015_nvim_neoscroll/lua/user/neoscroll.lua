
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

neoscroll.setup({
  hide_cursor          = true,   -- Hide cursor while scrolling
  stop_eof             = true,   -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff  = false,  -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff    = false,  -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true,   -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function      = nil,    -- Default easing function
  pre_hook             = nil,    -- Function to run before the scrolling animation starts
  post_hook            = nil,    -- Function to run after the scrolling animation ends
  performance_mode     = false,  -- Disable "Performance Mode" on all buffers.
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',   -- All these keys will be mapped to their
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},  -- corresponding default scrolling animation
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

-- local opts = { silent = true, noremap = true }

-- shorten function name
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>pr", ":Restart<CR>", opts)
-- keymap("n", "<leader>pr", ":Reload<CR>", opts)
-- keymap("n", "<leader>rr", ":lua require("notify")("Reloaded the configuration!", "info", {title = "NVCode"})<CR>", opts)

