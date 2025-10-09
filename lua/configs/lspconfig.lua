local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
	"html",
	"cssls",
	"bashls",
	"astro",
	"eslint",
	"jsonls",
	"gopls",
	"gleam",
	"pyright",
	"svelte",
	"markdown_oxide",
	"taplo",
	"ruby_lsp",
	"rust_analyzer",
}
local root_pattern = lspconfig.util.root_pattern

local pnpm_root = vim.fn.system("pnpm root -g"):gsub("\n", "")
local vue_language_server_path = pnpm_root .. "/@vue/language-server"

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	}
end

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

-- typescript
lspconfig.ts_ls.setup {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	root_dir = root_pattern "package.json",
	single_file_support = false,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

vim.lsp.enable "vue_ls"

-- tailwindcss
lspconfig.tailwindcss.setup {
	root_dir = lspconfig.util.root_pattern("package.json", "mix.exs", ".git"),
	filetypes = {
		"html",
		"heex",
		"eelixir",
		"css",
		"scss",
		"javascript",
		"typescript",
		"vue",
		"svelte",
		"javascriptreact",
		"typescriptreact",
	},
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "tv\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
			includeLanguages = { heex = "html", eelixir = "html" },
		},
	},
}

lspconfig.biome.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = root_pattern "biome.json",
	single_file_support = false,
}
vim.lsp.enable "biome"

-- Deno should only trigger with deno root file
lspconfig.denols.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = root_pattern "deno.json",
	single_file_support = false,
	cmd_env = { NO_COLOR = false },
}

-- lspconfig.marksman.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	on_init = on_init,
-- 	filetypes = { "markdown" },
-- }

lspconfig.omnisharp.setup {
	capabilities = capabilities,
	cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
	enable_import_completion = true,
	organize_imports_on_format = true,
	enable_roslyn_analyzers = true,
	root_dir = function()
		return vim.loop.cwd() -- current working directory
	end,
}

-- Deno has some stupid semantic token highlighting built into
-- the LSP, so we need to lower the priority of that
vim.highlight.priorities.semantic_tokens = 95

-- Elixir
lspconfig.elixirls.setup {
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	cmd = { "/home/callum/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
}
