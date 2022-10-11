
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, googletest = pcall(require, "googletest")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- get pretty notifier
local notify_engine = vim.notify
local notify_status_ok, notify = pcall(require, "notify")
if notify_status_ok then
  notify_engine = notify
end

googletest.setup({

  -- setup notifier
  notify = notify_engine,

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
  t = {
    name = "GoogleTest",
    r = {"<cmd>lua require 'googletest.test_run'.gtest_show_test_under_cursor()<cr>",     "Show test name under cursor"    },
    R = {"<cmd>lua require 'googletest.test_run'.gtest_show_test_set_under_cursor()<cr>", "Show test set name under cursor"},
    t = {"<cmd>lua require 'googletest.test_run'.gtest_run_test_under_cursor()<cr>",      "Run test under cursor"          },
    T = {"<cmd>lua require 'googletest.test_run'.gtest_run_test_set_under_cursor()<cr>",  "Run test set under cursor"      },
  }
}

wk.register(mappings, wk_opts)

