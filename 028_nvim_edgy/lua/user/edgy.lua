
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
      open = "Neotree position=top buffers",
    },
  },

  right = {
    {
      title = "Variable Explorer",
      ft = "aerial",
      size = { height = 0.7 },
      pinned = true,
      open = "AerialOpen",
    },
    {
      title = "Git Status",
      ft = "neo-tree",
      size = { height = 0.3 },
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "git_status"
      end,
      pinned = true,
      open = "Neotree position=top git_status",
    },
  },

  bottom = {
    {
      ft = "qf",
      size = { height = 10 },
      title = "QuickFix",
      pinned = true,
      open = "copen",
    },
    {
      ft = "help",
      size = { height = 10 },
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
keymap("n", "<f11>", "<cmd>lua require('edgy').toggle('bottom')<cr>", key_opts)

keymap("n", "<C-a>", "<cmd>lua require('edgy').select('left')<cr>",  key_opts)
keymap("n", "<C-d>", "<cmd>lua require('edgy').select('right')<cr>", key_opts)
-- keymap("n", "<S-f11>", "<cmd>lua require('edgy').select('right')<cr>", key_opts)

