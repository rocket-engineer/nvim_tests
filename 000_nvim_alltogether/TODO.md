
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
 ✔ Plugin: Installers for LSP/DAP/linters/formatters - williamboman/mason.nvim
 ✔ Use winbar (NeoVim 0.8)-> File name etc from Chris@Machine OR Lualine?
 ✔ Extension: Open Telescope (FindFile / LiveGrep) on current directory in NvimTree - nvim-telescope/telescope-live-grep-args.nvim


Next Activities
===============

 ✔ Plugin: LuaSnip - Better integration, LuaSnipEdit function, C++ snippets
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
 - Plugin: Browse JSON files - gennaro-tedesco/nvim-jqx

 - Unicode characters insertion

 - NvimTree improvements
   * NvimTree: autocommands for close
   * NvimTree: new keymaps


Weekend ToDo
------------

 - move semantics for std::vector::push_back(): Universal references etc

 + Switch to NeoVim 0.9.0

 + Plugin: Configurable tabline - nanozuki/tabby.nvim
   * files_redundancy_check S|H

 + Spell check in comments (only in comments for some languages) - lewis6991/spellsitter.nvim or native implementation?
   * Use LSP to detect variable names

 - Plugin: Find header/source file to source/header file - jakemason/ouroboros.nvim
   * Add API to get source/header file name, OuroborosSourceFileName(opt: file_path), OuroborosHeaderFileName(opt: file_path), OuroborosFileName(opt: file_path)
   * Add API to check is source/header file name, OuroborosIsPair(source_path, header_path)

 - Plugin: IDE Panel Groups - ldelossa/nvim-ide (isolated test)
   * Highlight overlength lines

   Panel Groups:

   * Left Panel Group:   - File Explorer Panel     -> NvimTree, [TerminalBrowser, ProjectBrowser, SessionBrowser]
   * Right Panel Group:  - Variable Explorer Panel -> Aerial
                         - Git Panel               -> Changes, Commits, Timeline, Branches
   * Bottom Panel Group: - Terminal Panel          -> Terminal

   Defaults:
   * Open left panel if specified file type: C/C++/Cuda, Python, Bash, ...
   * Open right panel: - Variable Explorer Panel if LSP active OR
                       - Git Panel if git repository found

 - Plugin: Highlight current window - nvim-zh/colorful-winsep.nvim

 + Java & LSP (jdtls) & DAP -> use specific version of jdtls

 + Different language settings (indentation, spell check, etc using after)

 - Plugin: NeoVim Lua Development - folke/neodev.nvim
   * Can LSP configured by NeoDev?


At Work ToDo
------------

 + Setup clang-tidy according to confluence article


Improvements
------------

 + Plugin: lukas-reineke/indent-blankline
   ✔ Work with fluent Result API (normal and focused) - show_current_context = true
   - Indentation focus for environments, lambdas, etc
   - Fix problem with lambdas
   - Irregular (i.e. uneven) indentation (disable indentation?)
   - Newline problem, do not at indentation line for a newline if e.g. function call is over several lines

 + Plugin: Vim-Better-Whitespace for Lua - zakharykaplan/nvim-retrail
   ✔ Fix problems

 + Plugin: kevinhwang91/nvim-ufo
   ✔ Make ufo work again (NeoVim 0.8 + Mason)
   ✔ How to make peekFoldedLinesUnderCursor() work?
   - Remove scrollbar in fold preview
   + Build NeoVim 0.8.1 from sources, including fix for UFO (https://github.com/kevinhwang91/nvim-ufo/issues/4#issuecomment-1157722074)
   - Check to work with LSP or treesitter (and configure fallback option)
   - Show complete signature and fold only body (customized fold text)
   - Get kind specification from LSP (class, method, function, comment, for, if, lambda, env, ...) - if possible
   - Default folding for defined kinds (class, method, function) - openFoldsExceptKinds()
   - Disable/enable folding for defined kinds
   - Fold function/method/etc body on last character (in newline) (for C: })
   - Update indent guards upon unfold
   ? Update scrollbar upon fold/unfold


