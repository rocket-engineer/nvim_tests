local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.lldb = {
  type    = 'executable',
  command = '/usr/bin/lldb-vscode-12',
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

-- If you want to use this for rust and c, add something like this:
dap.configurations.c    = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
