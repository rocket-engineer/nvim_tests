local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

vim.cmd [[let g:tokyonight_style = "night"]]
-- vim.cmd [[let g:tokyonight_italic_functions = 1]]
-- vim.cmd [[let g:tokyonight_italic_variables = 0]]
vim.cmd [[colorscheme tokyonight]]
