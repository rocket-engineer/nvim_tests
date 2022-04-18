
local colorscheme = "tokyonight"
-- local colorscheme = "nightfox"
-- local colorscheme = "gruvbox"

-- use a protected call
local status_ok, _ = pcall(require, colorscheme)
if not status_ok then
  return
end

-- vim.g.tokyonight_style = "night"

-- use a protected call
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

