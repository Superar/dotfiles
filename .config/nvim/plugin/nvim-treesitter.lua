require('nvim-treesitter.configs').setup({
    ensure_installed = {'python', 'lua', 'latex'}, -- Install parsers
    auto_install = true,
    highlight = {
        enable = true, -- Enable syntax highlighting
    },
    indent = {
        enable = true, -- Enable smart indentation
    },
})
