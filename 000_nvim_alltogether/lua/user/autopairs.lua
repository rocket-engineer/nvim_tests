
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

autopairs.setup {
  -- check_ts = true,
  disable_filetype = { "TelescopePrompt" },
  disable_in_macro = false  -- disable when recording or executing a macro
  -- disable_in_visualblock = false -- disable when insert after visual block mode
  -- ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")
  -- enable_moveright = true
  -- enable_afterquote = true  -- add bracket pairs after quote
  -- enable_check_bracket_line = true  --- check bracket in same line
  -- enable_bracket_in_quote = true --
  -- check_ts = false
  -- map_cr = true
  -- map_bs = true  -- map the <BS> key
  -- map_c_h = false  -- Map the <C-h> key to delete a pair
  -- map_c_w = false -- map <c-w> to delete a pair if possible
}

-- cmp integration
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

