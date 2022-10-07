
Fixed Activities
===============

 ✔ Switch to NeoVim 0.7 -> check Chris@Machine video
 ✔ Make current version work
 ✔ Install rigrep -> using deb file
 ✔ Plugin: Autopairs & Tabclose - Integration
 ✔ Plugin: LSP Signature - ray-x/lsp_signature
 ✔ Plugin: Code outline buffer - stevearc/aerial.nvim
 ✔ Plugin: Indentation detection - Darazaki/indent-o-matic


Next Activities
===============

 + Plugin: Vim-Better-Whitespace or NeoVim alternative
 + Plugin: LuaSnip - Better integration, LuaSnipEdit function, C++ snippets
 - Plugin: Better file tree? - nvim-neo-tree/neo-tree.nvim

 + Better TACO integration (is there anything missing - generated code?)
 + Plugin: Scrollbar - Better color

 + DAP Integration
   * Adapters for C++ and Java
   * Configurations for Test.2017, Test.2020 and Generator
   * DAPInstall integration
   * nvim-dap-virtual-text
   * nvim-dap-ui
   * telescope-dap
   * cmp-dap ?

 - GoogleTest integration
 - Plugin: Sessions - Make it work (including NVimTree) - jedrzejboczar/possession.nvim ?
 - Plugin: Gitdiff integration - sindrets/diffview.nvim ?
 - Customized tabline: rafcamlet/tabline-framework.nvim
 - Plugin: Better statusline - feline-nvim/feline.nvim
 - Plugin: Stick buffers to windows? - stevearc/stickybuf.nvim
 - Plugin: Switch scrollbar? - lewis6991/satellite.nvim
 - Plugin: TroubleToggle in floating window
 
 - Detect whitespae
 - Unicode characters insertion

 - NvimTree improvements
   * NvimTree: autocommands for close
   * NvimTree: new keymaps

Weekend ToDo
------------

 + Java & LSP (jdtls) & DAP -> use specific version of jdtls
 + Plugin: CMake integration - Shatur/neovim-cmake
 + Plugin: Better folding using LSP - kevinhwang91/nvim-ufo
 + Different language settings (indentation, spell check, etc using after)
 + Spell check in comments (only in comments for some languages) - lewis6991/spellsitter.nvim ?






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
 - Indent lines: More indentation focus / work with fluent Result API (normal and focused)
 - NvimTree does not work sometimes (not reproduceable)
 - LazyGit: Open files in main windows and new tab
 - Nightfox: Better background & gutter colors (NvimTree, Workspace, Aerial), fix line start color problem
 - Fix LSP signature, use plugin Issafalcon/lsp-overloads


Ideas for Plugins
=================

 Plugin: Navigation

 - Create first plugin (test environment, config, ...)
 - Scan the window environment (NVimTree, Aerial, main windows, etc)
 - Mappings
   - Focus NvimTree:               CTRL-a
   - Focus Aerial:                 CTRL-l
   - Switch main window:           CTRL-k
   - Go to tab #1 - #10:           CTRL-1 - CTRL-0
   - Move tab to the left / right: CTRL-left and CTRL-right
 - Show floating window with open tabs and buffers and call them
 - Open source code file and its header file in new tab
 - Switch between source code file and its header file and vice versa
   - Open header / source code file in split buffer
 - Other plugins: gelguy/wilder.nvim

 Plugin: GoogleTest

 - Jump to next/previous test using ]t and [t
 - Add new test template (normal, fixture, typed, parameterized) -> Snippet?
 - Define test binary
 - Run test under cursor in floating window
 - Run test under cursor in tabline
 - Run all tests 
 - Deliver test binary / test name (complete call) for e.g. DAP

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

 Plugin: NVCode

  - New github repo for final NVCode environment

