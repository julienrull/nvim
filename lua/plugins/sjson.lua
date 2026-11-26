vim.pack.add({ 'https://github.com/vim-scripts/vim-sjson' })

vim.filetype.add({
  extension = {
    sjson = "sjson",
    mjson = "sjson",
  },
})
