-- -------- Keybinds / Remaps --------
vim.g.mapleader = " "

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- NERDTree commands
vim.keymap.set('n', '<leader>n', '<cmd>NERDTreeFocus<cr>')
vim.keymap.set('n', '<C-n>', '<cmd>NERDTree<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>NERDTreeToggle<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>NERDTreeFind<cr>')

-- Autoformat
vim.keymap.set('n', '<leader>ii', '<cmd>Autoformat<cr>')

-- CoC
vim.keymap.set('v', '<leader>ca', '<Plug>(coc-codeaction-selected)<cr>')
vim.keymap.set('i', '<C-f>', function() if vim.fn['coc#float#has_scroll']() then return '<C-r>=coc#float#scroll(1)<cr>' else return '<Right>' end end)
vim.keymap.set('i', '<C-b>', function() if vim.fn['coc#float#has_scroll']() then return '<C-r>=coc#float#scroll(0)<cr>' else return '<Left>' end end)

-- Tabular
vim.keymap.set('n', '<localleader>lfe', '<cmd>Tabularize /&<cr>')
vim.keymap.set('n', '<localleader>lf\\', '<cmd>Tabularize /\\\\\\\\/<cr>')
vim.keymap.set('v', '<localleader>lfe', '<cmd>Tabularize /&<cr>')
vim.keymap.set('v', '<localleader>lf\\', '<cmd>Tabularize /\\\\\\\\/<cr>')

-- coc-snippets
vim.keymap.set('v', '<leader>qc', '<Plug>(coc-convert-snippet)')
vim.keymap.set('v', '<leader>qx', '<Plug>(coc-snippets-select)')

-- Markdown Preview
vim.keymap.set('n', '<localleader>mv', '<cmd>MarkdownPreviewToggle<cr>')

-- isort
vim.keymap.set('n', '<leader>io', '<cmd>Isort<cr>')
