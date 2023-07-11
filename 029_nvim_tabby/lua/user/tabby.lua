
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, tabby = pcall(require, "tabby")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

tabby.setup({
})

require('tabby.tabline').use_preset('active_tab_with_wins', {
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

-- local key_opts = {silent = true, noremap = true}
--
-- -- shorten function name
-- local keymap = vim.api.nvim_set_keymap
--
-- keymap("n", "<f9>",  "<cmd>lua require('edgy').toggle('left')<cr>",   key_opts)
-- keymap("n", "<f10>", "<cmd>lua require('edgy').toggle('right')<cr>",  key_opts)
-- keymap("n", "<f12>", "<cmd>lua require('edgy').toggle('bottom')<cr>", key_opts)
-- -- keymap("n", "<f12>", "<cmd>lua require('edgy').toggle()<cr>", key_opts)
--
-- keymap("n", "<C-a>", "<cmd>lua require('edgy').select('left')<cr>", key_opts)

