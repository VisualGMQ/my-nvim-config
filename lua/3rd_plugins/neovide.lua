-- neovide is a Neovim GUI made in Rust
-- offical webset: https://neovide.dev/

if vim.fn.exists("g:neovide") then
    vim.g.neovide_transparency = 1.0
    vim.g.neovide_no_idle = true
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_mode = "railgun"
end
