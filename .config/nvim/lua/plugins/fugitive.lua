-- Git integration
return {
    "tpope/vim-fugitive",
    dependencies = {
        "tpope/vim-rhubarb"
    },
    init = function()
        vim.g.fugitive_github_domains = {}
    end
}
