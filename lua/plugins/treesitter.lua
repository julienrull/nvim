vim.pack.add({
  { 
    src = 'https://github.com/nvim-treesitter/nvim-treesitter', 
    version = 'main' 
  },
})


vim.filetype.add({
  extension = {
    c = "c",
    h = "c",
  }
})


vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
