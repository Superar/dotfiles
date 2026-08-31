return {
    {
        "chomosuke/typst-preview.nvim", -- Typst real-time visualization
        ft = "typst",
        version = "1.*",
        opts = {
            extra_args = { "--font-path", "assets/fonts" }
        }
    },
}
