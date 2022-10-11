
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

luasnip.config.set_config({
  store_selection_keys = '<c-s>',
})


-- =================================================================================================
-- Snippets
-- =================================================================================================

-- some shorthands
local s = luasnip.snippet
-- local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
-- local c = luasnip.choice_node
-- local d = luasnip.dynamic_node
-- local r = luasnip.restore_node

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in placeholder 2
local function copy(args)
	return args[1]
end

luasnip.add_snippets("all", {
  -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
  s("fn", {
    -- Simple static text.
    t("//Parameters: "),
    -- function, first parameter is the function, second the Placeholders
    -- whose text it gets as input.
    f(copy, 2),
    t({ "", "function " }),
    -- Placeholder/Insert.
    i(1),
    t("("),
    -- Placeholder with initial text.
    i(2, "int foo"),
    -- Linebreak
    t({ ") {", "\t" }),
    -- Last Placeholder, exit Point of the snippet.
    i(0),
    t({ "", "}" }),
  }),
  s({
    trig = "link",
    namr = "markdown_link",
    dscr = "Create markdown link [txt](url)"
  },
  {
    t('['),
    i(1),
    t(']('),
    f(function(_, snip)
      return snip.env.TM_SELECTED_TEXT[1] or {}
    end, {}),
    t(')'),
    i(0),
  }),
})

luasnip.add_snippets("c", {
  -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
  s("mycomc", {
    -- Simple static text.
    t("// MyCommentInC"),
  }),
})

luasnip.add_snippets("cpp", {
  -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
  s("mycomcpp", {
    -- Simple static text.
    t("// MyCommentInCpp"),
  }),
  -- include system header
  s({
    trig = "Inc",
    namr = "include_system_header",
    dscr = "Include system header"
  },
  {
    -- Simple static text.
    t("#include <"),
    -- Placeholder with initial text.
    i(1, "local_header"),
    t(">"),
    -- Last Placeholder, exit Point of the snippet.
    i(0),
  }),
  -- include local header
  s({
    trig = "inc",
    namr = "include_local_header",
    dscr = "Include local header"
  },
  {
    t("#include \""),
    -- Placeholder with initial text.
    i(1, "local_header"),
    t("\""),
    -- Last Placeholder, exit Point of the snippet.
    i(0),
  }),
  -- ToDo
  s({
    trig = "todo",
    namr = "todo_statemnt",
    dscr = "Add ToDo statement"
  },
  {
    -- start of ToDo
    t("ToDo"),
    -- last placeholder, exit point of the snippet.
    i(0),
  }),
  -- Documentation: internal
  s({
    trig = "dint",
    namr = "docu_internal",
    dscr = "Document internal section"
  },
  {
    -- start of ToDo
    t("\\internal\n   * ToDo.\n   * \\endinternal"),
    -- last placeholder, exit point of the snippet.
    i(0),
  }),
  -- cout
  s({
    trig = "cout",
    namr = "cout_statement",
    dscr = "A std::cout call with a newline"
  },
  {
    -- Start of std::cout
    t("std::cout << "),
    -- Placeholder
    i(1),
    -- End of std::cout
    t(" << std::endl;"),
    -- Last Placeholder, exit Point of the snippet.
    i(0),
  }),
  -- cout with text
  s({
    trig = "coutt",
    namr = "cout_text_statement",
    dscr = "A std::cout call with text and a newline"
  },
  {
    -- Start of std::cout
    t("std::cout << "),
    -- Placeholder with initial text.
    i(1, "\"My text\""),
    -- End of std::cout
    t(" << std::endl;"),
    -- Last Placeholder, exit Point of the snippet.
    i(0),
  }),
})

-- luasnip.loaders_from_lua.load('mysnippets')

-- command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()


-- =================================================================================================
-- Keymaps
-- =================================================================================================

-- local wk_ok, wk = pcall(require, "which-key")
-- if not wk_ok then
--   return
-- end

-- local opts = {
--   mode    = "n",        -- NORMAL mode
--   prefix  = "<leader>",
--   buffer  = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
--   silent  = true,       -- use `silent` when creating keymaps
--   noremap = true,       -- use `noremap` when creating keymaps
--   nowait  = true,       -- use `nowait` when creating keymaps
-- }

-- local mappings = {
--   g = {
--     name = "Git",
--     b = {"<cmd>Telescope git_branches<cr>",                        "Checkout Branch"  },
--   }
-- }

-- wk.register(mappings, opts)

