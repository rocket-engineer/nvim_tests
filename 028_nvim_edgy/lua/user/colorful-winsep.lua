
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, winsep = pcall(require, "colorful-winsep")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

winsep.setup({
})
