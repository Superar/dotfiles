-- -------- Autocommands --------

local TrimWhitespace = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(save)
end

local TrimWhitespaceAugroup = vim.api.nvim_create_augroup('TrimWhitespace', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = TrimWhitespace
})

vim.api.nvim_create_autocmd("FileType", {
    group = TrimWhitespaceAugroup,
    callback = function(ev)
        if ev.match == "tex" then return end
        local lang = vim.treesitter.language.get_lang(ev.match)
        if not lang then return end
        local ok, loaded = pcall(vim.treesitter.language.add, lang)
        if ok and loaded then
            vim.treesitter.start(ev.buf, lang)
        end
    end
})
