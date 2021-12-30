
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end


-- =================================================================================================
-- Local Functions
-- =================================================================================================

local tree_cb = require('nvim-tree.config').nvim_tree_callback

local mappings = {
  -- modify nodes
  {key = 'd',           cb = tree_cb("remove")},
  {key = 'D',           cb = tree_cb("trash")},
  {key = 'I',           cb = tree_cb("toggle_ignored")},
  {key = 'H',           cb = tree_cb("toggle_dotfiles")},
  {key = 'r',           cb = tree_cb("rename")},
  {key = 'R',           cb = tree_cb("refresh")},

  -- open nodes
  {key = {"<CR>", "o"}, cb = tree_cb("edit")},
  {key = 't',           cb = tree_cb("tabnew")},
  {key = 'T',           cb = tree_cb("tabnew")},
  {key = 's',           cb = tree_cb("vsplit")},
  {key = 'S',           cb = tree_cb("vsplit")},
  
  -- navigate nodes
  {key = 'x',           cb = tree_cb("close_node") },

  -- misc
  {key = '?',           cb = tree_cb("toggle_help")},
}


-- =================================================================================================
-- Configuration
-- =================================================================================================

nvim_tree.setup({
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  auto_close          = true,  -- close tree if the last file was closed
  open_on_tab         = true,  -- let the tree stay open
  hijack_cursor       = true,  -- keep the cursor on the first element
  update_cwd          = false,
  update_to_buf_dir   = {
    enable    = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom   = {}
  },
  git = {
    enable  = true,
    ignore  = false,
    timeout = 500,
  },
  view = {
    side             = 'left',
    width            = 30,
    height           = 30,
    auto_resize      = false,
    number           = false,
    relativenumber   = false,
    signcolumn       = "yes",
    hide_root_folder = false,
    mappings = {
      custom_only = true,
      list        = mappings,
    }
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

