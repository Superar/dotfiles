-- Use spaces instead of tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.exrc = true -- Run local vimrc file in directories
vim.o.number = true
vim.o.relativenumber = true -- Use relative numbers
vim.o.hidden = true -- Keep files open
vim.o.incsearch = true -- Highlight search while writing
vim.o.hlsearch = false -- Do not highlight search after enter set ignorecase
vim.o.ignorecase = true
vim.o.smartcase = true -- If a capital letter is used, use case-sensitive search
vim.o.scrolloff = 8 -- Automatically scroll to keep 8 lines in the bottom
vim.o.termguicolors = true -- Enable highlight
vim.o.encoding = 'utf8'
vim.o.updatetime = 100
vim.o.colorcolumn = '80'

vim.g.python3_host_prog='/usr/bin/python3'
