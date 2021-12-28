
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end


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

local opts = {silent = true, noremap = true}

-- shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>h", "<cmd>lua _HTOP_TOGGLE()<CR>",    opts)
keymap("n", "<leader>p", "<cmd>lua _PYTHON_TOGGLE()<CR>",  opts)
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

