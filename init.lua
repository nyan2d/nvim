-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.rnu = true
vim.opt.swapfile = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hidden = true
vim.opt.splitright = true
vim.wo.wrap = false
vim.wo.fillchars = "eob: "
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noinsert"

-- Keybindings
vim.keymap.set("x", "J", ":move \'>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "k", ":move \'<-2<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", "<cmd>terminal<cr>", { noremap = true, silent = true })

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup{
                transparent_mode = true
            }
            vim.o.background = "dark"
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "romgrk/barbar.nvim",
        lazy = false,
        keys = {
            { "<leader>1", "<cmd>BufferGoto 1<cr>", desc = "Go to buffer 1" },
            { "<leader>2", "<cmd>BufferGoto 2<cr>", desc = "Go to buffer 2" },
            { "<leader>3", "<cmd>BufferGoto 3<cr>", desc = "Go to buffer 3" },
            { "<leader>4", "<cmd>BufferGoto 4<cr>", desc = "Go to buffer 4" },
            { "<leader>5", "<cmd>BufferGoto 5<cr>", desc = "Go to buffer 5" },
            { "<leader>6", "<cmd>BufferGoto 6<cr>", desc = "Go to buffer 6" },
            { "<leader>7", "<cmd>BufferGoto 7<cr>", desc = "Go to buffer 7" },
            { "<leader>8", "<cmd>BufferGoto 8<cr>", desc = "Go to buffer 8" },
            { "<leader>9", "<cmd>BufferGoto 9<cr>", desc = "Go to buffer 9" },
            { "<leader>0", "<cmd>NvimTreeFocus<cr>", desc = "Focus NvimTree" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust", "go", "javascript", "python", "html", "css" },
                highlight = { enable = true },
            }
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        opts = {},
        keys = {
            { "<leader>o", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- golang
            lspconfig.gopls.setup{}
            -- c
            lspconfig.clangd.setup{}
            -- python
            lspconfig.pylsp.setup{}
            -- html
            lspconfig.html.setup{
                capabilities = capabilities,
            }
            -- css
            lspconfig.cssls.setup{
                capabilities = capabilities,
            }
            -- js
            lspconfig.tsserver.setup{
                root_dir = lspconfig.util.root_pattern('*')
            }
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        lazy = false,
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    --{ name = "path" },
                    { name = "nvim_lsp_signature_help" },
                }),
                preselect = cmp.PreselectMode.None,
            })
        end,
        keys = {
            { "<leader>df", "<cmd>lua vim.lsp.buf.format{ async = true}<cr>", desc="format current file"},
            { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc="go to definition" },
            { "<leader>er", "<cmd>lua vim.lsp.buf.rename()<cr>", desc="lsp rename" },
            { "<leader>ea", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc="action" },
        },
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "phaazon/hop.nvim",
        opts = {},
        keys = {
            { "<leader>j", "<cmd>HopPattern<cr>", desc = "jump to word" },
        },
    },
})


-- TODO:
-- +++ лсп
-- +++ автодополнение
-- +++ каменты
-- +++ сниппеты
-- +++ навигация
-- +++ тудушки
-- +++ атвопары
-- + кнопки
