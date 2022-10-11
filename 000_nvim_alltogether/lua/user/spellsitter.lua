
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, spellsitter = pcall(require, "spellsitter")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

spellsitter.setup({
  -- whether enabled, can be a list of file types, e.g. {'python', 'lua'}
  enable = {'lua', 'vim', 'bash', 'json', 'make', 'cmake', 'yaml', 'python', 'cpp', 'c', 'cuda', 'fortran'},

  -- disable debugging
  debug = false
})

