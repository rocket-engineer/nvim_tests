
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

indent_blankline.setup({

  -- standard settings
  enabled          = true,
  use_treesitter   = true,
  -- buftype_exclude  = {},
  filetype_exclude = {
    'help',
    'tagbar',
    'conf',
    'dashboard',
    'packer',
    'lsp-installer',
    'NvimTree',
  },

  -- advanced settings
  -- char = '┊',
  char = '▏',
  show_first_indent_level        = false,
  show_trailing_blankline_indent = false,
  show_current_context           = true,
  show_current_context_start     = false,
  context_patterns = {
    "function",
    "class",
    "method",
    "^table",
    "^if",
    "^for",
  },
  -- let g:indent_blankline_context_patterns = ["class", "function", "method", "block", "list_literal", "selector", "^if",
  -- "^table", "if_statement", "while", "for"]
})

-- fix for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

