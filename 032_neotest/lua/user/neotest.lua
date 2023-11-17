
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

local utils = require("neotest-gtest.utils")
local lib = require("neotest.lib")

neotest.setup({
  adapters = {
    require("neotest-python"),
    require("neotest-gtest").setup({
            -- dap.adapters.<this debug_adapter> must be set for debugging to work
      -- see "installation" section above for installing and setting it up
      -- debug_adapter = "codelldb",

      -- Must be set to a function that takes a single string argument (full path to file)
      -- and returns its root. `neotest` provides a utility match_root_pattern,
      -- which will return the first parent directory containing one of these file names
      root = lib.files.match_root_pattern(
        "compile_commands.json",
        "compile_flags.txt",
        ".clangd",
        "init.lua",
        "init.vim",
        "build",
        ".git",
        "component_descriptor.json"
      ),

      -- takes full path to the file and returns true if it's a test file, false otherwise
      -- by default, returns true for all cpp files starting with "test_" or ending with
      -- "_test"
      is_test_file = utils.is_test_file
    })
    --   ({
    --   dap = { justMyCode = false },
    -- }),
    -- require("neotest-plenary"),
    -- require("neotest-vim-test")({
    --   ignore_file_types = { "python", "vim", "lua" },
    -- }),
  },
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("n", "[t", "<cmd>require('neotest').jump.prev({ status = 'failed'})<cr>", opts)
keymap("n", "]t", "<cmd>require('neotest').jump.next({ status = 'failed'})<cr>", opts)

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  return
end

local wk_mappings = {
  t = {
    name = "Test Environment",
    t = {"<cmd>lua require('neotest').run.run()<cr>",                     ""},
    S = {"<cmd>lua require('neotest').run.stop()<cr>",                    ""},
    o = {"<cmd>lua require('neotest').output.open()<cr>",                 "Open the output window."},
    -- O = {"<cmd>lua require('neotest').output.open({ enter = true })<cr>", ""},
    O = {"<cmd>lua require('neotest').output_panel.toggle()<cr>",         "Open the output panel."},
    C = {"<cmd>lua require('neotest').output_panel.clear()<cr>",          "Clear the output panel."},
    s = {"<cmd>lua require('neotest').summary.toggle()<cr>",              "Show test summary."},
    T = {"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",   ""},
  }
}

local wk_opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>",
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

wk.register(wk_mappings, wk_opts)

