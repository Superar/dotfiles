require('nvim-treesitter').install({'python', 'lua', 'latex'}) -- Install parsers

-- Enable syntax highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-- Enable smart indentation
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

