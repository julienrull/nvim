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


require('mini.basics').setup()
require('mini.extra').setup()
require('mini.visits').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.cmdline').setup()
require('mini.statusline').setup()
require('mini.completion').setup()
require('mini.pick').setup()
require('mini.notify').setup()
require('mini.files').setup()
require('mini.starter').setup()


vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers)

vim.keymap.set("n", "<leader>e", function()
  local mf = require("mini.files")
  if not mf.close() then
    mf.open(vim.api.nvim_buf_get_name(0))
  end
end, { desc = "Toggle mini.files" })

-- Dans mini.files, appuie sur un raccourci pour changer le cwd
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    vim.keymap.set("n", "gc", function()
      local entry = require("mini.files").get_fs_entry()
      if entry then
        local dir = entry.fs_type == "directory" and entry.path 
                    or vim.fn.fnamemodify(entry.path, ":h")
        vim.cmd("cd " .. dir)
        vim.notify("cwd: " .. dir)
      end
    end, { buffer = args.data.buf_id })
  end,
})


