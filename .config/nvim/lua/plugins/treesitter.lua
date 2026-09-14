return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "python",
            "lua",
            "latex",
            "bash",
            "vim",
            "vimdoc",
            "markdown",
            "typst"
        })
    end
}
