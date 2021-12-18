
-- lua << EOF
local cmp = require('cmp')
local lspkind = require('lspkind')
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = "ultisnips"},
    {name = 'path'},
    {name = 'buffer'},
  },
  -- documentation = {
  --   border = {"+", "-", "+", "|", "+", "-", "+", "|"},
  -- },
  mapping = {
    ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-e>']     = cmp.mapping.close(),
    ['<C-d>']     = cmp.mapping.scroll_docs(-4),
    ['<C-u>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>']      = cmp.mapping.confirm({select = true}),
    ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
          end
          cmp.select_next_item()
        elseif has_any_words_before() then
          press("<C-k>")
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- add this line when using cmp-cmdline:
        "c",
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
          press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          press("<ESC>:call UltiSnips#JumpForwards()<CR>")
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_any_words_before() then
          press("<Tab>")
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- add this line when using cmp-cmdline:
        "c",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        -- add this line when using cmp-cmdline:
        "c",
      }),
  },
  formatting = {
    format = lspkind.cmp_format({
      -- with_text = false,
      -- maxwidth = 50,
      symbol_map = {
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
      },
    })
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  -- }, {
  --   { name = 'cmdline' }
  })
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Clangd Config
require("lspconfig").clangd.setup{
  cmd = {"clangd-12", "--background-index"},
  filetypes = {"c", "cpp", "cxx", ".cu"},
  capabilities = capabilities,
}
-- EOF

