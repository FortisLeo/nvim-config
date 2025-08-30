vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

vim.keymap.set("i", "<S-CR>", "<Esc>o", { noremap= true, silent = true})

vim.api.nvim_exec([[
    nnoremap <leader>r :w<CR>:!javac % && java %:r<CR>
    ]], false)


vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Esc>i", { noremap = true, silent = true })

