
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('user.lsp.installer')
-- require('user.lsp.mason_lsp')
require('user.lsp.handlers').setup()
require('user.lsp.lspsaga')
require('user.lsp.null-ls')

