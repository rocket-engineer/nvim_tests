
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local luasnip = require("luasnip")


-- =================================================================================================
-- Local Variables
-- =================================================================================================

local kind_icons = {
  Text          = "",
  Method        = "",
  Function      = "",
  Constructor   = "",
  Field         = "ﰠ",
  Variable      = "",
  Class         = "ﴯ",
  Interface     = "",
  Module        = "",
  Property      = "ﰠ",
  Unit          = "塞",
  Value         = "",
  Enum          = "",
  Keyword       = "",
  Snippet       = "",
  Color         = "",
  File          = "",
  Reference     = "",
  Folder        = "",
  EnumMember    = "",
  Constant      = "",
  Struct        = "פּ",
  Event         = "",
  Operator      = "",
  TypeParameter = ""
}

local menu_items = {
  buffer        = "[Buffer]",
  luasnip       = "[Snippet]",
  nvim_lsp      = "[LSP]",
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

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

cmp.setup({

  -- the order of the sources matters
  sources = {
    -- {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'},
    {name = 'path'},
  },

  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- define the snippet engine
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<CR>']      = cmp.mapping.confirm({select = true}),
    ['<C-n>']     = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-p>']     = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-e>']     = cmp.mapping.close(),
    ['<C-d>']     = cmp.mapping.scroll_docs( 4),
    ['<C-u>']     = cmp.mapping.scroll_docs(-4),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
    
  formatting = {
    format = lspkind.cmp_format({
      mode    = 'symbol_text',
      menu    = menu_items,
      symbols = kind_icons,
    })
  },

  experimental = {
    ghost_text  = true,
    native_menu = false,
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
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  window = {
    documentation = false,
  },
})

