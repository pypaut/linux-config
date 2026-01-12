function GoCallbacks()
    -- Fix imports
    local cur = vim.fn.getpos('.')
    vim.api.nvim_command('%!goimports')
    vim.fn.setpos('.', cur)

    -- Run fmt
    vim.lsp.buf.format()

end


vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = '*.go',
    -- buffer = 0, -- if 0 doesn't work do vim.api.nvim_get_current_buf()
    callback = GoCallbacks,
})
