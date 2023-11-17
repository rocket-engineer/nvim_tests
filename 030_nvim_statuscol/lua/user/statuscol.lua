
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, statuscol = pcall(require, "statuscol")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

local builtin = require("statuscol.builtin")

statuscol.setup({
  segments = {
    -- { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    -- {
    --   sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
    --   click = "v:lua.ScSa"
    -- },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
    -- {
    --   sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
    --   click = "v:lua.ScSa"
    -- },
  }
})

-- require('tabby.tabline').use_preset('active_tab_with_wins', {
-- })


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

