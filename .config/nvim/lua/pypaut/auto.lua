vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = {'*.go'},
  -- buffer = 0, -- if 0 doesn't work do vim.api.nvim_get_current_buf()
  command = "%! goimports && go fmt %:p",
})
