-- TUI

require('vim._core.ui2').enable({})

-- Basic settings

vim.opt.clipboard = "unnamedplus"

vim.opt.guicursor = "a:block"

vim.opt.numberwidth = 1


vim.g.mapleader = ","
-- Prevents showing extra messages when using completion
vim.opt.shortmess:append("c")
-- Sets the height of the command line area at the bottom
vim.opt.cmdheight = 2
-- Displays the line number for the current line
vim.opt.number = true
-- Displays line numbers relative to the current cursor position
vim.opt.relativenumber = true
-- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.timeoutlen = 500
-- Time in milliseconds of inactivity before calling CursorHold or writing to swap
vim.opt.updatetime = 4000
-- Ignores case when searching patterns
vim.opt.ignorecase = true
-- Automatically switches to case-sensitive search if a capital letter is used
vim.opt.smartcase = true
-- Enables 24-bit RGB colors in the terminal
vim.opt.termguicolors = true
-- Number of spaces that a <Tab> character represents
vim.opt.tabstop = 2
-- Number of spaces to use for each step of automatic indentation
vim.opt.shiftwidth = 2
-- Number of spaces that a <Tab> counts for during editing operations
vim.opt.softtabstop = 2
-- Converts tabs into spaces when typing
vim.opt.expandtab = true
-- Automatically inserts an extra level of indentation in some cases
vim.opt.smartindent = true
-- Makes <Tab> insert 'shiftwidth' number of spaces at the start of a line
vim.opt.smarttab = true

vim.opt.wrap = true


vim.g.mapleader = " "

-- Buffer navigation
vim.keymap.set("n", "<leader>n", "<CMD>bnext<CR>",   { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", "<CMD>bprev<CR>",   { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>d", "<CMD>bdelete<CR>", { desc = "Delete buffer" })

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

-- Window splits
vim.keymap.set("n", "<leader>sv", "<CMD>vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<CMD>split<CR>",  { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>sc", "<CMD>close<CR>",  { desc = "Close window" })

-- Resize windows
vim.keymap.set("n", "<leader>rk",    "<CMD>resize +2<CR>",          { desc = "Increase height" })
vim.keymap.set("n", "<leader>rj",  "<CMD>resize -2<CR>",          { desc = "Decrease height" })
vim.keymap.set("n", "<leader>rh",  "<CMD>vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<leader>rl", "<CMD>vertical resize +2<CR>", { desc = "Increase width" })

if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
