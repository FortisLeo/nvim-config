local ok, builtin = pcall(require, "telescope.builtin")
if not ok then return end
vim.keymap.set('n', '<leader><Enter>', builtin.find_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
