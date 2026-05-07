-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.cmdline').setup()
require('mini.statusline').setup()
require('mini.completion').setup()
require('mini.pick').setup()

vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers)
