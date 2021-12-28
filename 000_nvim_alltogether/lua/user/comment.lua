
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, Comment = pcall(require, "Comment")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

Comment.setup({

  ---Add a space b/w comment and the line
  padding = true,

  ---Whether the cursor should stay at its position
  ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
  sticky = true,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|fun():string
  ignore = nil,

  ---LHS of toggle mappings in NORMAL + VISUAL mode
  toggler = {
    line  = '<leader>dc',
    block = '<leader>db',
  },

  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  opleader = {
    line  = '<leader>c',
    block = '<leader>b',
  },

  ---LHS of extra mappings
  ---@type table
  extra = {
    above = '<leader>cp', -- add comment to the line above
    below = '<leader>cn', -- add comment to the line below
    eol   = '<leader>ce', -- add comment to the end of line
  },

  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  mappings = {
    basic    = true,
    extra    = true,
    extended = false,
  },

  ---Pre-hook, called before commenting the line
  ---@type fun(ctx: Ctx):string
  pre_hook = nil,

  ---Post-hook, called after commenting is done
  ---@type fun(ctx: Ctx)
  post_hook = nil,
})

