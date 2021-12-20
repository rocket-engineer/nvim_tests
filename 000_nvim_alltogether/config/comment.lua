local status_ok, Comment = pcall(require, "Comment")
if not status_ok then
  return
end

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
    line  = '<leader>cc',
    block = '<leader>bc',
  },

  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  opleader = {
    line  = '<leader>c',
    block = '<leader>b',
  },

  ---LHS of extra mappings
  ---@type table
  extra = {
    ---Add comment on the line above
    above = 'gcO',
    ---Add comment on the line below
    below = 'gco',
    ---Add comment at the end of line
    eol = 'gcA',
  },

  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  mappings = {
    ---Operator-pending mapping
    ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
    ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
    basic = true,
    ---Extra mapping
    ---Includes `gco`, `gcO`, `gcA`
    extra = false,
    ---Extended mapping
    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extended = false,
  },

  ---Pre-hook, called before commenting the line
  ---@type fun(ctx: Ctx):string
  pre_hook = nil,

  ---Post-hook, called after commenting is done
  ---@type fun(ctx: Ctx)
  post_hook = nil,
})
