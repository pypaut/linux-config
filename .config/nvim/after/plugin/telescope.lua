local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope find Git files' })
vim.keymap.set('n', '<leader>pp', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
