local opt = vim.opt
local wo = vim.wo

-- Mains
opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.rnu = true
opt.swapfile = false
opt.showmatch = true
opt.ignorecase = true
opt.hidden = true
wo.wrap = false
wo.fillchars='eob: '
opt.splitright = true

-- Tabs
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
