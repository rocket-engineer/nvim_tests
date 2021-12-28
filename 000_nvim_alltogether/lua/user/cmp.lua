
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end


-- =================================================================================================
-- Local Variables
-- =================================================================================================

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local menu_items = {
  buffer        = "[Buffer]",
  -- nvim_lsp      = "[LSP]",
  -- luasnip       = "[Snippet]",
  -- nvim_lua      = "[Lua]",
  -- latex_symbols = "[Latex]",
  path          = "[Path]",
}

-- =================================================================================================
-- Local Functions
-- =================================================================================================

-- local has_any_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local press = function(key)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
-- end


-- =================================================================================================
-- Configuration
-- =================================================================================================

local lspkind = require('lspkind')

cmp.setup({

  sources = {
    -- {name = 'nvim_lsp'},
    -- {name = "ultisnips"},
    {name = 'buffer'},
    {name = 'path'},
  },

  -- TODO: do not show documentation in command line
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },

  -- snippet = {
  --   expand = function(args)
  --     vim.fn["UltiSnips#Anon"](args.body)
  --   end,
  -- },

  mapping = {
    ['<CR>']      = cmp.mapping.confirm({select = true}),
    ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-e>']     = cmp.mapping.close(),
    ['<C-d>']     = cmp.mapping.scroll_docs( 4),
    ['<C-u>']     = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- ["<C-k>"] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --       if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
    --         return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    --       end
    --       cmp.select_next_item()
    --     elseif has_any_words_before() then
    --       press("<C-k>")
    --     else
    --       fallback()
    --     end
    --   end, {
    --     "i",
    --     "s",
    --     -- add this line when using cmp-cmdline:
    --     "c",
    --   }),
    --   ["<Tab>"] = cmp.mapping(function(fallback)
    --     if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
    --       press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    --     elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    --       press("<ESC>:call UltiSnips#JumpForwards()<CR>")
    --     elseif cmp.visible() then
    --       cmp.select_next_item()
    --     elseif has_any_words_before() then
    --       press("<Tab>")
    --     else
    --       fallback()
    --     end
    --   end, {
    --     "i",
    --     "s",
    --     -- add this line when using cmp-cmdline:
    --     "c",
    --   }),
    --   ["<S-Tab>"] = cmp.mapping(function(fallback)
    --     if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    --       press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
    --     elseif cmp.visible() then
    --       cmp.select_prev_item()
    --     else
    --       fallback()
    --     end
    --   end, {
    --     "i",
    --     "s",
    --     -- add this line when using cmp-cmdline:
    --     "c",
    --   }),
  },
  
  formatting = {
    -- format = function(entry, vim_item)
    --   -- local prsnt, lspkind = pcall(require, "lspkind")
    --   -- if not prsnt then
    --   --   -- kind icons, this concatonates the icons with the name of the item kind
    --   --   vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
    --   --   -- source
    --   --   vim_item.menu = ({
    --   --     buffer = "[Buffer]",
    --   --     nvim_lsp = "[LSP]",
    --   --     luasnip = "[LuaSnip]",
    --   --     nvim_lua = "[Lua]",
    --   --     latex_symbols = "[LaTeX]",
    --   --   })[entry.source.name]
    --   --   return vim_item
    --   -- else
    --   --   -- return lspkind.cmp_format()
    --     return lspkind.cmp_format({
    --       with_text = true,
    --       menu      = menu_items,
    --     })
    --   -- end
    -- end
    -- format = function(entry, vim_item)
    --   return lspkind.cmp_format({
    --     with_text = true,
    --     menu      = menu_items,
    --   })
    -- end
    format = lspkind.cmp_format({
      with_text = true,
      menu      = menu_items,
    })
  },

  experimental = {
    ghost_text  = true,
    -- native_menu = false,
  }

})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  -- }, {
  --   { name = 'cmdline' }
  }),
  documentation = false,
})

-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

