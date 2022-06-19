
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

dapui.setup({
  icons = {
    expanded  = "▾",
    collapsed = "▸"
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open   = "o",
    remove = "d",
    edit   = "e",
    repl   = "r",
  },
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'right',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width  = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  return
end

local wk_opts = {
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
    u = {"<cmd>lua require('dapui').toggle()<cr>",        "Toggle User Interface"   },
    i = {"<cmd>lua require('dapui').eval()<cr>",          "Show variable value"     },
    f = {"<cmd>lua require('dapui').float_element()<cr>", "Show variable informaion"},
  }
}

wk.register(mappings, wk_opts)

-- "nnoremap <leader>d? :lua local widgets=require('dapui.widgets');require('dapui').float_element(widgets.scopes, { enter = true})<CR>
-- "nnoremap <leader>d? :lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>

