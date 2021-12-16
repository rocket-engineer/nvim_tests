
-- lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "cmake",
    "lua",
    "vim"
  },
  highlight = { 
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = true
  }
}
-- EOF

