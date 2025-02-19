require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
            config = { -- We added a `config` table!
                icon_preset = "basic", -- And we set our option here.
            },
        },
    }
})
vim.opt.conceallevel = 3
