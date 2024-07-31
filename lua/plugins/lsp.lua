return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require "configs.lspconfig"
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup {
				scroll_preview = {
					scroll_down = "<C-f>",
					scroll_up = "<C-d>",
				},
				ui = {
					title = false,
					border_style = "rounded",
				},
				symbol_in_winbar = {
					enable = false,
				},
				lightbulb = {
					enable = false,
				},
			}
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
}
