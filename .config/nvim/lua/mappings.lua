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


-- Tabular
vim.keymap.set('n', '<localleader>lfe', '<cmd>Tabularize /&<cr>')
vim.keymap.set('n', '<localleader>lf\\', '<cmd>Tabularize /\\\\\\\\/<cr>')
vim.keymap.set('n', '<localleader>lf=', '<cmd>Tabularize /=/<cr>')
vim.keymap.set('v', '<localleader>lfe', '<cmd>Tabularize /&<cr>')
vim.keymap.set('v', '<localleader>lf\\', '<cmd>Tabularize /\\\\\\\\/<cr>')
vim.keymap.set('v', '<localleader>lf=', '<cmd>Tabularize /=/<cr>')


-- Markdown Preview
vim.keymap.set('n', '<localleader>mv', '<cmd>MarkdownPreviewToggle<cr>')

-- Typst
vim.keymap.set('n', '<localleader>tl', '<cmd>make<cr>')
vim.keymap.set('n', '<localleader>tv', '<cmd>TypstPreviewToggle<cr>')
