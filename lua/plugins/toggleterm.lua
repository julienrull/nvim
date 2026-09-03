vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' })

require('toggleterm').setup({
  size = 15,
  open_mapping = [[<C-t>]],
  direction = 'float',
  float_opts = {
    border = 'curved',
  },
  shade_terminals = true,
  start_in_insert = true,
})

-- Escape in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Navigate from terminal
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
