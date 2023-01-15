local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Color scheme
opt.termguicolors = true
cmd'colorscheme gruvbox'

-- Outers
require('plugins/treesitter')
require('plugins/cmp')
require('plugins/nvim-tree')

-- Oneliners
require('bufferline').setup()
require('lsp_signature').setup()
require('telescope').setup()
require('lualine').setup()
