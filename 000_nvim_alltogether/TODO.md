
Fixed Activities
================

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
 - Plugin: Highlight, list and search ToDo comments - folke/todo-comments
 - Plugin: Create reviews in NeoVim - pwntester/octo.nvim
 - Plugin: Continuous testing, show test result in vim-signs - aaronhallaert/continuous-testing.nvim
 - Plugin: Highlight other uses of the current word - RRethy/vim-illuminate
 + Plugin: Switch worktrees with telescope - helmecke/telescope-git-worktree.nvim
 - Plugin: Access stored yanks and clipboard - AckslD/nvim-neoclip.lua

 - Use different terminal (eg kitty, GPU accelerated)

 - Unicode characters insertion

 - NvimTree improvements
   * NvimTree: autocommands for close
   * NvimTree: new keymaps


Weekend ToDo
------------

 -> New NeoVim Version
  + Switch to NeoVim 0.9.1
    - Remove treesitter-playground plugin
  + Create customized statuscolumn - luukvbaal/statuscol.nvim

 -> Improved Tab Handling
  ✔ Remove unused (i.e. not attached) buffers -> increase performace
    * Try kazhala/close-buffers.nvim
  + Plugin: Configurable tabline - nanozuki/tabby.nvim
    * Establish own customization
      -> files_redundancy_check S|H
  + https://github.com/LukasPietzschmann/telescope-tabs
    * Establish own customization

 -> Enable Spell Checking (only in comments)
  + Spell check in comments (only in comments for some languages) - lewis6991/spellsitter.nvim or native implementation?
    * Use LSP to detect variable names

 -> Window Layouts
  ✔ Plugin: Use predefined window layouts - folke/edgy.nvim
    * tab page support is required
    * Fix problems
  + Create my layout
  + Create shortcuts
  ✔ Plugin: Highlight current window - nvim-zh/colorful-winsep.nvim

 -> Use kitty as main terminal

 -> Fix tmux / zsh
  + Fix tmux problems
  + Fix zsh problems

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

 - Keymaps for unicode characters:
   - ✔, ...

 - Setup neotest
   * Use symbols in the status column to show whether a test was not run / successfull / failed
   * Use symbols in the status column to show where a test failed (using LSP diagnostics injection)
   * Define specific tests in project config file (using filter argument)
   * Keymaps: - <leader>tl : Run last test
              - <leader>ts : Show summary
              - [t         : Goto previous test
              - ]t         : Goto next test
              - <leader>tt : Run test under cursor
              - <leader>tT : Run test suite under cursor
              - <leader>tr : Run all tests
              - <leader>tR : Run all tests in current file
              - <leader>ts : Run specific tests (defined in project config file)
              - <leader>td : Debug test under cursor
              - <leader>tT : Debug test suite under cursor

 - move semantics for std::vector::push_back(): Universal references etc


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
   + Remove scrollbar in fold preview
   <!-- + Build NeoVim 0.8.1 from sources, including fix for UFO (https://github.com/kevinhwang91/nvim-ufo/issues/4#issuecomment-1157722074) -->
   - Check to work with LSP or treesitter (and configure fallback option)
   - Show complete signature and fold only function body (customized fold text)
   - Update indent guards upon unfold
   - Show indent guards in preview
   ? Update scrollbar upon fold/unfold

   - Get kind specification from LSP (class, method, function, comment, for, if, lambda, env, ...) - if possible
   - Default folding for defined kinds (class, method, function) - openFoldsExceptKinds()
   - Disable/enable folding for defined kinds
   - Fold function/method/etc body on last character (in newline) (for C: })
   - Extend clangd:
     - Compile clangd (16.*) from source
     - Occupy attribute kind in FoldingRange objects for relevant folding types
       -> Modify
       -> Enable it via the argument: --ast-custom-folding-ranges
       -> Functions, structs/classes, lambdas, namespaces, preprocessor variables (#ifdef ... #endif)
       -> https://github.com/kevinhwang91/nvim-ufo/issues/64
       -> https://clang.llvm.org/extra/doxygen/SemanticSelection_8cpp_source.html#l00183
       -> https://clang.llvm.org/extra/doxygen/structclang_1_1clangd_1_1FoldingRange.html

 + LSP: clangd
   - Specify absolute path to compile_commands.json according to project (or use default behavior)

 + Misc:
   - Grep for word under cursor (call Telescope)
   - Grep for visualized word (call Telescope)


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
    * Also show if buffers in the tabs have been modified -> write them all with a keymap
  - Open header or source code file in split buffer                    :NavOpenBufWithCoupleSibling(filename_prefix_path)
  - Open source code file and its header file in new tab               :NavOpenTabWithCouple(filename_prefix_path)
  - Other plugins: gelguy/wilder.nvim
  - Delete all buffers but the open ones

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
    - Read data base from file (Justifications.txt)
    - Write extension (hover) for null-ls
  - Use Telescope to find current Bauhaus findings [HOVER]
  - Enable/disable Bauhaus findings

 Plugin: null-ls-VCA.nvim

  + Use null-ls to show VCA findings as hover [HOVER]
    - Read data base from file (Justifications_VCA.txt)
    + Write extension (hover) for null-ls
  - Use null-ls to inject VCA findings to LSP diagnostics [DIAGNOSTICS]
    - Read data base from file (Findings.txt)
    - Write extension (diagnostic) for null-ls to show findings
    - Write extension (action) for null-ls to remove finding from database
  - Enable/disable VCA findings
  - Get VCA findings from CI (URL/latest CI pipeline from MR)
  - Use Telescope to find current VCA findings

 Plugin: null-ls.helper.iwyu

  - Use null-ls to inject findings of IWYU to LSP client
  - Use actions to automatically add/remove includes/classes

 Plugin: null-ls-manager.nvim

  - Enabled/disable null-ls helpers in a floating window

 Plugin: NVCode

  + New github repo for final NVCode environment
  + Framework with integrations:
    - git (branches, worktrees (w/ branches), )

 Plugin: nvcode-config.nvim

  -> NVCode plugin for NeoVim session / project configuration
     Namespace: nvcode.config.*

  - Create JSON file to store settings for a NeoVim session / project
  - Create NeoVim plugin to (automatically) read config file and provide data to plugins

 Plugin: nvcode-cmake-integration.nvim

  -> NVCode plugin for integrating CMake into NeoVim
     Namespace: nvcode.cmake_integration.*

  - Choosing current preset
  - Configuring CMake projects
  - Building targets
  - Executing ccmake in NeoVim (floating window, needs path to build dir)

 Plugin: nvcode-code-review.nvim

  -> NVCode plugin for accessing MRs, writing and editing reviews / comments / labels / reactions
     Namespace: nvcode.code_review.*

  - Start from octo.nvim and/or gh.nvim and write new plugin
  - Goal: * Create / edit reviews
          * Add / modify comments
          * Add / modify labels
          * Add / modify reactions
          * Show pipelines
          * Show TestReports


Collaborted Plugin Development
------------------------------

 Plugin: GoogleTest
 Plugin: CMake Integration
 Plugin: neovim-bauhaus
 Plugin: neovim-VCA


ToDo List
---------

 + Go to NeoVim 0.9.1
 + Finish Weekend ToDos
 - Write own plugins:
   - nvcode-config            : Read in and access runtime settings of current NeoVim instance
   - nvcode-cmake-integration : CMake integration into NeoVim, Presets / Configuration / Building targets / Providing executables of targets
   - null-ls-manager          : Manage null-ls extensions
 - Become familiar with gh tool and pluings octo.nvim and/or gh.nvim

