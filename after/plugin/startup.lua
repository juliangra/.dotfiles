local va = vim.api

va.nvim_create_autocmd("vimenter", {
  callback = function()
    vim.api.nvim_command("NvimTreeToggle")
  end,
})
