
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

dap.adapters.lldb = {
  type    = 'executable',
  command = '/bin/lldb-vscode-12',
  name    = "lldb"
}

dap.configurations.cpp = {
  {
    type    = "lldb",
    request = "launch",
    name    = "Launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    -- program = "/home/man-behind-moon/Misc/Tests/02_C/build/hello_world",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
--  {
--     -- If you get an "Operation not permitted" error using this, try disabling YAMA:
--     --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     name = "Attach to process",
--     type = 'lldb',
--     request = 'attach',
--     pid = require('dap.utils').pick_process,
--     args = {},
--   },
--   {
--     type    = 'lldb',
--     request = 'attach',
--     name    = "Attach to PID",
--     program = "/home/man-behind-moon/Misc/Tests/02_C/build/hello_world",
--     -- pid     = 123
--   }
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

-- If you want to use this for rust and c, add something like this:
dap.configurations.c    = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


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

keymap("n", "<S-j>", ":lua require('dap').step_over()<CR>",     opts)
keymap("n", "<S-k>", ":lua require('dap').step_into()<CR>",     opts)
keymap("n", "<S-l>", ":lua require('dap').step_out()<CR>",      opts)
keymap("n", "<S-r>", ":lua require('dap').run_to_cursor()<CR>", opts)

-- keymap("n", "<leader>d?", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

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
  d = {
    name = "DAP",
    b = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint"          },
    B = {"<cmd>lua require('dap').clear_breakpoints()<cr>", "Remove all Breakpoints"     },
    -- l = {"<cmd>lua require('dap').list_breakpoints()<cr>", "List all Breakpoints"       },

    n = {"<cmd>lua require('dap').continue()<cr>",          "Continue to next Breakpoint"},
    -- l = {"<cmd>lua require('dap').run_last()<cr>",         "Continue to next Breakpoint"},
    q = {"<cmd>lua require('dap').disconnect()<cr>",        "Disconnect Debugging Adapter"},

    -- r = {"<cmd>lua require('dap.repl').toggle()<cr>",      "Toggle REPL windows"},

    -- k = {"<cmd>lua require('dap').up()<cr>",               "Disconnect Debugging Adapter"},
    -- j = {"<cmd>lua require('dap').down()<cr>",             "Disconnect Debugging Adapter"},
  }
}

wk.register(mappings, opts)

