-- Color theme

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#3c3836', underline = true })
        vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#3c3836', underline = true })
        vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#3c3836', underline = true })
    end
})

return {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd('colorscheme gruvbox')
    end
}
