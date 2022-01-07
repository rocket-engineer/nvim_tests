
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
  diagnostic_header_icon = "   ",
  
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
    exec = "<cr>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<cr>",
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

-- keymap("n", "<leader>la", ":lua require('lspsaga.codeaction').code_action()<cr>",             opts)
-- keymap("n", "<leader>lh", ":lua require('lspsaga.provider').lsp_finder()<cr>",                opts)
-- keymap("n", "<leader>lp", ":lua require('lspsaga.provider').preview_definition()<cr>",        opts)
-- keymap("n", "<leader>lr", ":lua require('lspsaga.rename').rename()<cr>",                      opts)
-- keymap("n", "<leader>ls", ":lua require('lspsaga.signaturehelp').signature_help()<cr>",       opts)
-- keymap("n", "<leader>lt", ":lua require('lspsaga.diagnostic').show_line_diagnostics()<cr>",   opts)
-- keymap("n", "<leader>lT", ":lua require('lspsaga.diagnostic').show_cursor_diagnostics()<cr>", opts)
keymap("n", "K",          ":lua require('lspsaga.hover').render_hover_doc()<cr>",             opts)

-- keymap("n", "]d", ":lua require('lspsaga.diagnostic').navigate(\"prev\")()", opts)
-- keymap("n", "[d", ":lua require('lspsaga.diagnostic').navigate(\"next\")()", opts)

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
  l = {
    name = "LSP",
    a = {"<cmd>lua require('lspsaga.codeaction').code_action()<cr>",             "Code Action"      },
    h = {"<cmd>lua require('lspsaga.provider').lsp_finder()<cr>",                "LSP Finder"       },
    p = {"<cmd>lua require('lspsaga.provider').preview_definition()<cr>",        "Show Preview"     },
    r = {"<cmd>lua require('lspsaga.rename').rename()<cr>",                      "Rename Symbol"    },
    s = {"<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>",       "Show Signature"   },
    f = {"<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<cr>",   "Show Line Diag."  },
    F = {"<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<cr>", "Show Cursor Diag."},
    -- f = {"<cmd>lua vim.lsp.buf.formatting()<cr>",                                "Format File"      },
    -- l = {"<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    -- s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    -- S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
  }
}

wk.register(mappings, wk_opts)

