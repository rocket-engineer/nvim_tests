
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

lspsaga.setup({

  -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,

  -- diagnostic sign
  error_sign = "",
  warn_sign  = "",
  hint_sign  = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  
  -- code action title icon
  code_action_icon   = " ",
  code_action_prompt = {
    enable        = true,
    sign          = true,
    sign_priority = 40,
    virtual_text  = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon  = "  ",
  max_preview_lines  = 10,
  finder_action_keys = {
    open   = "o",
    vsplit = "s",
    split  = "i",
    quit   = "q",
    scroll_down = "<C-f>",
    scroll_up   = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon  = "  ",
  border_style             = "round",
  rename_prompt_prefix     = "➤",
  server_filetype_map      = {},
  diagnostic_prefix_format = "%d. ",
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

keymap("n", "<leader>rn", ":lua require('lspsaga.rename').rename()<CR>",                      opts)
keymap("n", "<leader>cp", ":lua require('lspsaga.provider').preview_definition()<CR>",        opts)
keymap("n", "<leader>cd", ":lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>",   opts)
keymap("n", "<leader>cc", ":lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>", opts)
keymap("n", "<leader>cs", ":lua require('lspsaga.signaturehelp').signature_help()<CR>",       opts)
keymap("n", "<leader>ca", ":lua require('lspsaga.codeaction').code_action()<CR>",             opts)
keymap("n", "<leader>ch", ":lua require('lspsaga.provider').lsp_finder()<CR>",                opts)
keymap("n", "K",          ":lua require('lspsaga.hover').render_hover_doc()<CR>",             opts)

-- keymap("n", "]d", ":lua require('lspsaga.diagnostic').navigate(\"prev\")()", opts)
-- keymap("n", "[d", ":lua require('lspsaga.diagnostic').navigate(\"next\")()", opts)

