return {
    {
        "kaarmu/typst.vim", -- Typst integration for writing documents
        ft = "typst",
        lazy = false
    },
    {
        "chomosuke/typst-preview.nvim", -- Typst real-time visualization
        ft = "typst",
        version = "1.*",
        opts = {
            extra_args = { "--font-path", "fonts" }
        }
    },
}
