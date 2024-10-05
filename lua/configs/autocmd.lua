vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("Format", {}),
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.slint",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_option_value('filetype', 'slint', { buf = buf })
    end
})

-- Slint support
-- autocmd BufEnter *.slint :setlocal filetype=slint
