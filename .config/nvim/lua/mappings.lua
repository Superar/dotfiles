-- -------- Keybinds / Remaps --------
vim.g.mapleader = " "

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope man_pages<cr>')
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>')
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
vim.keymap.set('n', '<leader>s', '<cmd>Telescope treesitter<cr>')

-- NERDTree commands
vim.keymap.set('n', '<leader>n', '<cmd>NERDTreeFocus<cr>')
vim.keymap.set('n', '<C-n>', '<cmd>NERDTree<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>NERDTreeToggle<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>NERDTreeFind<cr>')

-- Autoformat
vim.keymap.set('n', '<leader>ii', '<cmd>Autoformat<cr>')

-- CoC
vim.keymap.set('n', '<leader>io', '<cmd>OR<cr>')
vim.keymap.set('n', '<C-j>',
    function()
        if vim.fn['coc#float#has_float']() and vim.fn['coc#float#has_scroll']() then
            return vim.fn['coc#float#scroll'](1)
        else
            return '<C-j>'
        end
    end,
    { expr = true, silent = true })
vim.keymap.set('n', '<C-k>',
    function()
        if vim.fn['coc#float#has_float']() and vim.fn['coc#float#has_scroll']() then
            return vim.fn['coc#float#scroll'](0)
        else
            return '<C-k>'
        end
    end,
    {expr = true, silent = true})
vim.keymap.set('n', '<Esc>',
    function()
        if vim.fn['coc#float#has_float']() then
            return ':call coc#float#close_all()<cr>'
        else
            return '<Esc>'
        end
    end,
    {expr = true, silent = true})
vim.keymap.set('v', '<leader>ca', '<Plug>(coc-codeaction-selected)<cr>')
vim.keymap.set('i', '<C-j>',
    function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#next'](1)
        else
            return '<C-j>'
        end
    end,
    {expr = true, silent = true})
vim.keymap.set('i', '<C-k>',
    function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#prev'](1)
        else
            return '<C-k>'
        end
    end,
    {expr = true, silent = true})
vim.keymap.set('i', '<C-l>',
    function()
        if vim.fn['coc#float#has_scroll']() then
            return vim.fn['coc#float#scroll'](1)
        else
            return '<C-l>'
        end
    end,
    {expr = true, silent = true})
vim.keymap.set('i', '<C-h>',
    function()
        if vim.fn['coc#float#has_scroll']() then
            return vim.fn['coc#float#scroll'](0)
        else
            return '<C-h>'
        end
    end,
    {expr = true, silent = true})

-- Tabular
vim.keymap.set('n', '<localleader>lfe', '<cmd>Tabularize /&<cr>')
vim.keymap.set('n', '<localleader>lf\\', '<cmd>Tabularize /\\\\\\\\/<cr>')
vim.keymap.set('n', '<localleader>lf=', '<cmd>Tabularize /=/<cr>')
vim.keymap.set('v', '<localleader>lfe', '<cmd>Tabularize /&<cr>')
vim.keymap.set('v', '<localleader>lf\\', '<cmd>Tabularize /\\\\\\\\/<cr>')
vim.keymap.set('v', '<localleader>lf=', '<cmd>Tabularize /=/<cr>')

-- coc-snippets
vim.keymap.set('v', '<leader>qc', '<Plug>(coc-convert-snippet)')
vim.keymap.set('v', '<leader>qx', '<Plug>(coc-snippets-select)')

-- Markdown Preview
vim.keymap.set('n', '<localleader>mv', '<cmd>MarkdownPreviewToggle<cr>')
