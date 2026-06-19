-- Code format key maps
vim.keymap.set("n", "<leader>ii", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

vim.keymap.set("x", "<leader>ii", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format selection" })

-- Configuration only when an LSP is active
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(ev)
        local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = desc })
        end

        -- Key mappings
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")

        -- Highlight the symbol when holding the cursor
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
            vim.api.nvim_clear_autocmds({ buffer = ev.buf, group = highlight_augroup })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = ev.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = ev.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end
})

-- Show warning texts
vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    signs = true,
    underline = true,
})

-- Lua configurations
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                disable = { "missing-fields" },
                globals = { "vim" },
            }
        }
    }
})

-- Python configurations
-- isort for sorting imports
vim.g.isort_command = 'isort'
