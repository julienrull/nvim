return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.keybinds"] = {
            config = {
                neorg_leader = ",",
            }
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              neorg = "~/Git/neorg",
            },
            default_workspace = "neorg",
          },
        },
      },
    }
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
