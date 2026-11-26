vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
})

require('mini.basics').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.cmdline').setup()
require('mini.statusline').setup()
require('mini.completion').setup()
--require('mini.notify').setup()
require('mini.pick').setup()
require("mini.extra").setup()
require("mini.bracketed").setup()

vim.keymap.set("n", "<M-j>", function() mb.diagnostic("forward") end,  { desc = "Diagnostic suivant" })
vim.keymap.set("n", "<M-k>", function() mb.diagnostic("backward") end, { desc = "Diagnostic précédent" })
vim.keymap.set("n", "<M-n>", function() mb.quickfix("forward") end,    { desc = "Erreur suivante (quickfix)" })
vim.keymap.set("n", "<M-p>", function() mb.quickfix("backward") end,   { desc = "Erreur précédente (quickfix)" })

vim.keymap.set("n", "<leader>xd", "<cmd>Pick diagnostic scope='current'<cr>", { desc = "Diagnostics (buffer)" })
vim.keymap.set("n", "<leader>xD", "<cmd>Pick diagnostic scope='all'<cr>", { desc = "Diagnostics (tous)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Pick list scope='quickfix'<cr>", { desc = "Quickfix" })



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
