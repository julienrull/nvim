vim.pack.add({ 'https://github.com/thimc/gruber-darker.nvim.git' })

require('gruber-darker').setup({
 transparent = true, -- removes the background
})

vim.cmd.colorscheme('gruber-darker')

