-- Fuzzy file finder
return {
    "nvim-lua/plenary.nvim", -- Needed for telescope
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
}
