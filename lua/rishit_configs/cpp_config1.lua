local template_path = vim.fn.stdpath("config") .. "/lua/rishit_configs/templates/CpSkeleton.cpp"

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.cpp",
  callback = function()
    local file = io.open(template_path, "r")
    if not file then
      vim.notify("C++ template not found: " .. template_path, vim.log.levels.WARN)
      return
    end
    local lines = {}
    for line in file:lines() do
      table.insert(lines, line)
    end
    file:close()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end,
})

