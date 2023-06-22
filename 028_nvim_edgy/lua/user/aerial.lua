-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

aerial.setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { "lsp", "treesitter", "markdown" },
  -- backends = {
  --     '_'   = { "treesitter", "lsp", "markdown" },
  --     'cpp' = { "lsp", "treesitter" },
  -- },

  -- Enum: persist, close, auto, global
  --   persist - aerial window will stay open until closed
  --   close   - aerial window will close when original file is no longer visible
  --   auto    - aerial window will stay open as long as there is a visible
  --             buffer to attach to
  --   global  - same as 'persist', and will always show symbols for the current buffer
  close_behavior = "global",

  -- Enum: prefer_right, prefer_left, right, left, float
  -- Determines the default direction to open the aerial window. The 'prefer'
  -- options will open the window in the other direction *if* there is a
  -- different buffer in the way of the preferred direction
  default_direction = "right",

  -- Disable aerial on files with this many lines
  disable_max_lines = 10000,

  -- Disable aerial on files this size or larger (in bytes)
  disable_max_size = 2000000, -- Default 2MB

  -- These control the width of the aerial window.
  -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  -- min_width and max_width can be a list of mixed types.
  -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
  -- max_width = { 40, 0.2 },
  width = 30,
  -- min_width = 10,

  -- Automatically open aerial when entering supported buffers.
  -- This can be a function (see :help aerial-open-automatic)
  open_automatic = false,

  -- Set to true to only open aerial at the far right/left of the editor
  -- Default behavior opens aerial relative to current window
  placement_editor_edge = true,

  -- Show box drawing characters for the tree hierarchy
  show_guides = true,

  -- Customize the characters used when show_guides = true
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

-- local key_opts = {silent = true, noremap = true}
--
-- -- shorten function name
-- local keymap = vim.api.nvim_set_keymap
--
-- keymap("n", "<f10>", "<cmd>AerialToggle!<cr>", key_opts)

