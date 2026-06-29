-- Code format key maps
vim.keymap.set("n", "<leader>ii", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

vim.keymap.set("x", "<leader>ii", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format selection" })

-- Enable autocomplete
vim.o.complete = '.,w,b,o'
vim.o.completeopt = 'menuone,noselect,fuzzy,popup'
vim.o.autocomplete = true
vim.o.autocompletedelay = 250

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

        -- Enable built-in native completion for Neovim 0.11+
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        -- Keymaps for completion menu navigation and snippet jumping
        local function pumvisible()
            return tonumber(vim.fn.pumvisible()) ~= 0
        end

        vim.keymap.set('i', '<CR>', function()
            if pumvisible() then
                return '<C-y>'
            end
            return '<CR>'
        end, { buffer = ev.buf, expr = true, silent = true, desc = "Confirm completion" })

        vim.keymap.set({ 'i', 's' }, '<Tab>', function()
            if pumvisible() then
                return '<C-n>'
            elseif vim.snippet.active({ direction = 1 }) then
                return '<cmd>lua vim.snippet.jump(1)<cr>'
            else
                return '<Tab>'
            end
        end, { buffer = ev.buf, expr = true, silent = true, desc = "Next completion/snippet placeholder" })

        vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
            if pumvisible() then
                return '<C-p>'
            elseif vim.snippet.active({ direction = -1 }) then
                return '<cmd>lua vim.snippet.jump(-1)<cr>'
            else
                return '<S-Tab>'
            end
        end, { buffer = ev.buf, expr = true, silent = true, desc = "Previous completion/snippet placeholder" })

        vim.keymap.set('i', '<C-Space>', function()
            vim.lsp.completion.get()
        end, { buffer = ev.buf, desc = "Trigger completion" })

        -- Highlight the symbol when holding the cursor
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

-- Typst configurations
vim.lsp.config('tinymist', {
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType"
    }
})

-- Python configurations
-- isort for sorting imports
vim.g.isort_command = 'isort'

-- Texlab configurations
vim.lsp.config('texlab', {
    filetypes = { 'tex' }
})
