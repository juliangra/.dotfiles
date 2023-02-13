local setup, bufferline = pcall(require, "bufferline")
if not setup then
  return
end

vim.opt.termguicolors = true

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
  },
})
