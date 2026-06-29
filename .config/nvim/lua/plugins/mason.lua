-- Install LSPs
return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts={}
            },
            "neovim/nvim-lspconfig"
        }
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "ruff",
                "texlab",
                "bibtex-tidy",
                "tinymist",
                "lua-language-server",
                "bash-language-server",
                "jsonls",
                "typstyle"
            }
        }
    }
}
