
local options = {

  -- general settings
  mouse        = "a",                      -- allow the mouse to be used in neovim
  -- mousehide = true,
  number       = true,                     -- set numbered lines
  wrap         = false,                    -- display lines as one long line
  updatetime   = 300,                      -- faster completion (4000ms default)
  fileencoding = "utf-8",                  -- the encoding written to a file
  showmode     = true,                    -- we don't need to see things like -- INSERT -- anymore
  splitbelow   = true,                     -- force all horizontal splits to go below current window
  splitright   = true,                     -- force all vertical splits to go to the right of current window

  -- indentation settings
  tabstop    = 2,                          -- insert 2 spaces for a tab
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  expandtab  = true,                       -- convert tabs to spaces
  autoindent = true,                       -- use the indent from the previous line
  cindent    = true,                       -- use C-indentation style
  -- smartindent = true,                      -- make indenting smarter again

  -- appearance settings
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- colorscheme   = tokyonight,              -- set default color scheme
  -- background    = "dark",                  -- use a dark background
  cursorline     = true,                   -- highlight the current line
  relativenumber = false,                  -- set relative numbered lines
  showtabline    = 2,                      -- always show tabline
  signcolumn     = "yes",                  -- always show the sign column, otherwise it would shift the text each time
  -- numberwidth = 4,                         -- set number column width to 2 {default 4}

  -- backup and swap settings
  -- backup    = true,                        -- creates a backup file
  -- backupdir = "~/.env/nvim/backup"
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- miscellaneous settings
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0,                        -- so that `` is visible in markdown files
  -- hlsearch = true,                         -- highlight all matches on previous search pattern
  -- ignorecase = true,                       -- ignore case in search patterns
  -- pumheight = 10,                          -- pop up menu height
  -- smartcase = true,                        -- smart case
  -- swapfile = false,                        -- creates a swapfile
  -- timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  -- undofile = true,                         -- enable persistent undo
  -- scrolloff = 8,                           -- is one of my fav
  -- sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
