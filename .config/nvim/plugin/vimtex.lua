-- -------- LaTeX options --------
if jit.os == 'Windows' then
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
else
    vim.g.vimtex_view_method = 'zathura'
end
vim.g.vimtex_quickfix_mode = 1
vim.g.vimtex_quickfix_open_on_warning = 0
