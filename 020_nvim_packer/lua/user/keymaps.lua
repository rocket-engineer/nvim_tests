
local opts      = { silent = true, noremap = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<leader>ps", ":PackerSync<CR>", opts)

keymap("n", "<f10>", ":WhichKey ','<CR>", opts)

-- nnoremap <leader>ps <cmd>

-- nnoremap <leader>fb <cmd>Telescope file_browser<cr>
-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-- nnoremap <leader>fs <cmd>Telescope grep_string<cr>
-- nnoremap <leader>fo <cmd>Telescope oldfiles<cr>

