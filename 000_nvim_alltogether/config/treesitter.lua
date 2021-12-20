local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

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
