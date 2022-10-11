
Fixed Activities
===============

 ✔ Switch to NeoVim 0.7 -> check Chris@Machine video
 ✔ Make current version work
 ✔ Install rigrep -> using deb file
 ✔ Plugin: Autopairs & Tabclose - Integration
 ✔ Plugin: LSP Signature - ray-x/lsp_signature
 ✔ Plugin: Code outline buffer - stevearc/aerial.nvim
 ✔ Plugin: Indentation detection - Darazaki/indent-o-matic
 ✔ Plugin: Fix LSP signature - Issafalcon/lsp-overloads


Next Activities
===============

 + Plugin: LuaSnip - Better integration, LuaSnipEdit function, C++ snippets
 - Plugin: Better file tree? - nvim-neo-tree/neo-tree.nvim

 + Better TACO integration (is there anything missing - generated code?)
 + Plugin: Scrollbar - Better color
 + Plugin: What plugin to choose for LSP signature?

 + DAP Integration
   * Adapters for C++ and Java
   * Configurations for Test.2017, Test.2020 and Generator
   * DAPInstall integration
   * nvim-dap-virtual-text
   * nvim-dap-ui
   * telescope-dap
   * cmp-dap ?

 - Plugin: Sessions - Make it work (including NVimTree) - jedrzejboczar/possession.nvim ?
 - Plugin: Gitdiff integration - sindrets/diffview.nvim ?
 - Customized tabline: rafcamlet/tabline-framework.nvim
 - Plugin: Better statusline - feline-nvim/feline.nvim
 - Plugin: Stick buffers to windows? - stevearc/stickybuf.nvim
 - Plugin: Switch scrollbar? - lewis6991/satellite.nvim
 - Plugin: TroubleToggle in floating window
 - Plugin: Better motion plugin? - ggandor/leap.nvim
 - Extension: Open Telescope (FindFile / LiveGrep) on current directory in NvimTree - nvim-telescope/telescope-live-grep-args.nvim
 - Plugin: Browse JSON files - gennaro-tedesco/nvim-jqx

 - Unicode characters insertion

 - NvimTree improvements
   * NvimTree: autocommands for close
   * NvimTree: new keymaps

Weekend ToDo
------------

 + Switch to NeoVim 0.8
 + Try to use winbar (NeoVim 0.8)-> File name etc from Chris@Machine OR Lualine?

 + Plugin: Installers for LSP/DAP/linters/formatters - williamboman/mason.nvim
 + Java & LSP (jdtls) & DAP -> use specific version of jdtls
 
 + Different language settings (indentation, spell check, etc using after)
 + Spell check in comments (only in comments for some languages) - lewis6991/spellsitter.nvim ?
 
 - Plugin: CMake integration - Shatur/neovim-cmake
 - move semantics for std::vector::push_back()

At Work ToDo
------------

 + Setup clang-tidy according to confluence article

