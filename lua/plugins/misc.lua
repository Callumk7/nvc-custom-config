return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return {
				override = require "nvchad.icons.devicons",
				override_by_extension = {
					astro = {
						icon = "",
						color = "#EF8547",
						name = "astro",
					},
				},
			}
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "devicons")
			require("nvim-web-devicons").setup(opts)
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"tpope/vim-surround",
		event = "BufEnter",
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufEnter",
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		event = "BufEnter",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = { char = "│", highlight = "IblChar" },
			scope = { char = "│", highlight = "IblScopeChar", show_start = false, show_end = false },
		},
	},
}