Found Issues
------------

 ✔ No virtual text for diagnostics
 ✔ Indent lines in NvimTree
 - NvimTree does not work sometimes (not reproduceable)
 - LazyGit: Open files in main windows and new tab, See https://github.com/kdheepak/lazygit.nvim/issues/67
 - LazyGit: Why has it become so slow?
 - Nightfox: Better background & gutter colors (NvimTree, Workspace, Aerial), fix line start color problem
 - null-ls: Jump to next/last diagnostic finding


Miscellaneous
-------------

 ✔ Setup global ccache


Ideas for Plugins
-----------------

 Telescope Extension: live_grep_args_plus

  - Grep files only in a specified directory
  - Open marked file as C++ source and header file in new tab with CTRL-S (split)

 Telescope Extension: find_files_args_plus

  - Find files only in a specified directory
  - Open marked file as C++ source and header file in new tab with CTRL-S (split)

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

  - Wrap ldelossa/nvim-ide: Left/right panel, bottom panel
  - Scan the window environment (left/right/terminal panels, main windows, etc)
  - Mappings
    * Focus toggle left panel:      CTRL-a          :NavFocusToggleLeftPanel
    * Focus toggle right panel:     CTRL-l          :NavFocusToggleRightPanel
    * Focus toggle bottom panel:    CTRL-c          :NavFocusToggleBottomPanel
    * Switch main window:           CTRL-k          :NavSwitchMainWins
    * Go to last tab:               CTRL-j          :NavGoToLastTab
    * Go to tab #1 - #10:           CTRL-1 - CTRL-0 :NavGoToTab(tab_nr)
    * Move tab to the left / right: CTRL-left       :NavMoveTabLeft
                                    CTRL-right      :NavMoveTabRight
  - Show floating window with open tabs and buffers and call them      :NavShowTabs
    * Maybe use LukasPietzschmann/telescope-tabs
  - Open header or source code file in split buffer                    :NavOpenBufWithCoupleSibling(filename_prefix_path)
  - Open source code file and its header file in new tab               :NavOpenTabWithCouple(filename_prefix_path)
  - Other plugins: gelguy/wilder.nvim

 Plugin: Project Settings

  - Organize NeoVim projects
  - Store project settings in JSON file (configurations, builds, debugging)

 Plugin: CMake Integration

  - Read CMake Presets
  -

  - Mappings
    - Choose from all presets:         <leader>cp
    - Choose from all configurations:  <leader>c?
    - Call a CMake configuration:      <leader>c1 - <leader>c0
    - Choose from all builds:          <leader>b?
    - Call a CMake build :             <leader>b1 - <leader>b0
    - Choose from all debug sessionss: <leader>d?
    - Call a debug session:            <leader>d1 - <leader>d0

 Plugin: null-ls-bauhaus.nvim

  - Use null-ls to inject Bauhaus findings to LSP diagnostics [DIAGNOSTICS]
  - Use Telescope to find current Bauhaus findings [HOVER]
  - Enable/disable Bauhaus findings

 Plugin: null-ls-VCA.nvim

  - Use null-ls to inject VCA findings to LSP diagnostics [DIAGNOSTICS]
  - Use null-ls to show VCA findings as hover [HOVER]
  - Enable/disable VCA findints
  - Get VCA findings from CI (URL/latest CI pipeline from MR)
  - Use Telescope to find current VCA findings

 Plugin: null-ls.helper.iwyu

  - Use null-ls to inject findings of IWYU to LSP client
  - Use actions to automatically add/remove includes/classes

 Plugin: null-ls-manager.nvim

  - Enabled/disable null-ls helpers in a floating window

 Plugin: NVCode

  + New github repo for final NVCode environment


Collaborted Plugin Development
------------------------------

 Plugin: GoogleTest
 Plugin: CMake Integration
 Plugin: neovim-bauhaus
 Plugin: neovim-VCA

