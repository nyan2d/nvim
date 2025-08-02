return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
		config = function()
			require("nvim-tree").setup {
				git = {
					enable = false,
				}
			}
		end,
		keys = {
			{ "<leader>o", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file browser" },
			{ "<leader>0", "<cmd>NvimTreeFocus<cr>", desc = "Focus file browser" },
		}
	}
}
