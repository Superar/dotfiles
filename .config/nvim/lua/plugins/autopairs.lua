-- Replaces coc-pairs
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
        check_ts = true
    }
}

