local bind = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }
local map = function(mode, key, action)
    bind(mode, key, action, default_options)
end

map('x', 'K', ':move \'<-2<CR>gv-gv') -- up
map('x', 'J', ':move \'>+1<CR>gv-gv') -- down

map('', '<leader>q', '<cmd>bd<cr>') -- close current buffer
map('n', '<Leader>t', '<cmd>terminal<CR>') -- open terminal
map('n', '<Leader>df', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>') -- document - format
map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>') -- go to defenition
map('', '<Leader>ea', '<cmd>lua vim.lsp.buf.code_action()<cr>') -- element - code action
