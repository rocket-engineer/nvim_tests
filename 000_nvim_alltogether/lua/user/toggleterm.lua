
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

local htop = Terminal:new({cmd = "htop", hidden = true})
function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({cmd = "python3", hidden = true})
function _PYTHON_TOGGLE()
	python:toggle()
end

local lazygit = Terminal:new({cmd = "lazygit", hidden = true})
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local modify_run = Terminal:new({cmd = "/home/vistdn/Workspace/amsr/repos/modify_compile_commands.py", dir = "/home/vistdn/Workspace/amsr/repos", hidden = true})
function _MODIFY_TOGGLE()
	modify_run:toggle()
end

local test2017run = Terminal:new({cmd = "/home/vistdn/Workspace/amsr/repos/adaptive-microsar/.vscode/per_test2017/bin/amsr_persistency_test", dir = "/home/vistdn/Workspace/amsr/repos/adaptive-microsar/.vscode/per_test2017", hidden = true})
function _TEST2017_TOGGLE()
	test2017run:toggle()
end

local test2020run = Terminal:new({cmd = "/home/vistdn/Workspace/amsr/repos/adaptive-microsar/.vscode/per_test2020/bin/amsr_persistency_test", dir = "/home/vistdn/Workspace/amsr/repos/adaptive-microsar/.vscode/per_test2020", hidden = true})
function _TEST2020_TOGGLE()
	test2020run:toggle()
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

-- local opts = {silent = true, noremap = true}

-- shorten function name
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<CR>",    opts)
-- keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>",  opts)
-- keymap("n", "<leader>gl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

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
  t = {
    name = "Terminal",
    h = {"<cmd>lua _HTOP_TOGGLE()<cr>",     "htop"        },
    p = {"<cmd>lua _PYTHON_TOGGLE()<cr>",   "Python"      },
    j = {"<cmd>lua _TEST2017_TOGGLE()<cr>", "Test2017"    },
    k = {"<cmd>lua _TEST2020_TOGGLE()<cr>", "Test2020"    },
    l = {"<cmd>lua _MODIFY_TOGGLE()<cr>",   "ModifyScript"},
  }
}

wk.register(mappings, opts)

