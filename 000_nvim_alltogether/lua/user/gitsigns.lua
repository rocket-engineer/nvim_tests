
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- improved colors
vim.cmd [[highlight GitSignsAdd    guifg=#00FF00]]
vim.cmd [[highlight GitSignsChange guifg=#F0EF00]]
vim.cmd [[highlight GitSignsDelete guifg=#F00000]]

gitsigns.setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'   },
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    -- noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    -- ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    -- ['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    -- ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    -- ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    -- ['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    -- ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    -- ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    -- ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=false}<CR>',
    -- ['n <leader>gB'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',

    -- Text objects
    -- ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    -- ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_gitdir = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
})


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
  g = {
    name = "Git",
    b = {"<cmd>Telescope git_branches<cr>",                        "Checkout Branch"  },
    c = {"<cmd>Telescope git_commits<cr>",                         "Checkout Commit"  },
    d = {"<cmd>Gitsigns diffthis HEAD<cr>",                        "Show Difference"  },
    l = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>",                         "Open Lazygit"     },
    p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",         "Preview Hunk"     },
    r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",           "Reset Hunk"       },
    R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",         "Reset Buffer"     },
    s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",           "Stage Hunk"       },
    u = {"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",      "Undo Stage Hunk"  },
    o = {"<cmd>Telescope git_status<cr>",                          "Open changed File"},
    w = {"<cmd>lua require 'gitsigns'.blame_line{full=false}<cr>", "Blame Changes"    },
    W = {"<cmd>lua require 'gitsigns'.blame_line{full=true}<cr>",  "Blame Changes"    },
    -- j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>",       "Next Hunk"        },
    -- k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",       "Prev Hunk"        },
  }
}

wk.register(mappings, opts)

