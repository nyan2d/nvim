-- go install golang.org/x/tools/gopls@latest
vim.lsp.enable('gopls')
-- pip install python-lsp-server
vim.lsp.enable('pylsp')
-- clang
vim.lsp.enable('clangd')
-- lua-language-server
vim.lsp.enable('lua_ls')
-- npm i -g vscode-langservers-extracted
vim.lsp.enable('html')
-- npm i -g typescript-language-server typescript
vim.lsp.enable('ts_ls')
-- pacman -S clang
vim.lsp.enable('clangd')
-- npm i -g @vue/language-server
require("config.vue_ls")
