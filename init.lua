-- use this before init: $env:NVIM_APPNAME="nvim-new-config"
-- nvim 0.12 deprecates vim.tbl_flatten; several plugins still call it. Shadow before any plugin loads.
if vim.iter then
    vim.tbl_flatten = function(t)
        return vim.iter(t or {}):flatten(math.huge):totable()
    end
end
require("myself.config")
require("3rdlibs.config")
