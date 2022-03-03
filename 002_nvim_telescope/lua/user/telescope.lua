
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case", default is "smart_case"
    }
  }
})

telescope.load_extension('fzf')
-- telescope.load_extension('notify')


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
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>",   opts)
-- keymap("n", "<leader>fg", ":Telescope live_grep<CR>",    opts)
-- keymap("n", "<leader>fh", ":Telescope help_tags<CR>",    opts)
-- keymap("n", "<leader>fs", ":Telescope grep_string<CR>",  opts)
-- keymap("n", "<leader>fo", ":Telescope oldfiles<CR>",     opts)
-- keymap("n", "<leader>fn", ":Telescope notify<CR>",       opts)

-- nnoremap <leader>gc <cmd>Telescope git_commits<cr>
-- nnoremap <leader>gm <cmd>Telescope git_branches<cr>
-- nnoremap <leader>gS <cmd>Telescope git_stash<cr>

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
  f = {
    name = "Find",
    b = {"<cmd>Telescope file_browser<cr>", "File Browser"      },
    c = {"<cmd>Telescope commands<cr>",     "Show Commands"     },
    f = {"<cmd>Telescope find_files<cr>",   "Find Files"        },
    g = {"<cmd>Telescope live_grep<cr>",    "Live Grep"         },
    h = {"<cmd>Telescope help_tags<cr>",    "Help Pages"        },
    k = {"<cmd>Telescope keymaps<cr>",      "Show Keymaps"      },
    m = {"<cmd>Telescope man_pages<cr>",    "Man Pages"         },
    n = {"<cmd>Telescope notify<cr>",       "Noficiations"      },
    o = {"<cmd>Telescope oldfiles<cr>",     "Open Recent Files" },
    s = {"<cmd>Telescope grep_string<cr>",  "Grep String"       },
    C = {"<cmd>Telescope colorscheme<cr>",  "Choose Colorscheme"},
  }
}

wk.register(mappings, opts)

