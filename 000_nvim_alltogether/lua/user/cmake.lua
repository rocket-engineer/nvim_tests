
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, cmake = pcall(require, "cmake")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

-- get pretty notifier
local notify_engine = vim.notify
local notify_status_ok, notify = pcall(require, "notify")
if notify_status_ok then
  notify_engine = notify
end

-- local Path = require('plenary.path')

cmake.setup({
  -- cmake_executable = 'cmake',
  -- save_before_build = true,

  -- setup notifier
  notify = notify_engine,

  -- define settings file
  parameters_file = 'cmake_settings.json',

--   -- -- build_dir = tostring(Path:new('{cwd}', 'build', '{os}-{build_type}')), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
--   -- build_dir = "/home/vistdn/Workspace/amsr/repos/adaptive-microsar-build",
--   -- -- samples_path = tostring(script_path:parent():parent():parent() / 'samples'), -- Folder with samples. `samples` folder from the plugin directory is used by default.
--   -- -- default_projects_path = tostring(Path:new(vim.loop.os_homedir(), 'Projects')), -- Default folder for creating project.
--   --
--   -- -- configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
--   -- -- build_args = {}, -- Default arguments that will be always passed at cmake build step.
--   -- -- on_build_output = nil, -- Callback that will be called each time data is received by the current process. Accepts the received data as an argument.
--   -- -- quickfix = {
--   -- --   pos = 'botright', -- Where to open quickfix
--   -- --   height = 10, -- Height of the opened quickfix.
--   -- --   only_on_error = false, -- Open quickfix window only if target build failed.
--   -- -- },
--   -- copy_compile_commands = false,
--   --
--   -- -- dap_configuration = { type = 'lldb', request = 'launch' }, -- DAP configuration. By default configured to work with `lldb-vscode`.
--   -- -- dap_open_command = require('dap').repl.open, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
})

