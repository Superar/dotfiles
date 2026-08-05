return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
        builtin_marks = { ".", "<", ">", "^", "[", "]" },
        excluded_filetypes = { "mason", "lazy", "qf", "TelescopePrompt", "neo-tree", "startup" }
    },
}
