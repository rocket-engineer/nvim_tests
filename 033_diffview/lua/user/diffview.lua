
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

diffview.setup({
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

-- local opts = {noremap = true, silent = true}
-- local keymap = vim.api.nvim_set_keymap
--
-- keymap("n", "[t", "<cmd>require('neotest').jump.prev({ status = 'failed'})<cr>", opts)
-- keymap("n", "]t", "<cmd>require('neotest').jump.next({ status = 'failed'})<cr>", opts)
--
-- local wk_ok, wk = pcall(require, "which-key")
-- if not wk_ok then
--   return
-- end
--
-- local wk_mappings = {
--   t = {
--     name = "Test Environment",
--     t = {"<cmd>lua require('neotest').run.run()<cr>",                     ""},
--     S = {"<cmd>lua require('neotest').run.stop()<cr>",                    ""},
--     o = {"<cmd>lua require('neotest').output.open()<cr>",                 "Open the output window."},
--     -- O = {"<cmd>lua require('neotest').output.open({ enter = true })<cr>", ""},
--     O = {"<cmd>lua require('neotest').output_panel.toggle()<cr>",         "Open the output panel."},
--     C = {"<cmd>lua require('neotest').output_panel.clear()<cr>",          "Clear the output panel."},
--     s = {"<cmd>lua require('neotest').summary.toggle()<cr>",              "Show test summary."},
--     T = {"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",   ""},
--   }
-- }
--
-- local wk_opts = {
--   mode    = "n",        -- NORMAL mode
--   prefix  = "<leader>",
--   buffer  = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
--   silent  = true,       -- use `silent` when creating keymaps
--   noremap = true,       -- use `noremap` when creating keymaps
--   nowait  = true,       -- use `nowait` when creating keymaps
-- }
--
-- wk.register(wk_mappings, wk_opts)

