
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

indent_blankline.setup({
  indent = {
    -- char = "<",
    -- tab_char = ">",
    smart_indent_cap = true,
    -- highlight = { "Function" },
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
    -- char = ">",
    -- exclude = {"cpp"},
    -- highlight = hl_name_list
    highlight = { "Function" },
  }
})

-- local hooks = require("ibl.hooks")
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

