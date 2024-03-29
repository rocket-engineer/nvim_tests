
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
  -- auto_close          = true,  -- close tree if the last file was closed
  open_on_tab         = true,  -- let the tree stay open
  hijack_cursor       = true,  -- keep the cursor on the first element
  update_cwd          = false,
  -- update_to_buf_dir   = {
  --   enable    = true,
  --   auto_open = true,
  -- },
  -- add_blank_line_at_top = true,
  -- hide_root_node = true,
  -- retain_hidden_root_indent = true,
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
    ignore  = true,
    timeout = 500,
  },
  view = {
    side             = 'left',
    width            = 30,
    height           = 30,
    -- auto_resize      = false,
    number           = false,
    relativenumber   = false,
    signcolumn       = "yes",
    hide_root_folder = false,
    mappings = {
      custom_only = true,
      list        = mappings,
    }
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
})

-- require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
--   auto_reload_on_write = true,
--   disable_netrw = false,
--   hijack_cursor = false,
--   hijack_netrw = true,
--   hijack_unnamed_buffer_when_opening = false,
--   ignore_buffer_on_setup = false,
--   open_on_setup = false,
--   open_on_setup_file = false,
--   open_on_tab = false,
--   sort_by = "name",
--   update_cwd = false,
--   view = {
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = "left",
--     preserve_window_proportions = false,
--     number = false,
--     relativenumber = false,
--     signcolumn = "yes",
--     mappings = {
--       custom_only = false,
--       list = {
--         -- user mappings go here
--       },
--     },
--   },
--   renderer = {
--     indent_markers = {
--       enable = false,
--       icons = {
--         corner = "└ ",
--         edge = "│ ",
--         none = "  ",
--       },
--     },
--     icons = {
--       webdev_colors = true,
--     },
--   },
--   hijack_directories = {
--     enable = true,
--     auto_open = true,
--   },
--   update_focused_file = {
--     enable = false,
--     update_cwd = false,
--     ignore_list = {},
--   },
--   ignore_ft_on_setup = {},
--   system_open = {
--     cmd = "",
--     args = {},
--   },
--   diagnostics = {
--     enable = false,
--     show_on_dirs = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     },
--   },
--   filters = {
--     dotfiles = false,
--     custom = {},
--     exclude = {},
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 400,
--   },
--   actions = {
--     use_system_clipboard = true,
--     change_dir = {
--       enable = true,
--       global = false,
--       restrict_above_cwd = false,
--     },
--     open_file = {
--       quit_on_open = false,
--       resize_window = false,
--       window_picker = {
--         enable = true,
--         chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--         exclude = {
--           filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
--           buftype = { "nofile", "terminal", "help" },
--         },
--       },
--     },
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true,
--   },
--   log = {
--     enable = false,
--     truncate = false,
--     types = {
--       all = false,
--       config = false,
--       copy_paste = false,
--       diagnostics = false,
--       git = false,
--       profile = false,
--     },
--   },
-- } -- END_DEFAULT_OPTS

-- =================================================================================================
-- Keymaps
-- =================================================================================================

