
set nocompatible
filetype plugin indent on
call plug#begin('~/.env/nvim/plugins')

" coloring
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'

" misc
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jdhao/better-escape.vim'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

" ================================================================================

syntax on                  " enable syntax
"set t_Co=256              " set number of colors
set mouse=a                " enable mouse                                                                                                                                                                                                                                                             
set mousehide              " hide the mouse cursor while typing
set number                 " enable row numbers
set nowrap                 " display long lines as just one single line
set cursorline             " show cursor line
set tabstop=2              " change the number of space characters for the tab key
set shiftwidth=2           " change the number of space characters for indentation
set softtabstop=2
set expandtab              " convert tabs to spaces
set expandtab
set smarttab 
" set autoindent           " auto indent after new line
set smartindent            " auto indent after new line

let mapleader=","          " set map leader key

" set colorcolumn=80

" ================================================================================

if (has("termguicolors"))
  set termguicolors
endif

colorscheme tokyonight
" colorscheme gruvbox8_hard
" colorscheme wombat

let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_italic_variables = 0

set background=dark

" ================================================================================

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "cmake",
    "lua",
    "vim"
  },
  highlight = { 
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = true
  }
}
EOF

" ================================================================================

lua << EOF
local dap = require('dap')

dap.adapters.lldb = {
  type    = 'executable',
  command = '/bin/lldb-vscode-12',
  name    = "lldb"
}

dap.configurations.cpp = {
  {
    type    = "lldb",
    request = "launch",
    name    = "Launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    -- program = "/home/man-behind-moon/Misc/Tests/02_C/build/hello_world",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
--  {
--     -- If you get an "Operation not permitted" error using this, try disabling YAMA:
--     --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     name = "Attach to process",
--     type = 'lldb',
--     request = 'attach',
--     pid = require('dap.utils').pick_process,
--     args = {},
--   },
--   {
--     type    = 'lldb',
--     request = 'attach',
--     name    = "Attach to PID",
--     program = "/home/man-behind-moon/Misc/Tests/02_C/build/hello_world",
--     -- pid     = 123
--   }
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

-- If you want to use this for rust and c, add something like this:
dap.configurations.c    = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

EOF

nnoremap <leader>db :lua require('dap').toggle_breakpoint()<CR>
nnoremap <leader>dB :lua require('dap').clear_breakpoints()<CR>
nnoremap <leader>dl :lua require('dap').list_breakpoints()<CR>

nnoremap <leader>dn :lua require('dap').continue()<CR>
nnoremap <leader>d_ :lua require('dap').run_last()<CR>
nnoremap <leader>dq :lua require('dap').disconnect()<CR>

nnoremap <leader>dr :lua require('dap.repl').toggle()<CR>

" nnoremap <leader>d? :lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>

nnoremap <S-j> :lua require('dap').step_over()<CR>
nnoremap <S-k> :lua require('dap').step_into()<CR>
nnoremap <S-l> :lua require('dap').step_out()<CR>
nnoremap <S-r> :lua require('dap').run_to_cursor()<CR>

nnoremap <leader>dk :lua require('dap').up()<CR>
nnoremap <leader>dj :lua require('dap').down()<CR>


lua <<EOF
local config1 = {
  type    = "lldb",
  request = "launch",
  name    = "Test DAP Config1",
  program = "/home/vistdn/Misc/Test/01_neovim/003_DAP/test",
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
  args = {},

  runInTerminal = false,
}
EOF

" nnoremap <leader>d1 :lua require('dap').run(config1)<CR>

" ================================================================================

lua <<EOF
require("nvim-dap-virtual-text").setup({
  enabled = true,                        -- enable this plugin (the default)
  -- enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  -- highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  -- highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  -- show_stop_reason = true,               -- show stop reason when stopped for exceptions
  commented = false,                     -- prefix virtual text with comment string
  -- only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
  -- all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
  -- filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
  -- -- experimental features:
  -- virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
  -- all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  -- virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
  -- virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
  --                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})
EOF

" ================================================================================

lua <<EOF
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    position = "right",
    size     = 40,
  },
  tray = {
    elements = { "repl" },
    position = "bottom",
    size     = 10,
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width  = nil, -- Floats will be treated as percentage of your screen.
    border     = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
EOF

nnoremap <leader>du :lua require('dapui').toggle()<CR>
nnoremap <leader>di :lua require('dapui').eval()<CR>
nnoremap <leader>df :lua require('dapui').float_element()<CR>
"nnoremap <leader>d? :lua local widgets=require('dapui.widgets');require('dapui').float_element(widgets.scopes, { enter = true})<CR>
"nnoremap <leader>d? :lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>

" ================================================================================

