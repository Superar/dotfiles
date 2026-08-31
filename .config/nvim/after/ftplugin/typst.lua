local function tinymist_pin(path)
    local client = vim.lsp.get_clients({ name = "tinymist", bufnr = 0 })[1]

    if not client then
        vim.notify("tinymist not running", vim.log.levels.ERROR)
        return
    end

    client:request("workspace/executeCommand", {
        command = "tinymist.pinMain",
        arguments = { path or vim.NIL },
    }, function(err)
        if err then
            vim.notify("Error when pinning: " .. vim.inspect(err), vim.log.levels.ERROR)
        end
    end, 0)
end

local function main_file()
    local root = vim.fs.root(0, { "typst.toml", ".git" })
    return root and (root .. "/main.typ") or nil
end

vim.api.nvim_buf_create_user_command(0, "TypstPin", function()
    tinymist_pin(vim.api.nvim_buf_get_name(0))
end, {})

vim.api.nvim_buf_create_user_command(0, "TypstUnpin", function()
    tinymist_pin(nil)
end, {})

vim.api.nvim_create_autocmd("LspAttach", {
    buffer = 0,
    callback = function(ev)
        if vim.lsp.get_client_by_id(ev.data.client_id).name ~= "tinymist" then return end
        local main = main_file()
        if main then vim.schedule(function() tinymist_pin(main) end) end
    end,
})


-- Acrostiche native autocomplete
vim.api.nvim_create_autocmd("TextChangedI", {
    buffer = 0,
    group = vim.api.nvim_create_augroup("TypstAcronymComplete", { clear = true }),
    callback = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local prefix = line:sub(1, col)

        if prefix:match('#ac%a*%("$') then
            local acronyms_file = vim.fn.findfile("acronyms.typ", ".;")
            if acronyms_file ~= "" then
                local items = {}
                local f = io.open(acronyms_file, "r")
                if f then
                    for l in f:lines() do
                        local k, v = l:match('^%s*"([^"]+)"%s*:%s*"([^"]+)"')
                        if k and v then
                            table.insert(items, {
                                word = k,
                                abbr = k,
                                menu = v,
                                kind = "Acr",
                                info = v
                            })
                        end
                    end
                    f:close()
                end
                if #items > 0 then
                    vim.fn.complete(col + 1, items)
                end
            end
        end
    end
})
