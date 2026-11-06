return {
    before_init = function(_, config)
        local python = vim.fs.joinpath(config.root_dir, ".venv", "bin",  "python")

        if vim.uv.fs_stat(python) then
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = python
        end
    end,
}
