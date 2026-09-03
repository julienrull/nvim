-- ~/.config/nvim/after/ftplugin/odin.lua

-- format des erreurs Odin : fichier(ligne:col) message
vim.opt_local.errorformat = table.concat({
  "%f(%l:%c)\\ %m",
}, ",")
