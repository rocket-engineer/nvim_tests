
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
    expand = {"<CR>", "<2-LeftMouse>"},
    open   = "o",
    remove = "d",
    edit   = "e",
    repl   = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {id = "scopes",      size = 0.25}, -- Can be float or integer > 1
      {id = "breakpoints", size = 0.25},
      {id = "stacks",      size = 0.25},
      {id = "watches",     size = 0.25},
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = {"repl"},
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width  = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = {"q", "<Esc>"},
    },
  },
  windows = {indent = 1},
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
    u = {"<cmd>lua require('dapui').toggle()<cr>",        "UI: Toggle"       },
    i = {"<cmd>lua require('dapui').eval()<cr>",          "UI: Evaluate"     },
    f = {"<cmd>lua require('dapui').float_element()<cr>", "UI: Float Element"},
  }
}

wk.register(mappings, wk_opts)
