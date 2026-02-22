return {
    "https://github.com/neovim/nvim-lspconfig",
    config = function()
        local on_attach = function(client, bufnr)
          if client.server_capabilities.semanticTokensProvider then
            vim.lsp.semantic_tokens.start(bufnr, client.id)
          end
        end
        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
            underline = false,
            update_in_insert = false,
        })
        
        -- New API syntax
        vim.lsp.config('clangd', {
            cmd = { 'clangd' },
            filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
            root_markers = { '.git', 'compile_commands.json' },
            on_attach = on_attach,
        })
        
        -- CRITICAL: Enable the LSP
        vim.lsp.enable('clangd')
    end
}
