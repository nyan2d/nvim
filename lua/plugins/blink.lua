return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },

        opts = {
            snippets = { preset = 'luasnip' },

            keymap = {
                preset = 'default',

                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<Tab>"] = {
                    function(cmp)
                        return cmp.select_next()
                    end,
                    "snippet_forward",
                    "fallback",
                },
                ["<S-Tab>"] = {
                    function(cmp)
                        return cmp.select_prev()
                    end,
                    "snippet_backward",
                    "fallback",
                },
                ['<CR>'] = { 'select_and_accept', 'fallback' },
            },
            completion = {
                ghost_text = {
                    enabled = true
                },
                accept = {
                    auto_brackets = {
                        enabled = true
                    }
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 700,
                },
            },
            sources = {
                default = { "snippets", "lsp", "path", "buffer" }
            },
            fuzzy = { implementation = "lua" },
            signature = { enabled = true },
        },

        opts_extend = { "sources.default" },
    }
}
