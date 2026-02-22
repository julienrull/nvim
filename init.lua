-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
  change_detection = {
		notify = false,
  },
})

-- CORE
vim.filetype.add({
  extension = {
    h = "c",
  },
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.numberwidth = 1
vim.opt.tabstop = 4  -- Insert 4 spaces for a tab
vim.opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true


vim.o.guicursor = 'n-v-c-sm-i-ci-ve:block'
vim.opt.termguicolors = true
vim.cmd("hi Normal guibg=none ctermbg=none")
vim.cmd("hi NormalNC guibg=none ctermbg=none")
vim.cmd("hi SignColumn guibg=none")
vim.cmd("hi EndOfBuffer guibg=none")


local function run_in_oil_dir(cmd)
  local oil = require("oil")
  local dir = oil.get_current_dir()
  if not dir then
    print("Not in an oil buffer")
    return
  end
  vim.cmd("terminal cd " .. dir .. " && " .. cmd)
end

vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>n', '<cmd>bnext<cr>')
vim.keymap.set('n', '<Leader>p', '<cmd>bprev<cr>')
vim.keymap.set('n', '<Leader>d', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<Leader>e', '<cmd>Oil<cr>')

vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>ss", ":split<CR>")
vim.keymap.set("n", "<leader>sc", ":close<CR>")
vim.keymap.set("n", "<leader>so", ":only<CR>")
vim.keymap.set("n", "<leader>sk", ":resize +15<CR>")
vim.keymap.set("n", "<leader>sj", ":resize -15<CR>")
vim.keymap.set("n", "<leader>sh", ":vertical resize -15<CR>")
vim.keymap.set("n", "<leader>sl", ":vertical resize +15<CR>")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>mv", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>mh", "<C-w>s<C-w>j")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', builtin.treesitter, { desc = 'Telescope symbols' })

vim.keymap.set("n", "<leader>rc", function()
  local oil = require("oil")
  local dir = oil.get_current_dir()
  if not dir then
    print("Not in an oil buffer")
    return
  end

  vim.ui.input({ prompt = "Command: " }, function(input)
    if input then
      vim.cmd("terminal cd " .. dir .. " && " .. input)
    end
  end)
end)

--vim.keymap.set("n", "<leader>rr", function()
--  run_in_oil_dir("make")
--end)
