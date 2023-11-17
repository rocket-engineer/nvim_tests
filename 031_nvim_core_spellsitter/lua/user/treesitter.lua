
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

treesitter.setup({
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cpp",
    "cuda",
    "cmake",
    "fortran",
    "java",
    "json",
    "latex",
    "lua",
    "make",
    "python",
    "rst",
    "yaml",
    "vim"
  },
  highlight = { 
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = true
  }
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

-- local opts = { silent = true, noremap = true }

-- shorten function name
-- local keymap = vim.api.nvim_set_keymap

