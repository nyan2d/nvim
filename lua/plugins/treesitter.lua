return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {},
        config = function()
            require("nvim-treesitter.configs").setup{
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                    "c",
                    "lua",
                    "go",
                    "markdown",
                    "comment", -- todo, hack, fixme etc
                    "bash",
                    "python"
                }
            }
        end
    }
}

