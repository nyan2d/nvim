return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust", "go", "javascript", "python", "html", "css", "markdown", "markdown_inline" },
                highlight = { enable = true },
            }
        end,
    },
}
