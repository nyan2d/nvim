local bind = vim.api.nvim_set_keymap
local def = { noremap = true, silent = true }
local map = function(mode, key, action)
    bind(mode, key, action, def)
end
local remap = function(mode, key, action)
    bind(mode, key, action, {})
end

-- -- -- -- --
--   KEYS   --
-- -- -- -- --
map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

map('n', '<C-a>', 'ggVG')
map('n', '<C-f>', 'gg=G')

map('n', '<C-s>', ':<C-u>update<CR>')
map('v', '<C-s>', '<C-c>:update<CR>')
map('i', '<C-s>', '<C-o>:update<CR>')

-- -- -- -- --
--  LEADER  --
-- -- -- -- --

-- system
map('n', '<Leader>o', '<cmd>NvimTreeToggle<CR>') -- open nvim tree
map('', '<Leader>q', '<cmd>bd<CR>') -- close current buffer
map('n', '<Leader>i', '<cmd>Telescope find_files<CR>') -- open telescope's find files
map('n', '<Leader>t', '<cmd>terminal<CR>') -- open terminal

-- document [d]
map('n', '<Leader>df', '<cmd>lua vim.lsp.buf.format{ async = true }<CR>') -- document - format
map('n', '<Leader>ds', '<cmd>Telescope current_buffer_fuzzy_find<CR>') -- document - search

-- go to [g]
map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>') -- go to defenition
map('n', '<Leader>gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>') -- go to references

-- element [e]
map('n', '<Leader>er', '<cmd>lua vim.lsp.buf.rename()<CR>') -- element - rename
map('', '<Leader>ea', '<cmd>lua vim.lsp.buf.code_action()<CR>') -- element - code action

-- jump [j]
map('n', '<Leader>j', '<cmd>HopPattern<CR>')


-- tabs
map('n', '<Leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
map('n', '<Leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
map('n', '<Leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
map('n', '<Leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')
map('n', '<Leader>5', '<cmd>BufferLineGoToBuffer 5<CR>')
map('n', '<Leader>6', '<cmd>BufferLineGoToBuffer 6<CR>')
map('n', '<Leader>7', '<cmd>BufferLineGoToBuffer 7<CR>')
map('n', '<Leader>8', '<cmd>BufferLineGoToBuffer 8<CR>')
map('n', '<Leader>9', '<cmd>BufferLineGoToBuffer 9<CR>')
map('n', '<Leader>0', '<cmd>NvimTreeFocus<CR>')
