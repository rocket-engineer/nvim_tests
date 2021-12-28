
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

notify.setup({

  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Function called when a window is closed
  on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 1000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = "#000000",
  -- background_colour = "Normal",

  -- Minimum width for notification windows
  minimum_width = 20,

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN  = "",
    INFO  = "",
    DEBUG = "",
    TRACE = "✎",
  },
})


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

keymap("n", "<leader>n1", ":lua require('notify')(\"My super important error message\",   \"error\", {title = \"NVCode Notification\"})<CR>", opts)
keymap("n", "<leader>n2", ":lua require('notify')(\"My super important warning message\", \"warn\",  {title = \"NVCode Notification\"})<CR>", opts)
keymap("n", "<leader>n3", ":lua require('notify')(\"My super important info message\",    \"info\",  {title = \"NVCode Notification\"})<CR>", opts)
keymap("n", "<leader>n4", ":lua require('notify')(\"My super important debug message\",   \"debug\", {title = \"NVCode Notification\"})<CR>", opts)

