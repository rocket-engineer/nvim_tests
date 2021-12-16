
-- fix for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

-- lua << EOF
require("indent_blankline").setup {
  -- standard settings
  enabled          = true,
  use_treesitter   = true,
  filetype_exclude = {'help', 'tagbar', 'conf', 'dashboard'},
  buftype_exclude  = {'help', 'tagbar', 'conf', 'dashboard'}, 

  -- advanced settings
  -- char = '┊',
  char = '▏',
  show_first_indent_level        = false,
  show_trailing_blankline_indent = false,
  show_current_context           = true,
  show_current_context_start     = true,
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
}
-- EOF

