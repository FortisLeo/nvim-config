vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

vim.keymap.set("i", "<S-CR>", "<Esc>o", { noremap= true, silent = true})

local function run_java()
  if vim.fn.executable("javac") == 0 or vim.fn.executable("java") == 0 then
    vim.notify("Java (javac and java) is required for <leader>r", vim.log.levels.ERROR)
    return
  end

  vim.cmd("write")
  local source = vim.fn.expand("%:p")
  local class_name = vim.fn.expand("%:t:r")
  local directory = vim.fn.expand("%:p:h")
  vim.cmd("!cd " .. vim.fn.shellescape(directory) .. " && javac " .. vim.fn.shellescape(source) .. " && java " .. vim.fn.shellescape(class_name))
end

vim.keymap.set("n", "<leader>r", run_java, { desc = "Compile and run Java file" })


vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Esc>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Esc>i", { noremap = true, silent = true })

