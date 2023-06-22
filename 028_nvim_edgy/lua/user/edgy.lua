
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, edgy = pcall(require, "edgy")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

edgy.setup({
  exit_when_last = true,
  animate = {
    enabled = false,
  },

  left = {
    -- Neo-tree filesystem always takes half the screen height
    {
      title = "File Explorer",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "filesystem"
      end,
      size = { height = 0.5 },
      pinned = true,
      open = "Neotree position=top filesystem",
    },
    {
      title = "Buffers",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "buffers"
      end,
      pinned = false,
      open = "Neotree position=top buffers",
    },
  },

  right = {
    {
      title = "Variable Explorer",
      ft = "aerial",
      pinned = true,
      open = "AerialOpen",
    },
  },

  bottom = {
    { ft = "qf",
      title = "QuickFix",
      pinned = true,
      open = "copen",
    },
    {
      ft = "help",
      size = { height = 20 },
      -- only show help buffers
      filter = function(buf)
        return vim.bo[buf].buftype == "help"
      end,
    },
  }
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

local key_opts = {silent = true, noremap = true}

-- shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<f9>",  "<cmd>lua require('edgy').toggle('left')<cr>",   key_opts)
keymap("n", "<f10>", "<cmd>lua require('edgy').toggle('right')<cr>",  key_opts)
keymap("n", "<f12>", "<cmd>lua require('edgy').toggle('bottom')<cr>", key_opts)
-- keymap("n", "<f12>", "<cmd>lua require('edgy').toggle()<cr>", key_opts)

keymap("n", "<C-a>", "<cmd>lua require('edgy').select('left')<cr>", key_opts)

