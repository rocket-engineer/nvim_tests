
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, sessions = pcall(require, "session_manager")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

local Path = require('plenary.path')

sessions.setup({
  sessions_dir   = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer  = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  -- autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session      = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes  = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  }, 
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
})


-- =================================================================================================
-- Keymaps
-- =================================================================================================

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  return
end

local opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>",
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local mappings = {
  -- f = {
  --   name = "Find",
  --   b = {"<cmd>Telescope file_browser<cr>", "File Browser"      },
  --   c = {"<cmd>Telescope commands<cr>",     "Show Commands"     },
  --   f = {"<cmd>Telescope find_files<cr>",   "Find Files"        },
  -- }
}

wk.register(mappings, opts)

