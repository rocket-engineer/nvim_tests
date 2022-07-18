
-- =================================================================================================
-- Module Protection
-- =================================================================================================

local status_ok, indentomatic = pcall(require, "indent-o-matic")
if not status_ok then
  return
end


-- =================================================================================================
-- Configuration
-- =================================================================================================

indentomatic.setup {
    -- number of lines without indentation before giving up (use -1 for infinite)
    max_lines = 2048,

    -- space indentations that should be detected
    standard_widths = { 2, 4, 8 },

    -- skip multi-line comments and strings (more accurate detection but less performant)
    -- skip_multiline = true,

    -- C-style languages
    filetype_c = {
        standard_widths = { 2 },
    },
    filetype_cpp = {
        standard_widths = { 2 },
    },
    filetype_cuda = {
        standard_widths = { 2 },
    },

    -- do not detect 8 spaces indentations inside files without a filetype
    filetype_ = {
        standard_widths = { 2, 4 },
    },

    -- disable indent-o-matic for LISP files
    -- filetype_lisp = {
    --     max_lines = 0,
    -- },
}

