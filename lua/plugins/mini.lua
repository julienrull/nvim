vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
})

require('mini.basics').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.cmdline').setup()
require('mini.statusline').setup()
require('mini.completion').setup()
require('mini.notify').setup()
require('mini.pick').setup()

local extra = require('mini.extra')

-- Pickers
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Find buffers' })

-- Pickers LSP
vim.keymap.set('n', '<leader>ss', function()
  extra.pickers.lsp({ scope = 'document_symbol' })
end, { desc = 'Document symbols' })

vim.keymap.set('n', '<leader>sS', function()
  extra.pickers.lsp({ scope = 'workspace_symbol_live' })
end, { desc = 'Workspace symbols' })

vim.keymap.set('n', '<leader>sr', function()
  extra.pickers.lsp({ scope = 'references' })
end, { desc = 'Symbol references' })

vim.keymap.set('n', '<leader>sd', function()
  extra.pickers.lsp({ scope = 'definition' })
end, { desc = 'Symbol definition' })
