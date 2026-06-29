vim.api.nvim_buf_create_user_command(0, "TypstPin", function()
  local tinymist_id = nil
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.name == "tinymist" then
      tinymist_id = client.id
      break
    end
  end

  if not tinymist_id then
    vim.notify("tinymist not running!", vim.log.levels.ERROR)
    return
  end

  local client = vim.lsp.get_client_by_id(tinymist_id)
  if client then
    client.request("workspace/executeCommand", {
      command = "tinymist.pinMain",
      arguments = { vim.api.nvim_buf_get_name(0) },
    }, function(err)
      if err then
        vim.notify("error pinning: " .. err, vim.log.levels.ERROR)
      else
        vim.notify("succesfully pinned", vim.log.levels.INFO)
      end
    end, 0)
  end
end, {})

-- Acrostiche native autocomplete
vim.api.nvim_create_autocmd("TextChangedI", {
  buffer = 0,
  group = vim.api.nvim_create_augroup("TypstAcronymComplete", { clear = true }),
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local prefix = line:sub(1, col)

    if prefix:match('#ac%a*%("$') then
      local acronyms_file = vim.fn.findfile("acronyms.typ", ".;")
      if acronyms_file ~= "" then
        local items = {}
        local f = io.open(acronyms_file, "r")
        if f then
          for l in f:lines() do
            local k, v = l:match('^%s*"([^"]+)"%s*:%s*"([^"]+)"')
            if k and v then
              table.insert(items, {
                word = k,
                abbr = k,
                menu = v,
                kind = "Acr",
                info = v
              })
            end
          end
          f:close()
        end
        if #items > 0 then
          vim.fn.complete(col + 1, items)
        end
      end
    end
  end
})

