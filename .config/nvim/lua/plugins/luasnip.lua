return {
    "L3MON4D3/LuaSnip",
    version = "V2.*",
    build = "make install_jsregexp",
    config = function ()
        require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snips" })
    end
}
