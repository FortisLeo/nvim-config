vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

vim.keymap.set("i", "<S-CR>", "<Esc>o", { noremap= true, silent = true})
local function run_file()
    vim.cmd('w')
    local ext = vim.fn.expand('%:e')


    if ext == 'java' then
	vim.cmd('!javac % && java %:r')
    elseif ext == 'kt' then
	vim.cmd('!kotlinc % -include-runtime -d %:r.jar && java -jar %:r.jar')
    elseif ext == 'py' then
	vim.cmd('!python %')
    end
end
vim.keymap.set("n", "<leader>r", run_file)
vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Esc>i", { noremap = true, silent = true })


