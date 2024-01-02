return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            require("nvim-tree").setup {
                git = {
                    enable = false,
                },
            }
        end,
        keys = {
            { "<leader>o", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
            { "<leader>0", "<cmd>NvimTreeFocus<cr>", desc = "Focus NvimTree" },
        },
    },
}
