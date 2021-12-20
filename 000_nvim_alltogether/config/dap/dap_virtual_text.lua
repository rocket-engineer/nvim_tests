local status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status_ok then
  return
end

dap_virtual_text.setup()
