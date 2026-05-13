vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' })

if vim.fn.has('win32') == 1 then
  vim.opt.shell = "C:\\Users\\julie\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
else
  vim.opt.shell = "zsh"
end


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

-- MSVC terminal
--local Terminal = require('toggleterm.terminal').Terminal
--
--
--local vcvars_term = Terminal:new({
--  --cmd = [[cmd /k ""C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat""]],
--  cmd = [[C:\Users\julie\AppData\Local\Microsoft\WindowsApps\Microsoft.PowerShell_8wekyb3d8bbwe\pwsh.exe]],
--  direction = 'float',
--  float_opts = {
--    border = 'curved',
--  },
--})
--
--vim.keymap.set('n', '<leader>tv', function()
--  vcvars_term:toggle()
--end, { desc = 'Toggle MSVC terminal' })
