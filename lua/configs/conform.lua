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
		javascript = { "biome", "prettierd", stop_after_first = true },
		typescript = { "biome", "deno_fmt", "prettierd", stop_after_first = true },
		javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd" },
		html = { "biome", "prettierd", stop_after_first = true },
		astro = { "prettierd" },
		json = { "biome", "prettierd", stop_after_first = true },
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
