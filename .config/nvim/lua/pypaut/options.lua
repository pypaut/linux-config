-- Options
vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.spell = false
vim.opt.signcolumn = "auto"
vim.opt.wrap = false

-- Set the behavior of tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.hlsearch = true


-- vim.keymap.set('n', '<CR>', function()
--   if vim.o.buftype == 'quickfix' then
--     return "<CR>"
--   else
--     return ":nohlsearch<CR>"
--   end
-- end, {expr = true, replace_keycodes = true})

vim.cmd [[
  let g:netrw_banner=0
]]
