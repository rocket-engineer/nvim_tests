
-- =================================================================================================
-- Module Protection
-- =================================================================================================

-- local status_ok, ultisnips = pcall(require, "ultisnips")
-- if not status_ok then
--   return
-- end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- improved colors
-- vim.cmd [[highlight GitSignsAdd    guifg=#00FF00]]
-- vim.cmd [[highlight GitSignsChange guifg=#F0EF00]]
-- vim.cmd [[highlight GitSignsDelete guifg=#F00000]]

-- ultisnips.setup({
-- )}

vim.cmd [[let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.env/nvim/misc/snippets"]]
vim.cmd [[let g:UltiSnipsEnableSnipMate      = 0         ]]
vim.cmd [[let g:UltiSnipsEditSplit           = "vertical"]]
vim.cmd [[let g:UltiSnipsExpandTrigger       = "<c-k>"   ]]
vim.cmd [[let g:UltiSnipsJumpForwardTrigger  = "<tab>"   ]]
vim.cmd [[let g:UltiSnipsJumpBackwardTrigger = "<s-tab>" ]]
vim.cmd [[let g:UltiSnipsListSnippets        = "<c-l>"   ]]

-- let g:UltiSnipsEditSplit           = "context"
-- let g:UltiSnipsExpandTrigger       = "<c-k>"
-- let g:UltiSnipsJumpForwardTrigger  = "<tab>"
-- let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
-- let g:UltiSnipsListSnippets        = "<c-l>"
-- let g:UltiSnipsSnippetDirectories  = ["misc/snippets", "plugins/vim-snippets/snippets"]


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
--     c = {"<cmd>Telescope git_commits<cr>",                         "Checkout Commit"  },
--     d = {"<cmd>Gitsigns diffthis HEAD<cr>",                        "Show Difference"  },
--     l = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>",                         "Open Lazygit"     },
--     p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",         "Preview Hunk"     },
--     r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",           "Reset Hunk"       },
--     R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",         "Reset Buffer"     },
--     s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",           "Stage Hunk"       },
--     u = {"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",      "Undo Stage Hunk"  },
--     o = {"<cmd>Telescope git_status<cr>",                          "Open changed File"},
--     w = {"<cmd>lua require 'gitsigns'.blame_line{full=false}<cr>", "Blame Changes"    },
--     W = {"<cmd>lua require 'gitsigns'.blame_line{full=true}<cr>",  "Blame Changes"    },
--     -- j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>",       "Next Hunk"        },
--     -- k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",       "Prev Hunk"        },
--   }
-- }

-- wk.register(mappings, opts)

