
Next Activities
===============

 ✔ Switch to NeoVim 0.7 -> check Chris@Machine video
 ✔ Make current version work
 ✔ Install rigrep -> using deb file
 ✔ Plugin: Autopairs & Tabclose - Integration
 ✔ Plugin: LSP Signature - ray-x/lsp_signature
 ✔ Plugin: Code outline buffer - stevearc/aerial.nvim

 + Plugin: Indentation detection - Darazaki/indent-o-matic
 + Java & LSP (jdtls) -> use specific version of jdtls
 - Plugin: Better file tree? - nvim-neo-tree/neo-tree.nvim
 + Plugin: Vim-Better-Whitespace or NeoVim alternative
 + Plugin: LuaSnip - Better integration, LuaSnipEdit function, C++ snippets

 + Better TACO integration (is there anything missing - generated code?)
 + Different language settings (indentation, spell check, etc using after)
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
 - Plugin: Better folding using LSP - kevinhwang91/nvim-ufo
 - Plugin: Stick buffers to windows? - stevearc/stickybuf.nvim
 - Plugin: Switch scrollbar? - lewis6991/satellite.nvim
 
 - Spell check in comments (only in comments for some languages) - lewis6991/spellsitter.nvim ?
 - Detect whitespae
 - Unicode characters insertion

 - NvimTree improvements
   * NvimTree: autocommands for close
   * NvimTree: new keymaps


Found Issues
============

 ✔ No virtual text for diagnostics
 ✔ Indent lines in NvimTree
 - Indent lines: More indentation focus / work with fluent Result API (normal and focused)
 - NvimTree does not work sometimes (not reproduceable)
 - LazyGit: Open files in main windows and new tab


Ideas for Plugins
=================

 Plugin: Navigation

 - Create first plugin (test environment, config, ...)
 - Scan the window environment (NVimTree, Vista, main windows)
 - Go to NvimTree, Aerial
 - Switch between main windows (using CTRL-k)
 - Go to tab using CTRL-1 - CTRL-0 (tab #1 - #10)
 - Move tab to the left / right (using CTRL-left and CTRL-right)
 - Show floating window with open tabs and buffers and call them
 - Open source code file and its header file in new tab
 - Switch between source code file and its header file and vice versa
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

 Plugin: NVCode

  - New github repo for final NVCode environment

 Plugin: TODO

  - TODO

