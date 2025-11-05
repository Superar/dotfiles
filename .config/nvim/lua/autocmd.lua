-- -------- Autocommands --------

TrimWhitespace = function(patterns)
    local save = vim.fn.winsaveview()
    vim.api.nvim_exec('keeppatterns %s/\\s\\+$//e', false)
    vim.fn.winrestview(save)
end

local TrimWhitespaceAugroup = vim.api.nvim_create_augroup('TrimWhitespace', {clear = true})
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = TrimWhitespace
})

