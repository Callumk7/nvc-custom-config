local options = {
	formatters = {
		biome = {
			require_cwd = true,
		},
		deno_fmt = {
			cwd = require("conform.util").root_file { "deno.json" },
			require_cwd = true,
		},
	},
	formatters_by_ft = {
		javascript = { { "biome", "prettierd" } },
		typescript = { { "biome", "deno_fmt", "prettierd" } },
		javascriptreact = { { "biome", "prettierd" } },
		typescriptreact = { { "biome", "prettierd", "prettier" } },
		css = { "prettierd" },
		html = { { "biome", "prettierd" } },
		astro = { "prettierd" },
		json = { { "biome", "prettierd" } },
		rust = { "rustfmt" },
		go = { "gofmt" },
		sh = { "shfmt" },
		ruby = { "rubyfmt" },
		gleam = { "gleam" },
	},

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

require("conform").setup(options)
