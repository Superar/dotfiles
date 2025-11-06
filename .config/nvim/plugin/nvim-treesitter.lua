require('nvim-treesitter.configs').setup({
    ensure_installed = {'python', 'lua', 'latex'}, -- Install parsers
    highlight = {
        enable = true, -- Enable syntax highlighting
    },
    indent = {
        enable = true, -- Enable smart indentation
    },
})
