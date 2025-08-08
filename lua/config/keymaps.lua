local bind = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }
local map = function(mode, key, action)
    bind(mode, key, action, default_options)
end

-- move selected lines up
map('x', 'K', ':move \'<-2<CR>gv-gv')
-- move selected lines down
map('x', 'J', ':move \'>+1<CR>gv-gv')

-- previous buffer
map('n', '<s-j>', '<cmd>bprev<cr>')
-- next buffer
map('n', '<s-k>', '<cmd>bnext<cr>')
-- close buffer
map('n', '<leader>q', '<cmd>bd<cr>')

-- open terminal
map('n', '<leader>t', '<cmd>terminal<cr>')

-- goto definition
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
-- document format
map('n', '<leader>df', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>')
-- show code actions
map('n', '<leader>ea', '<cmd>lua vim.lsp.buf.code_action()<cr>')
-- rename element
map('n', '<leader>er', '<cmd>lua vim.lsp.buf.rename()<cr>')


-- barbar:
map('n', '<leader>1', '<cmd>BufferGoto 1<cr>')
map('n', '<leader>2', '<cmd>BufferGoto 2<cr>')
map('n', '<leader>3', '<cmd>BufferGoto 3<cr>')
map('n', '<leader>4', '<cmd>BufferGoto 4<cr>')
map('n', '<leader>5', '<cmd>BufferGoto 5<cr>')
map('n', '<leader>6', '<cmd>BufferGoto 6<cr>')
map('n', '<leader>7', '<cmd>BufferGoto 7<cr>')
map('n', '<leader>8', '<cmd>BufferGoto 8<cr>')
map('n', '<leader>9', '<cmd>BufferGoto 9<cr>')
