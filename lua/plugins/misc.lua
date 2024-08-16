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
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
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
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			char = {
				keys = { "f", "F", "t", "T", ";", "," },
			},
			highlight = {
				backdrop = false,
				matches = true,
			},
		},
		keys = {
			{
				"<leader>s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"<leader>S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
