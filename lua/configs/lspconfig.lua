-- EXAMPLE
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
	"volar",
	"svelte",
	"marksman",
	"markdown_oxide",
	"taplo",
	"ruby_lsp",
}
local root_pattern = lspconfig.util.root_pattern

local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	}
end

-- typescript
lspconfig.ts_ls.setup {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
			},
		},
	},
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	root_dir = root_pattern "package.json",
	single_file_support = false,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- tailwindcss
lspconfig.tailwindcss.setup {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "tv\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
}

lspconfig.biome.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = root_pattern "biome.json",
	single_file_support = false,
}

-- Deno should only trigger with deno root file
lspconfig.denols.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = root_pattern "deno.json",
	single_file_support = false,
    cmd_env = { NO_COLOR = false }
}

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

