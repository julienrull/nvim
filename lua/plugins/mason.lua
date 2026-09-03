vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
    signs = false,
    underline = false,
})

vim.keymap.set("n", "<leader>l", vim.diagnostic.open_float, {
    desc = "Show diagnostic",
})

vim.keymap.set("n", "<leader>lh", function()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })

    vim.lsp.inlay_hint.enable(not enabled, {
        bufnr = 0,
    })
end, {
    desc = "Toggle inlay hints",
})
