return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            bib = { "bibtex-tidy" },
            python = { "ruff_organize_imports", "ruff_format" },
            markdown = { "prettier" }
        },
        formatters = {
            ["bibtex-tidy"] = {
                prepend_args = {
                    "--omit=id,abstract",
                    "--sort=key",
                    "--curly",
                    "--numeric",
                    "--months",
                    "--blank-lines"
                }
            },
        },
    },
}
