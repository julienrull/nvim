vim.pack.add({'https://github.com/rluba/jai.vim'})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.jai",
  command = "set filetype=jai",
})
