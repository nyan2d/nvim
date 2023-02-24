local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Color scheme
cmd'colorscheme dracula'

-- Outers
require('plugins/treesitter')
require('plugins/cmp')
require('plugins/nvim-tree')

-- Oneliners
require('bufferline').setup()
require('lsp_signature').setup()
require('telescope').setup()
require('lualine').setup()
require('hop').setup()

require('todo-comments').setup()
