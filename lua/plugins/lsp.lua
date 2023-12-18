return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            -- golang [ go install golang.org/x/tools/gopls@latest ]
            lspconfig.gopls.setup{}
            -- c [ pacman -S clang ]
            lspconfig.clangd.setup{}
            -- python [ pip install 'python-lsp-server[all]' ]
            lspconfig.pylsp.setup{}
            -- html [ npm install -g vscode-langservers-extracted ]
            lspconfig.html.setup{
                capabilities = capabilities,
            }
            -- css [ npm install -g vscode-langservers-extracted ]
            lspconfig.cssls.setup{
                capabilities = capabilities,
            }
            -- js [ npm install -g typescript ] [ npm install -g typescript-language-server ]
            lspconfig.tsserver.setup{
                root_dir = lspconfig.util.root_pattern('*')
            }
        end,
    },
}
