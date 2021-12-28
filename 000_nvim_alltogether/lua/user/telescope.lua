
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

local opts = { silent = true, noremap = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>fb", ":Telescope file_browser<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>",   opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>",    opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>",    opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>",  opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>",     opts)
keymap("n", "<leader>fn", ":Telescope notify<CR>",       opts)

-- nnoremap <leader>gc <cmd>Telescope git_commits<cr>
-- nnoremap <leader>gm <cmd>Telescope git_branches<cr>
-- nnoremap <leader>gS <cmd>Telescope git_stash<cr>

