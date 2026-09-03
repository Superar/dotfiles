vim.bo.commentstring = "// %s"
vim.bo.makeprg = "make"

vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

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
        local main = vim.fn.getcwd() .. "/main.typ"
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

-- Command to list all revision marks
vim.api.nvim_buf_create_user_command(0, "TypstMarks", function()
    local root = vim.fs.root(0, { "typst.toml", ".git" }) or vim.fn.getcwd()
    local out = vim.fn.systemlist({
        "rg", "--vimgrep", "--no-heading", "-g", "*.typ",
        [[#m[a-z]-(add|del|rep)\[]], root,
    })
    vim.fn.setqflist({}, " ", {
        title = "typst revision marks",
        lines = out,
        efm = "%f:%l:%c:%m",
    })
    vim.cmd("copen")
end, {})

-- Review commands (<author>-add, <author>-del, <author>-rep)
local revisions = vim.g.typst_revisions

if revisions then
    local function set_round(name)
        local cfg = vim.g.typst_revisions
        cfg.current = name
        vim.g.typst_revisions = cfg
    end

    local function wrap_selection(op)
        local round = vim.g.typst_revisions.current
        local saved = vim.fn.getreginfo("z")
        vim.cmd('noautocmd normal! "zy')
        local selection = vim.fn.getreg("z")
        vim.fn.setreg("z", ("#%s-%s[%s]"):format(round, op, selection), "v")
        vim.cmd('noautocmd normal! gv"zp')
        vim.fn.setreg("z", saved)
    end

    -- \ta to add
    vim.keymap.set("x", "<localleader>ta", function() wrap_selection("add") end,
        { buffer = true, desc = "Typst: mark selection as addition" })
    -- \td to delete
    vim.keymap.set("x", "<localleader>td", function() wrap_selection("del") end,
        { buffer = true, desc = "Typst: mark selection as deletion" })


    vim.api.nvim_buf_create_user_command(0, "TypstRound", function(opts)
        if opts.args == "" then
            vim.notify("current round: " .. vim.g.typst_revisions.current)
        else
            set_round(opts.args)
            vim.notify("revision round: " .. opts.args)
        end
    end, {
        nargs = "?",
        complete = function() return vim.g.typst_revisions.rounds end,
    })
end

-- Jump through sections
local function jump(back)
    return function()
        local flags = back and "bW" or "W"
        for i = 1, vim.v.count1 do
            vim.fn.search([[^\s*=\+\s]], i == 1 and flags .. "s" or flags)
        end
    end
end
local opts = { buffer = true, silent = true }
vim.keymap.set({ "n", "x", "o" }, "]]", jump(false), vim.tbl_extend("force", opts, { desc = "Next section" }))
vim.keymap.set({ "n", "x", "o" }, "[[", jump(true), vim.tbl_extend("force", opts, { desc = "Previous section" }))


-- General mappings
local map = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = true, desc = desc })
end

map('<localleader>tl', '<cmd>make!<cr>', "Typst: compile")
map('<localleader>tv', '<cmd>TypstPreviewToggle<cr>', "Typst: toggle preview")
map('<localleader>tp', '<cmd>TypstPin<cr>', "Typst: pin main file")
map('<localleader>tu', '<cmd>TypstUnpin<cr>', "Typst: unpin")
map("<localleader>tf", "<cmd>make! final<cr>", "Typst: build clean PDF")
map("<localleader>tc", "<cmd>make! clean<cr>", "Typst: clean PDF files")
