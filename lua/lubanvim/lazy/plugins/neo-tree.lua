return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Explorer" },
			{ "<leader>o", "<cmd>Neotree focus left<cr>",  desc = "Focus explorer" },
		},
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_current",
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			window = {
				position = "left",
				width = 32,
			},
		},
	},
}
