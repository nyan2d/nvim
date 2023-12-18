return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>o", "<cmd>Neotree toggle<cr>", desc = "NeoTree toggle" },
            { "<leader>0", "<cmd>Neotree action=focus<cr>", desc="NeoTree set focus" },
        },
    },
}
