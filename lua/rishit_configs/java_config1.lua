vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.java",
    callback = function()
        local class_name = vim.fn.expand("%:t:r")
        local template = string.format([[
public class %s {
    public static void main(String[] args) {
	
    }
}
        ]], class_name)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))


	        local line_number = 3 -- Adjust this if the position changes in the template
        local col_number = 0  -- Start at the first column
        vim.api.nvim_win_set_cursor(0, {line_number, col_number})
    end
})

