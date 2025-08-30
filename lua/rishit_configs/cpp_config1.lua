vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.cpp",
  callback = function()
    local template = vim.fn.stdpath("config") .. "\\lua\\rishit_configs\\templates\\CpSkeleton.cpp"
    vim.cmd("0r " .. template)
  end
})

