
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, tabout = pcall(require, "tabout")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

tabout.setup {
  enable_backwards = false, -- well ...
  act_as_tab       = false, -- shift content if tab out is not possible
  act_as_shift_tab = false, -- reverse shift content if tab out is not possible
  ignore_beginning = true,  -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
  completion       = false, -- if the tabkey is used in a completion pum

  tabkey           = '<C-b>', -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey = '',      -- key to trigger backwards tabout, set to an empty string to disable

  tabouts = {
    {open = "'", close = "'"},
    {open = '"', close = '"'},
    {open = '`', close = '`'},
    {open = '(', close = ')'},
    {open = '[', close = ']'},
    {open = '{', close = '}'}
    },

  exclude = {} -- tabout will ignore these filetypes
}

