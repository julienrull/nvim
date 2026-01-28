vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.numberwidth = 1
vim.opt.tabstop = 4  -- Insert 4 spaces for a tab
vim.opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>n', '<cmd>bnext<cr>')
vim.keymap.set('n', '<Leader>p', '<cmd>bprev<cr>')
vim.keymap.set('n', '<Leader>d', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<Leader>e', '<cmd>Oil<cr>')