Improvements
------------

 + Plugin: lukas-reineke/indent-blankline
   * Indentation focus for environments, lambdas, etc
   * Newline problem, do not at indentation line for a newline if e.g. function call is over several lines
   * Work with fluent Result API (normal and focused) -
   * Irregular (i.e. uneven) indentation (disable indentation?)

 + Plugin: Vim-Better-Whitespace for Lua - zakharykaplan/nvim-retrail
   * Fix problems

 + Plugin: kevinhwang91/nvim-ufo
   * Make ufo work again (NeoVim 0.8 + Mason)
   * Check to work with LSP or treesitter (and configure fallback option)
   * How to make peekFoldedLinesUnderCursor() work?
   * Show complete signature and fold only body (customized fold text)
   * Get kind specification from LSP (class, method, function, comment, for, if, lambda, env, ...) - if possible
   * Default folding for defined kinds (class, method, function) - openFoldsExceptKinds()
   * Disable/enable folding for defined kinds
   * Fold function/method/etc body on last character (in newline) (for C: })
   * Update scrollbar upon fold/unfold
   * Update indent guards upon unfold
   * Build NeoVim 0.8 from sources, including fix for UFO (https://github.com/kevinhwang91/nvim-ufo/issues/4#issuecomment-1157722074)

Found Issues
============

 ✔ No virtual text for diagnostics
 ✔ Indent lines in NvimTree
 - NvimTree does not work sometimes (not reproduceable)
 - LazyGit: Open files in main windows and new tab
 - LazyGit: Why has it become so slow?
 - Nightfox: Better background & gutter colors (NvimTree, Workspace, Aerial), fix line start color problem


Miscellaneous
=============

 ✔ Setup global ccache


Ideas for Plugins
=================

 Plugin: GoogleTest

 ✔ Provide filter name of test under cursor
 ✔ Run test under cursor in floating window
 ✔ Run test set under cursor in floating window
 + Jump to next/previous test using ]t and [t
 - Run all tests, show progress in Lualine
 ✔ Deliver test binary / test name (complete call) for e.g. DAP
   -> Moved to CMake plugin
 ✔ Add new test template (normal, fixture, typed, parameterized)
   -> Use LuaSnip
 + Integration into Plugin nvim-neotest/neotest (as runner)

 Plugin: Navigation

 - Scan the window environment (NVimTree, Aerial, main windows, etc)
 - Mappings
   - Focus NvimTree:               CTRL-a          :NavFocusNvimTree
   - Focus Aerial:                 CTRL-l          :NavFocusAerial
   - Switch main window:           CTRL-k          :NavSwitchMainWin
   - Go to tab #1 - #10:           CTRL-1 - CTRL-0 :NavTabGoTo(tab_nr)
   - Move tab to the left / right: CTRL-left       :NavMoveTabLeft
                                   CTRL-right      :NavMoveTabRight
 - Show floating window with open tabs and buffers and call them      :NavShowTabs
 - Open source code file and its header file in new tab               :NavOpenTabWithCouple(filename_prefix_path)
 - Switch between source code file and its header file and vice versa :NavSwitchMainWin
   - Open header / source code file in split buffer                   :NavOpenBufWithCoupleSibling(filename_prefix_path)
 - Other plugins: gelguy/wilder.nvim

 Plugin: CMake Integration

 - Organize NeoVim projects
 - Store CMake settings in JSON file (configurations, builds, debugging)
 - Mappings
   - Choose from all presets:         <leader>cp
   - Choose from all configurations:  <leader>c?
   - Call a CMake configuration:      <leader>c1 - <leader>c0
   - Choose from all builds:          <leader>b?
   - Call a CMake build :             <leader>b1 - <leader>b0
   - Choose from all debug sessionss: <leader>d?
   - Call a debug session:            <leader>d1 - <leader>d0

 Plugin: Projects

 - Organize NeoVim projects
 - Store settings in JSON file(s) (project name, LSP compile_commands.json, DAP, etc)

 -> Use neovim-cmake and Sessions?

 Plugin: neovim-bauhaus

  - Use null-ls to add Bauhaus findings to LSP diagnostics
  - Own sign for Bauhaus findings in the gutter
  - Use Telescope to find current Bauhaus findings
  - Show current Bauhaus findings in TroubleToggle

 Plugin: neovim-VCA

  - Use null-ls to add VCA findings to LSP diagnostics
  - Own sign for VCA findings in the gutter
  - Use Telescope to find current VCA findings
  - Show current VCA findings in TroubleToggle

 Plugin: null-ls.helper.iwyu

  - Add findings of IWYU to LSP client
  - Use actions to automatically add/remove includes/classes
  
 Plugin: NVCode

  - New github repo for final NVCode environment


Collaborted Plugin Development
==============================

 Plugin: GoogleTest
 Plugin: CMake Integration
 Plugin: neovim-bauhaus
 Plugin: neovim-VCA

